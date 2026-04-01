/*
 * drivers/uio/uio_mcp3202.h
 *
 * Userspace I/O platform driver for the MCP3202-to-PRU service.
 *
 * Copyright (C) 2015 LynxSpring
 *
 */

#ifndef _UIO_MCP3202_H
#define _UIO_MCP3202_H

#include <linux/module.h>

enum FREQUENCY {    // measured and calibrated, but can be calculated
        FREQ_12_5MHz =  1,
        FREQ_6_25MHz =  5,
        FREQ_5MHz    =  7,
        FREQ_3_85MHz = 10,
        FREQ_1MHz   =  45,
        FREQ_500kHz =  95,
        FREQ_250kHz = 245,
        FREQ_100kHz = 495,
        FREQ_25kHz = 1995,
        FREQ_10kHz = 4995,
        FREQ_5kHz =  9995,
        FREQ_2kHz = 24995,
        FREQ_1kHz = 49995
};

enum CONTROL {
        PRU_PAUSED = 0,
        PRU_RUNNING = 1,
        PRU_UPDATE = 3
};

struct uio_mcp3202_dev {
        struct uio_info *info;
        struct clk *mcp3202_clk;
        dma_addr_t sram_paddr;
        dma_addr_t ddr_paddr;
        void __iomem *mcp3202io_vaddr;
        unsigned long sram_vaddr;
        void *ddr_vaddr;
        unsigned int hostirq_start;
        unsigned int pintc_base;
        struct gen_pool *sram_pool;
};

typedef enum {
        RATE_30KSPS = 0,
        RATE_50KSPS,
        RATE_70KSPS,
        RATE_100KSPS
} rates_e;

typedef enum {
        STATUS_UNKNOWN = 0,
        STATUS_ACTIVE,
        STATUS_INACTIVE
} dev_status_e;

// Modes for  Niagara

typedef enum {
        ADC_NONE = 0,	// Set as a labeling flag to Niagara
        ADC_VOLTAGE, // Set as a labeling flag to Niagara, same as Current
        ADC_RESISTANCE, // Resistor circuit
        ADC_CURRENT,	   // Current circuit
	ADC_PULSE	// Pulse per second
} adc_mode_e;

struct parse_s {
        char *str;
        int val;
};

// This structure matches the structure found in the PRU driver.  These two must always match.

#define STACK_SIZE 		(256) 
#define MCP3202_MAGIC_NUMBER 0xD0C0FFEE
#define MAX_PAVGWINDOW	256
#define MAX_THRESHOLD	65534
#define MIN_SAMPLERATE 5000
#define MAX_SAMPLERATE 20000

typedef struct __attribute__((__packed__)) {
	uint32_t	magic;
	uint16_t	readyFlag;
	uint16_t	mosiWordOut_ch0;
	uint16_t	mosiWordOut_ch1;
	uint16_t 	mosiWordLen;

	uint16_t	pConfigFlag;	// 0 = Normal, 1 = New configuation available-- reset SPI
	uint16_t	pSampleRate;    // Samples per second
	uint16_t	pAvgWindow;		// Rolling average window size, must be ^2 (1, 2, 4, 8, 16, 32, 64, 128, 256)
	uint16_t	pThreshold_ch0;		// For pulse counting
	uint16_t	pThreshold_ch1;		// For pulse counting
	uint16_t	pPulsePerSec_ch0;
	uint16_t	pPulsePerSec_ch1;

	// SPI Configuration

	uint16_t	spiPort;
	uint16_t	spiCh;
	uint16_t	spiEnableSB;
	uint16_t	spiClkMode;

	uint16_t	stackLock;
	int16_t		stackCount;
	int16_t		stackHead;
	int16_t		stackTail;
	uint16_t	ch1avg;
	uint16_t	ch2avg;
	uint16_t	avgWindow;

	struct {
		uint16_t ch1, ch2;
	} stack[STACK_SIZE];
} ctrlData_s;

#endif
