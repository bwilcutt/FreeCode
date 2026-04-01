/*
 * drivers/uio/uio_mcp3202.c
 *
 * Userspace I/O platform driver for the MCP3202-to-PRU service.
 */

#include <linux/platform_device.h>
#include <linux/uio_driver.h>
#include <linux/spinlock.h>
#include <linux/bitops.h>
#include <linux/module.h>
#include <linux/interrupt.h>
#include <linux/stringify.h>
#include <linux/pm_runtime.h>
#include <linux/slab.h>

#include <linux/of.h>
#include <linux/of_platform.h>
#include <linux/of_address.h>
#include <linux/poll.h>

#include <linux/io.h>
#include <linux/delay.h>
#include <linux/of.h>
#include <linux/of_gpio.h>
#include <linux/gpio.h>

#include "uio_mcp3202.h"

static ssize_t mcp3202_attr_show(struct device *dev, struct device_attribute *attr, char *page);
static ssize_t mcp3202_attr_store(struct device *dev, struct device_attribute *attr, const char *page, size_t count);
int findNameToValue(struct parse_s *parseCon, const char *name);
char *findValueToName(struct parse_s *parseCon, int val);
int atoi(const char *str);
int popStack(uint16_t *vch1, uint16_t *vch2);

#define DRIVER_NAME "uio_mcp3202"
#define PIN_HIGH (1)
#define PIN_LOW (0)

/* Bits in uio_pdrv_genirq_platdata.flags */

enum {
        UIO_IRQ_DISABLED = 0,
};

/* Local vars */

#define MIN_SAMPLE_RATE (1)
#define MAX_SAMPLE_RATE (100)

struct parse_s adcMode_con[] = {
        { "none",            ADC_NONE },
        { "voltage",         ADC_VOLTAGE },
        { "resistance",      ADC_RESISTANCE },
        { "current",         ADC_CURRENT },
	{ "pulse",	     ADC_PULSE },
        { NULL, 0 }
};

struct parse_s readyFlag_con[] = {
	{ "stop",		0 },
	{ "run",		1 },
	{ NULL, 0}
};


static char mode_str[] = "mode";
static char value_str[] = "value";
static char threshold_str[] = "threshold";
static char ui1_str[] = "ui.1";
static char ui2_str[] = "ui.2";
static char attribute_str[] = "attrs";

static adc_mode_e adcMode_ch1 = ADC_NONE;
static adc_mode_e adcMode_ch2 = ADC_NONE;

/* Locally defined attributes, explosed in /sys/class/uio/uioN/device

   /description		- Prints usage info
   /ui.1		- Universal input channel #1
	/value		- Value of channel #1 
	/mode		- Resistance, Current, Pulse or Voltage
        /threshold      - Threshold of PPS
   /ui.2		- Universal input channel #2
	/value		- Value of channel #2
	/mode		- Resistance, Current, Pulse or Voltage
        /threshold      - Threshold of PPS
   /readyFlag		- Set 0 to halt, 1 to run for entire driver
   /pAvgWindow		- Size of rolling average window
   /pSampleRate		- Sample rate
*/

static DEVICE_ATTR(description, 	S_IRUGO, 			mcp3202_attr_show, NULL);
static DEVICE_ATTR(pSampleRate,		S_IRUGO | S_IWUSR,	mcp3202_attr_show, mcp3202_attr_store);                                                                      
static DEVICE_ATTR(pAvgWindow,		S_IRUGO | S_IWUSR,	mcp3202_attr_show, mcp3202_attr_store);
static DEVICE_ATTR(readyFlag,		S_IRUGO | S_IWUSR,	mcp3202_attr_show, mcp3202_attr_store);
static struct device_attribute dev_attr_mode1 = {
	.attr = {
		.name = mode_str,
		.mode = S_IWUSR | S_IRUGO,
	},
	.show = mcp3202_attr_show,
	.store = mcp3202_attr_store,
};

static struct device_attribute dev_attr_mode2 = {
	.attr = {
		.name = mode_str,
		.mode = S_IWUSR | S_IRUGO,
	},
	.show = mcp3202_attr_show,
	.store = mcp3202_attr_store,
};

static struct device_attribute dev_attr_value1 = {
	.attr = {
		.name = value_str,
		.mode = S_IRUGO,
	},
	.show = mcp3202_attr_show,
	.store = mcp3202_attr_store,
};

static struct device_attribute dev_attr_value2 = {
	.attr = {
		.name = value_str,
		.mode = S_IRUGO,
	},
	.show = mcp3202_attr_show,
	.store = mcp3202_attr_store,
};

static struct device_attribute dev_attr_threshold1 = {
	.attr = {
		.name = threshold_str,
		.mode = S_IWUSR | S_IRUGO,
	},
	.show = mcp3202_attr_show,
	.store = mcp3202_attr_store,
};

static struct device_attribute dev_attr_threshold2 = {
	.attr = {
		.name = threshold_str,
		.mode = S_IWUSR | S_IRUGO,
	},
	.show = mcp3202_attr_show,
	.store = mcp3202_attr_store,
};

static struct attribute *ui1_entries[] = {
	&dev_attr_value1.attr,
	&dev_attr_mode1.attr,
	&dev_attr_threshold1.attr,
	NULL,
};

static struct attribute *ui2_entries[] = {
	&dev_attr_value2.attr,
	&dev_attr_mode2.attr,
	&dev_attr_threshold2.attr,
	NULL,
};

static struct attribute *attr_entries[] = {
	&dev_attr_description.attr,
	&dev_attr_pSampleRate.attr,
	&dev_attr_pAvgWindow.attr,
	&dev_attr_readyFlag.attr,
	NULL
};

/* /sys/class/uio/uioN/device/ui.1 */

static struct attribute_group ui1_group = {
	.name = ui1_str,
	.attrs = ui1_entries,
};

/* /sys/class/uio/uioN/device/ui.2 */

static struct attribute_group ui2_group = {
	.name = ui2_str,
	.attrs = ui2_entries,
};

/* /sys/class/uio/uioN/device/attr */

static struct attribute_group attr_group = {
	.name = attribute_str,
	.attrs = attr_entries,
};
	
static struct attribute_group *dev_groups[] = {
	&ui1_group,
	&ui2_group,
	&attr_group,
	NULL
};

struct uio_mcp3202_platdata {
	struct uio_info *uioinfo;
	spinlock_t lock;
	unsigned long flags;
	int channel_0;
	int channel_1;
	struct platform_device *pdev;
};

volatile ctrlData_s *pruDataStruct = 0;

static char desc[] = "MCP3202 Driver\n\n \
mode = current | voltage | resistance | pulse | none\n \
value = 0 - 65535\n \
readyFlag = run | stop\n \
%d <= pSampleRate <= %d\n \
1 <= pAvgWindow <= %d - Size of rolling average window\n \
1 <= Threshold <= %d\n\n";

/******************************************************
 * Function     : mcp3202_attr_show
 * Input        : Config item pointer
 *                attribute pointer
 *                output page pointer
 * Output       : Bytes written
 * Description  : Translates the drivers current settings
 *                into human readable data and outputs
 *                the data to the page memory pointer.
 ******************************************************/
static ssize_t mcp3202_attr_show(struct device *info, struct device_attribute *attr, char *page)
{
        ssize_t ret = -EINVAL;
        char *str = NULL;
	uint16_t vch1, vch2;

        if (attr == &dev_attr_description)
                return sprintf(page, desc, MIN_SAMPLERATE, MAX_SAMPLERATE, MAX_PAVGWINDOW, MAX_THRESHOLD);
        else if (attr == &dev_attr_mode1) {
                str = findValueToName(adcMode_con, adcMode_ch1);
                if (str)
                        ret = sprintf(page, "%s\n", str);
                else
                        ret = sprintf(page, "err\n");
        } else if (attr == &dev_attr_mode2) {
                str = findValueToName(adcMode_con, adcMode_ch2);
                if (str)
                        ret = sprintf(page, "%s\n", str);
                else
                        ret = sprintf(page, "err\n");
	} else if (attr == &dev_attr_readyFlag) {
		str = findValueToName(readyFlag_con, pruDataStruct->readyFlag);
		if (str)
			ret = sprintf(page, "%s\n", str);
		else
			ret = sprintf(page, "err\n");
        } else if (attr == &dev_attr_pSampleRate) {
		ret = sprintf(page, "%d\n", pruDataStruct->pSampleRate);
	} else if (attr == &dev_attr_pAvgWindow) {
		ret = sprintf(page, "%d\n", pruDataStruct->pAvgWindow);
	} else if (attr == &dev_attr_value1) {
		if (adcMode_ch1 == ADC_PULSE)
		{	
			ret = sprintf(page, "%d\n", pruDataStruct->pPulsePerSec_ch0);
		} else if (popStack(&vch1, &vch2) == 0) {
			ret = sprintf(page, "%d\n", vch1 & 0x7ff);
		} else {		
			ret = sprintf(page, "empty");
		}
	} else if (attr == &dev_attr_value2) {
		if (adcMode_ch2 == ADC_PULSE)
		{	
			ret = sprintf(page, "%d\n", pruDataStruct->pPulsePerSec_ch1);
		} else if (popStack(&vch1, &vch2) == 0) {
			ret = sprintf(page, "%d\n", vch2 & 0x7ff);
		} else {		
			ret = sprintf(page, "empty");
		}
	} else if (attr == &dev_attr_threshold1) {
		ret = sprintf(page, "%d\n", pruDataStruct->pThreshold_ch0);
	} else if (attr == &dev_attr_threshold2) {
		ret = sprintf(page, "%d\n", pruDataStruct->pThreshold_ch1);
	}

        return ret;
}

/******************************************************
 * Function     : mcp3202_attr_store
 * Input        : Config item pointer
 *                attribute pointer
 *                input page pointer
 *                int size of data
 * Output       : Bytes read or -EINVAL if paramter not found
 * Description  : Translates the input parameter data
 *                from human readable data to internal
 *                values.
 ******************************************************/
static ssize_t mcp3202_attr_store(struct device *dev, struct device_attribute *attr, const char *page, size_t count)
{
        ssize_t ret = strlen(page);
        struct platform_device *pdev = to_platform_device(dev);                                                                 
        struct uio_mcp3202_platdata *priv = platform_get_drvdata(pdev);
	int v;
	uint16_t val;

	if (priv == NULL)
	{
		return -EINVAL;
	}

	if (attr == &dev_attr_readyFlag) {
		pruDataStruct->readyFlag = findNameToValue(readyFlag_con, page);
	} else if (attr == &dev_attr_mode1) {
		if ((v = findNameToValue(adcMode_con, page)) != -1)
		{ 
			adcMode_ch1 = v;

			switch(adcMode_ch1)
			{
				case ADC_VOLTAGE:
				case ADC_CURRENT:
					gpio_set_value(priv->channel_0, PIN_HIGH);
					break;
	
				case ADC_RESISTANCE:
					gpio_set_value(priv->channel_0, PIN_LOW);
					break;

				case ADC_PULSE:
				case ADC_NONE:
				default:
					break;
			}
		}
	} else if (attr == &dev_attr_mode2) {
		if ((v = findNameToValue(adcMode_con, page)) != -1)
		{
			adcMode_ch2 = v;

			switch(adcMode_ch2)
			{
				case ADC_VOLTAGE:
				case ADC_CURRENT:
					gpio_set_value(priv->channel_1, PIN_HIGH);
					break;
	
				case ADC_RESISTANCE:
					gpio_set_value(priv->channel_1, PIN_LOW);
					break;
				
				case ADC_PULSE:	
				case ADC_NONE:
				default:
					break;
			}
		}
        } else {

		val = atoi(page);

		if (attr == &dev_attr_pSampleRate && (val >= MIN_SAMPLERATE && val <= MAX_SAMPLERATE)) {
			pruDataStruct->pSampleRate = val;
		} else if (attr == &dev_attr_pAvgWindow && (val <= MAX_PAVGWINDOW)) {
			pruDataStruct->pAvgWindow = atoi(page);
		} else if (attr == &dev_attr_threshold1 && (val <= MAX_THRESHOLD)) {
			pruDataStruct->pThreshold_ch0 = val;
		} else if (attr == &dev_attr_threshold2 && val <= MAX_THRESHOLD) {
			pruDataStruct->pThreshold_ch1 = val;
		} else {
			ret = -EINVAL;
		}
	}			

	pruDataStruct->pConfigFlag = 1; // Tell PRU to reset using new parameters

        return ret;
}

/******************************************************
 * Function     : uio_mcp3202_open
 * Input        : info pointer to driver data 
 *                Node id of current driver iteration 
 * Output       : Always returns 0 (no error)
 * Description  : Waits for power management to wake up the
 *                virtual device (MCP3202) software before
 *                it can be used. 
 ******************************************************/
static int uio_mcp3202_open(struct uio_info *info, struct inode *inode)
{
	struct uio_mcp3202_platdata *priv = info->priv;

	/* Wait until the Runtime PM code has woken up the device */
	pm_runtime_get_sync(&priv->pdev->dev);
	return 0;
}

/******************************************************
 * Function     : uio_mcp3202_release
 * Input        : info pointer to driver data 
 *                Node id of current driver iteration 
 * Output       : Always returns 0 (no error)
 * Description  : Forces the virtual device to go into 
 *                idle, informs the power management 
 *                system.
 ******************************************************/
static int uio_mcp3202_release(struct uio_info *info, struct inode *inode)
{
	struct uio_mcp3202_platdata *priv = info->priv;

	/* Tell the Runtime PM code that the device has become idle */
	pm_runtime_put_sync(&priv->pdev->dev);
	return 0;
}

/******************************************************
 * Function     : uio_mcp3202_handler
 * Input        : Activating IRQ number 
 *                Info structure of device 
 * Output       : Always returns IRQ_HANDLED (no error)
 * Description  : IRQ handler for the uio_mcp3202 device. 
 *                The IRQ is defined in the device tree 
 *                structure (soc) for the MCP3202.
 *		  This is the IRQ used by the PRU system
 *		  to indicate data is available to read.
 ******************************************************/
static irqreturn_t uio_mcp3202_handler(int irq, struct uio_info *dev_info)
{
	struct uio_mcp3202_platdata *priv = dev_info->priv;

	/* Just disable the interrupt in the interrupt controller, and
	 * remember the state so we can allow user space to enable it later.
	 */

	spin_lock(&priv->lock);
	if (!__test_and_set_bit(UIO_IRQ_DISABLED, &priv->flags))
		disable_irq_nosync(irq);
	spin_unlock(&priv->lock);

	return IRQ_HANDLED;
}

/******************************************************
 * Function     : uio_mcp3202_irqcontrol
 * Input        : info pointer to driver data 
 *                irq status (1 = on, 0 = off) 
 * Output       : Always returns 0 (no error)
 * Description  : This function allows the user space
 *                to enable or disable the interrupt in 
 *                the interrupt controller, but keep track
 *                of the state to prevent per-irq debt 
 *                debth damage.
 ******************************************************/
static int uio_mcp3202_irqcontrol(struct uio_info *dev_info, s32 irq_on)
{
	struct uio_mcp3202_platdata *priv = dev_info->priv;
	unsigned long flags;

	 /* Serialize this operation to support multiple tasks and concurrency
	 * with irq handler on SMP systems.
	 */

	spin_lock_irqsave(&priv->lock, flags);
	if (irq_on) {
		if (__test_and_clear_bit(UIO_IRQ_DISABLED, &priv->flags))
			enable_irq(dev_info->irq);
	} else {
		if (!__test_and_set_bit(UIO_IRQ_DISABLED, &priv->flags))
			disable_irq_nosync(dev_info->irq);
	}
	spin_unlock_irqrestore(&priv->lock, flags);

	return 0;
}

/******************************************************
 * Function     : uio_mcp3202_probe
 * Input        : Platform device structure 
 * Output       : Error condition
 * Description  : This function is called when the driver
 *                is bound to the device (mcp3202).
 *                It sets up conditions for the driver to
 *                operate. 
 ******************************************************/

static int uio_mcp3202_probe(struct platform_device *pdev)
{
	struct uio_info *uioinfo = dev_get_platdata(&pdev->dev);
	struct uio_mcp3202_platdata *priv;
	struct uio_mem *uiomem;
	int ret = -EAGAIN;
	int i;

	// Get the pointer to PRU0's UIO configuration structure.

	pruDataStruct = (ctrlData_s *) ioremap(0x4a300000 + 0x00010000, sizeof(ctrlData_s));

	// Make sure our driver is running, if not then abort.

	if (pruDataStruct->magic != MCP3202_MAGIC_NUMBER)
	{
		dev_err(&pdev->dev, "mcp3202 pru software not found, aborting mcp3202 UIO driver.\n");
		return -ENODEV;
	}
	
	if (pdev->dev.of_node) {
		/* alloc uioinfo for one device */
		uioinfo = devm_kzalloc(&pdev->dev, sizeof(*uioinfo),
				       GFP_KERNEL);
		if (!uioinfo) {
			dev_err(&pdev->dev, "mcp3202: unable to kmalloc\n");
			return -ENOMEM;
		}
		uioinfo->name = pdev->dev.of_node->name;
		uioinfo->version = "devicetree";
		/* Multiple IRQs are not supported */
	}
	
        if (!uioinfo || !uioinfo->name || !uioinfo->version) {
                if (!uioinfo)
                        dev_err(&pdev->dev, "mcp3202: missing platform_data structure\n");
                else if (!uioinfo->name)
                        dev_err(&pdev->dev, "mcp3202: missing platform_data name\n");
                else if (!uioinfo->version)
                        dev_err(&pdev->dev, "mcp3202: missing platform_data version\n");
                return ret;
        }

	if (uioinfo->handler || uioinfo->irqcontrol ||
	    uioinfo->irq_flags & IRQF_SHARED) {
		dev_err(&pdev->dev, "mcp3202: interrupt configuration error\n");
		return ret;
	}

	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
	if (!priv) {
		dev_err(&pdev->dev, "mcp3202: unable to kmalloc\n");
		return -ENOMEM;
	}

	priv->uioinfo = uioinfo;
	spin_lock_init(&priv->lock);
	priv->flags = 0; /* interrupt is enabled to begin with */
	priv->pdev = pdev;

        if (pdev->dev.of_node) {
                of_property_read_u32(pdev->dev.of_node, "channel_0", &priv->channel_0);
                of_property_read_u32(pdev->dev.of_node, "channel_1", &priv->channel_1);
        } else {
		dev_err(&pdev->dev, "mcp3202: channels not defined.\n");
		return -ENODEV;
	}

	gpio_direction_output(priv->channel_0, 0);
	gpio_direction_output(priv->channel_1, 0);
	if (!uioinfo->irq) {
		ret = platform_get_irq(pdev, 0);
		uioinfo->irq = ret;
		if (ret == -ENXIO && pdev->dev.of_node)
			uioinfo->irq = UIO_IRQ_NONE;
		else if (ret < 0) {
			dev_err(&pdev->dev, "mcp3202: failed to get IRQ\n");
			return ret;
		}
	}

	uiomem = &uioinfo->mem[0];

	for (i = 0; i < pdev->num_resources; ++i) {
		struct resource *r = &pdev->resource[i];

		if (r->flags != IORESOURCE_MEM)
			continue;

		if (uiomem >= &uioinfo->mem[MAX_UIO_MAPS]) {
			dev_warn(&pdev->dev, "mcp3202: device has more than "
					__stringify(MAX_UIO_MAPS)
					" I/O memory resources.\n");
			break;
		}

		uiomem->memtype = UIO_MEM_PHYS;
		uiomem->addr = r->start;
		uiomem->size = resource_size(r);
		uiomem->name = r->name;
		++uiomem;
	}

	while (uiomem < &uioinfo->mem[MAX_UIO_MAPS]) {
		uiomem->size = 0;
		++uiomem;
	}

	/* This driver requires no hardware specific kernel code to handle
	 * interrupts. Instead, the interrupt handler simply disables the
	 * interrupt in the interrupt controller. User space is responsible
	 * for performing hardware specific acknowledge and re-enabling of
	 * the interrupt in the interrupt controller.
	 *
	 * Interrupt sharing is not supported.
	 */

	uioinfo->handler = uio_mcp3202_handler;
	uioinfo->irqcontrol = uio_mcp3202_irqcontrol;
	uioinfo->open = uio_mcp3202_open;
	uioinfo->release = uio_mcp3202_release;
	uioinfo->priv = priv;

	/* Enable Runtime PM for this device:
	 * The device starts in suspended state to allow the hardware to be
	 * turned off by default. The Runtime PM bus code should power on the
	 * hardware and enable clocks at open().
	 */
	pm_runtime_enable(&pdev->dev);

	ret = uio_register_device(&pdev->dev, priv->uioinfo);
	if (ret) {
		dev_err(&pdev->dev, "mcp3202: unable to register uio device\n");
		pm_runtime_disable(&pdev->dev);
		return -EAGAIN;
	}

	platform_set_drvdata(pdev, priv);

	while (dev_groups[i] != NULL)
	{
		if (sysfs_create_group(&pdev->dev.kobj, dev_groups[i]))
			break;
		i++;
	}

	if (dev_groups[i] != NULL)
	{
		dev_err(&pdev->dev, "mcp3202: failed to create device files\n");
	}

	return 0;
}

/******************************************************
 * Function     : uio_mcp3202_remove
 * Input        : Platform device structure 
 * Output       : Error condition (always 0)
 * Description  : This function is called when the driver
 *                is unbound from the device (mcp3202).
 *                It is called only when the driver is
 *                being removed (rmmod).
 ******************************************************/
static int uio_mcp3202_remove(struct platform_device *pdev)
{
	struct uio_mcp3202_platdata *priv = platform_get_drvdata(pdev);

	uio_unregister_device(priv->uioinfo);
	pm_runtime_disable(&pdev->dev);

	priv->uioinfo->handler = NULL;
	priv->uioinfo->irqcontrol = NULL;

	return 0;
}

/******************************************************
 * Function     : uio_mcp3202_runtime_nop
 * Input        : Device structure 
 * Output       : Error condition (always 0)
 * Description  : This is the runtime PM callback function
 *                shared between runtime_suspend and
 *                runtime_resume.  It does nothing. 
 *                This Runtime PM callback does not need to 
 *                save or restore any registers since user 
 *                space is responsbile for hardware register 
 *                reinitialization after open().
 ******************************************************/
static int uio_mcp3202_runtime_nop(struct device *dev)
{
	return 0;
}

int findNameToValue(struct parse_s *parseCon, const char *name)
{
        int retVal = -1;
        int index = 0;

        while (parseCon[index].str != NULL && retVal == -1)
        {
                if (strnicmp(parseCon[index].str, name, strlen(parseCon[index].str)) == 0)
                {
                        retVal = parseCon[index].val;
                } else {
                        index++;
                }
        }

        return retVal;
}

char *findValueToName(struct parse_s *parseCon, int val)
{
        char *retVal = NULL;
        int index = 0;

        while (parseCon[index].str != NULL && retVal == NULL)
        {
                if (parseCon[index].val == val)
                {
                        retVal = parseCon[index].str;
                } else {
                        index++;
                }
        }

        return retVal;
}

int atoi(const char *str)
{
    int res = 0; // Initialize result
    int i = 0;

    // Iterate through all characters of input string and update result
    for (i = 0; (str[i] >= '0' && str[i] <= '9'); ++i)
        res = res*10 + str[i] - '0';

    return res;
}

int popStack(uint16_t *vch1, uint16_t *vch2)
{
	int retVal = 1; // 0 = Ok, 1 = No data on stack

	while (pruDataStruct->stackLock == 1) msleep(50);
	pruDataStruct->stackLock = 1;

	if (pruDataStruct->stackCount)
	{
		*vch1 = pruDataStruct->stack[pruDataStruct->stackTail].ch1;
		*vch2 = pruDataStruct->stack[pruDataStruct->stackTail].ch2;

		pruDataStruct->stackTail++;
		pruDataStruct->stackCount--;

		if (pruDataStruct->stackTail >= STACK_SIZE)
			pruDataStruct->stackTail = 0;

		if (pruDataStruct->stackTail == pruDataStruct->stackHead)
			pruDataStruct->stackCount = 0; // Just to be safe

		retVal = 0;
	} else {
		// Reset on empty stack

		pruDataStruct->stackTail = pruDataStruct->stackHead = 0;

		*vch1 = 0;
		*vch2 = 0;
	}

	pruDataStruct->stackLock = 0;

	return retVal;
}

static const struct dev_pm_ops uio_mcp3202_dev_pm_ops = {
	.runtime_suspend = uio_mcp3202_runtime_nop,
	.runtime_resume = uio_mcp3202_runtime_nop,
};

static struct of_device_id uio_of_mcp3202_dt_id[] = {
	{  .compatible = "ti,pruss"  },
	{ }
};

MODULE_DEVICE_TABLE(of, uio_of_mcp3202_dt_id);
module_param_string(of_id, uio_of_mcp3202_dt_id[0].compatible, 128, 0);
MODULE_PARM_DESC(of_id, "Openfirmware id of the device to be handled by uio");

static struct platform_driver uio_mcp3202_drv = {
	.probe = uio_mcp3202_probe,
	.remove = uio_mcp3202_remove,
	.driver = {
		.name = DRIVER_NAME,
		.pm = &uio_mcp3202_dev_pm_ops,
		.of_match_table = of_match_ptr(uio_of_mcp3202_dt_id),
	},
};

module_platform_driver(uio_mcp3202_drv);

MODULE_AUTHOR("bryan wilcutt");
MODULE_DESCRIPTION("LynxSpring ONYXX MCP3202 Driver");
MODULE_LICENSE("GPL");
MODULE_ALIAS("platform:" DRIVER_NAME);
