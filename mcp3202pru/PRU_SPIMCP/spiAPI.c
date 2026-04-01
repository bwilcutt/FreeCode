/***************************************************************************************
 * File		: SPI.C
 * Program	: PRU MCP3202 Reader
 * Author	: Bryan Wilcutt
 *
 * Description	:
 *
 * Interface API to communicate with the SPI bus using the PRU processor.
 *
 * Developed from the document:
 * "AM335x Sitara Processors, Technical Reference Manual" - Revision January 2016,
 * Literature Number: SPRUH73M, by Texas Instruments.
 * See section 24, "Multichannel Serial Port Interface (McSPI)", pp. 4779.
 *
 * Usage:
 *
 * This file contains API calls to manage, manipulate and control the SPI processor
 * via the PRU processor.  This API uses a stateless discipline.
 *
 * API Calls--
 *
 * SPI_ClkConfig
 * SPI_WordLengthSet
 * SPI_CSSet
 * SPI_CSTimeControlSet
 * SPI_CSAssert
 * SPI_CSDeAssert
 * SPI_StartBitEnable
 * SPI_StartBitPolaritySet
 * SPI_CSPolaritySet
 * SPI_StartBitDisable
 * SPI_MasterModeEnable
 * SPI_SlaveModeEnable
 * SPI_MasterModeSet
 * SPI_SlaveModeSet
 * SPI_ChannelSet
 * SPI_Reset
 * SPI_DataPinDirection
 * SPI_TurboModeSet
 * SPI_TxFIFOSet
 * SPI_RxFIFOSet
 * SPI_FIFOTrigLvlSet
 * SPI_WordCountSet
 * SPI_DMASet
 * SPI_IntSet
 * SPI_InitDelaySet
 * SPI_SysTestModeSet
 * SPI_SlaveSelect
 * SPI_TransmitData
 * SPI_BlitData
 * SPI_ReceiveData
 * SPI_IntStatusGet
 * SPI_IntStatusClear
 * SPI_ClkRead
 * SPI_ClkForceWrite
 * SPI_DataPinRead
 * SPI_DataPinWrite
 * SPI_CSRead
 * SPI_CSForceWrite
 * SPI_ChannelStatusGet
 * SPI_MultipleWordAccessSet
 * SPI_FIFODatManagementSet
 * SPI_AutoIdleSet
 * SPI_SmartIdleSet
 * SPI_ClkActivitySet
 *
 * Note: Some portions of code have been borrowed from or enfluenced by TI based
 * 		 handler code for the SPI.
 **************************************************************************************/

#include <stdint.h>
#include <pru_cfg.h>
#include <pru_ctrl.h>
#include <spiAPI.h>

/**********************************************************************
 * Function		: SPI_ClkConfig
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: Src Max Frequency of Device (PRU = 48MHZ)
 * Input		: Desired frequency based on sample bit size
 * Input		: chNum Channel number of the SPI_ instance used.
 * Input		: clkMode Clock mode used.
 * 		    	  SPI_CLK_MODE_{0..3}
 * Output		: None
 * Description	:
 *
 * This API will configure the clkD and extClk fields to generate
 * required spi clock depending on the type of granularity. It will
 * also set the phase and polarity of spiClk by the clkMode field.
 *
 * Note that in slave mode, the slave clk is driven by the master clock.
 * Make sure INPUT_EN is set for the CLK pin in the device tree so that
 * the pinctrl can loop the CLK.
 *
 * Calculate rate example:
 *
 * 48Mhz PRU
 *
 * 100K samples per second at 16-bits per sample = 1.6Mb
 * 48Mhz / 1.6Mb = Ratio of 30
 * Therefore, srcFreq = 48000000, sampleFreq = 1600000
 **********************************************************************/
void SPI_ClkConfig(uint32_t spiAddr, uint32_t srcFreq, uint32_t sampleFreq, uint32_t chNum, uint32_t clkMode)
{
	uint32_t fRatio = 0;
	uint32_t extClk = 0;
	uint32_t clkD 	= 0;

	// Calculate the value of fRatio.
	fRatio = (srcFreq / sampleFreq);

	// If fRatio is not a power of 2, set granularity of 1 clock cycle
	if (0 != (fRatio & (fRatio - 1)))
	{
		// Set the clock granularity to 1 clock cycle.
		SPIREG(spiAddr + SPI_CHCONF(chNum)) |= SPI_CHCONF_CLKG;

		// Calculate the ratios clkD and extClk based on fClk
		extClk = (fRatio - 1) >> 4;
		clkD = (fRatio - 1) & SPI_CLKD_MASK;

		// Clear the extClk field of SPI_CHCTRL register.
		SPIREG(spiAddr + SPI_CHCTRL(chNum)) &= ~SPI_CHCTRL_EXTCLK;

		// Set the extClk field of SPI_CHCTRL register.
		SPIREG(spiAddr + SPI_CHCTRL(chNum)) |= (extClk << SPI_CHCTRL_EXTCLK_SHIFT);
	} else {
		// Clock granularity of power of 2.
		SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_CLKG;

		while(1 != fRatio)
		{
			fRatio /= 2;
			clkD++;
		}
	}

	// Clearing the clkD field of SPI_CHCONF register.
	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_CLKD;

	// Configure the clkD field of SPI_CHCONF register.
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= (clkD << SPI_CHCONF_CLKD_SHIFT);

	// Clearing the clkMode field of SPI_CHCONF register.
	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~(SPI_CHCONF_PHA | SPI_CHCONF_POL);

	// Configure the clkMode of SPI_CHCONF register.
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= (clkMode & (SPI_CHCONF_PHA | SPI_CHCONF_POL));
}

/**********************************************************************
 * Function		: SPI_WordLengthSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: wordLength Length of a data word used for SPI_ communication.
 * 			      use SPI_WORD_LENGTH(4...32) macro for conversion.
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * This API will configure the length of SPI_ word used for
 * communication.
 **********************************************************************/
inline void SPI_WordLengthSet(uint32_t spiAddr, uint32_t wordLength, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_WL;
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= (wordLength & SPI_CHCONF_WL);
}

/**********************************************************************
 * Function		: SPI_CSSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: Mode
 * 			      SPI_CS_ENABLE | SPI_CS_DISABLE
 * Output		: None
 * Description	:
 *
 * Modification of CS polarity, SPI clock phase and polarity is not
 * allowed when CS is enabled.  Enables or disables the CS line.
 **********************************************************************/
void SPI_CSSet(uint32_t spiAddr, uint32_t mode)
{
	if (mode == SPI_CS_ENABLE)
	{
		SPIREG(spiAddr + SPI_MODULCTRL) &= ~SPI_MODULCTRL_PIN34;
	} else if (mode == SPI_CS_DISABLE) {
		SPIREG(spiAddr + SPI_MODULCTRL) |= SPI_MODULCTRL_PIN34;
	}
}

/**********************************************************************
 * Function		: SPI_CSPolaritySet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: spiEnPol Polarity of CS line.
 * 			      SPI_CS_POL_HIGH | SPI_CS_POL_LOW
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Sets whether CS line is held High or Low during activity (I/O).
 **********************************************************************/
inline void SPI_CSPolaritySet(uint32_t spiAddr, uint32_t spiEnPol, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_EPOL;
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= (spiEnPol & SPI_CHCONF_EPOL);
}

/**********************************************************************
 * Function		: SPI_CSTimeControlSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: csTimeControl Chip Select time control.
 * 			      Selects x in SPI_CS_TCS_xPNT5_CLK
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Sets the CS timing control.
 **********************************************************************/
inline void SPI_CSTimeControlSet(uint32_t spiAddr, uint32_t csTimeControl, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_TCS0;
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= (csTimeControl & SPI_CHCONF_TCS0);
}

/**********************************************************************
 * Function		: SPI_CSAssert
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Asserts the CS line.
 **********************************************************************/
inline void SPI_CSAssert(uint32_t spiAddr, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= (SPI_CHCONF_FORCE);
}
/**********************************************************************
 * Function		: SPI_CSDeAssert
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Deasserts the CS line.
 **********************************************************************/
inline void SPI_CSDeAssert(uint32_t spiAddr, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~(SPI_CHCONF_FORCE);
}

/**********************************************************************
 * Function		: SPI_StartBitEnable
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: none.
 * Description	:
 *
 * Enables the start bit.
 **********************************************************************/
inline void SPI_StartBitEnable(uint32_t spiAddr, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= SPI_CHCONF_SBE;
}

/**********************************************************************
 * Function		: SPI_StartBitPolaritySet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: startBitPol Polarity of start bit.
 * 			      SPI_START_BIT_POL_LOW | SPI_START_BIT_POL_HIGH
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Sets the polarity of start bit to be held low or high duing xmission.
 **********************************************************************/
inline void SPI_StartBitPolaritySet(uint32_t spiAddr, uint32_t startBitPol, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_SBPOL;
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= (startBitPol & SPI_CHCONF_SBPOL);
}

/**********************************************************************
 * Function		: SPI_StartBitDisable
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Disables the start bit mode of the SPI.
 **********************************************************************/
inline void SPI_StartBitDisable(uint32_t spiAddr, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_SBE;
}

/**********************************************************************
 * Function		: SPI_MasterModeEnable
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Enables the SPI master mode.
 **********************************************************************/
inline void SPI_MasterModeEnable(uint32_t spiAddr)
{
	SPIREG(spiAddr + SPI_MODULCTRL) &= ~SPI_MODULCTRL_MS;
	SPIREG(spiAddr + SPI_SYST) &= ~SPI_SYST_SPIENDIR;
}

/**********************************************************************
 * Function		: SPI_SlaveModeEnable
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Enables the SPI Slave Mode.
 **********************************************************************/
inline void SPI_SlaveModeEnable(uint32_t spiAddr)
{
	SPIREG(spiAddr + SPI_MODULCTRL) |= SPI_MODULCTRL_MS;
	SPIREG(spiAddr + SPI_SYST) |= SPI_SYST_SPIENDIR;
}

/**********************************************************************
 * Function		: SPI_MasterModeSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: channelMode Single/Multi channel.
 * 			      SPI_SINGLE_CH | SPI_MULTI_CH
 * Input		: trMode Transmit/Receive mode used in master configuration.
 * 			      SPI_TX_RX_MODE | SPI_RX_ONLY_MODE | SPI_TX_ONLY_MODE
 * Input		: pinMode Interface mode and pin assignment.
 * 			      SPI_DATA_LINE_COMM_MODE_{0..7}
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: TRUE - Success  FALSE - Failed (bad Mode?)
 * Description	:
 *
 * Enables the SPI controller in master mode and configures all
 * communication parameters.
 **********************************************************************/
uint32_t SPI_MasterModeSet(uint32_t spiAddr, uint32_t channelMode, uint32_t trMode, uint32_t pinMode, uint32_t chNum)
{
	uint32_t retVal = FALSE;

	SPIREG(spiAddr + SPI_MODULCTRL) &= ~SPI_MODULCTRL_SINGLE; // Clear MS channel mode
	SPIREG(spiAddr + SPI_MODULCTRL) |= (channelMode & SPI_MODULCTRL_SINGLE); // Set MS

	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_TRM; // Clear TRM
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= (trMode & SPI_CHCONF_TRM); // Set TRM

	// Avoid setting SPI into combinations that result in bad states.

	if (((SPI_TX_RX_MODE == trMode) && (SPI_DATA_LINE_COMM_MODE_3 == pinMode)) ||
			((SPI_TX_ONLY_MODE == trMode) && (SPI_DATA_LINE_COMM_MODE_3 == pinMode)) ||
			((SPI_TX_RX_MODE == trMode) && (SPI_DATA_LINE_COMM_MODE_7 == pinMode)) ||
			((SPI_TX_ONLY_MODE == trMode) && (SPI_DATA_LINE_COMM_MODE_7 == pinMode)))
	{
		retVal = FALSE;
	} else {
		SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~(SPI_CHCONF_IS | SPI_CHCONF_DPE1 | SPI_CHCONF_DPE0); // Clear IS/DPE0/DPE1
		SPIREG(spiAddr + SPI_CHCONF(chNum)) |= (pinMode & (SPI_CHCONF_IS | SPI_CHCONF_DPE1 | SPI_CHCONF_DPE0)); // Set IS/DPE0/DPE1

		retVal = TRUE;
	}

	return retVal;
}

/**********************************************************************
 * Function		: SPI_SlaveModeSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: channelMode Single/Multi channel.
 * 			      SPI_SINGLE_CH | SPI_MULTI_CH
 * Input		: trMode Transmit/Receive mode used in master configuration.
 * 			      SPI_TX_RX_MODE | SPI_RX_ONLY_MODE | SPI_TX_ONLY_MODE
 * Input		: pinMode Interface mode and pin assignment.
 * 			      SPI_DATA_LINE_COMM_MODE_{0..7}
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: TRUE - Success FALSE - Error (bad mode?)
 * Description	:
 *
 * Enables the SPI controller in master mode and configures all
 * communication parameters.  Only channel 0 is allowed for communication
 * in slave mode.
 **********************************************************************/
uint32_t SPI_SlaveModeSet(uint32_t spiAddr, uint32_t trMode, uint32_t pinMode)
{
	uint32_t retVal = TRUE;

	// Clear the TRM field of SPI_CHCONF register.
	SPIREG(spiAddr + SPI_CHCONF(SPI_CH_NUM_0)) &= ~SPI_CHCONF_TRM;

	// Set the TRM field with the user sent value.
	SPIREG(spiAddr + SPI_CHCONF(SPI_CH_NUM_0)) |= (trMode & SPI_CHCONF_TRM);

	if (((SPI_TX_RX_MODE == trMode) && (SPI_DATA_LINE_COMM_MODE_3 == pinMode)) ||
			((SPI_TX_ONLY_MODE == trMode) && (SPI_DATA_LINE_COMM_MODE_3 == pinMode)) ||
			((SPI_TX_RX_MODE == trMode) && (SPI_DATA_LINE_COMM_MODE_7 == pinMode)) ||
			((SPI_TX_ONLY_MODE == trMode) && (SPI_DATA_LINE_COMM_MODE_7 == pinMode)))
	{
		retVal = FALSE;
	} else {
		// Clear the IS, DPE0, DPE1 fields of SPI_CHCONF register.
		SPIREG(spiAddr + SPI_CHCONF(SPI_CH_NUM_0)) &= ~(SPI_CHCONF_IS | SPI_CHCONF_DPE1 | SPI_CHCONF_DPE0);

		// Set the IS, DPE0, DPE1 fields with the user sent values.
		SPIREG(spiAddr + SPI_CHCONF(SPI_CH_NUM_0)) |= (pinMode & (SPI_CHCONF_IS | SPI_CHCONF_DPE1 | SPI_CHCONF_DPE0));
	}

	return retVal;
}

/**********************************************************************
 * Function		: SPI_ChannelSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: Mode
 *   			  SPI_CHANNEL_ENABLE | SPI_CHANNEL_DISABLE
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Enables  or disables the controller of the SPI controller.  Note that
 * channel 0 is only for slave mode.
 **********************************************************************/
inline void SPI_ChannelSet(uint32_t spiAddr, uint32_t mode, uint32_t chNum)
{
	if (mode == SPI_CHANNEL_ENABLE)
	{
		SPIREG(spiAddr + SPI_CHCTRL(chNum)) |= SPI_CHCTRL_EN_ACTIVE;
	} else if (mode == SPI_CHANNEL_DISABLE) {
		SPIREG(spiAddr + SPI_CHCTRL(chNum)) &= ~SPI_CHCTRL_EN_ACTIVE;
	}
}

/**********************************************************************
 * Function		: SPI_Reset
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Resets the specified SPI peripheral.  Waits for reset to complete
 * before returning.  Make sure CLOCKS ARE ON (PER) before calling this
 * function or it will "hang".
 **********************************************************************/
inline void SPI_Reset(uint32_t spiAddr)
{
	SPIREG(spiAddr + SPI_SYSCONFIG) |= SPI_SYSCONFIG_SOFTRESET;
	while(!(SPI_SYSSTATUS_RESETDONE_COMPLETED & SPIREG(spiAddr + SPI_SYSSTATUS)));
}

/**********************************************************************
 * Function		: SPI_TurboModeEnable
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: Mode
 * 	    		  SPI_TURBO_ENABLE | SPI_TURBO_DISABLE
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Enables or disables the SPI turbo mode.
 **********************************************************************/
inline void SPI_TurboModeSet(uint32_t spiAddr, uint32_t mode, uint32_t chNum)
{
	if (mode == SPI_TURBO_ENABLE)
	{
		SPIREG(spiAddr + SPI_CHCONF(chNum)) |= SPI_CHCONF_TURBO;
	} else if (mode == SPI_TURBO_DISABLE) {
		SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_TURBO;
	}
}

/**********************************************************************
 * Function		: SPI_DataPinDirection
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: datDirection Will enable either of the data pins as i/p or o/p.
 * 		    	  SPI_DAT0_OUT_DAT1_IN | SPI_DAT1_OUT_DAT0_IN
 * Output		: None
 * Description	:
 *
 * Configures direction of D0 and D1.
 **********************************************************************/
inline void SPI_DataPinDirection(uint32_t spiAddr, uint32_t datDirection)
{
	SPIREG(spiAddr + SPI_SYST) &= ~(SPI_SYST_SPIDATDIR1 | SPI_SYST_SPIDATDIR0);
	SPIREG(spiAddr + SPI_SYST) |= (datDirection & (SPI_SYST_SPIDATDIR0 | SPI_SYST_SPIDATDIR1));
}

/**********************************************************************
 * Function		: SPI_TxFIFOEnable
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: txFifo FIFO used for transmit mode.
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Enables Tx FIFO for the given SPI and Channel.
 **********************************************************************/
inline void SPI_TxFIFOEnable(uint32_t spiAddr, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= SPI_CHCONF_FFEW;
}

/**********************************************************************
 * Function		: SPI_TxFIFODisable
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Disables Tx FIFO for the given SPI and Channel.
 **********************************************************************/
inline void SPI_TxFIFODisable(uint32_t spiAddr, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_FFEW;
}

/**********************************************************************
 * Function		: SPI_TxFIFOEmpy
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: Returns 1 if Tx FIFO is empty, 0 if not empty
 * Description	:
 *
 * Returns TX FIFO Status.
 ***********************************************************************/
inline uint32_t Is_TxFIFOEmpty(uint32_t spiAddr, uint32_t chNum)
{
	return (SPI_CHCONF_FFEW == (SPIREG(spiAddr + SPI_CHCONF(chNum)) & SPI_CHCONF_FFEW));
}

/**********************************************************************
 * Function		: Is_TxFIFOEnabled
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: txFifo FIFO used for transmit mode.
 * Output		: Returns 1 if TX Fifo Enabled, 0 if not enabled
 * Description	:
 *
 * Returns TX FIFO Status
 **********************************************************************/
inline uint32_t Is_TxFIFOEnabled(uint32_t spiAddr, uint32_t chNum)
{
	return (SPI_CHCONF_FFEW_FFENABLED == (SPIREG(spiAddr + SPI_CHCONF(chNum)) & SPI_CHCONF_FFEW_FFENABLED));
}

/**********************************************************************
 * Function		: SPI_RxFIFOSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: rxFifo FIFO used for receive mode.
 * 	    		  SPI_RX_FIFO_ENABLE | SPI_RX_FIFO_DISABLE
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Enables the RX fifo which can only be done on one channel.
 **********************************************************************/
inline void SPI_RxFIFOEnable(uint32_t spiAddr, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) |= SPI_CHCONF_FFER;
}

inline void SPI_RxFIFODisable(uint32_t spiAddr, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~SPI_CHCONF_FFER;
}

inline uint32_t Is_RxFIFOEmpty(uint32_t spiAddr, uint32_t chNum)
{
	return (SPI_CHCONF_FFER == (SPIREG(spiAddr + SPI_CHCONF(chNum)) & SPI_CHCONF_FFER));
}

inline uint32_t Is_RxFIFOEnabled(uint32_t spiAddr, uint32_t chNum)
{
	return (SPI_CHCONF_FFER_FFENABLED == (SPIREG(spiAddr + SPI_CHCONF(chNum)) & SPI_CHCONF_FFER_FFENABLED));
}

inline uint32_t Is_RxDataReady(uint32_t spiAddr, uint32_t chNum)
{
	return (SPI_CHSTAT_RXS == (SPIREG(spiAddr + SPI_CHSTAT(chNum)) & SPI_CHSTAT_RXS));
}

/**********************************************************************
 * Function		: SPI_FIFOTrigLvlSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: afl Buffer almost full value.
 * Input		: ael Buffer almost empty value.
 * Input		: trMode Transmit/Receive modes used.
 * 	    		  SPI_TX_RX_MODE | SPI_RX_ONLY_MODE | SPI_TX_ONLY_MODE
 * Output		: None
 * Description	:
 *
 * Values for afl and ael will have varying values depending on
 * trMode. If trMode is SPI_TX_RX_MODE then afl and ael can take
 * values ranging from 0-19. If trMode is SPI_RX_ONLY_MODE/
 * SPI_TX_ONLY_MODE then afl and ael can take values from 0-39.
 *
 * While configuring mode of operation using trMode please ensure the
 * same value of trMode is used while using API's SPI_MasterMode
 * and SPI_SlaveMode. Mismatch while using trMode for different
 * APIs can result in unpredictable behaviour.
 *
 * For 'ael' and 'afl' please send level values for both of the fields
 * and do not send the value which has to be written into the register
 * for the corresponding level value.
 * For e.g. if 'ael' or 'afl' has to be 1 byte, then pass the parameter
 * 'ael' or 'afl' as 1 and not 0 because the value which has to be
 * written into register is manipulated inside the driver itself.
 **********************************************************************/
void SPI_FIFOTrigLvlSet(uint32_t spiAddr, uint8_t afl, uint8_t ael, uint32_t trMode)
{
	switch(trMode)
	{
		case SPI_TX_ONLY_MODE:
			// Clear the AEL field of SPI_XFERLEVEL register.
			SPIREG(spiAddr + SPI_XFERLEVEL) &= ~SPI_XFERLEVEL_AEL;

			// Set the AEL field with the user sent value.
			SPIREG(spiAddr + SPI_XFERLEVEL) |= ((ael - 1) & SPI_XFERLEVEL_AEL);
			break;

		case SPI_RX_ONLY_MODE:
			// Clear the AFL field of SPI_XFERLEVEL register.
			SPIREG(spiAddr + SPI_XFERLEVEL) &= ~SPI_XFERLEVEL_AFL;

			// Set the AFL field with the user sent value.
			SPIREG(spiAddr + SPI_XFERLEVEL) |= (((afl - 1) << SPI_XFERLEVEL_AFL_SHIFT) & SPI_XFERLEVEL_AFL);
			break;

		default:
		case SPI_TX_RX_MODE:
			// Clear the AFL and AEL fields of SPI_XFERLEVEL register.
			SPIREG(spiAddr + SPI_XFERLEVEL) &= ~(SPI_XFERLEVEL_AFL | SPI_XFERLEVEL_AEL);

			// Set the AFL and AEL fields with the user sent value.
			SPIREG(spiAddr + SPI_XFERLEVEL) |= ((((afl-1) << SPI_XFERLEVEL_AFL_SHIFT) & SPI_XFERLEVEL_AFL) | ((ael - 1) & SPI_XFERLEVEL_AEL));
			break;
	}
}

/**********************************************************************
 * Function		: SPI_WordCountSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: wCnt Word count.
 * Output		: None
 * Description	:
 *
 * Sets the transfer word count.
 **********************************************************************/
inline void SPI_WordCountSet(uint32_t spiAddr, uint16_t wCnt)
{
	SPIREG(spiAddr + SPI_XFERLEVEL) &= ~SPI_XFERLEVEL_WCNT;
	SPIREG(spiAddr + SPI_XFERLEVEL) |= (wCnt << SPI_XFERLEVEL_WCNT_SHIFT);
}

/**********************************************************************
 * Function		: SPI_DMASet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: Mode
 *    			  SPI_DMA_ENABLE | SPI_DMA_DISABLE
 * Input		: dmaFlags Variable used to enable DMA mode for Rx/Tx events.
 * 				  SPI_DMA_RX_EVENT | SPI_DMA_TX_EVENT
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Enables or disables the DMA read/write for the SPI.
 **********************************************************************/
inline void SPI_DMASet(uint32_t spiAddr, uint32_t mode, uint32_t dmaFlags, uint32_t chNum)
{
	if (mode == SPI_DMA_ENABLE)
	{
		SPIREG(spiAddr + SPI_CHCONF(chNum)) |= (dmaFlags & (SPI_CHCONF_DMAR | SPI_CHCONF_DMAW));
	} else if (mode == SPI_DMA_DISABLE) {
		SPIREG(spiAddr + SPI_CHCONF(chNum)) &= ~(dmaFlags & (SPI_CHCONF_DMAR | SPI_CHCONF_DMAW));
	}
}

/**********************************************************************
 * Function		: SPI_IntSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: intFlags Represents the various interrupts to be enabled.
 * 	     		  SPI_INT_TX_EMPTY(chan) | SPI_INT_TX_UNDERFLOW(chan) |
 *   			  SPI_INT_RX_FULL(chan) | SPI_INT_RX0_OVERFLOW | SPI_INT_EOWKE
 * Input		: Mode
 * 	    		  SPI_INT_ENABLE | SPI_INT_DISABLE
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: None
 * Description	:
 *
 * Sets and enables the SPI interrupt.
 **********************************************************************/
inline void SPI_IntSet(uint32_t spiAddr, uint32_t mode, uint32_t intFlags)
{
	if (mode == SPI_INT_ENABLE)
	{
		SPIREG(spiAddr + SPI_IRQENABLE) |= intFlags;
	} else if (mode == SPI_INT_DISABLE) {
		SPIREG(spiAddr + SPI_IRQENABLE) &= ~intFlags;
	}
}

/**********************************************************************
 * Function		: SPI_InitDelaySet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: initDelay Delay used for first transfer.
 * 		    	  SPI_INITDLY_0 | SPI_INITDLY_4 | SPI_INITDLY_8 |
 *     			  SPI_INITDLY_16 | SPI_INITDLY_32
 * Output		: None
 * Description	:
 *
 * Sets the initial delay for the first transfer from the SPI.  It is
 * only available in single master mode.
 **********************************************************************/
inline void SPI_InitDelaySet(uint32_t spiAddr, uint32_t initDelay)
{
	SPIREG(spiAddr + SPI_MODULCTRL) &= ~SPI_MODULCTRL_INITDLY;
	SPIREG(spiAddr + SPI_MODULCTRL) |= (initDelay & SPI_MODULCTRL_INITDLY);
}

/**********************************************************************
 * Function		: SPI_SysTestModeSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: sysTest Value mode
 *                SPI_SYSTEST_ENABLE | SPI_SYSTEST_DISABLE
 * Output		: None
 * Description	:
 *
 * Enables or disables the SYSTEST mode.
 **********************************************************************/
inline void SPI_SysTestModeSet(uint32_t spiAddr, uint32_t sysTest)
{
	SPIREG(spiAddr + SPI_MODULCTRL) &= ~SPI_MODULCTRL_SYSTEM_TEST;
	SPIREG(spiAddr + SPI_MODULCTRL) |= (sysTest & SPI_MODULCTRL_SYSTEM_TEST);
}

/**********************************************************************
 * Function		: SPI_SlaveSelect
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: slaveSelect Mode
 * 	    		  SPI_SLAVE_DETECT_{0..4}
 * Output		: None
 * Description	:
 *
 * Enables SPIEN on for slave signal detection when in slave mode.
 **********************************************************************/
inline void SPI_SlaveSelect(uint32_t spiAddr, uint32_t slaveSelect)
{
	SPIREG(spiAddr + SPI_CHCONF(SPI_CH_NUM_0)) &= ~SPI_CHCONF_SPIENSLV;
	SPIREG(spiAddr + SPI_CHCONF(SPI_CH_NUM_0)) |= (slaveSelect &	SPI_CHCONF_SPIENSLV);
}

/**********************************************************************
 * Function		: SPI_TransmitData
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: Data to transmit
 * Input		: chNum Channel number of the SPI_ instance used.
 * Description	:
 *
 * Writes data to the SPI channel.
 **********************************************************************/
inline void SPI_TransmitData32(uint32_t spiAddr, uint32_t txData, uint32_t chNum)
{
	SPIREG(spiAddr + SPI_TX(chNum)) = txData;
}

inline void SPI_TransmitData16(uint32_t spiAddr, uint16_t txData, uint32_t chNum)
{
	SPIREG16(spiAddr + SPI_TX(chNum)) = txData;
}

inline void SPI_TransmitData8(uint32_t spiAddr, uint8_t txData, uint32_t chNum)
{
	SPIREG8(spiAddr + SPI_TX(chNum)) = txData;
}

/**********************************************************************
 * Function		: SPI_BlitOutData
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: Data to transmit
 * Input		: Bits to write (1-32)
 * Input		: chNum Channel number of the SPI_ instance used.
 * Description	:
 *
 * Writes the bits located in the  transmit data.  Writes MSB first followed
 * by remaining bits.  Example:
 * Data 0000 0000 0000 0000 0000 0110 1000 1101 Bits 14
 *                            ^-- MSB         ^-- LSB
 **********************************************************************/
uint32_t SPI_BlitOutData(uint32_t spiAddr, uint32_t txData, uint32_t bitcount, uint32_t chNum)
{
	uint32_t retVal = FALSE; // Default failure, pin direction not set
	int bits = 0;
	uint32_t shift = 0;
	uint32_t mask = 0;

	if (SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIDATDIR1)
	{
		shift = SPI_SYST_SPIDAT_0_SHIFT;
		mask = SPI_SYST_SPIDAT_0;
		retVal = TRUE;
	} else if (SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIDATDIR0) {
		shift = SPI_SYST_SPIDAT_1_SHIFT;
		mask = SPI_SYST_SPIDAT_1;
		retVal = TRUE;
	}

	for (bits = 0; bits < bitcount && retVal == TRUE; bits++)
	{
		if ((1 << (bitcount - bits - 1)) & txData)
		{
			SPIREG(spiAddr + SPI_SYST) |= (1 << shift);
		} else {
			SPIREG(spiAddr + SPI_SYST) &= ~(mask);
		}
	}

	return retVal;
}
/**********************************************************************
 * Function		: SPI_ReceiveData32
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: chNum Channel number of the SPI_ instance used.
 * Output		: Read 32bit value
 * Description	:
 *
 * Reads data from the SPI.
 **********************************************************************/
inline uint32_t SPI_ReceiveData32(uint32_t spiAddr, uint32_t chNum)
{
	return(SPIREG(spiAddr + SPI_RX(chNum)));
}

inline uint16_t SPI_ReceiveData16(uint32_t spiAddr, uint32_t chNum)
{
	return(SPIREG16(spiAddr + SPI_RX(chNum)));
}

/**********************************************************************
 * Function		: SPI_IntStatusGet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: intFlags Represents the various interrupts to be cleared.
 * 			      SPI_INT_TX_EMPTY(chan) | SPI_INT_TX_UNDERFLOW(chan) |
 * 			      SPI_INT_RX_FULL(chan) | SPI_INT_RX0_OVERFLOW | SPI_INT_EOW
 * Input		: chNum Channel number of the SPI_ instance used.
 * Description	:
 *
 * Returns the status of the SPI interrupts.
 **********************************************************************/
inline uint32_t SPI_IntStatusGet(uint32_t spiAddr)
{
	return(SPIREG(spiAddr + SPI_IRQSTATUS));
} 

/**********************************************************************
 * Function		: SPI_IntStatusClear
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: intFlags Represents the various interrupts to be cleared.
 * 			      SPI_INT_TX_EMPTY(chan) | SPI_INT_TX_UNDERFLOW(chan) |
 * 			      SPI_INT_RX_FULL(chan) | SPI_INT_RX0_OVERFLOW | SPI_INT_EOW
 * Input		: chNum Channel number of the SPI_ instance used.
 * Description	:
 *
 * Clears the status of the SPI interrupts.
 **********************************************************************/
inline void SPI_IntStatusClear(uint32_t spiAddr, uint32_t intFlags)
{
	SPIREG(spiAddr + SPI_SYST) &= ~SPI_SET_STATUS_BIT;
	SPIREG(spiAddr + SPI_IRQSTATUS) = intFlags;
}

/**********************************************************************
 * Function		: SPI_ClkRead
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: Pointer to returned SpiClk value
 * Output		: TRUE - Successful FALSE - Failure (master mode?)
 * Description	:
 *
 * For slave mode only, reads the value of SpiClk state.
 **********************************************************************/
uint32_t SPI_ClkRead(uint32_t spiAddr, uint32_t *spiClk)
{
	uint32_t retVal = FALSE;

	// Check whether SPIENDIR is used as input.
	if (SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIENDIR)
	{
		retVal = TRUE;
		*spiClk = (SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPICLK);
	}

	return retVal;
}

/**********************************************************************
 * Function		: SPI_ClkWrite
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: spiClk Will hold the value of spiClk .
 *			  	  SPI_CLK_HIGH | SPI_CLK_LOW
 * Output		: TRUE - Successful, FALSE - Fail (slave_mode?)
 * Description	:
 *
 * In master mode, changes the clock state to high or low.
 **********************************************************************/
uint32_t SPI_ClkWrite(uint32_t spiAddr, uint32_t spiClk)
{
	uint32_t retVal = FALSE;

	if (!(SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIENDIR))
	{
		retVal = TRUE;

		// Clear the SPICLK field of SPI_SYST register.
		SPIREG(spiAddr + SPI_SYST) &= ~SPI_SYST_SPICLK;

		// Set the SPICLK field with the user sent value.
		SPIREG(spiAddr + SPI_SYST) |= (spiClk & SPI_SYST_SPICLK);
	}

	return retVal;
} 

/**********************************************************************
 * Function		: SPI_DataPinRead
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: dataPinDir Direction pins
 * 			  	  SPI_DAT1_IN | SPI_DAT0_IN
 * Input		: Pointer to received data
 * Output		: TRUE - Successful, FALSE - Error (are pins set for read?)
 * Description	:
 *
 * Reads data from SPIDAT pins 0:1.  SPIDAT pins must be set to use for
 * reading for this function to work.
 **********************************************************************/
uint32_t SPI_DataPinRead(uint32_t spiAddr, uint32_t dataPinDir, uint32_t *spiDat)
{
	uint32_t retVal = FALSE;

	if (dataPinDir == (SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIDATDIR1))
	{
		retVal = TRUE;

		// Read the SPIDAT_1 value.
		*spiDat = (SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIDAT_1);
	} else if (dataPinDir == (SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIDATDIR0)) {
		retVal = TRUE;

		// Read the SPIDAT_0 value.
		*spiDat = (SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIDAT_0);
	}

	return retVal;
}
/**********************************************************************
 * Function		: SPI_DataPinWrite
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: dataPinDir Direction pins
 * 			  	  SPI_DAT1_OUT | SPI_DAT0_OUT
 * Input		: Source data to write
 * Output		: TRUE - Successful, FALSE - Error (are pins set for read?)
 * Description	:
 *
 * Writes data from SPIDAT pins 0:1.  SPIDAT pins must be set to use for
 * reading for this function to work.
 **********************************************************************/

uint32_t SPI_DataPinWrite(uint32_t spiAddr, uint32_t dataPinDir, uint32_t spiDat)
{
	uint32_t retVal = FALSE;

	if (dataPinDir == (SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIDATDIR1))
	{
		retVal = TRUE;

		// Clear the SPIDAT_1 field of SPI_SYST register.
		SPIREG(spiAddr + SPI_SYST) &= ~SPI_SYST_SPIDAT_1;

		// Set the SPIDAT_1 field with the user sent value.
		SPIREG(spiAddr + SPI_SYST) |= (spiDat << SPI_SYST_SPIDAT_1_SHIFT);
	} else if (dataPinDir == (SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIDATDIR0)) {
		retVal = TRUE;

		// Clear the SPIDAT_0 field of SPI_SYST register.
		SPIREG(spiAddr + SPI_SYST) &= ~SPI_SYST_SPIDAT_0;

		// Set the SPIDAT_0 field with the user sent value.
		SPIREG(spiAddr + SPI_SYST) |= (spiDat << SPI_SYST_SPIDAT_0_SHIFT);
	}

	return retVal;
}

/**********************************************************************
 * Function		: SPI_CSRead
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: spiEn Memory location at which read value is stored.
 * Input		: spiEnNum The instance of SPIEN used.
 * Output		: TRUE - Successful, FALSE - Fail (SPIEN pin direction wrong?)
 * Description	:
 *
 * Reads the state of CS when SPIENDIR is set for input.
 **********************************************************************/
uint32_t SPI_CSRead(uint32_t spiAddr, uint32_t *spiEn, uint32_t spiEnNum)
{
	uint32_t retVal = FALSE;

	if ((SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIENDIR))
	{
		retVal = TRUE;

		// Read the SPIEN value.
		*spiEn = (SPIREG(spiAddr + SPI_SYST) & spiEnNum);
	}

	return retVal;
}

/**********************************************************************
 * Function		: SPI_CSWrite
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: spiEnLvl Value to be written into SPIEN_n field where n is 0-3.
 * 	     		  SPI_SPIEN_HIGH | SPI_SPIEN_LOW
 * Input		: spiEnNum The instance of SPIEN used.
 * 		     	  SPI_SPIEN_{0..3}
 * Output		: TRUE - Succecssful, FALSE - Fail (SPIEN set as input?)
 * Description	:
 *
 * Changes the CS state when SPIENDIR is set for output.
 **********************************************************************/
uint32_t SPI_CSWrite(uint32_t spiAddr, uint32_t spiEnLvl, uint32_t spiEnNum)
{
	uint32_t retVal = FALSE;

	if (!(SPIREG(spiAddr + SPI_SYST) & SPI_SYST_SPIENDIR))
	{
		retVal = TRUE;

		if (spiEnNum == SPI_SPIEN_0)
		{
			// Clear the SPIEN_0 field of SPI_SYST register.
			SPIREG(spiAddr + SPI_SYST) &= ~SPI_SYST_SPIEN_0;

			// Set the SPIEN_0 field with the user sent value.
			SPIREG(spiAddr + SPI_SYST) |= (spiEnLvl & SPI_SYST_SPIEN_0);
		} else if (spiEnNum == SPI_SPIEN_1) {
			// Clear the SPIEN_1 field of SPI_SYST register.
			SPIREG(spiAddr + SPI_SYST) &= ~SPI_SYST_SPIEN_1;

			// Set the SPIEN_1 field with the user sent value.
			SPIREG(spiAddr + SPI_SYST) |= ((spiEnLvl <<	SPI_SYST_SPIEN_1_SHIFT) & SPI_SYST_SPIEN_1);
		} else if (spiEnNum == SPI_SPIEN_2) {
			// Clear the SPIEN_2 field of SPI_SYST register.
			SPIREG(spiAddr + SPI_SYST) &= ~SPI_SYST_SPIEN_2;

			// Set the SPIEN_2 field with the user sent value.
			SPIREG(spiAddr + SPI_SYST) |= ((spiEnLvl << SPI_SYST_SPIEN_2_SHIFT) & SPI_SYST_SPIEN_2);
		} else if (spiEnNum == SPI_SPIEN_3) {
			// Clear the SPIEN_3 field of SPI_SYST register.
			SPIREG(spiAddr + SPI_SYST) &= ~SPI_SYST_SPIEN_3;

			// Set the SPIEN_3 field with the user sent value.
			SPIREG(spiAddr + SPI_SYST) |= ((spiEnLvl << SPI_SYST_SPIEN_3_SHIFT) & SPI_SYST_SPIEN_3);
		}
	}

	return retVal;
} 

/**********************************************************************
 * Function		: SPI_ChannelStatusGet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: chNum Channel used for communication.
 * Output		: 32-bit value of the status register.
 * Description	:
 *
 * Returns status of the SPI channel.
 **********************************************************************/
inline uint32_t SPI_ChannelStatusGet(uint32_t spiAddr, uint32_t chNum)
{
	return(SPIREG(spiAddr + SPI_CHSTAT(chNum)));
}

/**********************************************************************
 * Function		: SPI_MultiWordAccessSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: moa Used to enable/disable MOA in SPI_ peripheral.
 *		     	  SPI_MOA_ENABLE | SPI_MOA_DISABLE
 * Output		: None
 * Description	:
 *
 * Enables or disables the multi-word OCP access.
 **********************************************************************/
inline void SPI_MultiWordAccessSet(uint32_t spiAddr, uint32_t moa)
{
	SPIREG(spiAddr + SPI_MODULCTRL) &= ~SPI_MODULCTRL_MOA;
	SPIREG(spiAddr + SPI_MODULCTRL) |= (moa & SPI_MODULCTRL_MOA);
}

/**********************************************************************
 * Function		: SPI_FIFODatSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: fdaa Used to enable/disable FDAA in SPI_ peripheral.
 * 	     		  SPI_FDAA_ENABLE | SPI_FDAA_DISABLE
 * Output		: None
 * Description	:
 *
 * Enables or disables the FIFO DMA
 **********************************************************************/
inline void SPI_FIFODatSet(uint32_t spiAddr, uint32_t fdaa)
{
	SPIREG(spiAddr + SPI_MODULCTRL) &= ~SPI_MODULCTRL_FDAA;
	SPIREG(spiAddr + SPI_MODULCTRL) |= (fdaa & SPI_MODULCTRL_FDAA);
}

/**********************************************************************
 * Function		: SPI_AutoIdleSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: autoIdle mode
 * 		    	  SPI_AUTO_IDLE_ENABLE | SPI_AUTO_IDLE_DISABLE
 * Output		: None
 * Description	:
 *
 * Enables or disables the SPI autoidle mode.
 **********************************************************************/
inline void SPI_AutoIdleSet(uint32_t spiAddr, uint32_t autoIdle)
{
	SPIREG(spiAddr + SPI_SYSCONFIG) &= ~SPI_SYSCONFIG_AUTOIDLE;
	SPIREG(spiAddr + SPI_SYSCONFIG) |= (autoIdle & SPI_SYSCONFIG_AUTOIDLE);
}

/**********************************************************************
 * Function		: SPI_SmartIdleSet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: smartIdle Used to set modes for smart idle mode.
 * 		    	  SPI_SIDLE_MODE_FORCE | SPI_SIDLE_MODE_NOIDLE | SPI_SIDLE_MODE_SMART
 * Output		: None
 * Description	:
 *
 * Enables or disables multi-word access for the SPI.
 **********************************************************************/

inline void SPI_SmartIdleSet(uint32_t spiAddr, uint32_t smartIdle)
{
	SPIREG(spiAddr + SPI_SYSCONFIG) &= ~SPI_SYSCONFIG_SIDLEMODE;
	SPIREG(spiAddr + SPI_SYSCONFIG) |= (smartIdle & SPI_SYSCONFIG_SIDLEMODE);
}

/**********************************************************************
 * Function		: SPI_ClkActivitySet
 * Input		: spiAddr Memory Address of the SPI_ instance used.
 * Input		: clkAct Clock activity used.
 *  	          SPI_CLK_ACTIVITY_NONE | SPI_CLK_ACTIVITY_OCP |
 *  	          SPI_CLK_ACTIVITY_FUNC | SPI_CLK_ACTIVITY_BOTH
 * Output		: None
 * Description	:
 *
 * Sets the clock activity of the SPI.
 **********************************************************************/
inline void SPI_ClkActivitySet(uint32_t spiAddr, uint32_t clkAct)
{
	SPIREG(spiAddr + SPI_SYSCONFIG) &= ~SPI_SYSCONFIG_CLOCKACTIVITY;
	SPIREG(spiAddr + SPI_SYSCONFIG) |= (clkAct & SPI_SYSCONFIG_CLOCKACTIVITY);
}
