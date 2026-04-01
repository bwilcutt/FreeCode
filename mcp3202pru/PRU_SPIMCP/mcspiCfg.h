/***************************************************************************************
* File         : mcspi.h
* Author       : Bryan Wilcutt
*
* Description:
*
* Defines the MC SPI memory region, register by register and bit by bit.
***************************************************************************************/

#ifndef MCSPI_H
#define MCSPI_H

#include <stdint.h>

typedef struct {
	union {
		// Offset 0x0000

		volatile uint32_t mcspi_revision;
		volatile struct {
			unsigned y_minor				:6;  // 5-0
			unsigned custom					:2;  // 7-6
			unsigned x_major				:3;  // 10-8
			unsigned r_rtl					:5;  // 15-11
			unsigned func					:12; // 27-16
			unsigned resv					:2;  // 29-28
			unsigned scheme					:2;  // 31-30
		} mcspi_revision_bit; 
	};
		// Offset 0x0004 - Offset 0x10c

		unsigned	EMPTY_SPACE_1[67];

	union {
		// Offset 0x0110

		volatile uint32_t mcspi_sysconfig;
		volatile struct {
			unsigned autoidle				:1;  // 0
			unsigned softreset				:1;  // 1
			unsigned resv3					:1;  // 2
			unsigned sidlemode				:2;  // 4-3
			unsigned resv2					:3;  // 7-5
			unsigned clockactivity			:2;  // 9-8
			unsigned resv1					:22; // 10-31
		} mcspi_sysconfig_bit; 
	};

	union {
		// Offset 0x0114

		volatile uint32_t mcspi_sysstatus;
		volatile struct {
			unsigned resetdone				:1;  // 0
			unsigned resv					:31; // 31-1
		} mcspi_sysstatus_bit;
	};	

	union {
		// Offset 0x0118

		volatile uint32_t mcspi_irqstatus;
		volatile struct {
			unsigned tx0_empty				:1;  // 0
			unsigned tx0_underflow			:1;  // 1
			unsigned rx0_full				:1;  // 2
			unsigned resv5					:1;  // 3
			unsigned tx1_empty				:1;  // 4
			unsigned tx1_underflow	   		:1;  // 5
			unsigned rx1_full				:1;  // 6
			unsigned resv4					:1;  // 7
			unsigned tx2_empty				:1;  // 8
			unsigned tx2_underflow			:1;  // 9
			unsigned rx2_full				:1;  // 10
			unsigned resv3					:1;  // 11
			unsigned tx3_empty				:1;  // 12
			unsigned tx3_underflow			:1;  // 13
			unsigned rx3_full				:1;  // 14
			unsigned resv2					:2;  // 16-15
			unsigned eow					:1;  // 17
			unsigned resv1					:14; // 31-18
		} mcspi_irqstatus_bit;
	};

	union {
		// Offset 0x011c

		volatile uint32_t mcspi_irqenable;
		volatile struct  {
			unsigned tx0_empty_enable		:1;  // 0
			unsigned tx0_underflow_enable	:1;  // 1
			unsigned rx0_full_enable		:1;  // 2
			unsigned rx0_overflow_enable	:1;  // 3
			unsigned tx1_empty_enable		:1;  // 4
			unsigned tx1_underflow_enable	:1;  // 5
			unsigned rx1_full_enable		:1;  // 6
			unsigned resv4					:1;  // 7
			unsigned tx2_empty_enable		:1;  // 8
			unsigned tx2_underflow_enable	:1;  // 9
			unsigned rx2_full_enable		:1;  // 10
			unsigned resv3					:1;  // 11
			unsigned tx3_empty_enable		:1;  // 12
			unsigned tx3_underflow_enable 	:1;  // 13
			unsigned rx3_full_enable		:1;  // 14
			unsigned resv2					:2;  // 16-15
			unsigned eowke					:1;  // 17
			unsigned resv1					:14; // 31-18
		} mcspi_irqenable_bit;
	};

		// Offset 0x0120

		unsigned	EMPTY_SPACE_2;

	union {
		// Offset 0x0124

		volatile uint32_t mcspi_syst;
		volatile struct {
			unsigned spien_0			:1;  	// 0
			unsigned spien_1			:1; 	// 1
			unsigned spien_2			:1;  	// 2
			unsigned spien_3			:1;  	// 3
			unsigned spidat_0			:1;  	// 4
			unsigned spidat_1			:1;  	// 5
			unsigned spiclk				:1; 	// 6
			unsigned resv2				:1;  	// 7
			unsigned spidatdir0			:1;  	// 8
			unsigned spidatdir1			:1;  	// 9
			unsigned spiendir			:1; 	 // 10
			unsigned ssb				:1;  	// 11
			unsigned resv1				:20; 	// 31-12
		} mcspi_syst_bit ;
	};
	
	union {
		// Offset 0x0128

		volatile uint32_t mcspi_modulctrl;
		volatile struct {
			unsigned single				:1;  	// 0
			unsigned pin34				:1;  	// 1
			unsigned ms					:1;  	// 2
			unsigned system_test		:1;  	// 3
			unsigned initdly			:3;  	// 6-4
			unsigned moa				:1;  	// 7
			unsigned fdaa				:1;  	// 8
			unsigned resv1				:23; 	// 31-9
		} mcspi_modulctrl_bit;
	};

	union {
		// Offset 0x012c

		volatile uint32_t mcspi_ch0conf;
		volatile struct {
			unsigned pha				:1;  	// 0
			unsigned pol				:1;  	// 1
			unsigned clkd				:4;  	// 5-2
			unsigned epol				:1;  	// 6
			unsigned wl					:5;  	// 11-7
			unsigned trm				:2;  	// 13-12
			unsigned dmaw				:1;  	// 14
			unsigned dmar				:1;  	// 15
			unsigned dpe0				:1;  	// 16
			unsigned dpe1				:1;  	// 17
			unsigned is					:1;  	// 18
			unsigned turbo				:1;  	// 19
			unsigned force				:1;  	// 20
			unsigned spienslv			:2;  	// 22-21
			unsigned sbe				:1;  	// 23
			unsigned sbpol				:1;  	// 24
			unsigned tcs				:2;  	// 26-25
			unsigned ffew				:1;  	// 27
			unsigned ffer				:1;  	// 28
			unsigned clkg				:1;  	// 29
			unsigned resv1				:2;  	// 31-30
		} mcspi_ch0conf_bit;
	};

	union {
		// Offset 0x0130

		volatile uint32_t mcspi_ch0stat;
		volatile struct {
			unsigned rxs				:1; 	// 0
			unsigned txs				:1;  	// 1
			unsigned eot				:1; 	// 2
			unsigned txffe				:1; 	// 3
			unsigned txfff				:1; 	// 4
			unsigned rxffe				:1;		// 5
			unsigned rxfff				:1;  	// 6
			unsigned resv				:25; 	// 31-7
		} mcspi_ch0stat_bit ;
	};	
	
	union {
		// Offset 0x0134

		volatile uint32_t mcspi_ch0ctrl;
		volatile struct {
			unsigned en					:1;  	// 0
			unsigned resv2				:7;  	// 7-1
			unsigned extclk				:8;  	// 15-8
			unsigned resv1				:16; 	// 31-16
		} mcspi_ch0ctrl_bit;
	};

	union {
		// Offset 0x0138

		volatile uint32_t mcspi_tx0;
		volatile struct {
			unsigned tdata				:32; 	// 0-31
		} mcspi_tx0_bit;
	};

	union {
		// Offset 0x013c

		volatile uint32_t mcspi_rx0;
		volatile struct {
			unsigned rdata				:32; 	// 0-31
		} mcspi_rx0_bit;
	};


	union {
		// Offset 0x0140

		volatile uint32_t mcspi_ch1conf;
		volatile struct {
			unsigned pha				:1;  	// 0
			unsigned pol				:1;  	// 1
			unsigned clkd				:4;  	// 5-2
			unsigned epol				:1;  	// 6
			unsigned wl					:5;  	// 11-7
			unsigned trm				:2;  	// 13-12
			unsigned dmaw				:1;  	// 14
			unsigned dmar				:1;  	// 15
			unsigned dpe0				:1; 	// 16
			unsigned dpe1				:1;  	// 17
			unsigned is					:1;  	// 18
			unsigned turbo				:1;  	// 19
			unsigned force				:1;  	// 20
			unsigned spienslv			:2;  	// 22-21
			unsigned sbe				:1; 	// 23
			unsigned sbpol				:1;  	// 24
			unsigned tcs				:2;  	// 26-25
			unsigned ffew				:1;  	// 27
			unsigned ffer				:1;  	// 28
			unsigned clkg				:1;  	// 29
			unsigned resv1				:2;  	// 31-30
		} mcspi_ch1conf_bit;
	};

	union {
		// Offset 0x0144

		volatile uint32_t mcspi_ch1stat;
		volatile struct {
			unsigned rxs				:1; 	// 0
			unsigned txs				:1;  	// 1
			unsigned eot				:1; 	// 2
			unsigned txffe				:1; 	// 3
			unsigned txfff				:1; 	// 4
			unsigned rxffe				:1; 	// 5
			unsigned rxfff				:1;  	// 6
			unsigned resv				:25; 	// 31-7
		} mcspi_ch1stat_bit ;
	};	
	
	union {
		// Offset 0x0148

		volatile uint32_t mcspi_ch1ctrl;
		volatile struct {
			unsigned en					:1;  	// 0
			unsigned resv2				:7;  	// 7-1
			unsigned extclk				:8;  	// 15-8
			unsigned resv1				:16; 	// 31-16
		} mcspi_ch1ctrl_bit;
	};

	union {
		// Offset 0x014c

		volatile uint32_t mcspi_tx1;
		volatile struct {
			unsigned tdata				:32; 	// 0-31
		} mcspi_tx1_bit;
	};

	union {
		// Offset 0x0150

		volatile uint32_t mcspi_rx1;
		volatile struct {
			unsigned rdata				:32; 	// 0-31
		} mcspi_rx1_bit;
	};

	union {
		// Offset 0x0154

		volatile uint32_t mcspi_ch2conf;
		volatile struct {
			unsigned pha				:1;  	// 0
			unsigned pol				:1;  	// 1
			unsigned clkd				:4;  	// 5-2
			unsigned epol				:1;  	// 6
			unsigned wl					:5;  	// 11-7
			unsigned trm				:2;  	// 13-12
			unsigned dmaw				:1;  	// 14
			unsigned dmar				:1;  	// 15
			unsigned dpe0				:1;  	// 16
			unsigned dpe1				:1;  	// 17
			unsigned is					:1;  	// 18
			unsigned turbo				:1;  	// 19
			unsigned force				:1;  	// 20
			unsigned spienslv			:2;  	// 22-21
			unsigned sbe				:1;  	// 23
			unsigned sbpol				:1;  	// 24
			unsigned tcs				:2;  	// 26-25
			unsigned ffew				:1;  	// 27
			unsigned ffer				:1;  	// 28
			unsigned clkg				:1;  	// 29
			unsigned resv1				:2;  	// 31-30
		} mcspi_ch2conf_bit;
	};

	union {
		// Offset 0x0158

		volatile uint32_t mcspi_ch2stat;
		volatile struct {
			unsigned rxs				:1; 	// 0
			unsigned txs				:1;  	// 1
			unsigned eot				:1; 	// 2
			unsigned txffe				:1; 	// 3
			unsigned txfff				:1; 	// 4
			unsigned rxffe				:1; 	// 5
			unsigned rxfff				:1;  	// 6
			unsigned resv				:25; 	// 31-7
		} mcspi_ch2stat_bit;
	};	
	
	union {
		// Offset 0x015c

		volatile uint32_t mcspi_ch2ctrl;
		volatile struct {
			unsigned en					:1;  	// 0
			unsigned resv2				:7;  	// 7-1
			unsigned extclk				:8;  	// 15-8
			unsigned resv1				:16; 	// 31-16
		} mcspi_ch2ctrl_bit;
	};

	union {
		// Offset 0x0160

		volatile uint32_t mcspi_tx2;
		volatile struct {
			unsigned tdata				:32; 	// 0-31
		} mcspi_tx2_bit;
	};

	union {
		// Offset 0x0164

		volatile uint32_t mcspi_rx2;
		volatile struct {
			unsigned rdata				:32; 	// 0-31
		} mcspi_rx2_bit;
	};


	union {
		// Offset 0x0168

		volatile uint32_t mcspi_ch3conf;
		volatile struct {
			unsigned pha				:1;  	// 0
			unsigned pol				:1;  	// 1
			unsigned clkd				:4;  	// 5-2
			unsigned epol				:1;  	// 6
			unsigned wl					:5;  	// 11-7
			unsigned trm				:2;  	// 13-12
			unsigned dmaw				:1;  	// 14
			unsigned dmar				:1;  	// 15
			unsigned dpe0				:1;  	// 16
			unsigned dpe1				:1;  	// 17
			unsigned is					:1;  	// 18
			unsigned turbo				:1;  	// 19
			unsigned force				:1;  	// 20
			unsigned spienslv			:2;  	// 22-21
			unsigned sbe				:1;  	// 23
			unsigned sbpol				:1;  	// 24
			unsigned tcs				:2;  	// 26-25
			unsigned ffew				:1;  	// 27
			unsigned ffer				:1;  	// 28
			unsigned clkg				:1;  	// 29
			unsigned resv1				:2;  	// 31-30
		} mcspi_ch3conf_bit ;
	};

	union {
		// Offset 0x016c

		volatile uint32_t mcspi_ch3stat;
		volatile struct {
			unsigned rxs				:1; 	// 0
			unsigned txs				:1;  	// 1
			unsigned eot				:1; 	// 2
			unsigned txffe				:1; 	// 3
			unsigned txfff				:1; 	// 4
			unsigned rxffe				:1; 	// 5
			unsigned rxfff				:1;  	// 6
			unsigned resv				:25; 	// 31-7
		} mcspi_ch3stat_bit;
	};	
	
	union {
		// Offset 0x0170

		volatile uint32_t mcspi_ch3ctrl;
		volatile struct {
			unsigned en					:1;  	// 0
			unsigned resv2				:7;  	// 7-1
			unsigned extclk				:8;  	// 15-8
			unsigned resv1				:16; 	// 31-16
		} mcspi_ch3ctrl_bit;
	};

	union {
		// Offset 0x0174

		volatile uint32_t mcspi_tx3;
		volatile struct {
			unsigned tdata				:32; 	// 0-31
		} mcspi_tx3_bit;
	};

	union {
		// Offset 0x0178

		volatile uint32_t mcspi_rx3;
		volatile struct {
			unsigned rdata				:32; 	// 0-31
		} mcspi_rx3_bit;
	};

	union {
		// Offset 0x017c

		volatile uint32_t mcspi_xferlevel;
		volatile struct {
			unsigned ael				:8;  	// 7-0
			unsigned afl				:8;  	// 15-8
			unsigned wcnt				:8;  	// 31-16
		} mcspi_xferlevel_bit;
	};

	union {
		// Offset 0x0180

		volatile uint32_t mcspi_daftx;
		volatile struct {
			unsigned daftdata			:32; 	// 31-0
		} mcspi_daftx_bit;
	};

		// Offset 0x184 - Offset 0x19c

		unsigned	EMPTY_SPACE_3[7];

	union {
		// Offset 0x01a0

		volatile uint32_t mcspi_dafrx;
		volatile struct {
			unsigned dafrdata			:32; 	// 31-0
		} mcspi_dafrx_bit;
	};
} mcspiCfg_s;

// Note the "MCSPI0" must be defined in the application's memory map, defined as:
//
// MCSPIn			: org = 0x48030000 len = 0x000001A4	CREGISTER=x
// Where "x" is an available register, from 0 to 31.
// Where "n" is an available SPI device (0 or 1).

//volatile __far mcspiCfg MCSPI_CFG __attribute__((cregister("MCSPI1", near), peripheral));
#endif
