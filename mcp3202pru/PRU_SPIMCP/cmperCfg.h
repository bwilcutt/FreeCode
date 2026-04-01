/***************************************************************************************
 * File		: cmpr.h 
 * Author	: Bryan Wilcutt
 *
 * Description:
 *
 * Defines the PER CM memory region, register by register and bit by bit.
 ***************************************************************************************/ 

#ifndef CMPER_H
#define CMPER_H

#include <stdint.h>

typedef struct {
	union {
		// Offset 0x0000

		volatile uint32_t cm_per_l4ls_clkstctrl;
		volatile struct {
			uint32_t clktrctrl					:2; // 1-0
			uint32_t resv7						:6; // 7-2
			uint32_t clkactivity_l4ls_gclk		:1; // 8
			uint32_t resv6						:1; // 9
			uint32_t clkactivity_uart_gfclk		:1; // 10
			uint32_t clkactivity_can_clk		:1; // 11
			uint32_t resv5						:1; // 12
			uint32_t clkactivity_timer7_gclk	:1; // 13
			uint32_t clkactivity_timer2_gclk	:1; // 14
			uint32_t clkactivity_timer3_gclk	:1; // 15
			uint32_t clkactivity_timer4_gclk	:1; // 16
			uint32_t clkactivity_lcdc_gclk		:1; // 17
			uint32_t resv4						:1; // 18
			uint32_t clkactivity_gpio_1_gdbclk	:1; // 19
			uint32_t clkactivity_gpio_2_gdbclk	:1; // 20
			uint32_t clkactivity_gpio_3_gdbclk	:1; // 21
			uint32_t resv3i						:2; // 23-22
			uint32_t clkactivity_i2c_fclk		:1; // 24
			uint32_t clkactivity_spi_gclk		:1; // 25
			uint32_t resv2						:1; // 26
			uint32_t clkactivity_timer5_gclk	:1; // 27
			uint32_t clkactivity_timer6_gclk	:1; // 28
			uint32_t resv1						:3; // 31-29
		} cm_per_l4ls_clkstctrl_bit;
	};

	union {
		// Offset 0x0004

		volatile uint32_t cm_per_l3s_clkstctrl;
		volatile struct {
			uint32_t clktrctrl					:2;  // 1-0
			uint32_t resv2						:1;  // 2
			uint32_t clkactivity_l3s_gclk		:1;  // 3
			uint32_t resv1						:28; // 31-4
		} cm_per_l3s_clkstctrl_bit;
	};

		// Offset 0x0008

		uint32_t	EMPTY_SPACE_1;

        union {
		// Offset 0x000c

		volatile uint32_t cm_per_l3_clkstctrl;
		volatile struct {
			uint32_t clktrctrl					:2;  // 1-0
			uint32_t clkactivity_emif_gclk		:1;  // 2
			uint32_t clkactivity_mmc_gclk		:1;  // 3
			uint32_t clkactivity_l3_gclk		:1;  // 4
			uint32_t resv2						:1;  // 5
			uint32_t clkactivity_cpts_rft_gclk	:1;  // 6
			uint32_t clkactivity_mcasp_gclk		:1;  // 7
			uint32_t resv1						:24; // 31-8
		} cm_per_l3_clkstctrl_bit;
	};

		// Offset 0x0010

		uint32_t	EMPTY_SPACE_2;

	union {
		// Offset 0x0014

		volatile uint32_t cm_per_cpgmac0_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t stbyst						:1;  // 18
			uint32_t resv1						:13; // 31-19
		} cm_per_cpgmac0_clkctrl_bit;
	};

	union {
		// Offset 0x0018
 
		volatile uint32_t cm_per_lcdc_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t stbyst						:1;  // 18
			uint32_t resv1						:13; // 31-19
		} cm_per_lcdc_clkctrl_bit;
	};

	union {
		// Offset 0x001c
 
		volatile uint32_t cm_per_usb0_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t stbyst						:1;  // 18
			uint32_t resv1						:13; // 31-19
		} cm_per_usb0_clkctrl_bit;
	};

		// Offset 0x0020

		uint32_t	EMPTY_SPACE_3;

	union {
		// Offset 0x0024
 
		volatile uint32_t cm_per_tptc0_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t stbyst						:1;  // 18
			uint32_t resv1						:13; // 31-19
		} cm_per_tptc0_clkctrl_bit;
	};

	union {
		// Offset 0x0028
 
		volatile uint32_t cm_per_emif_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-19
		} cm_per_emif_clkctrl_bit;
	};

	union {
		// Offset 0x002c
 
		volatile uint32_t cm_per_ocmcram_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_ocmcram_clkctrl_bit;
	};

	union {
		// Offset 0x0030
 
		volatile uint32_t cm_per_gpmc_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_gpmc_clkctrl_bit;
	};

	union {
		// Offset 0x0034
 
		volatile uint32_t cm_per_mcasp0_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_mcasp0_clkctrl_bit;
	};

	union {
		// Offset 0x0038
 
		volatile uint32_t cm_per_uart5_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_uart5_clkctrl_bit;
	};

	union {
		// Offset 0x003c
 
		volatile uint32_t cm_per_mmc0_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_mmc0_clkctrl_bit;
	};

	union {
		// Offset 0x0040
 
		volatile uint32_t cm_per_elm_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_mmc0_elm_clkctrl_bit;
	};

	union {
		// Offset 0x0044
 
		volatile uint32_t cm_per_i2c2_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_i2c2_clkctrl_bit;
	};

	union {
		// Offset 0x0048
 
		volatile uint32_t cm_per_i2c1_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_i2c1_clkctrl_bit;
	};

	union {
		// Offset 0x004c
 
		volatile uint32_t cm_per_spi0_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_spi0_clkctrl_bit;
	};

	union {
		// Offset 0x0050
 
		volatile uint32_t cm_per_spi1_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_spi1_clkctrl_bit;
	};

		// Offset 0x0054

		uint32_t	EMPTY_SPACE_4;

		// Offset 0x0058

		uint32_t	EMPTY_SPACE_5;

		// Offset 0x005c

		uint32_t	EMPTY_SPACE_6;

	union {
		// Offset 0x0060
 
		volatile uint32_t cm_per_l4ls_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_l4ls_clkctrl_bit;
	};

		// Offset 0x0064

		uint32_t	EMPTY_SPACE_7;

	union {
		// Offset 0x0068
 
		volatile uint32_t cm_per_mcasp1_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_mcasp1_clkctrl__bit;
	};

	union {
		// Offset 0x006c
 
		volatile uint32_t cm_per_uart1_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_uart1_clkctrl__bit;
	};
	
	union {
		// Offset 0x0070
 
		volatile uint32_t cm_per_uart2_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_uart2_clkctrl__bit;
	};

	union {
		// Offset 0x0074
 
		volatile uint32_t cm_per_uart3_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_uart3_clkctrl__bit;
	};

	union {
		// Offset 0x0078
 
		volatile uint32_t cm_per_uart4_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_uart4_clkctrl__bit;
	};

	union {
		// Offset 0x007c
 
		volatile uint32_t cm_per_timer7_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_timer7_clkctrl__bit;
	};

	union {
		// Offset 0x0080
 
		volatile uint32_t cm_per_timer2_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_timer2_clkctrl__bit;
	};

	union {
		// Offset 0x0084
 
		volatile uint32_t cm_per_timer3_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_timer3_clkctrl__bit;
	};

	union {
		// Offset 0x0088
 
		volatile uint32_t cm_per_timer4_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_timer4_clkctrl__bit;
	};

		// Offset 0x008c - 0x00a8

		uint32_t	EMPTY_SPACE_9[8];

	union {
		// Offset 0x00ac
 
		volatile uint32_t cm_per_gpio1_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t optfclken_gpio_1_gdbclk	:1;  // 18
			uint32_t resv1						:13; // 31-91
		} cm_per_gpio1_clkctrl__bit;
	};

	union {
		// Offset 0x00b0
 
		volatile uint32_t cm_per_gpio2_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t optfclken_gpio_1_gdbclk	:1;  // 18
			uint32_t resv1						:13; // 31-91
		} cm_per_gpio2_clkctrl__bit;
	};

	union {
		// Offset 0x00b4
 
		volatile uint32_t cm_per_gpio3_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t optfclken_gpio_1_gdbclk	:1;  // 18
			uint32_t resv1						:13; // 31-91
		} cm_per_gpio3_clkctrl__bit;
	};

		// Offset 0x00b8

		uint32_t	EMPTY_SPACE_10;

	union {
		// Offset 0x00bc
 
		volatile uint32_t cm_per_tpcc_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_tpcc_clkctrl__bit;
	};

	union {
		// Offset 0x00c0
 
		volatile uint32_t cm_per_dcan0_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_dcan0_clkctrl__bit;
	};

	union {
		// Offset 0x00c4
 
		volatile uint32_t cm_per_dcan1_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_dcan1_clkctrl__bit;
	};

		// Offset 0x00c8

		uint32_t	EMPTY_SPACE_11;

	union {
		// Offset 0x00cc
 
		volatile uint32_t cm_per_epwmss1_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_epwmss1_clkctrl__bit;
	};

		// Offset 0x00d0

		uint32_t	EMPTY_SPACE_12;

	union {
		// Offset 0x00d4
 
		volatile uint32_t cm_per_epwmss0_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_epwmss0_clkctrl__bit;
	};

	union {
		// Offset 0x00d8
 
		volatile uint32_t cm_per_epwmss2_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_epwmss2_clkctrl__bit;
	};

	union {
		// Offset 0x00dc
 
		volatile uint32_t cm_per_l3_instr_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_l3_instr_clkctrl_bit;
	};

	union {
		// Offset 0x00e0
 
		volatile uint32_t cm_per_l3_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_l3_instr_bit;
	};

	union {
		// Offset 0x00e4
 
		volatile uint32_t cm_per_ieee5000_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t optfclken_gpio_1_gdbclk	:1;  // 18
			uint32_t resv1						:13; // 31-91
		} cm_per_ieee5000_clkctrl_bit;
	};

	union {
		// Offset 0x00e8
 
		volatile uint32_t cm_per_pru_icss_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t optfclken_gpio_1_gdbclk	:1;  // 18
			uint32_t resv1						:13; // 31-91
		} cm_per_pru_icss_clkctrl_bit;
	};

	union {
		// Offset 0x00ec
 
		volatile uint32_t cm_per_timer5_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_timer5_clkctrl_bit;
	};

	union {
		// Offset 0x00f0
 
		volatile uint32_t cm_per_timer6_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_timer6_clkstrl_bit;
	};

	union {
		// Offset 0x00f4
 
		volatile uint32_t cm_per_mmc1_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_mmc1_clkstrl_bit;
	};

	union {
		// Offset 0x00f8
 
		volatile uint32_t cm_per_mmc2_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_mmc2_clkstrl_bit;
	};

	union {
		// Offset 0x00fc
 
		volatile uint32_t cm_per_tptc1_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t optfclken_gpio_1_gdbclk	:1;  // 18
			uint32_t resv1						:13; // 31-91
		} cm_per_tptc1_clkctrl_bit;
	};

	union {
		// Offset 0x0100
 
		volatile uint32_t cm_per_tptc2_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t optfclken_gpio_1_gdbclk	:1;  // 18
			uint32_t resv1						:13; // 31-91
		} cm_per_tptc2_clkctrl_bit;
	};

		// Offset 0x0104

		uint32_t	EMPTY_SPACE_13;

		// Offset 0x0108

		uint32_t	EMPTY_SPACE_14;

	union {
		// Offset 0x010c
 
		volatile uint32_t cm_per_spinlock_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_spinlock_clkstrl_bit;
	};

	union {
		// Offset 0x0110
 
		volatile uint32_t cm_per_mailbox0_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_mailbox0_clkctrl_bit;
	};

		// Offset 0x0114

		uint32_t	EMPTY_SPACE_15;

		// Offset 0x0118

		uint32_t	EMPTY_SPACE_16;

	union {
		// Offset 0x011c
 
		volatile uint32_t cm_per_l4hs_clkstctrl;
		volatile struct {
			uint32_t clktrctrl					:2;  // 1-0
			uint32_t resv2						:1;  // 2
			uint32_t clkactivity_l4hs_gclk		:1;  // 3
			uint32_t clkactivity_cpsw_250mhz_gclk:1; // 4
			uint32_t clkactivity_cpsw_50mhz_gclk:1;  // 5
			uint32_t clkactivity_cpsw_5mhz_gclk	:1;  // 6
			uint32_t resv1						:25; // 31-7
		} cm_per_l4hs_clkstctrl_bit;
	};

	union {
		// Offset 0x0120
 
		volatile uint32_t cm_per_l4hs_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_l4hs_clkctrl_bit;
	};

		// Offset 0x0124

		uint32_t	EMPTY_SPACE_17;

		// Offset 0x0128

		uint32_t	EMPTY_SPACE_18;

	union {
		// Offset 0x012c
 
		volatile uint32_t cm_per_ocpwp_l3_clkstctrl;
		volatile struct {
			uint32_t clktrctrl					:2;  // 1-0
			uint32_t resv2						:2;  // 3-2
			uint32_t clkactivity_ocpwp_l3_gclk	:1;  // 4
			uint32_t clkactivity_ocpsw_l4_gclk	:1;  // 5 
			uint32_t resv1						:26; // 31-6
		} cm_per_ocpwp_l3_clkstctrl_bit;
	};

	union {
		// Offset 0x0130
 
		volatile uint32_t cm_per_ocpwp_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t optfclken_gpio_1_gdbclk	:1;  // 18
			uint32_t resv1						:13; // 31-91
		} cm_per_ocpwp_clkctrl_bit;
	};

		// Offset 0x0134

		uint32_t	EMPTY_SPACE_19;

		// Offset 0x0138

		uint32_t	EMPTY_SPACE_20;

		// Offset 0x013c

		uint32_t	EMPTY_SPACE_21;

	union {
		// Offset 0x0140
 
		volatile uint32_t cm_per_pru_icss_clkstctrl;
		volatile struct {
			uint32_t clktrctrl					:2;  // 1-0
			uint32_t resv2						:2;  // 3-2
			uint32_t clkactivity_pru_icss_ocp_gclk:1;// 4
			uint32_t clkactivity_pru_icss_iep_gclk:1;// 5
			uint32_t clkactivity_pru_icss_uart_gclk:1; // 6
			uint32_t resv1						:25; // 31-7
		} cm_per_pru_icss_clkstctrl_bit;
	};

	union {
		// Offset 0x0144
 
		volatile uint32_t cm_per_cpsw_clkstctrl;
		volatile struct {
			uint32_t clktrctrl					:2;  // 1-0
			uint32_t resv2						:2;  // 3-2
			uint32_t clkactivity_cpsw_125mhz_gclk:1; // 4
			uint32_t resv1						:27; // 31-5
		} cm_per_cpsw_clkstctrl_bit;
	};

	union {
		// Offset 0x0148
 
		volatile uint32_t cm_per_lcdc_clkstctrl;
		volatile struct {
			uint32_t clktrctrl					:2;  // 1-0
			uint32_t resv2						:2;  // 3-2
			uint32_t clkactivity_lcdc_l3_ocp_gclk:1; // 4
			uint32_t clkactivity_lcdc_l4_ocp_gclk:1; // 5
			uint32_t resv1						:26; // 31-6
		} cm_per_lcdc_clkstctrl_bit;
	};

	union {
		// Offset 0x014c
 
		volatile uint32_t cm_per_clkdiv32k_clkctrl;
		volatile struct {
			uint32_t modulemode					:2;  // 1-0
			uint32_t resv2						:14; // 15-2
			uint32_t idlest						:2;  // 17-16
			uint32_t resv1						:14; // 31-18
		} cm_per_clkdiv32k_clkctrl_bit;
	};

	union {
		// Offset 0x0150
 
		volatile uint32_t cm_per_clk_24mhz_clkstctrl;
		volatile struct {
			uint32_t clktrctrl					:2;  // 1-0
			uint32_t resv2						:2;  // 3-2
			uint32_t clkactivity_clk_24mhz_gclk	:1;  // 4 
			uint32_t resv1						:27; // 31-5
		} cm_per_iclk_24mhz_clkstctrl_bit;
	};
} cmperCfg_s;
#endif
