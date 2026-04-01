;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.1.2 *
;* Date/Time created: Wed Sep  7 12:11:05 2016                                *
;******************************************************************************
	.compiler_opts --abi=eabi --diag_wrap=off --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../mcp3202.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI PRU C/C++ Codegen Unix v2.1.2 Copyright (c) 2012-2015 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/home/bwilcutt/workspace/onyxx-drivers/PRU_workspace/PRU_SPIMCP/Debug")
	.global	__PRU_CREG_DDR
	.global	__PRU_CREG_PRU_INTC
	.global	__PRU_CREG_PRU_CFG
	.global	__PRU_CREG_PRU_SHAREDMEM

$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("__halt")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("__halt")
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external

$C$DW$2	.dwtag  DW_TAG_subprogram, DW_AT_name("__delay_cycles")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("__delay_cycles")
	.dwattr $C$DW$2, DW_AT_declaration
	.dwattr $C$DW$2, DW_AT_external
$C$DW$3	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$11)
	.dwendtag $C$DW$2


$C$DW$4	.dwtag  DW_TAG_subprogram, DW_AT_name("Is_RxDataReady")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("Is_RxDataReady")
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$4, DW_AT_declaration
	.dwattr $C$DW$4, DW_AT_external
	.dwattr $C$DW$4, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$4, DW_AT_decl_line(0x329)
	.dwattr $C$DW$4, DW_AT_decl_column(0x11)
$C$DW$5	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$82)
$C$DW$6	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$4


$C$DW$7	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ChannelSet")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("SPI_ChannelSet")
	.dwattr $C$DW$7, DW_AT_declaration
	.dwattr $C$DW$7, DW_AT_external
	.dwattr $C$DW$7, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$7, DW_AT_decl_line(0x32c)
	.dwattr $C$DW$7, DW_AT_decl_column(0x0e)
$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$82)
$C$DW$9	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$82)
$C$DW$10	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$7


$C$DW$11	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkConfig")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("SPI_ClkConfig")
	.dwattr $C$DW$11, DW_AT_declaration
	.dwattr $C$DW$11, DW_AT_external
	.dwattr $C$DW$11, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$11, DW_AT_decl_line(0x32f)
	.dwattr $C$DW$11, DW_AT_decl_column(0x0e)
$C$DW$12	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$82)
$C$DW$13	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$82)
$C$DW$14	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$82)
$C$DW$15	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$82)
$C$DW$16	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$11


$C$DW$17	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSPolaritySet")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("SPI_CSPolaritySet")
	.dwattr $C$DW$17, DW_AT_declaration
	.dwattr $C$DW$17, DW_AT_external
	.dwattr $C$DW$17, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$17, DW_AT_decl_line(0x335)
	.dwattr $C$DW$17, DW_AT_decl_column(0x0e)
$C$DW$18	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$82)
$C$DW$19	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$82)
$C$DW$20	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$17


$C$DW$21	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSSet")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("SPI_CSSet")
	.dwattr $C$DW$21, DW_AT_declaration
	.dwattr $C$DW$21, DW_AT_external
	.dwattr $C$DW$21, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$21, DW_AT_decl_line(0x337)
	.dwattr $C$DW$21, DW_AT_decl_column(0x0e)
$C$DW$22	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$82)
$C$DW$23	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$21


$C$DW$24	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DataPinDirection")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("SPI_DataPinDirection")
	.dwattr $C$DW$24, DW_AT_declaration
	.dwattr $C$DW$24, DW_AT_external
	.dwattr $C$DW$24, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$24, DW_AT_decl_line(0x339)
	.dwattr $C$DW$24, DW_AT_decl_column(0x0e)
$C$DW$25	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$82)
$C$DW$26	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$24


$C$DW$27	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_MasterModeEnable")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("SPI_MasterModeEnable")
	.dwattr $C$DW$27, DW_AT_declaration
	.dwattr $C$DW$27, DW_AT_external
	.dwattr $C$DW$27, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$27, DW_AT_decl_line(0x343)
	.dwattr $C$DW$27, DW_AT_decl_column(0x0e)
$C$DW$28	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$27


$C$DW$29	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_MasterModeSet")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("SPI_MasterModeSet")
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$29, DW_AT_declaration
	.dwattr $C$DW$29, DW_AT_external
	.dwattr $C$DW$29, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$29, DW_AT_decl_line(0x344)
	.dwattr $C$DW$29, DW_AT_decl_column(0x11)
$C$DW$30	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$82)
$C$DW$31	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$82)
$C$DW$32	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$82)
$C$DW$33	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$82)
$C$DW$34	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$29


$C$DW$35	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ReceiveData")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("SPI_ReceiveData")
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$35, DW_AT_declaration
	.dwattr $C$DW$35, DW_AT_external
	.dwattr $C$DW$35, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$35, DW_AT_decl_line(0x346)
	.dwattr $C$DW$35, DW_AT_decl_column(0x11)
$C$DW$36	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$82)
$C$DW$37	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$35


$C$DW$38	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_Reset")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("SPI_Reset")
	.dwattr $C$DW$38, DW_AT_declaration
	.dwattr $C$DW$38, DW_AT_external
	.dwattr $C$DW$38, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$38, DW_AT_decl_line(0x347)
	.dwattr $C$DW$38, DW_AT_decl_column(0x0e)
$C$DW$39	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$38


$C$DW$40	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_RxFIFODisable")
	.dwattr $C$DW$40, DW_AT_TI_symbol_name("SPI_RxFIFODisable")
	.dwattr $C$DW$40, DW_AT_declaration
	.dwattr $C$DW$40, DW_AT_external
	.dwattr $C$DW$40, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$40, DW_AT_decl_line(0x349)
	.dwattr $C$DW$40, DW_AT_decl_column(0x0e)
$C$DW$41	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$82)
$C$DW$42	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$40


$C$DW$43	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_StartBitDisable")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("SPI_StartBitDisable")
	.dwattr $C$DW$43, DW_AT_declaration
	.dwattr $C$DW$43, DW_AT_external
	.dwattr $C$DW$43, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$43, DW_AT_decl_line(0x34e)
	.dwattr $C$DW$43, DW_AT_decl_column(0x0e)
$C$DW$44	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$82)
$C$DW$45	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$43


$C$DW$46	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_StartBitEnable")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("SPI_StartBitEnable")
	.dwattr $C$DW$46, DW_AT_declaration
	.dwattr $C$DW$46, DW_AT_external
	.dwattr $C$DW$46, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$46, DW_AT_decl_line(0x34f)
	.dwattr $C$DW$46, DW_AT_decl_column(0x0e)
$C$DW$47	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$82)
$C$DW$48	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$46


$C$DW$49	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_StartBitPolaritySet")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("SPI_StartBitPolaritySet")
	.dwattr $C$DW$49, DW_AT_declaration
	.dwattr $C$DW$49, DW_AT_external
	.dwattr $C$DW$49, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$49, DW_AT_decl_line(0x350)
	.dwattr $C$DW$49, DW_AT_decl_column(0x0e)
$C$DW$50	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$82)
$C$DW$51	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$82)
$C$DW$52	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$49


$C$DW$53	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TransmitData")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("SPI_TransmitData")
	.dwattr $C$DW$53, DW_AT_declaration
	.dwattr $C$DW$53, DW_AT_external
	.dwattr $C$DW$53, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$53, DW_AT_decl_line(0x352)
	.dwattr $C$DW$53, DW_AT_decl_column(0x0e)
$C$DW$54	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$82)
$C$DW$55	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$82)
$C$DW$56	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$53


$C$DW$57	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TxFIFODisable")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("SPI_TxFIFODisable")
	.dwattr $C$DW$57, DW_AT_declaration
	.dwattr $C$DW$57, DW_AT_external
	.dwattr $C$DW$57, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$57, DW_AT_decl_line(0x355)
	.dwattr $C$DW$57, DW_AT_decl_column(0x0e)
$C$DW$58	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$82)
$C$DW$59	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$57


$C$DW$60	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_WordCountSet")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("SPI_WordCountSet")
	.dwattr $C$DW$60, DW_AT_declaration
	.dwattr $C$DW$60, DW_AT_external
	.dwattr $C$DW$60, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$60, DW_AT_decl_line(0x356)
	.dwattr $C$DW$60, DW_AT_decl_column(0x0e)
$C$DW$61	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$61, DW_AT_type(*$C$DW$T$82)
$C$DW$62	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$9)
	.dwendtag $C$DW$60


$C$DW$63	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_WordLengthSet")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("SPI_WordLengthSet")
	.dwattr $C$DW$63, DW_AT_declaration
	.dwattr $C$DW$63, DW_AT_external
	.dwattr $C$DW$63, DW_AT_decl_file("../spiAPI.h")
	.dwattr $C$DW$63, DW_AT_decl_line(0x357)
	.dwattr $C$DW$63, DW_AT_decl_column(0x0e)
$C$DW$64	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$82)
$C$DW$65	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$65, DW_AT_type(*$C$DW$T$82)
$C$DW$66	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$66, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$63

	.global	||pru_intc_map||
	.common	||pru_intc_map||,0,1
$C$DW$67	.dwtag  DW_TAG_variable, DW_AT_name("pru_intc_map")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("pru_intc_map")
	.dwattr $C$DW$67, DW_AT_location[DW_OP_addr ||pru_intc_map||]
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$522)
	.dwattr $C$DW$67, DW_AT_external
	.dwattr $C$DW$67, DW_AT_decl_file("../resource_table.h")
	.dwattr $C$DW$67, DW_AT_decl_line(0x45)
	.dwattr $C$DW$67, DW_AT_decl_column(0x0f)
	.global	||pru_remoteproc_ResourceTable||
	.sect	".resource_table:retain", RW
	.retain
	.align	1
	.elfsym	||pru_remoteproc_ResourceTable||,SYM_SIZE(52)
||pru_remoteproc_ResourceTable||:
	.bits	1,32			; pru_remoteproc_ResourceTable.base.ver @ 0
	.bits	0,32			; pru_remoteproc_ResourceTable.base.num @ 32
	.bits	0,32			; pru_remoteproc_ResourceTable.base.reserved[0] @ 64
	.bits	0,32			; pru_remoteproc_ResourceTable.base.reserved[1] @ 96
	.bits	0,32			; pru_remoteproc_ResourceTable.offset[0] @ 128
	.space	32

$C$DW$68	.dwtag  DW_TAG_variable, DW_AT_name("pru_remoteproc_ResourceTable")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("pru_remoteproc_ResourceTable")
	.dwattr $C$DW$68, DW_AT_location[DW_OP_addr ||pru_remoteproc_ResourceTable||]
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$477)
	.dwattr $C$DW$68, DW_AT_external
	.dwattr $C$DW$68, DW_AT_decl_file("../resource_table.h")
	.dwattr $C$DW$68, DW_AT_decl_line(0x52)
	.dwattr $C$DW$68, DW_AT_decl_column(0x1a)
	.weak	||CT_DDR||
||CT_DDR||:	.usect	".creg.DDR.noload.near",4,1
$C$DW$69	.dwtag  DW_TAG_variable, DW_AT_name("CT_DDR")
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("CT_DDR")
	.dwattr $C$DW$69, DW_AT_location[DW_OP_addr ||CT_DDR||]
	.dwattr $C$DW$69, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$69, DW_AT_external
	.dwattr $C$DW$69, DW_AT_decl_file("../mcp3202.c")
	.dwattr $C$DW$69, DW_AT_decl_line(0x48)
	.dwattr $C$DW$69, DW_AT_decl_column(0x19)
	.weak	||CT_INTC||
||CT_INTC||:	.usect	".creg.PRU_INTC.noload.far",5380,1
$C$DW$70	.dwtag  DW_TAG_variable, DW_AT_name("CT_INTC")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("CT_INTC")
	.dwattr $C$DW$70, DW_AT_location[DW_OP_addr ||CT_INTC||]
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$480)
	.dwattr $C$DW$70, DW_AT_external
	.dwattr $C$DW$70, DW_AT_decl_file("../mcp3202.c")
	.dwattr $C$DW$70, DW_AT_decl_line(0x49)
	.dwattr $C$DW$70, DW_AT_decl_column(0x18)
	.weak	||CT_CFG||
||CT_CFG||:	.usect	".creg.PRU_CFG.noload.far",68,1
$C$DW$71	.dwtag  DW_TAG_variable, DW_AT_name("CT_CFG")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("CT_CFG")
	.dwattr $C$DW$71, DW_AT_location[DW_OP_addr ||CT_CFG||]
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$482)
	.dwattr $C$DW$71, DW_AT_external
	.dwattr $C$DW$71, DW_AT_decl_file("../mcp3202.c")
	.dwattr $C$DW$71, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$71, DW_AT_decl_column(0x17)
	.global	||perCfg||
	.data
	.align	1
	.elfsym	||perCfg||,SYM_SIZE(4)
||perCfg||:
	.bits	1155530752,32			; perCfg @ 0

$C$DW$72	.dwtag  DW_TAG_variable, DW_AT_name("perCfg")
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("perCfg")
	.dwattr $C$DW$72, DW_AT_location[DW_OP_addr ||perCfg||]
	.dwattr $C$DW$72, DW_AT_type(*$C$DW$T$485)
	.dwattr $C$DW$72, DW_AT_external
	.dwattr $C$DW$72, DW_AT_decl_file("../mcp3202.c")
	.dwattr $C$DW$72, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$72, DW_AT_decl_column(0x16)
	.global	||ctrlData||
||ctrlData||:	.usect	".creg.PRU_SHAREDMEM.near",1070,1
$C$DW$73	.dwtag  DW_TAG_variable, DW_AT_name("ctrlData")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("ctrlData")
	.dwattr $C$DW$73, DW_AT_location[DW_OP_addr ||ctrlData||]
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$490)
	.dwattr $C$DW$73, DW_AT_external
	.dwattr $C$DW$73, DW_AT_decl_file("../mcp3202.c")
	.dwattr $C$DW$73, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$73, DW_AT_decl_column(0x24)
;	/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/bin/acpiapru -@/tmp/25451UOYDYT 
	.sect	".text:main"
	.clink
	.global	||main||

$C$DW$74	.dwtag  DW_TAG_subprogram, DW_AT_name("main")
	.dwattr $C$DW$74, DW_AT_low_pc(||main||)
	.dwattr $C$DW$74, DW_AT_high_pc(0x00)
	.dwattr $C$DW$74, DW_AT_TI_symbol_name("main")
	.dwattr $C$DW$74, DW_AT_external
	.dwattr $C$DW$74, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$74, DW_AT_TI_begin_file("../mcp3202.c")
	.dwattr $C$DW$74, DW_AT_TI_begin_line(0x58)
	.dwattr $C$DW$74, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$74, DW_AT_decl_file("../mcp3202.c")
	.dwattr $C$DW$74, DW_AT_decl_line(0x58)
	.dwattr $C$DW$74, DW_AT_decl_column(0x05)
	.dwattr $C$DW$74, DW_AT_TI_max_frame_size(0x06)
	.dwpsn	file "../mcp3202.c",line 89,column 1,is_stmt,address ||main||,isa 0

	.dwfde $C$DW$CIE, ||main||

;***************************************************************
;* FNAME: main                          FR SIZE:   6           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            4 Auto,  2 SOE     *
;***************************************************************

||main||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x06          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 6
        SBBO      &r3.b2, r2, 4, 2      ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -2
	.dwcfi	save_reg_to_mem, 15, -1
$C$DW$75	.dwtag  DW_TAG_variable, DW_AT_name("ch1")
	.dwattr $C$DW$75, DW_AT_TI_symbol_name("ch1")
	.dwattr $C$DW$75, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$75, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$76	.dwtag  DW_TAG_variable, DW_AT_name("ch2")
	.dwattr $C$DW$76, DW_AT_TI_symbol_name("ch2")
	.dwattr $C$DW$76, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$76, DW_AT_location[DW_OP_breg8 2]
        NOP                             ; [ALU_PRU] 
	.dwpsn	file "../mcp3202.c",line 90,column 15,is_stmt,isa 0
        LDI       r0.w0, 0x00           ; [ALU_PRU] |90| 
        SBBO      &r0.w0, r2, 0, 2      ; [ALU_PRU] |90| ch1
	.dwpsn	file "../mcp3202.c",line 91,column 15,is_stmt,isa 0
        SBBO      &r0.w0, r2, 2, 2      ; [ALU_PRU] |91| ch2
	.dwpsn	file "../mcp3202.c",line 97,column 2,is_stmt,isa 0
        LDI32     r0, ||CT_CFG||+4      ; [ALU_PRU] |97| CT_CFG
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |97| 
        CLR       r1, r1, 0x00000004    ; [ALU_PRU] |97| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |97| 
	.dwpsn	file "../mcp3202.c",line 101,column 2,is_stmt,isa 0
        LDI32     r1, 0xffff0000        ; [ALU_PRU] |101| 
        LDI32     r0, 0x00022028        ; [ALU_PRU] |101| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |101| 
        AND       r1, r14, r1           ; [ALU_PRU] |101| 
        SET       r1, r1, 0x00000008    ; [ALU_PRU] |101| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |101| 
	.dwpsn	file "../mcp3202.c",line 105,column 5,is_stmt,isa 0
$C$DW$77	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$77, DW_AT_low_pc(0x00)
	.dwattr $C$DW$77, DW_AT_name("init_data")
	.dwattr $C$DW$77, DW_AT_TI_call
        JAL       r3.w2, ||init_data||  ; [ALU_PRU] |105| init_data
	.dwpsn	file "../mcp3202.c",line 109,column 2,is_stmt,isa 0
$C$DW$78	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$78, DW_AT_low_pc(0x00)
	.dwattr $C$DW$78, DW_AT_name("init_spi")
	.dwattr $C$DW$78, DW_AT_TI_call
        JAL       r3.w2, ||init_spi||   ; [ALU_PRU] |109| init_spi
	.dwpsn	file "../mcp3202.c",line 111,column 2,is_stmt,isa 0
        LDI32     r1, 0xd0c0ffee        ; [ALU_PRU] |111| 
        LDI32     r0, ||ctrlData||      ; [ALU_PRU] |111| ctrlData
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |111| 
        LSR       r14, r1, 0x08         ; [ALU_PRU] |111| 
        SBBO      &r14.b0, r0, 1, 1     ; [ALU_PRU] |111| 
        LSR       r14, r1, 0x10         ; [ALU_PRU] |111| 
        SBBO      &r14.b0, r0, 2, 1     ; [ALU_PRU] |111| 
        LSR       r1, r1, 0x18          ; [ALU_PRU] |111| 
        SBBO      &r1.b0, r0, 3, 1      ; [ALU_PRU] |111| 
	.dwpsn	file "../mcp3202.c",line 113,column 9,is_stmt,isa 0
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L1||
;*
;*   Loop source line                : 113
;*   Loop closing brace source line  : 136
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L1||:    
	.dwpsn	file "../mcp3202.c",line 115,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+4    ; [ALU_PRU] |115| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |115| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |115| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |115| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |115| 
        QBEQ      ||$C$L1||, r0.w0, 0x00 ; [ALU_PRU] |115| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 117,column 4,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+14   ; [ALU_PRU] |117| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |117| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |117| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |117| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |117| 
        QBNE      ||$C$L2||, r0.w0, 0x01 ; [ALU_PRU] |117| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 122,column 5,is_stmt,isa 0
        LDI       r14.w0, 0x0000        ; [ALU_PRU] |122| 
        LDI32     r0, ||ctrlData||+14   ; [ALU_PRU] |122| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |122| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |122| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |122| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |122| 
	.dwpsn	file "../mcp3202.c",line 126,column 5,is_stmt,isa 0
$C$DW$79	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$79, DW_AT_low_pc(0x00)
	.dwattr $C$DW$79, DW_AT_name("init_spi")
	.dwattr $C$DW$79, DW_AT_TI_call
        JAL       r3.w2, ||init_spi||   ; [ALU_PRU] |126| init_spi
	.dwpsn	file "../mcp3202.c",line 127,column 4,is_stmt,isa 0
        JMP       ||$C$L1||             ; [ALU_PRU] |127| 
;* --------------------------------------------------------------------------*
||$C$L2||:    
	.dwpsn	file "../mcp3202.c",line 130,column 5,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+6    ; [ALU_PRU] |130| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |130| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |130| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |130| 
        OR        r14, r0.b0, r1        ; [ALU_PRU] |130| 
$C$DW$80	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$80, DW_AT_low_pc(0x00)
	.dwattr $C$DW$80, DW_AT_name("get_value")
	.dwattr $C$DW$80, DW_AT_TI_call
        JAL       r3.w2, ||get_value||  ; [ALU_PRU] |130| get_value
        SBBO      &r14.w0, r2, 0, 2     ; [ALU_PRU] |130| ch1
	.dwpsn	file "../mcp3202.c",line 131,column 5,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+8    ; [ALU_PRU] |131| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |131| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |131| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |131| 
        OR        r14, r0.b0, r1        ; [ALU_PRU] |131| 
$C$DW$81	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$81, DW_AT_low_pc(0x00)
	.dwattr $C$DW$81, DW_AT_name("get_value")
	.dwattr $C$DW$81, DW_AT_TI_call
        JAL       r3.w2, ||get_value||  ; [ALU_PRU] |131| get_value
        SBBO      &r14.w0, r2, 2, 2     ; [ALU_PRU] |131| ch2
	.dwpsn	file "../mcp3202.c",line 133,column 5,is_stmt,isa 0
        LBBO      &r14.w0, r2, 0, 2     ; [ALU_PRU] |133| ch1
        LBBO      &r14.w2, r2, 2, 2     ; [ALU_PRU] |133| ch2
$C$DW$82	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$82, DW_AT_low_pc(0x00)
	.dwattr $C$DW$82, DW_AT_name("sampleAverage")
	.dwattr $C$DW$82, DW_AT_TI_call
        JAL       r3.w2, ||sampleAverage|| ; [ALU_PRU] |133| sampleAverage
	.dwpsn	file "../mcp3202.c",line 113,column 9,is_stmt,isa 0
        JMP       ||$C$L1||             ; [ALU_PRU] |113| 
;* --------------------------------------------------------------------------*
	.dwattr $C$DW$74, DW_AT_TI_end_file("../mcp3202.c")
	.dwattr $C$DW$74, DW_AT_TI_end_line(0x8f)
	.dwattr $C$DW$74, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$74

	.sect	".text:get_value"
	.clink
	.global	||get_value||

$C$DW$83	.dwtag  DW_TAG_subprogram, DW_AT_name("get_value")
	.dwattr $C$DW$83, DW_AT_low_pc(||get_value||)
	.dwattr $C$DW$83, DW_AT_high_pc(0x00)
	.dwattr $C$DW$83, DW_AT_TI_symbol_name("get_value")
	.dwattr $C$DW$83, DW_AT_external
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$83, DW_AT_TI_begin_file("../mcp3202.c")
	.dwattr $C$DW$83, DW_AT_TI_begin_line(0x9d)
	.dwattr $C$DW$83, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$83, DW_AT_decl_file("../mcp3202.c")
	.dwattr $C$DW$83, DW_AT_decl_line(0x9d)
	.dwattr $C$DW$83, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$83, DW_AT_TI_max_frame_size(0x15)
	.dwpsn	file "../mcp3202.c",line 158,column 1,is_stmt,address ||get_value||,isa 0

	.dwfde $C$DW$CIE, ||get_value||
$C$DW$84	.dwtag  DW_TAG_formal_parameter, DW_AT_name("mosiout")
	.dwattr $C$DW$84, DW_AT_TI_symbol_name("mosiout")
	.dwattr $C$DW$84, DW_AT_type(*$C$DW$T$470)
	.dwattr $C$DW$84, DW_AT_location[DW_OP_regx 0x38]

;***************************************************************
;* FNAME: get_value                     FR SIZE:  21           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           15 Auto,  6 SOE     *
;***************************************************************

||get_value||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x15          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 21
        SBBO      &r3.b2, r2, 15, 6     ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -6
	.dwcfi	save_reg_to_mem, 15, -5
	.dwcfi	save_reg_to_mem, 16, -4
	.dwcfi	save_reg_to_mem, 17, -3
	.dwcfi	save_reg_to_mem, 18, -2
	.dwcfi	save_reg_to_mem, 19, -1
$C$DW$85	.dwtag  DW_TAG_variable, DW_AT_name("mosiout")
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("mosiout")
	.dwattr $C$DW$85, DW_AT_type(*$C$DW$T$470)
	.dwattr $C$DW$85, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$86	.dwtag  DW_TAG_variable, DW_AT_name("outVal")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("outVal")
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$86, DW_AT_location[DW_OP_breg8 1]
        NOP                             ; [ALU_PRU] 
$C$DW$87	.dwtag  DW_TAG_variable, DW_AT_name("inVal")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("inVal")
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$87, DW_AT_location[DW_OP_breg8 5]
        NOP                             ; [ALU_PRU] 
$C$DW$88	.dwtag  DW_TAG_variable, DW_AT_name("spiReg")
	.dwattr $C$DW$88, DW_AT_TI_symbol_name("spiReg")
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$88, DW_AT_location[DW_OP_breg8 9]
        NOP                             ; [ALU_PRU] 
$C$DW$89	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$89, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$89, DW_AT_location[DW_OP_breg8 13]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14.b0, r2, 0, 1     ; [ALU_PRU] |158| mosiout
	.dwpsn	file "../mcp3202.c",line 159,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |159| 
        SBBO      &r0, r2, 1, 4         ; [ALU_PRU] |159| outVal
	.dwpsn	file "../mcp3202.c",line 160,column 17,is_stmt,isa 0
        SBBO      &r0, r2, 5, 4         ; [ALU_PRU] |160| inVal
	.dwpsn	file "../mcp3202.c",line 161,column 18,is_stmt,isa 0
        SBBO      &r0, r2, 9, 4         ; [ALU_PRU] |161| spiReg
	.dwpsn	file "../mcp3202.c",line 162,column 18,is_stmt,isa 0
        LDI       r0.w0, 0x00           ; [ALU_PRU] |162| 
        SBBO      &r0.w0, r2, 13, 2     ; [ALU_PRU] |162| retVal
	.dwpsn	file "../mcp3202.c",line 164,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+24   ; [ALU_PRU] |164| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |164| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |164| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |164| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |164| 
        QBNE      ||$C$L3||, r0.w0, 0x00 ; [ALU_PRU] |164| 
;* --------------------------------------------------------------------------*
        LDI32     r0, 0x48030000        ; [ALU_PRU] |164| 
        JMP       ||$C$L4||             ; [ALU_PRU] |164| 
;* --------------------------------------------------------------------------*
||$C$L3||:    
        LDI32     r0, 0x481a0000        ; [ALU_PRU] |164| 
;* --------------------------------------------------------------------------*
||$C$L4||:    
        SBBO      &r0, r2, 9, 4         ; [ALU_PRU] |164| spiReg
	.dwpsn	file "../mcp3202.c",line 169,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |169| ctrlData
        LDI       r15, 0x0001           ; [ALU_PRU] |169| 
        LBBO      &r14, r2, 9, 4        ; [ALU_PRU] |169| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |169| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |169| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |169| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |169| 
        MOV       r16, r0.w0            ; [ALU_PRU] |169| 
$C$DW$90	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$90, DW_AT_low_pc(0x00)
	.dwattr $C$DW$90, DW_AT_name("SPI_ChannelSet")
	.dwattr $C$DW$90, DW_AT_TI_call
        JAL       r3.w2, ||SPI_ChannelSet|| ; [ALU_PRU] |169| SPI_ChannelSet
	.dwpsn	file "../mcp3202.c",line 173,column 2,is_stmt,isa 0
        LBBO      &r0.b0, r2, 0, 1      ; [ALU_PRU] |173| mosiout
        MOV       r0, r0.b0             ; [ALU_PRU] |173| 
        SBBO      &r0, r2, 1, 4         ; [ALU_PRU] |173| outVal
	.dwpsn	file "../mcp3202.c",line 174,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+10   ; [ALU_PRU] |174| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |174| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |174| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |174| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |174| 
        RSB       r0.b0, r0.b0, 0x20    ; [ALU_PRU] |174| 
        MOV       r0, r0.b0             ; [ALU_PRU] |174| 
        QBBC      ||$C$L5||, r0, 0x07   ; [ALU_PRU] |174| 
;* --------------------------------------------------------------------------*
        FILL      &r0.b1, 3             ; [ALU_PRU] |174| 
;* --------------------------------------------------------------------------*
||$C$L5||:    
        LBBO      &r1, r2, 1, 4         ; [ALU_PRU] |174| outVal
        LSL       r0, r1, r0            ; [ALU_PRU] |174| 
        SBBO      &r0, r2, 1, 4         ; [ALU_PRU] |174| outVal
	.dwpsn	file "../mcp3202.c",line 176,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 9, 4        ; [ALU_PRU] |176| spiReg
        LBBO      &r15, r2, 1, 4        ; [ALU_PRU] |176| outVal
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |176| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |176| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |176| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |176| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |176| 
        MOV       r16, r0.w0            ; [ALU_PRU] |176| 
$C$DW$91	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$91, DW_AT_low_pc(0x00)
	.dwattr $C$DW$91, DW_AT_name("SPI_TransmitData")
	.dwattr $C$DW$91, DW_AT_TI_call
        JAL       r3.w2, ||SPI_TransmitData|| ; [ALU_PRU] |176| SPI_TransmitData
	.dwpsn	file "../mcp3202.c",line 178,column 2,is_stmt,isa 0
        LDI32     r4, ||ctrlData||+26   ; [ALU_PRU] |178| ctrlData
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L6||
;*
;*   Loop source line                : 178
;*   Loop closing brace source line  : 178
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L6||:    
	.dwpsn	file "../mcp3202.c",line 178,column 9,is_stmt,isa 0
        LBBO      &r0.b0, r4, 1, 1      ; [ALU_PRU] |178| 
        LBBO      &r1.b0, r4, 0, 1      ; [ALU_PRU] |178| 
        LBBO      &r14, r2, 9, 4        ; [ALU_PRU] |178| spiReg
        LSL       r0, r0.b0, 0x08       ; [ALU_PRU] |178| 
        OR        r0, r1.b0, r0         ; [ALU_PRU] |178| 
        MOV       r15, r0.w0            ; [ALU_PRU] |178| 
$C$DW$92	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$92, DW_AT_low_pc(0x00)
	.dwattr $C$DW$92, DW_AT_name("Is_RxDataReady")
	.dwattr $C$DW$92, DW_AT_TI_call
        JAL       r3.w2, ||Is_RxDataReady|| ; [ALU_PRU] |178| Is_RxDataReady
        QBEQ      ||$C$L6||, r14, 0x00  ; [ALU_PRU] |178| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 180,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |180| ctrlData
        LBBO      &r14, r2, 9, 4        ; [ALU_PRU] |180| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |180| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |180| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |180| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |180| 
        MOV       r15, r0.w0            ; [ALU_PRU] |180| 
$C$DW$93	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$93, DW_AT_low_pc(0x00)
	.dwattr $C$DW$93, DW_AT_name("SPI_ReceiveData")
	.dwattr $C$DW$93, DW_AT_TI_call
        JAL       r3.w2, ||SPI_ReceiveData|| ; [ALU_PRU] |180| SPI_ReceiveData
        SBBO      &r14, r2, 5, 4        ; [ALU_PRU] |180| inVal
	.dwpsn	file "../mcp3202.c",line 184,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 5, 4         ; [ALU_PRU] |184| inVal
        LSL       r0, r0, 0x05          ; [ALU_PRU] |184| 
        SBBO      &r0, r2, 5, 4         ; [ALU_PRU] |184| inVal
	.dwpsn	file "../mcp3202.c",line 185,column 2,is_stmt,isa 0
        LSR       r0, r0, 0x13          ; [ALU_PRU] |185| 
        SBBO      &r0, r2, 5, 4         ; [ALU_PRU] |185| inVal
	.dwpsn	file "../mcp3202.c",line 187,column 2,is_stmt,isa 0
        LBBO      &r0.w0, r2, 5, 2      ; [ALU_PRU] |187| inVal
        SBBO      &r0.w0, r2, 13, 2     ; [ALU_PRU] |187| retVal
	.dwpsn	file "../mcp3202.c",line 191,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |191| ctrlData
        ZERO      &r15, 4               ; [ALU_PRU] |191| 
        LBBO      &r14, r2, 9, 4        ; [ALU_PRU] |191| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |191| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |191| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |191| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |191| 
        MOV       r16, r0.w0            ; [ALU_PRU] |191| 
$C$DW$94	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$94, DW_AT_low_pc(0x00)
	.dwattr $C$DW$94, DW_AT_name("SPI_ChannelSet")
	.dwattr $C$DW$94, DW_AT_TI_call
        JAL       r3.w2, ||SPI_ChannelSet|| ; [ALU_PRU] |191| SPI_ChannelSet
	.dwpsn	file "../mcp3202.c",line 193,column 2,is_stmt,isa 0
        LBBO      &r14.w0, r2, 13, 2    ; [ALU_PRU] |193| retVal
	.dwpsn	file "../mcp3202.c",line 194,column 1,is_stmt,isa 0
        LBBO      &r3.b2, r2, 15, 6     ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
	.dwcfi	restore_reg, 16
	.dwcfi	restore_reg, 17
	.dwcfi	restore_reg, 18
	.dwcfi	restore_reg, 19
        ADD       r2, r2, 0x15          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$95	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$95, DW_AT_low_pc(0x00)
	.dwattr $C$DW$95, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$83, DW_AT_TI_end_file("../mcp3202.c")
	.dwattr $C$DW$83, DW_AT_TI_end_line(0xc2)
	.dwattr $C$DW$83, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$83

	.sect	".text:init_spi"
	.clink
	.global	||init_spi||

$C$DW$96	.dwtag  DW_TAG_subprogram, DW_AT_name("init_spi")
	.dwattr $C$DW$96, DW_AT_low_pc(||init_spi||)
	.dwattr $C$DW$96, DW_AT_high_pc(0x00)
	.dwattr $C$DW$96, DW_AT_TI_symbol_name("init_spi")
	.dwattr $C$DW$96, DW_AT_external
	.dwattr $C$DW$96, DW_AT_TI_begin_file("../mcp3202.c")
	.dwattr $C$DW$96, DW_AT_TI_begin_line(0xce)
	.dwattr $C$DW$96, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$96, DW_AT_decl_file("../mcp3202.c")
	.dwattr $C$DW$96, DW_AT_decl_line(0xce)
	.dwattr $C$DW$96, DW_AT_decl_column(0x06)
	.dwattr $C$DW$96, DW_AT_TI_max_frame_size(0x0a)
	.dwpsn	file "../mcp3202.c",line 207,column 1,is_stmt,address ||init_spi||,isa 0

	.dwfde $C$DW$CIE, ||init_spi||

;***************************************************************
;* FNAME: init_spi                      FR SIZE:  10           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  2 SOE     *
;***************************************************************

||init_spi||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0a          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 10
        SBBO      &r3.b2, r2, 8, 2      ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -2
	.dwcfi	save_reg_to_mem, 15, -1
$C$DW$97	.dwtag  DW_TAG_variable, DW_AT_name("spiReg")
	.dwattr $C$DW$97, DW_AT_TI_symbol_name("spiReg")
	.dwattr $C$DW$97, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$97, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$98	.dwtag  DW_TAG_variable, DW_AT_name("sampleRate")
	.dwattr $C$DW$98, DW_AT_TI_symbol_name("sampleRate")
	.dwattr $C$DW$98, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$98, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
	.dwpsn	file "../mcp3202.c",line 208,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |208| 
        SBBO      &r0, r2, 0, 4         ; [ALU_PRU] |208| spiReg
	.dwpsn	file "../mcp3202.c",line 209,column 22,is_stmt,isa 0
        SBBO      &r0, r2, 4, 4         ; [ALU_PRU] |209| sampleRate
	.dwpsn	file "../mcp3202.c",line 214,column 2,is_stmt,isa 0
        LDI32     r1, 0xfffffffc        ; [ALU_PRU] |214| 
        LDI       r0, ||perCfg||        ; [ALU_PRU] |214| perCfg
        LBBO      &r0, r0, 0, 4         ; [ALU_PRU] |214| 
        ADD       r0, r0, 0x50          ; [ALU_PRU] |214| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |214| 
        AND       r1, r14, r1           ; [ALU_PRU] |214| 
        SET       r1, r1, 0x00000001    ; [ALU_PRU] |214| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |214| 
	.dwpsn	file "../mcp3202.c",line 216,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+24   ; [ALU_PRU] |216| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |216| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |216| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |216| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |216| 
        QBNE      ||$C$L7||, r0.w0, 0x00 ; [ALU_PRU] |216| 
;* --------------------------------------------------------------------------*
        LDI32     r0, 0x48030000        ; [ALU_PRU] |216| 
        JMP       ||$C$L8||             ; [ALU_PRU] |216| 
;* --------------------------------------------------------------------------*
||$C$L7||:    
        LDI32     r0, 0x481a0000        ; [ALU_PRU] |216| 
;* --------------------------------------------------------------------------*
||$C$L8||:    
        SBBO      &r0, r2, 0, 4         ; [ALU_PRU] |216| spiReg
	.dwpsn	file "../mcp3202.c",line 220,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |220| spiReg
$C$DW$99	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$99, DW_AT_low_pc(0x00)
	.dwattr $C$DW$99, DW_AT_name("SPI_Reset")
	.dwattr $C$DW$99, DW_AT_TI_call
        JAL       r3.w2, ||SPI_Reset||  ; [ALU_PRU] |220| SPI_Reset
	.dwpsn	file "../mcp3202.c",line 221,column 2,is_stmt,isa 0
        LDI       r15, 0x0001           ; [ALU_PRU] |221| 
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |221| spiReg
$C$DW$100	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$100, DW_AT_low_pc(0x00)
	.dwattr $C$DW$100, DW_AT_name("SPI_CSSet")
	.dwattr $C$DW$100, DW_AT_TI_call
        JAL       r3.w2, ||SPI_CSSet||  ; [ALU_PRU] |221| SPI_CSSet
	.dwpsn	file "../mcp3202.c",line 222,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |222| ctrlData
        ZERO      &r15, 4               ; [ALU_PRU] |222| 
        ZERO      &r16, 4               ; [ALU_PRU] |222| 
        LDI32     r17, 0x00010000       ; [ALU_PRU] |222| 
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |222| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |222| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |222| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |222| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |222| 
        MOV       r18, r0.w0            ; [ALU_PRU] |222| 
$C$DW$101	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$101, DW_AT_low_pc(0x00)
	.dwattr $C$DW$101, DW_AT_name("SPI_MasterModeSet")
	.dwattr $C$DW$101, DW_AT_TI_call
        JAL       r3.w2, ||SPI_MasterModeSet|| ; [ALU_PRU] |222| SPI_MasterModeSet
	.dwpsn	file "../mcp3202.c",line 223,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |223| spiReg
$C$DW$102	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$102, DW_AT_low_pc(0x00)
	.dwattr $C$DW$102, DW_AT_name("SPI_MasterModeEnable")
	.dwattr $C$DW$102, DW_AT_TI_call
        JAL       r3.w2, ||SPI_MasterModeEnable|| ; [ALU_PRU] |223| SPI_MasterModeEnable
	.dwpsn	file "../mcp3202.c",line 230,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+16   ; [ALU_PRU] |230| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |230| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |230| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |230| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |230| 
        LSL       r0, r0.w0, 0x05       ; [ALU_PRU] |230| 
        SBBO      &r0, r2, 4, 4         ; [ALU_PRU] |230| sampleRate
	.dwpsn	file "../mcp3202.c",line 231,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |231| ctrlData
        LDI32     r15, 0x02dc6c00       ; [ALU_PRU] |231| 
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |231| spiReg
        LBBO      &r16, r2, 4, 4        ; [ALU_PRU] |231| sampleRate
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |231| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |231| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |231| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |231| 
        MOV       r17, r0.w0            ; [ALU_PRU] |231| 
        LDI32     r0, ||ctrlData||+30   ; [ALU_PRU] |231| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |231| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |231| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |231| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |231| 
        MOV       r18, r0.w0            ; [ALU_PRU] |231| 
$C$DW$103	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$103, DW_AT_low_pc(0x00)
	.dwattr $C$DW$103, DW_AT_name("SPI_ClkConfig")
	.dwattr $C$DW$103, DW_AT_TI_call
        JAL       r3.w2, ||SPI_ClkConfig|| ; [ALU_PRU] |231| SPI_ClkConfig
	.dwpsn	file "../mcp3202.c",line 233,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |233| ctrlData
        LDI       r15, 0x0f80           ; [ALU_PRU] |233| 
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |233| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |233| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |233| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |233| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |233| 
        MOV       r16, r0.w0            ; [ALU_PRU] |233| 
$C$DW$104	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$104, DW_AT_low_pc(0x00)
	.dwattr $C$DW$104, DW_AT_name("SPI_WordLengthSet")
	.dwattr $C$DW$104, DW_AT_TI_call
        JAL       r3.w2, ||SPI_WordLengthSet|| ; [ALU_PRU] |233| SPI_WordLengthSet
	.dwpsn	file "../mcp3202.c",line 234,column 2,is_stmt,isa 0
        LDI       r15.w0, 0x0001        ; [ALU_PRU] |234| 
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |234| spiReg
$C$DW$105	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$105, DW_AT_low_pc(0x00)
	.dwattr $C$DW$105, DW_AT_name("SPI_WordCountSet")
	.dwattr $C$DW$105, DW_AT_TI_call
        JAL       r3.w2, ||SPI_WordCountSet|| ; [ALU_PRU] |234| SPI_WordCountSet
	.dwpsn	file "../mcp3202.c",line 236,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |236| ctrlData
        LDI       r15, 0x0040           ; [ALU_PRU] |236| 
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |236| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |236| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |236| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |236| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |236| 
        MOV       r16, r0.w0            ; [ALU_PRU] |236| 
$C$DW$106	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$106, DW_AT_low_pc(0x00)
	.dwattr $C$DW$106, DW_AT_name("SPI_CSPolaritySet")
	.dwattr $C$DW$106, DW_AT_TI_call
        JAL       r3.w2, ||SPI_CSPolaritySet|| ; [ALU_PRU] |236| SPI_CSPolaritySet
	.dwpsn	file "../mcp3202.c",line 238,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |238| ctrlData
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |238| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |238| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |238| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |238| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |238| 
        MOV       r15, r0.w0            ; [ALU_PRU] |238| 
$C$DW$107	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$107, DW_AT_low_pc(0x00)
	.dwattr $C$DW$107, DW_AT_name("SPI_TxFIFODisable")
	.dwattr $C$DW$107, DW_AT_TI_call
        JAL       r3.w2, ||SPI_TxFIFODisable|| ; [ALU_PRU] |238| SPI_TxFIFODisable
	.dwpsn	file "../mcp3202.c",line 239,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |239| ctrlData
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |239| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |239| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |239| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |239| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |239| 
        MOV       r15, r0.w0            ; [ALU_PRU] |239| 
$C$DW$108	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$108, DW_AT_low_pc(0x00)
	.dwattr $C$DW$108, DW_AT_name("SPI_RxFIFODisable")
	.dwattr $C$DW$108, DW_AT_TI_call
        JAL       r3.w2, ||SPI_RxFIFODisable|| ; [ALU_PRU] |239| SPI_RxFIFODisable
	.dwpsn	file "../mcp3202.c",line 240,column 2,is_stmt,isa 0
        LDI       r15, 0x0100           ; [ALU_PRU] |240| 
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |240| spiReg
$C$DW$109	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$109, DW_AT_low_pc(0x00)
	.dwattr $C$DW$109, DW_AT_name("SPI_DataPinDirection")
	.dwattr $C$DW$109, DW_AT_TI_call
        JAL       r3.w2, ||SPI_DataPinDirection|| ; [ALU_PRU] |240| SPI_DataPinDirection
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 242,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+28   ; [ALU_PRU] |242| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |242| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |242| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |242| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |242| 
        QBEQ      ||$C$L9||, r0.w0, 0x00 ; [ALU_PRU] |242| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 244,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |244| ctrlData
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |244| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |244| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |244| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |244| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |244| 
        MOV       r15, r0.w0            ; [ALU_PRU] |244| 
$C$DW$110	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$110, DW_AT_low_pc(0x00)
	.dwattr $C$DW$110, DW_AT_name("SPI_StartBitEnable")
	.dwattr $C$DW$110, DW_AT_TI_call
        JAL       r3.w2, ||SPI_StartBitEnable|| ; [ALU_PRU] |244| SPI_StartBitEnable
	.dwpsn	file "../mcp3202.c",line 245,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |245| ctrlData
        ZERO      &r15, 4               ; [ALU_PRU] |245| 
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |245| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |245| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |245| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |245| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |245| 
        MOV       r16, r0.w0            ; [ALU_PRU] |245| 
$C$DW$111	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$111, DW_AT_low_pc(0x00)
	.dwattr $C$DW$111, DW_AT_name("SPI_StartBitPolaritySet")
	.dwattr $C$DW$111, DW_AT_TI_call
        JAL       r3.w2, ||SPI_StartBitPolaritySet|| ; [ALU_PRU] |245| SPI_StartBitPolaritySet
	.dwpsn	file "../mcp3202.c",line 246,column 2,is_stmt,isa 0
        JMP       ||$C$L10||            ; [ALU_PRU] |246| 
;* --------------------------------------------------------------------------*
||$C$L9||:    
	.dwpsn	file "../mcp3202.c",line 247,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |247| ctrlData
        LBBO      &r14, r2, 0, 4        ; [ALU_PRU] |247| spiReg
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |247| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |247| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |247| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |247| 
        MOV       r15, r0.w0            ; [ALU_PRU] |247| 
$C$DW$112	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$112, DW_AT_low_pc(0x00)
	.dwattr $C$DW$112, DW_AT_name("SPI_StartBitDisable")
	.dwattr $C$DW$112, DW_AT_TI_call
        JAL       r3.w2, ||SPI_StartBitDisable|| ; [ALU_PRU] |247| SPI_StartBitDisable
	.dwpsn	file "../mcp3202.c",line 249,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L10||:    
        LBBO      &r3.b2, r2, 8, 2      ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
        ADD       r2, r2, 0x0a          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$113	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$113, DW_AT_low_pc(0x00)
	.dwattr $C$DW$113, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$96, DW_AT_TI_end_file("../mcp3202.c")
	.dwattr $C$DW$96, DW_AT_TI_end_line(0xf9)
	.dwattr $C$DW$96, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$96

	.sect	".text:sampleAverage"
	.clink
	.global	||sampleAverage||

$C$DW$114	.dwtag  DW_TAG_subprogram, DW_AT_name("sampleAverage")
	.dwattr $C$DW$114, DW_AT_low_pc(||sampleAverage||)
	.dwattr $C$DW$114, DW_AT_high_pc(0x00)
	.dwattr $C$DW$114, DW_AT_TI_symbol_name("sampleAverage")
	.dwattr $C$DW$114, DW_AT_external
	.dwattr $C$DW$114, DW_AT_TI_begin_file("../mcp3202.c")
	.dwattr $C$DW$114, DW_AT_TI_begin_line(0x104)
	.dwattr $C$DW$114, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$114, DW_AT_decl_file("../mcp3202.c")
	.dwattr $C$DW$114, DW_AT_decl_line(0x104)
	.dwattr $C$DW$114, DW_AT_decl_column(0x06)
	.dwattr $C$DW$114, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../mcp3202.c",line 261,column 1,is_stmt,address ||sampleAverage||,isa 0

	.dwfde $C$DW$CIE, ||sampleAverage||
$C$DW$115	.dwtag  DW_TAG_formal_parameter, DW_AT_name("ch1v")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("ch1v")
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$115, DW_AT_location[DW_OP_regx 0x38]
$C$DW$116	.dwtag  DW_TAG_formal_parameter, DW_AT_name("ch2v")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("ch2v")
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$116, DW_AT_location[DW_OP_regx 0x3a]

;***************************************************************
;* FNAME: sampleAverage                 FR SIZE:   4           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            4 Auto,  0 SOE     *
;***************************************************************

||sampleAverage||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 4
$C$DW$117	.dwtag  DW_TAG_variable, DW_AT_name("ch1v")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("ch1v")
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$117, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$118	.dwtag  DW_TAG_variable, DW_AT_name("ch2v")
	.dwattr $C$DW$118, DW_AT_TI_symbol_name("ch2v")
	.dwattr $C$DW$118, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$118, DW_AT_location[DW_OP_breg8 2]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14.w2, r2, 2, 2     ; [ALU_PRU] |261| ch2v
        SBBO      &r14.w0, r2, 0, 2     ; [ALU_PRU] |261| ch1v
	.dwpsn	file "../mcp3202.c",line 264,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+40   ; [ALU_PRU] |264| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |264| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |264| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |264| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |264| 
        LBBO      &r0.w2, r2, 0, 2      ; [ALU_PRU] |264| ch1v
        ADD       r14.w0, r0.w0, r0.w2  ; [ALU_PRU] |264| 
        LDI32     r0, ||ctrlData||+40   ; [ALU_PRU] |264| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |264| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |264| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |264| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |264| 
	.dwpsn	file "../mcp3202.c",line 265,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+42   ; [ALU_PRU] |265| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |265| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |265| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |265| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |265| 
        LBBO      &r0.w2, r2, 2, 2      ; [ALU_PRU] |265| ch2v
        ADD       r14.w0, r0.w0, r0.w2  ; [ALU_PRU] |265| 
        LDI32     r0, ||ctrlData||+42   ; [ALU_PRU] |265| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |265| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |265| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |265| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |265| 
	.dwpsn	file "../mcp3202.c",line 266,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+44   ; [ALU_PRU] |266| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |266| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |266| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |266| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |266| 
        ADD       r14.w0, r0.w0, 0x01   ; [ALU_PRU] |266| 
        LDI32     r0, ||ctrlData||+44   ; [ALU_PRU] |266| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |266| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |266| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |266| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |266| 
	.dwpsn	file "../mcp3202.c",line 268,column 2,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+18   ; [ALU_PRU] |268| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |268| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |268| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |268| 
        OR        r14, r0.b0, r1        ; [ALU_PRU] |268| 
        LDI32     r0, ||ctrlData||+44   ; [ALU_PRU] |268| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |268| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |268| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |268| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |268| 
        QBLT      ||$C$L24||, r14.w0, r0.w0 ; [ALU_PRU] |268| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 270,column 3,is_stmt,isa 0
        LDI       r14.w0, 0x0000        ; [ALU_PRU] |270| 
        LDI32     r0, ||ctrlData||+44   ; [ALU_PRU] |270| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |270| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |270| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |270| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |270| 
	.dwpsn	file "../mcp3202.c",line 275,column 3,is_stmt,isa 0
        JMP       ||$C$L12||            ; [ALU_PRU] |275| 
;* --------------------------------------------------------------------------*
||$C$L11||:    
	.dwpsn	file "../mcp3202.c",line 275,column 30,is_stmt,isa 0
        .newblock
        LDI32    r0, 49
$1:     SUB      r0, r0, 1
        QBNE     $1, r0, 0             ; [ALU_PRU] |275| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L12||
;* --------------------------------------------------------------------------*
||$C$L12||:    
	.dwpsn	file "../mcp3202.c",line 275,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+32   ; [ALU_PRU] |275| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |275| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |275| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |275| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |275| 
        QBNE      ||$C$L11||, r0.w0, 0x00 ; [ALU_PRU] |275| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 276,column 3,is_stmt,isa 0
        LDI       r14.w0, 0x0001        ; [ALU_PRU] |276| 
        LDI32     r0, ||ctrlData||+32   ; [ALU_PRU] |276| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |276| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |276| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |276| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |276| 
	.dwpsn	file "../mcp3202.c",line 278,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+36   ; [ALU_PRU] |278| ctrlData
        LBBO      &r14.w0, r2, 0, 2     ; [ALU_PRU] |278| ch1v
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |278| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |278| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |278| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |278| 
        MOV       r0, r0.w0             ; [ALU_PRU] |278| 
        QBBC      ||$C$L13||, r0, 0x0f  ; [ALU_PRU] |278| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |278| 
;* --------------------------------------------------------------------------*
||$C$L13||:    
        LSL       r1, r0, 0x02          ; [ALU_PRU] |278| 
        LDI32     r0, ||ctrlData||+46   ; [ALU_PRU] |278| ctrlData
        ADD       r0, r1, r0            ; [ALU_PRU] |278| 
        MOV       r1, r14.w0            ; [ALU_PRU] |278| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |278| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |278| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |278| 
	.dwpsn	file "../mcp3202.c",line 279,column 3,is_stmt,isa 0
        LBBO      &r14.w0, r2, 2, 2     ; [ALU_PRU] |279| ch2v
        LDI32     r0, ||ctrlData||+36   ; [ALU_PRU] |279| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |279| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |279| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |279| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |279| 
        MOV       r0, r0.w0             ; [ALU_PRU] |279| 
        QBBC      ||$C$L14||, r0, 0x0f  ; [ALU_PRU] |279| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |279| 
;* --------------------------------------------------------------------------*
||$C$L14||:    
        LSL       r1, r0, 0x02          ; [ALU_PRU] |279| 
        LDI32     r0, ||ctrlData||+48   ; [ALU_PRU] |279| ctrlData
        ADD       r0, r1, r0            ; [ALU_PRU] |279| 
        MOV       r1, r14.w0            ; [ALU_PRU] |279| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |279| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |279| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |279| 
	.dwpsn	file "../mcp3202.c",line 281,column 3,is_stmt,isa 0
        LDI       r14.w0, 0x0000        ; [ALU_PRU] |281| 
        LDI32     r0, ||ctrlData||+40   ; [ALU_PRU] |281| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |281| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |281| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |281| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |281| 
	.dwpsn	file "../mcp3202.c",line 282,column 3,is_stmt,isa 0
        MOV       r1, r14.w0            ; [ALU_PRU] |282| 
        LDI32     r0, ||ctrlData||+42   ; [ALU_PRU] |282| ctrlData
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |282| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |282| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |282| 
	.dwpsn	file "../mcp3202.c",line 286,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+36   ; [ALU_PRU] |286| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |286| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |286| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |286| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |286| 
        LDI32     r1, ||ctrlData||+36   ; [ALU_PRU] |286| ctrlData
        ADD       r14.w0, r0.w0, 0x01   ; [ALU_PRU] |286| 
        MOV       r0, r14.w0            ; [ALU_PRU] |286| 
        SBBO      &r0.b0, r1, 0, 1      ; [ALU_PRU] |286| 
        MOV       r0, r14.w0            ; [ALU_PRU] |286| 
        QBBC      ||$C$L15||, r0, 0x0f  ; [ALU_PRU] |286| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |286| 
;* --------------------------------------------------------------------------*
||$C$L15||:    
        LSR       r0, r0, 0x08          ; [ALU_PRU] |286| 
        SBBO      &r0.b0, r1, 1, 1      ; [ALU_PRU] |286| 
	.dwpsn	file "../mcp3202.c",line 287,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+34   ; [ALU_PRU] |287| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |287| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |287| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |287| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |287| 
        ADD       r14.w0, r0.w0, 0x01   ; [ALU_PRU] |287| 
        LDI32     r1, ||ctrlData||+34   ; [ALU_PRU] |287| ctrlData
        MOV       r0, r14.w0            ; [ALU_PRU] |287| 
        SBBO      &r0.b0, r1, 0, 1      ; [ALU_PRU] |287| 
        MOV       r0, r14.w0            ; [ALU_PRU] |287| 
        QBBC      ||$C$L16||, r0, 0x0f  ; [ALU_PRU] |287| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |287| 
;* --------------------------------------------------------------------------*
||$C$L16||:    
        LSR       r0, r0, 0x08          ; [ALU_PRU] |287| 
        SBBO      &r0.b0, r1, 1, 1      ; [ALU_PRU] |287| 
	.dwpsn	file "../mcp3202.c",line 289,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+34   ; [ALU_PRU] |289| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |289| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |289| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |289| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |289| 
        MOV       r0.w2, r0.w0          ; [ALU_PRU] |289| 
        XOR       r0.b3, r0.b3, 0x80    ; [ALU_PRU] |289| 
        LDI       r0.w0, 0x0100         ; [ALU_PRU] |289| 
        XOR       r0.b1, r0.b1, 0x80    ; [ALU_PRU] |289| 
        QBLE      ||$C$L18||, r0.w0, r0.w2 ; [ALU_PRU] |289| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 290,column 4,is_stmt,isa 0
        LDI       r14.w0, 0x0100        ; [ALU_PRU] |290| 
        LDI32     r1, ||ctrlData||+34   ; [ALU_PRU] |290| ctrlData
        MOV       r0, r14.w0            ; [ALU_PRU] |290| 
        SBBO      &r0.b0, r1, 0, 1      ; [ALU_PRU] |290| 
        MOV       r0, r14.w0            ; [ALU_PRU] |290| 
        QBBC      ||$C$L17||, r0, 0x0f  ; [ALU_PRU] |290| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |290| 
;* --------------------------------------------------------------------------*
||$C$L17||:    
        LSR       r0, r0, 0x08          ; [ALU_PRU] |290| 
        SBBO      &r0.b0, r1, 1, 1      ; [ALU_PRU] |290| 
;* --------------------------------------------------------------------------*
||$C$L18||:    
	.dwpsn	file "../mcp3202.c",line 292,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+36   ; [ALU_PRU] |292| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |292| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |292| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |292| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |292| 
        MOV       r0.w2, r0.w0          ; [ALU_PRU] |292| 
        XOR       r0.b3, r0.b3, 0x80    ; [ALU_PRU] |292| 
        LDI       r0.w0, 0x0100         ; [ALU_PRU] |292| 
        XOR       r0.b1, r0.b1, 0x80    ; [ALU_PRU] |292| 
        QBLT      ||$C$L20||, r0.w0, r0.w2 ; [ALU_PRU] |292| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 293,column 4,is_stmt,isa 0
        LDI       r14.w0, 0x0000        ; [ALU_PRU] |293| 
        LDI32     r1, ||ctrlData||+36   ; [ALU_PRU] |293| ctrlData
        MOV       r0, r14.w0            ; [ALU_PRU] |293| 
        SBBO      &r0.b0, r1, 0, 1      ; [ALU_PRU] |293| 
        MOV       r0, r14.w0            ; [ALU_PRU] |293| 
        QBBC      ||$C$L19||, r0, 0x0f  ; [ALU_PRU] |293| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |293| 
;* --------------------------------------------------------------------------*
||$C$L19||:    
        LSR       r0, r0, 0x08          ; [ALU_PRU] |293| 
        SBBO      &r0.b0, r1, 1, 1      ; [ALU_PRU] |293| 
;* --------------------------------------------------------------------------*
||$C$L20||:    
	.dwpsn	file "../mcp3202.c",line 295,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+38   ; [ALU_PRU] |295| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |295| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |295| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |295| 
        OR        r14, r0.b0, r1        ; [ALU_PRU] |295| 
        LDI32     r0, ||ctrlData||+36   ; [ALU_PRU] |295| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |295| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |295| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |295| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |295| 
        QBNE      ||$C$L23||, r14.w0, r0.w0 ; [ALU_PRU] |295| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 298,column 4,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+38   ; [ALU_PRU] |298| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |298| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |298| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |298| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |298| 
        ADD       r14.w0, r0.w0, 0x01   ; [ALU_PRU] |298| 
        LDI32     r1, ||ctrlData||+38   ; [ALU_PRU] |298| ctrlData
        MOV       r0, r14.w0            ; [ALU_PRU] |298| 
        SBBO      &r0.b0, r1, 0, 1      ; [ALU_PRU] |298| 
        MOV       r0, r14.w0            ; [ALU_PRU] |298| 
        QBBC      ||$C$L21||, r0, 0x0f  ; [ALU_PRU] |298| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |298| 
;* --------------------------------------------------------------------------*
||$C$L21||:    
        LSR       r0, r0, 0x08          ; [ALU_PRU] |298| 
        SBBO      &r0.b0, r1, 1, 1      ; [ALU_PRU] |298| 
	.dwpsn	file "../mcp3202.c",line 299,column 4,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+38   ; [ALU_PRU] |299| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |299| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |299| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |299| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |299| 
        MOV       r0.w2, r0.w0          ; [ALU_PRU] |299| 
        XOR       r0.b3, r0.b3, 0x80    ; [ALU_PRU] |299| 
        LDI       r0.w0, 0x0100         ; [ALU_PRU] |299| 
        XOR       r0.b1, r0.b1, 0x80    ; [ALU_PRU] |299| 
        QBLT      ||$C$L23||, r0.w0, r0.w2 ; [ALU_PRU] |299| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 300,column 5,is_stmt,isa 0
        LDI       r14.w0, 0x0000        ; [ALU_PRU] |300| 
        LDI32     r1, ||ctrlData||+38   ; [ALU_PRU] |300| ctrlData
        MOV       r0, r14.w0            ; [ALU_PRU] |300| 
        SBBO      &r0.b0, r1, 0, 1      ; [ALU_PRU] |300| 
        MOV       r0, r14.w0            ; [ALU_PRU] |300| 
        QBBC      ||$C$L22||, r0, 0x0f  ; [ALU_PRU] |300| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |300| 
;* --------------------------------------------------------------------------*
||$C$L22||:    
        LSR       r0, r0, 0x08          ; [ALU_PRU] |300| 
        SBBO      &r0.b0, r1, 1, 1      ; [ALU_PRU] |300| 
;* --------------------------------------------------------------------------*
||$C$L23||:    
	.dwpsn	file "../mcp3202.c",line 305,column 3,is_stmt,isa 0
        LDI32     r0, ||ctrlData||+32   ; [ALU_PRU] |305| ctrlData
        LBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |305| 
        LSL       r1, r1.b0, 0x08       ; [ALU_PRU] |305| 
        LBBO      &r0.b0, r0, 0, 1      ; [ALU_PRU] |305| 
        OR        r0, r0.b0, r1         ; [ALU_PRU] |305| 
        QBEQ      ||$C$L24||, r0.w0, 0x00 ; [ALU_PRU] |305| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 306,column 4,is_stmt,isa 0
        LDI       r14.w0, 0x0000        ; [ALU_PRU] |306| 
        LDI32     r0, ||ctrlData||+32   ; [ALU_PRU] |306| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |306| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |306| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |306| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |306| 
	.dwpsn	file "../mcp3202.c",line 308,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L24||:    
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$119	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$119, DW_AT_low_pc(0x00)
	.dwattr $C$DW$119, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$114, DW_AT_TI_end_file("../mcp3202.c")
	.dwattr $C$DW$114, DW_AT_TI_end_line(0x134)
	.dwattr $C$DW$114, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$114

	.sect	".text:init_data"
	.clink
	.global	||init_data||

$C$DW$120	.dwtag  DW_TAG_subprogram, DW_AT_name("init_data")
	.dwattr $C$DW$120, DW_AT_low_pc(||init_data||)
	.dwattr $C$DW$120, DW_AT_high_pc(0x00)
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("init_data")
	.dwattr $C$DW$120, DW_AT_external
	.dwattr $C$DW$120, DW_AT_TI_begin_file("../mcp3202.c")
	.dwattr $C$DW$120, DW_AT_TI_begin_line(0x13e)
	.dwattr $C$DW$120, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$120, DW_AT_decl_file("../mcp3202.c")
	.dwattr $C$DW$120, DW_AT_decl_line(0x13e)
	.dwattr $C$DW$120, DW_AT_decl_column(0x06)
	.dwattr $C$DW$120, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../mcp3202.c",line 319,column 1,is_stmt,address ||init_data||,isa 0

	.dwfde $C$DW$CIE, ||init_data||

;***************************************************************
;* FNAME: init_data                     FR SIZE:   4           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            4 Auto,  0 SOE     *
;***************************************************************

||init_data||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 4
$C$DW$121	.dwtag  DW_TAG_variable, DW_AT_name("i")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("i")
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$121, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
	.dwpsn	file "../mcp3202.c",line 324,column 2,is_stmt,isa 0
        ZERO      &r1, 4                ; [ALU_PRU] |324| 
        LDI32     r0, ||ctrlData||+20   ; [ALU_PRU] |324| ctrlData
        LSR       r14, r1, 0x08         ; [ALU_PRU] |324| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |324| 
        SBBO      &r14.b0, r0, 1, 1     ; [ALU_PRU] |324| 
        LSR       r14, r1, 0x10         ; [ALU_PRU] |324| 
        SBBO      &r14.b0, r0, 2, 1     ; [ALU_PRU] |324| 
        LSR       r1, r1, 0x18          ; [ALU_PRU] |324| 
        SBBO      &r1.b0, r0, 3, 1      ; [ALU_PRU] |324| 
	.dwpsn	file "../mcp3202.c",line 325,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x1388        ; [ALU_PRU] |325| 
        MOV       r1, r14.w0            ; [ALU_PRU] |325| 
        LDI32     r0, ||ctrlData||+16   ; [ALU_PRU] |325| ctrlData
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |325| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |325| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |325| 
	.dwpsn	file "../mcp3202.c",line 326,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0000        ; [ALU_PRU] |326| 
        LDI32     r0, ||ctrlData||+26   ; [ALU_PRU] |326| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |326| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |326| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |326| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |326| 
	.dwpsn	file "../mcp3202.c",line 327,column 2,is_stmt,isa 0
        MOV       r1, r14.w0            ; [ALU_PRU] |327| 
        LDI32     r0, ||ctrlData||+30   ; [ALU_PRU] |327| ctrlData
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |327| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |327| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |327| 
	.dwpsn	file "../mcp3202.c",line 328,column 2,is_stmt,isa 0
        MOV       r1, r14.w0            ; [ALU_PRU] |328| 
        LDI32     r0, ||ctrlData||+28   ; [ALU_PRU] |328| ctrlData
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |328| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |328| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |328| 
	.dwpsn	file "../mcp3202.c",line 329,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0001        ; [ALU_PRU] |329| 
        LDI32     r0, ||ctrlData||+24   ; [ALU_PRU] |329| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |329| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |329| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |329| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |329| 
	.dwpsn	file "../mcp3202.c",line 330,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0007        ; [ALU_PRU] |330| 
        LDI32     r0, ||ctrlData||+6    ; [ALU_PRU] |330| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |330| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |330| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |330| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |330| 
	.dwpsn	file "../mcp3202.c",line 331,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0006        ; [ALU_PRU] |331| 
        LDI32     r0, ||ctrlData||+8    ; [ALU_PRU] |331| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |331| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |331| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |331| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |331| 
	.dwpsn	file "../mcp3202.c",line 332,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0004        ; [ALU_PRU] |332| 
        LDI32     r0, ||ctrlData||+10   ; [ALU_PRU] |332| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |332| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |332| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |332| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |332| 
	.dwpsn	file "../mcp3202.c",line 333,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x000d        ; [ALU_PRU] |333| 
        LDI32     r0, ||ctrlData||+12   ; [ALU_PRU] |333| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |333| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |333| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |333| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |333| 
	.dwpsn	file "../mcp3202.c",line 334,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0004        ; [ALU_PRU] |334| 
        LDI32     r0, ||ctrlData||+18   ; [ALU_PRU] |334| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |334| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |334| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |334| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |334| 
	.dwpsn	file "../mcp3202.c",line 335,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0001        ; [ALU_PRU] |335| 
        LDI32     r0, ||ctrlData||+4    ; [ALU_PRU] |335| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |335| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |335| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |335| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |335| 
	.dwpsn	file "../mcp3202.c",line 336,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0000        ; [ALU_PRU] |336| 
        LDI32     r0, ||ctrlData||+14   ; [ALU_PRU] |336| ctrlData
        MOV       r1, r14.w0            ; [ALU_PRU] |336| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |336| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |336| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |336| 
	.dwpsn	file "../mcp3202.c",line 340,column 2,is_stmt,isa 0
        LDI32     r1, ||ctrlData||+36   ; [ALU_PRU] |340| ctrlData
        MOV       r0, r14.w0            ; [ALU_PRU] |340| 
        SBBO      &r0.b0, r1, 0, 1      ; [ALU_PRU] |340| 
        MOV       r0, r14.w0            ; [ALU_PRU] |340| 
        QBBC      ||$C$L25||, r0, 0x0f  ; [ALU_PRU] |340| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |340| 
;* --------------------------------------------------------------------------*
||$C$L25||:    
        LSR       r0, r0, 0x08          ; [ALU_PRU] |340| 
        SBBO      &r0.b0, r1, 1, 1      ; [ALU_PRU] |340| 
	.dwpsn	file "../mcp3202.c",line 341,column 2,is_stmt,isa 0
        LDI32     r1, ||ctrlData||+38   ; [ALU_PRU] |341| ctrlData
        MOV       r0, r14.w0            ; [ALU_PRU] |341| 
        SBBO      &r0.b0, r1, 0, 1      ; [ALU_PRU] |341| 
        MOV       r0, r14.w0            ; [ALU_PRU] |341| 
        QBBC      ||$C$L26||, r0, 0x0f  ; [ALU_PRU] |341| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |341| 
;* --------------------------------------------------------------------------*
||$C$L26||:    
        LSR       r0, r0, 0x08          ; [ALU_PRU] |341| 
        SBBO      &r0.b0, r1, 1, 1      ; [ALU_PRU] |341| 
	.dwpsn	file "../mcp3202.c",line 342,column 2,is_stmt,isa 0
        LDI32     r1, ||ctrlData||+34   ; [ALU_PRU] |342| ctrlData
        MOV       r0, r14.w0            ; [ALU_PRU] |342| 
        SBBO      &r0.b0, r1, 0, 1      ; [ALU_PRU] |342| 
        MOV       r0, r14.w0            ; [ALU_PRU] |342| 
        QBBC      ||$C$L27||, r0, 0x0f  ; [ALU_PRU] |342| 
;* --------------------------------------------------------------------------*
        LDI       r0.w2, 0xffff         ; [ALU_PRU] |342| 
;* --------------------------------------------------------------------------*
||$C$L27||:    
        LSR       r0, r0, 0x08          ; [ALU_PRU] |342| 
        SBBO      &r0.b0, r1, 1, 1      ; [ALU_PRU] |342| 
	.dwpsn	file "../mcp3202.c",line 343,column 2,is_stmt,isa 0
        MOV       r1, r14.w0            ; [ALU_PRU] |343| 
        LDI32     r0, ||ctrlData||+32   ; [ALU_PRU] |343| ctrlData
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |343| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |343| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |343| 
	.dwpsn	file "../mcp3202.c",line 344,column 2,is_stmt,isa 0
        MOV       r1, r14.w0            ; [ALU_PRU] |344| 
        LDI32     r0, ||ctrlData||+40   ; [ALU_PRU] |344| ctrlData
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |344| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |344| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |344| 
	.dwpsn	file "../mcp3202.c",line 345,column 2,is_stmt,isa 0
        MOV       r1, r14.w0            ; [ALU_PRU] |345| 
        LDI32     r0, ||ctrlData||+42   ; [ALU_PRU] |345| ctrlData
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |345| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |345| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |345| 
	.dwpsn	file "../mcp3202.c",line 346,column 2,is_stmt,isa 0
        MOV       r1, r14.w0            ; [ALU_PRU] |346| 
        LDI32     r0, ||ctrlData||+44   ; [ALU_PRU] |346| ctrlData
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |346| 
        LSR       r1, r14.w0, 0x08      ; [ALU_PRU] |346| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |346| 
	.dwpsn	file "../mcp3202.c",line 348,column 7,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |348| 
        SBBO      &r0, r2, 0, 4         ; [ALU_PRU] |348| i
	.dwpsn	file "../mcp3202.c",line 348,column 14,is_stmt,isa 0
        LDI       r0, 0x0100            ; [ALU_PRU] |348| 
        XOR       r0.b3, r0.b3, 0x80    ; [ALU_PRU] |348| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |348| i
        XOR       r1.b3, r1.b3, 0x80    ; [ALU_PRU] |348| 
        QBGE      ||$C$L29||, r0, r1    ; [ALU_PRU] |348| 
;* --------------------------------------------------------------------------*
        LDI       r17.w2, 0x0000        ; [ALU_PRU] |350| 
        LDI32     r16, ||ctrlData||+46  ; [ALU_PRU] |350| ctrlData
        LDI       r17.w0, 0x0000        ; [ALU_PRU] |351| 
        LDI32     r15, ||ctrlData||+48  ; [ALU_PRU] |351| ctrlData
        LDI       r14, 0x0100           ; [ALU_PRU] |348| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L28||
;*
;*   Loop source line                : 348
;*   Loop closing brace source line  : 352
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L28||:    
	.dwpsn	file "../mcp3202.c",line 350,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |350| i
        MOV       r1, r17.w2            ; [ALU_PRU] |350| 
        LSL       r0, r0, 0x02          ; [ALU_PRU] |350| 
        ADD       r0, r0, r16           ; [ALU_PRU] |350| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |350| 
        LSR       r1, r17.w2, 0x08      ; [ALU_PRU] |350| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |350| 
	.dwpsn	file "../mcp3202.c",line 351,column 3,is_stmt,isa 0
        MOV       r1, r17.w0            ; [ALU_PRU] |351| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |351| i
        LSL       r0, r0, 0x02          ; [ALU_PRU] |351| 
        ADD       r0, r0, r15           ; [ALU_PRU] |351| 
        SBBO      &r1.b0, r0, 0, 1      ; [ALU_PRU] |351| 
        LSR       r1, r17.w0, 0x08      ; [ALU_PRU] |351| 
        SBBO      &r1.b0, r0, 1, 1      ; [ALU_PRU] |351| 
	.dwpsn	file "../mcp3202.c",line 348,column 30,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |348| i
        ADD       r0, r0, 0x01          ; [ALU_PRU] |348| 
        SBBO      &r0, r2, 0, 4         ; [ALU_PRU] |348| i
	.dwpsn	file "../mcp3202.c",line 348,column 14,is_stmt,isa 0
        XOR       r0.b3, r0.b3, 0x80    ; [ALU_PRU] |348| 
        MOV       r1, r14               ; [ALU_PRU] |348| 
        XOR       r1.b3, r1.b3, 0x80    ; [ALU_PRU] |348| 
        QBLT      ||$C$L28||, r1, r0    ; [ALU_PRU] |348| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcp3202.c",line 353,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L29||:    
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$122	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$122, DW_AT_low_pc(0x00)
	.dwattr $C$DW$122, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$120, DW_AT_TI_end_file("../mcp3202.c")
	.dwattr $C$DW$120, DW_AT_TI_end_line(0x161)
	.dwattr $C$DW$120, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$120

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	||Is_RxDataReady||
	.global	||SPI_ChannelSet||
	.global	||SPI_ClkConfig||
	.global	||SPI_CSPolaritySet||
	.global	||SPI_CSSet||
	.global	||SPI_DataPinDirection||
	.global	||SPI_MasterModeEnable||
	.global	||SPI_MasterModeSet||
	.global	||SPI_ReceiveData||
	.global	||SPI_Reset||
	.global	||SPI_RxFIFODisable||
	.global	||SPI_StartBitDisable||
	.global	||SPI_StartBitEnable||
	.global	||SPI_StartBitPolaritySet||
	.global	||SPI_TransmitData||
	.global	||SPI_TxFIFODisable||
	.global	||SPI_WordCountSet||
	.global	||SPI_WordLengthSet||

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$19	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$19, DW_AT_byte_size(0x04)
$C$DW$123	.dwtag  DW_TAG_member
	.dwattr $C$DW$123, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$123, DW_AT_name("REV_MINOR")
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("REV_MINOR")
	.dwattr $C$DW$123, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x06)
	.dwattr $C$DW$123, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$123, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$123, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$123, DW_AT_decl_line(0x0a)
	.dwattr $C$DW$123, DW_AT_decl_column(0x0d)
$C$DW$124	.dwtag  DW_TAG_member
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$124, DW_AT_name("REV_CUSTOM")
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("REV_CUSTOM")
	.dwattr $C$DW$124, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x02)
	.dwattr $C$DW$124, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$124, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$124, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$124, DW_AT_decl_line(0x0b)
	.dwattr $C$DW$124, DW_AT_decl_column(0x0d)
$C$DW$125	.dwtag  DW_TAG_member
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$125, DW_AT_name("REV_MAJOR")
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("REV_MAJOR")
	.dwattr $C$DW$125, DW_AT_bit_offset(0x15), DW_AT_bit_size(0x03)
	.dwattr $C$DW$125, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$125, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$125, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$125, DW_AT_decl_line(0x0c)
	.dwattr $C$DW$125, DW_AT_decl_column(0x0d)
$C$DW$126	.dwtag  DW_TAG_member
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$126, DW_AT_name("REV_RTL")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("REV_RTL")
	.dwattr $C$DW$126, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x05)
	.dwattr $C$DW$126, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$126, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$126, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$126, DW_AT_decl_line(0x0d)
	.dwattr $C$DW$126, DW_AT_decl_column(0x0d)
$C$DW$127	.dwtag  DW_TAG_member
	.dwattr $C$DW$127, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$127, DW_AT_name("REV_MODULE")
	.dwattr $C$DW$127, DW_AT_TI_symbol_name("REV_MODULE")
	.dwattr $C$DW$127, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x0c)
	.dwattr $C$DW$127, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$127, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$127, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$127, DW_AT_decl_line(0x0e)
	.dwattr $C$DW$127, DW_AT_decl_column(0x0d)
$C$DW$128	.dwtag  DW_TAG_member
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$128, DW_AT_name("rsvd28")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$128, DW_AT_bit_offset(0x02), DW_AT_bit_size(0x02)
	.dwattr $C$DW$128, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$128, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$128, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$128, DW_AT_decl_line(0x0f)
	.dwattr $C$DW$128, DW_AT_decl_column(0x0d)
$C$DW$129	.dwtag  DW_TAG_member
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$129, DW_AT_name("REV_SCHEME")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("REV_SCHEME")
	.dwattr $C$DW$129, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x02)
	.dwattr $C$DW$129, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$129, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$129, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$129, DW_AT_decl_line(0x10)
	.dwattr $C$DW$129, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$19

	.dwattr $C$DW$T$19, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x09)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x12)
$C$DW$T$184	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$184, DW_AT_type(*$C$DW$T$19)

$C$DW$T$20	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x04)
$C$DW$130	.dwtag  DW_TAG_member
	.dwattr $C$DW$130, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$130, DW_AT_name("rsvd0")
	.dwattr $C$DW$130, DW_AT_TI_symbol_name("rsvd0")
	.dwattr $C$DW$130, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$130, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$130, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$130, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$130, DW_AT_decl_line(0x1a)
	.dwattr $C$DW$130, DW_AT_decl_column(0x0d)
$C$DW$131	.dwtag  DW_TAG_member
	.dwattr $C$DW$131, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$131, DW_AT_name("NEST_MODE")
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("NEST_MODE")
	.dwattr $C$DW$131, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x02)
	.dwattr $C$DW$131, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$131, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$131, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$131, DW_AT_decl_line(0x1b)
	.dwattr $C$DW$131, DW_AT_decl_column(0x0d)
$C$DW$132	.dwtag  DW_TAG_member
	.dwattr $C$DW$132, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$132, DW_AT_name("rsvd4")
	.dwattr $C$DW$132, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$132, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1c)
	.dwattr $C$DW$132, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$132, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$132, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$132, DW_AT_decl_line(0x1c)
	.dwattr $C$DW$132, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$20

	.dwattr $C$DW$T$20, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$20, DW_AT_decl_line(0x19)
	.dwattr $C$DW$T$20, DW_AT_decl_column(0x12)
$C$DW$T$186	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$186, DW_AT_type(*$C$DW$T$20)

$C$DW$T$21	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x04)
$C$DW$133	.dwtag  DW_TAG_member
	.dwattr $C$DW$133, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$133, DW_AT_name("EN_HINT_ANY")
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("EN_HINT_ANY")
	.dwattr $C$DW$133, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$133, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$133, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$133, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$133, DW_AT_decl_line(0x29)
	.dwattr $C$DW$133, DW_AT_decl_column(0x0d)
$C$DW$134	.dwtag  DW_TAG_member
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$134, DW_AT_name("rsvd1")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("rsvd1")
	.dwattr $C$DW$134, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1f)
	.dwattr $C$DW$134, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$134, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$134, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$134, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$134, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$21

	.dwattr $C$DW$T$21, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$21, DW_AT_decl_line(0x28)
	.dwattr $C$DW$T$21, DW_AT_decl_column(0x12)
$C$DW$T$188	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$188, DW_AT_type(*$C$DW$T$21)

$C$DW$T$22	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$22, DW_AT_byte_size(0x04)
$C$DW$135	.dwtag  DW_TAG_member
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$135, DW_AT_name("GLB_NEST_LEVEL")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("GLB_NEST_LEVEL")
	.dwattr $C$DW$135, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$135, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$135, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$135, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$135, DW_AT_decl_line(0x37)
	.dwattr $C$DW$135, DW_AT_decl_column(0x0d)
$C$DW$136	.dwtag  DW_TAG_member
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$136, DW_AT_name("rsvd9")
	.dwattr $C$DW$136, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$136, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$136, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$136, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$136, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$136, DW_AT_decl_line(0x38)
	.dwattr $C$DW$136, DW_AT_decl_column(0x0d)
$C$DW$137	.dwtag  DW_TAG_member
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$137, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$137, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$137, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$137, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$137, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$137, DW_AT_decl_line(0x39)
	.dwattr $C$DW$137, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$22

	.dwattr $C$DW$T$22, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$22, DW_AT_decl_line(0x36)
	.dwattr $C$DW$T$22, DW_AT_decl_column(0x12)
$C$DW$T$190	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$190, DW_AT_type(*$C$DW$T$22)

$C$DW$T$23	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$23, DW_AT_byte_size(0x04)
$C$DW$138	.dwtag  DW_TAG_member
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$138, DW_AT_name("STS_SET_IDX")
	.dwattr $C$DW$138, DW_AT_TI_symbol_name("STS_SET_IDX")
	.dwattr $C$DW$138, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$138, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$138, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$138, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$138, DW_AT_decl_line(0x43)
	.dwattr $C$DW$138, DW_AT_decl_column(0x0d)
$C$DW$139	.dwtag  DW_TAG_member
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$139, DW_AT_name("rsvd10")
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$139, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$139, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$139, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$139, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$139, DW_AT_decl_line(0x44)
	.dwattr $C$DW$139, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$23

	.dwattr $C$DW$T$23, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$23, DW_AT_decl_line(0x42)
	.dwattr $C$DW$T$23, DW_AT_decl_column(0x12)
$C$DW$T$192	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$192, DW_AT_type(*$C$DW$T$23)

$C$DW$T$24	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$24, DW_AT_byte_size(0x04)
$C$DW$140	.dwtag  DW_TAG_member
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$140, DW_AT_name("STS_CLR_IDX")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("STS_CLR_IDX")
	.dwattr $C$DW$140, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$140, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$140, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$140, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$140, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$140, DW_AT_decl_column(0x0d)
$C$DW$141	.dwtag  DW_TAG_member
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$141, DW_AT_name("rsvd10")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$141, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$141, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$141, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$141, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$141, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$141, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$24

	.dwattr $C$DW$T$24, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x12)
$C$DW$T$194	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$194, DW_AT_type(*$C$DW$T$24)

$C$DW$T$25	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x04)
$C$DW$142	.dwtag  DW_TAG_member
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$142, DW_AT_name("EN_SET_IDX")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("EN_SET_IDX")
	.dwattr $C$DW$142, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$142, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$142, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$142, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$142, DW_AT_decl_line(0x59)
	.dwattr $C$DW$142, DW_AT_decl_column(0x0d)
$C$DW$143	.dwtag  DW_TAG_member
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$143, DW_AT_name("rsvd10")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$143, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$143, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$143, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$143, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$143, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$143, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$25

	.dwattr $C$DW$T$25, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x58)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x12)
$C$DW$T$196	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$196, DW_AT_type(*$C$DW$T$25)

$C$DW$T$26	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$26, DW_AT_byte_size(0x04)
$C$DW$144	.dwtag  DW_TAG_member
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$144, DW_AT_name("EN_CLR_IDX")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("EN_CLR_IDX")
	.dwattr $C$DW$144, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$144, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$144, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$144, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$144, DW_AT_decl_line(0x64)
	.dwattr $C$DW$144, DW_AT_decl_column(0x0d)
$C$DW$145	.dwtag  DW_TAG_member
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$145, DW_AT_name("rsvd10")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$145, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$145, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$145, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$145, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$145, DW_AT_decl_line(0x65)
	.dwattr $C$DW$145, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$26

	.dwattr $C$DW$T$26, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$26, DW_AT_decl_line(0x63)
	.dwattr $C$DW$T$26, DW_AT_decl_column(0x12)
$C$DW$T$198	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$198, DW_AT_type(*$C$DW$T$26)

$C$DW$T$27	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x04)
$C$DW$146	.dwtag  DW_TAG_member
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$146, DW_AT_name("HINT_EN_SET_IDX")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("HINT_EN_SET_IDX")
	.dwattr $C$DW$146, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$146, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$146, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$146, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$146, DW_AT_decl_line(0x72)
	.dwattr $C$DW$146, DW_AT_decl_column(0x0d)
$C$DW$147	.dwtag  DW_TAG_member
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$147, DW_AT_name("rsvd10")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$147, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$147, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$147, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$147, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$147, DW_AT_decl_line(0x73)
	.dwattr $C$DW$147, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$27

	.dwattr $C$DW$T$27, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$27, DW_AT_decl_line(0x71)
	.dwattr $C$DW$T$27, DW_AT_decl_column(0x12)
$C$DW$T$200	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$200, DW_AT_type(*$C$DW$T$27)

$C$DW$T$28	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x04)
$C$DW$148	.dwtag  DW_TAG_member
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$148, DW_AT_name("HINT_EN_CLR_IDX")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("HINT_EN_CLR_IDX")
	.dwattr $C$DW$148, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$148, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$148, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$148, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$148, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$148, DW_AT_decl_column(0x0d)
$C$DW$149	.dwtag  DW_TAG_member
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$149, DW_AT_name("rsvd10")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$149, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$149, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$149, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$149, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$149, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$149, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$28

	.dwattr $C$DW$T$28, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$28, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$T$28, DW_AT_decl_column(0x12)
$C$DW$T$202	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$202, DW_AT_type(*$C$DW$T$28)

$C$DW$T$29	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$29, DW_AT_byte_size(0x04)
$C$DW$150	.dwtag  DW_TAG_member
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$150, DW_AT_name("GLB_PRI_INTR")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("GLB_PRI_INTR")
	.dwattr $C$DW$150, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$150, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$150, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$150, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$150, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$150, DW_AT_decl_column(0x0d)
$C$DW$151	.dwtag  DW_TAG_member
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$151, DW_AT_name("rsvd10")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$151, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$151, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$151, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$151, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$151, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$151, DW_AT_decl_column(0x0d)
$C$DW$152	.dwtag  DW_TAG_member
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$152, DW_AT_name("GLB_NONE")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("GLB_NONE")
	.dwattr $C$DW$152, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$152, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$152, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$152, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$152, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$152, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$29

	.dwattr $C$DW$T$29, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$29, DW_AT_decl_line(0x8a)
	.dwattr $C$DW$T$29, DW_AT_decl_column(0x12)
$C$DW$T$204	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$204, DW_AT_type(*$C$DW$T$29)

$C$DW$T$30	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x04)
$C$DW$153	.dwtag  DW_TAG_member
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$153, DW_AT_name("RAW_STS_31_0")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("RAW_STS_31_0")
	.dwattr $C$DW$153, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$153, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$153, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$153, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$153, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$153, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$30

	.dwattr $C$DW$T$30, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$30, DW_AT_decl_line(0x99)
	.dwattr $C$DW$T$30, DW_AT_decl_column(0x12)
$C$DW$T$206	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$206, DW_AT_type(*$C$DW$T$30)

$C$DW$T$31	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$31, DW_AT_byte_size(0x04)
$C$DW$154	.dwtag  DW_TAG_member
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$154, DW_AT_name("RAW_STS_63_32")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("RAW_STS_63_32")
	.dwattr $C$DW$154, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$154, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$154, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$154, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$154, DW_AT_decl_line(0xa4)
	.dwattr $C$DW$154, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$31

	.dwattr $C$DW$T$31, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$31, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$T$31, DW_AT_decl_column(0x12)
$C$DW$T$208	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$208, DW_AT_type(*$C$DW$T$31)

$C$DW$T$32	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$32, DW_AT_byte_size(0x04)
$C$DW$155	.dwtag  DW_TAG_member
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$155, DW_AT_name("ENA_STS_31_0")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("ENA_STS_31_0")
	.dwattr $C$DW$155, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$155, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$155, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$155, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$155, DW_AT_decl_line(0xb1)
	.dwattr $C$DW$155, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$32

	.dwattr $C$DW$T$32, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$32, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$T$32, DW_AT_decl_column(0x12)
$C$DW$T$210	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$210, DW_AT_type(*$C$DW$T$32)

$C$DW$T$33	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$33, DW_AT_byte_size(0x04)
$C$DW$156	.dwtag  DW_TAG_member
	.dwattr $C$DW$156, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$156, DW_AT_name("ENA_STS_63_32")
	.dwattr $C$DW$156, DW_AT_TI_symbol_name("ENA_STS_63_32")
	.dwattr $C$DW$156, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$156, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$156, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$156, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$156, DW_AT_decl_line(0xbb)
	.dwattr $C$DW$156, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$33

	.dwattr $C$DW$T$33, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$33, DW_AT_decl_line(0xba)
	.dwattr $C$DW$T$33, DW_AT_decl_column(0x12)
$C$DW$T$212	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$212, DW_AT_type(*$C$DW$T$33)

$C$DW$T$34	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$34, DW_AT_byte_size(0x04)
$C$DW$157	.dwtag  DW_TAG_member
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$157, DW_AT_name("EN_SET_31_0")
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("EN_SET_31_0")
	.dwattr $C$DW$157, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$157, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$157, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$157, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$157, DW_AT_decl_line(0xc8)
	.dwattr $C$DW$157, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$34

	.dwattr $C$DW$T$34, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$34, DW_AT_decl_line(0xc7)
	.dwattr $C$DW$T$34, DW_AT_decl_column(0x12)
$C$DW$T$214	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$214, DW_AT_type(*$C$DW$T$34)

$C$DW$T$35	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$35, DW_AT_byte_size(0x04)
$C$DW$158	.dwtag  DW_TAG_member
	.dwattr $C$DW$158, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$158, DW_AT_name("EN_SET_63_32")
	.dwattr $C$DW$158, DW_AT_TI_symbol_name("EN_SET_63_32")
	.dwattr $C$DW$158, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$158, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$158, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$158, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$158, DW_AT_decl_line(0xd2)
	.dwattr $C$DW$158, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$35

	.dwattr $C$DW$T$35, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$35, DW_AT_decl_line(0xd1)
	.dwattr $C$DW$T$35, DW_AT_decl_column(0x12)
$C$DW$T$216	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$216, DW_AT_type(*$C$DW$T$35)

$C$DW$T$36	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$36, DW_AT_byte_size(0x04)
$C$DW$159	.dwtag  DW_TAG_member
	.dwattr $C$DW$159, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$159, DW_AT_name("EN_CLR_31_0")
	.dwattr $C$DW$159, DW_AT_TI_symbol_name("EN_CLR_31_0")
	.dwattr $C$DW$159, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$159, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$159, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$159, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$159, DW_AT_decl_line(0xdf)
	.dwattr $C$DW$159, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$36

	.dwattr $C$DW$T$36, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$36, DW_AT_decl_line(0xde)
	.dwattr $C$DW$T$36, DW_AT_decl_column(0x12)
$C$DW$T$218	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$218, DW_AT_type(*$C$DW$T$36)

$C$DW$T$37	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$37, DW_AT_byte_size(0x04)
$C$DW$160	.dwtag  DW_TAG_member
	.dwattr $C$DW$160, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$160, DW_AT_name("EN_CLR_63_32")
	.dwattr $C$DW$160, DW_AT_TI_symbol_name("EN_CLR_63_32")
	.dwattr $C$DW$160, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$160, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$160, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$160, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$160, DW_AT_decl_line(0xe9)
	.dwattr $C$DW$160, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$37

	.dwattr $C$DW$T$37, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$37, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$T$37, DW_AT_decl_column(0x12)
$C$DW$T$220	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$220, DW_AT_type(*$C$DW$T$37)

$C$DW$T$38	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x04)
$C$DW$161	.dwtag  DW_TAG_member
	.dwattr $C$DW$161, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$161, DW_AT_name("CH_MAP_0")
	.dwattr $C$DW$161, DW_AT_TI_symbol_name("CH_MAP_0")
	.dwattr $C$DW$161, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$161, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$161, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$161, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$161, DW_AT_decl_line(0xf6)
	.dwattr $C$DW$161, DW_AT_decl_column(0x0d)
$C$DW$162	.dwtag  DW_TAG_member
	.dwattr $C$DW$162, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$162, DW_AT_name("rsvd4")
	.dwattr $C$DW$162, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$162, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$162, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$162, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$162, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$162, DW_AT_decl_line(0xf7)
	.dwattr $C$DW$162, DW_AT_decl_column(0x0d)
$C$DW$163	.dwtag  DW_TAG_member
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$163, DW_AT_name("CH_MAP_1")
	.dwattr $C$DW$163, DW_AT_TI_symbol_name("CH_MAP_1")
	.dwattr $C$DW$163, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$163, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$163, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$163, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$163, DW_AT_decl_line(0xf8)
	.dwattr $C$DW$163, DW_AT_decl_column(0x0d)
$C$DW$164	.dwtag  DW_TAG_member
	.dwattr $C$DW$164, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$164, DW_AT_name("rsvd12")
	.dwattr $C$DW$164, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$164, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$164, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$164, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$164, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$164, DW_AT_decl_line(0xf9)
	.dwattr $C$DW$164, DW_AT_decl_column(0x0d)
$C$DW$165	.dwtag  DW_TAG_member
	.dwattr $C$DW$165, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$165, DW_AT_name("CH_MAP_2")
	.dwattr $C$DW$165, DW_AT_TI_symbol_name("CH_MAP_2")
	.dwattr $C$DW$165, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$165, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$165, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$165, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$165, DW_AT_decl_line(0xfa)
	.dwattr $C$DW$165, DW_AT_decl_column(0x0d)
$C$DW$166	.dwtag  DW_TAG_member
	.dwattr $C$DW$166, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$166, DW_AT_name("rsvd20")
	.dwattr $C$DW$166, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$166, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$166, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$166, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$166, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$166, DW_AT_decl_line(0xfb)
	.dwattr $C$DW$166, DW_AT_decl_column(0x0d)
$C$DW$167	.dwtag  DW_TAG_member
	.dwattr $C$DW$167, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$167, DW_AT_name("CH_MAP_3")
	.dwattr $C$DW$167, DW_AT_TI_symbol_name("CH_MAP_3")
	.dwattr $C$DW$167, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$167, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$167, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$167, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$167, DW_AT_decl_line(0xfc)
	.dwattr $C$DW$167, DW_AT_decl_column(0x0d)
$C$DW$168	.dwtag  DW_TAG_member
	.dwattr $C$DW$168, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$168, DW_AT_name("rsvd28")
	.dwattr $C$DW$168, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$168, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$168, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$168, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$168, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$168, DW_AT_decl_line(0xfd)
	.dwattr $C$DW$168, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$38

	.dwattr $C$DW$T$38, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$38, DW_AT_decl_line(0xf5)
	.dwattr $C$DW$T$38, DW_AT_decl_column(0x12)
$C$DW$T$222	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$222, DW_AT_type(*$C$DW$T$38)

$C$DW$T$39	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$39, DW_AT_byte_size(0x04)
$C$DW$169	.dwtag  DW_TAG_member
	.dwattr $C$DW$169, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$169, DW_AT_name("CH_MAP_4")
	.dwattr $C$DW$169, DW_AT_TI_symbol_name("CH_MAP_4")
	.dwattr $C$DW$169, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$169, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$169, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$169, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$169, DW_AT_decl_line(0x107)
	.dwattr $C$DW$169, DW_AT_decl_column(0x0d)
$C$DW$170	.dwtag  DW_TAG_member
	.dwattr $C$DW$170, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$170, DW_AT_name("rsvd4")
	.dwattr $C$DW$170, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$170, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$170, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$170, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$170, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$170, DW_AT_decl_line(0x108)
	.dwattr $C$DW$170, DW_AT_decl_column(0x0d)
$C$DW$171	.dwtag  DW_TAG_member
	.dwattr $C$DW$171, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$171, DW_AT_name("CH_MAP_5")
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("CH_MAP_5")
	.dwattr $C$DW$171, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$171, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$171, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$171, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$171, DW_AT_decl_line(0x109)
	.dwattr $C$DW$171, DW_AT_decl_column(0x0d)
$C$DW$172	.dwtag  DW_TAG_member
	.dwattr $C$DW$172, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$172, DW_AT_name("rsvd12")
	.dwattr $C$DW$172, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$172, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$172, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$172, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$172, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$172, DW_AT_decl_line(0x10a)
	.dwattr $C$DW$172, DW_AT_decl_column(0x0d)
$C$DW$173	.dwtag  DW_TAG_member
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$173, DW_AT_name("CH_MAP_6")
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("CH_MAP_6")
	.dwattr $C$DW$173, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$173, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$173, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$173, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$173, DW_AT_decl_line(0x10b)
	.dwattr $C$DW$173, DW_AT_decl_column(0x0d)
$C$DW$174	.dwtag  DW_TAG_member
	.dwattr $C$DW$174, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$174, DW_AT_name("rsvd20")
	.dwattr $C$DW$174, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$174, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$174, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$174, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$174, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$174, DW_AT_decl_line(0x10c)
	.dwattr $C$DW$174, DW_AT_decl_column(0x0d)
$C$DW$175	.dwtag  DW_TAG_member
	.dwattr $C$DW$175, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$175, DW_AT_name("CH_MAP_7")
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("CH_MAP_7")
	.dwattr $C$DW$175, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$175, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$175, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$175, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$175, DW_AT_decl_line(0x10d)
	.dwattr $C$DW$175, DW_AT_decl_column(0x0d)
$C$DW$176	.dwtag  DW_TAG_member
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$176, DW_AT_name("rsvd28")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$176, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$176, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$176, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$176, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$176, DW_AT_decl_line(0x10e)
	.dwattr $C$DW$176, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$39

	.dwattr $C$DW$T$39, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$39, DW_AT_decl_line(0x106)
	.dwattr $C$DW$T$39, DW_AT_decl_column(0x12)
$C$DW$T$224	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$224, DW_AT_type(*$C$DW$T$39)

$C$DW$T$40	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$40, DW_AT_byte_size(0x04)
$C$DW$177	.dwtag  DW_TAG_member
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$177, DW_AT_name("CH_MAP_8")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("CH_MAP_8")
	.dwattr $C$DW$177, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$177, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$177, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$177, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$177, DW_AT_decl_line(0x118)
	.dwattr $C$DW$177, DW_AT_decl_column(0x0d)
$C$DW$178	.dwtag  DW_TAG_member
	.dwattr $C$DW$178, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$178, DW_AT_name("rsvd4")
	.dwattr $C$DW$178, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$178, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$178, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$178, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$178, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$178, DW_AT_decl_line(0x119)
	.dwattr $C$DW$178, DW_AT_decl_column(0x0d)
$C$DW$179	.dwtag  DW_TAG_member
	.dwattr $C$DW$179, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$179, DW_AT_name("CH_MAP_9")
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("CH_MAP_9")
	.dwattr $C$DW$179, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$179, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$179, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$179, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$179, DW_AT_decl_line(0x11a)
	.dwattr $C$DW$179, DW_AT_decl_column(0x0d)
$C$DW$180	.dwtag  DW_TAG_member
	.dwattr $C$DW$180, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$180, DW_AT_name("rsvd12")
	.dwattr $C$DW$180, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$180, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$180, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$180, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$180, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$180, DW_AT_decl_line(0x11b)
	.dwattr $C$DW$180, DW_AT_decl_column(0x0d)
$C$DW$181	.dwtag  DW_TAG_member
	.dwattr $C$DW$181, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$181, DW_AT_name("CH_MAP_10")
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("CH_MAP_10")
	.dwattr $C$DW$181, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$181, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$181, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$181, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$181, DW_AT_decl_line(0x11c)
	.dwattr $C$DW$181, DW_AT_decl_column(0x0d)
$C$DW$182	.dwtag  DW_TAG_member
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$182, DW_AT_name("rsvd20")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$182, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$182, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$182, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$182, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$182, DW_AT_decl_line(0x11d)
	.dwattr $C$DW$182, DW_AT_decl_column(0x0d)
$C$DW$183	.dwtag  DW_TAG_member
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$183, DW_AT_name("CH_MAP_11")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("CH_MAP_11")
	.dwattr $C$DW$183, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$183, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$183, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$183, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$183, DW_AT_decl_line(0x11e)
	.dwattr $C$DW$183, DW_AT_decl_column(0x0d)
$C$DW$184	.dwtag  DW_TAG_member
	.dwattr $C$DW$184, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$184, DW_AT_name("rsvd28")
	.dwattr $C$DW$184, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$184, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$184, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$184, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$184, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$184, DW_AT_decl_line(0x11f)
	.dwattr $C$DW$184, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$40

	.dwattr $C$DW$T$40, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$40, DW_AT_decl_line(0x117)
	.dwattr $C$DW$T$40, DW_AT_decl_column(0x12)
$C$DW$T$226	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$226, DW_AT_type(*$C$DW$T$40)

$C$DW$T$41	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$41, DW_AT_byte_size(0x04)
$C$DW$185	.dwtag  DW_TAG_member
	.dwattr $C$DW$185, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$185, DW_AT_name("CH_MAP_12")
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("CH_MAP_12")
	.dwattr $C$DW$185, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$185, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$185, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$185, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$185, DW_AT_decl_line(0x129)
	.dwattr $C$DW$185, DW_AT_decl_column(0x0d)
$C$DW$186	.dwtag  DW_TAG_member
	.dwattr $C$DW$186, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$186, DW_AT_name("rsvd4")
	.dwattr $C$DW$186, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$186, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$186, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$186, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$186, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$186, DW_AT_decl_line(0x12a)
	.dwattr $C$DW$186, DW_AT_decl_column(0x0d)
$C$DW$187	.dwtag  DW_TAG_member
	.dwattr $C$DW$187, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$187, DW_AT_name("CH_MAP_13")
	.dwattr $C$DW$187, DW_AT_TI_symbol_name("CH_MAP_13")
	.dwattr $C$DW$187, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$187, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$187, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$187, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$187, DW_AT_decl_line(0x12b)
	.dwattr $C$DW$187, DW_AT_decl_column(0x0d)
$C$DW$188	.dwtag  DW_TAG_member
	.dwattr $C$DW$188, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$188, DW_AT_name("rsvd12")
	.dwattr $C$DW$188, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$188, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$188, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$188, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$188, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$188, DW_AT_decl_line(0x12c)
	.dwattr $C$DW$188, DW_AT_decl_column(0x0d)
$C$DW$189	.dwtag  DW_TAG_member
	.dwattr $C$DW$189, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$189, DW_AT_name("CH_MAP_14")
	.dwattr $C$DW$189, DW_AT_TI_symbol_name("CH_MAP_14")
	.dwattr $C$DW$189, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$189, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$189, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$189, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$189, DW_AT_decl_line(0x12d)
	.dwattr $C$DW$189, DW_AT_decl_column(0x0d)
$C$DW$190	.dwtag  DW_TAG_member
	.dwattr $C$DW$190, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$190, DW_AT_name("rsvd20")
	.dwattr $C$DW$190, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$190, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$190, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$190, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$190, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$190, DW_AT_decl_line(0x12e)
	.dwattr $C$DW$190, DW_AT_decl_column(0x0d)
$C$DW$191	.dwtag  DW_TAG_member
	.dwattr $C$DW$191, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$191, DW_AT_name("CH_MAP_15")
	.dwattr $C$DW$191, DW_AT_TI_symbol_name("CH_MAP_15")
	.dwattr $C$DW$191, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$191, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$191, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$191, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$191, DW_AT_decl_line(0x12f)
	.dwattr $C$DW$191, DW_AT_decl_column(0x0d)
$C$DW$192	.dwtag  DW_TAG_member
	.dwattr $C$DW$192, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$192, DW_AT_name("rsvd28")
	.dwattr $C$DW$192, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$192, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$192, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$192, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$192, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$192, DW_AT_decl_line(0x130)
	.dwattr $C$DW$192, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$41

	.dwattr $C$DW$T$41, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$41, DW_AT_decl_line(0x128)
	.dwattr $C$DW$T$41, DW_AT_decl_column(0x12)
$C$DW$T$228	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$228, DW_AT_type(*$C$DW$T$41)

$C$DW$T$42	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$42, DW_AT_byte_size(0x04)
$C$DW$193	.dwtag  DW_TAG_member
	.dwattr $C$DW$193, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$193, DW_AT_name("CH_MAP_16")
	.dwattr $C$DW$193, DW_AT_TI_symbol_name("CH_MAP_16")
	.dwattr $C$DW$193, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$193, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$193, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$193, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$193, DW_AT_decl_line(0x13a)
	.dwattr $C$DW$193, DW_AT_decl_column(0x0d)
$C$DW$194	.dwtag  DW_TAG_member
	.dwattr $C$DW$194, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$194, DW_AT_name("rsvd4")
	.dwattr $C$DW$194, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$194, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$194, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$194, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$194, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$194, DW_AT_decl_line(0x13b)
	.dwattr $C$DW$194, DW_AT_decl_column(0x0d)
$C$DW$195	.dwtag  DW_TAG_member
	.dwattr $C$DW$195, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$195, DW_AT_name("CH_MAP_17")
	.dwattr $C$DW$195, DW_AT_TI_symbol_name("CH_MAP_17")
	.dwattr $C$DW$195, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$195, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$195, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$195, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$195, DW_AT_decl_line(0x13c)
	.dwattr $C$DW$195, DW_AT_decl_column(0x0d)
$C$DW$196	.dwtag  DW_TAG_member
	.dwattr $C$DW$196, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$196, DW_AT_name("rsvd12")
	.dwattr $C$DW$196, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$196, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$196, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$196, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$196, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$196, DW_AT_decl_line(0x13d)
	.dwattr $C$DW$196, DW_AT_decl_column(0x0d)
$C$DW$197	.dwtag  DW_TAG_member
	.dwattr $C$DW$197, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$197, DW_AT_name("CH_MAP_18")
	.dwattr $C$DW$197, DW_AT_TI_symbol_name("CH_MAP_18")
	.dwattr $C$DW$197, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$197, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$197, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$197, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$197, DW_AT_decl_line(0x13e)
	.dwattr $C$DW$197, DW_AT_decl_column(0x0d)
$C$DW$198	.dwtag  DW_TAG_member
	.dwattr $C$DW$198, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$198, DW_AT_name("rsvd20")
	.dwattr $C$DW$198, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$198, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$198, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$198, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$198, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$198, DW_AT_decl_line(0x13f)
	.dwattr $C$DW$198, DW_AT_decl_column(0x0d)
$C$DW$199	.dwtag  DW_TAG_member
	.dwattr $C$DW$199, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$199, DW_AT_name("CH_MAP_19")
	.dwattr $C$DW$199, DW_AT_TI_symbol_name("CH_MAP_19")
	.dwattr $C$DW$199, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$199, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$199, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$199, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$199, DW_AT_decl_line(0x140)
	.dwattr $C$DW$199, DW_AT_decl_column(0x0d)
$C$DW$200	.dwtag  DW_TAG_member
	.dwattr $C$DW$200, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$200, DW_AT_name("rsvd28")
	.dwattr $C$DW$200, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$200, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$200, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$200, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$200, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$200, DW_AT_decl_line(0x141)
	.dwattr $C$DW$200, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$42

	.dwattr $C$DW$T$42, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$42, DW_AT_decl_line(0x139)
	.dwattr $C$DW$T$42, DW_AT_decl_column(0x12)
$C$DW$T$230	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$230, DW_AT_type(*$C$DW$T$42)

$C$DW$T$43	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$43, DW_AT_byte_size(0x04)
$C$DW$201	.dwtag  DW_TAG_member
	.dwattr $C$DW$201, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$201, DW_AT_name("CH_MAP_20")
	.dwattr $C$DW$201, DW_AT_TI_symbol_name("CH_MAP_20")
	.dwattr $C$DW$201, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$201, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$201, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$201, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$201, DW_AT_decl_line(0x14b)
	.dwattr $C$DW$201, DW_AT_decl_column(0x0d)
$C$DW$202	.dwtag  DW_TAG_member
	.dwattr $C$DW$202, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$202, DW_AT_name("rsvd4")
	.dwattr $C$DW$202, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$202, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$202, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$202, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$202, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$202, DW_AT_decl_line(0x14c)
	.dwattr $C$DW$202, DW_AT_decl_column(0x0d)
$C$DW$203	.dwtag  DW_TAG_member
	.dwattr $C$DW$203, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$203, DW_AT_name("CH_MAP_21")
	.dwattr $C$DW$203, DW_AT_TI_symbol_name("CH_MAP_21")
	.dwattr $C$DW$203, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$203, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$203, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$203, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$203, DW_AT_decl_line(0x14d)
	.dwattr $C$DW$203, DW_AT_decl_column(0x0d)
$C$DW$204	.dwtag  DW_TAG_member
	.dwattr $C$DW$204, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$204, DW_AT_name("rsvd12")
	.dwattr $C$DW$204, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$204, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$204, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$204, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$204, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$204, DW_AT_decl_line(0x14e)
	.dwattr $C$DW$204, DW_AT_decl_column(0x0d)
$C$DW$205	.dwtag  DW_TAG_member
	.dwattr $C$DW$205, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$205, DW_AT_name("CH_MAP_22")
	.dwattr $C$DW$205, DW_AT_TI_symbol_name("CH_MAP_22")
	.dwattr $C$DW$205, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$205, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$205, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$205, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$205, DW_AT_decl_line(0x14f)
	.dwattr $C$DW$205, DW_AT_decl_column(0x0d)
$C$DW$206	.dwtag  DW_TAG_member
	.dwattr $C$DW$206, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$206, DW_AT_name("rsvd20")
	.dwattr $C$DW$206, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$206, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$206, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$206, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$206, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$206, DW_AT_decl_line(0x150)
	.dwattr $C$DW$206, DW_AT_decl_column(0x0d)
$C$DW$207	.dwtag  DW_TAG_member
	.dwattr $C$DW$207, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$207, DW_AT_name("CH_MAP_23")
	.dwattr $C$DW$207, DW_AT_TI_symbol_name("CH_MAP_23")
	.dwattr $C$DW$207, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$207, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$207, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$207, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$207, DW_AT_decl_line(0x151)
	.dwattr $C$DW$207, DW_AT_decl_column(0x0d)
$C$DW$208	.dwtag  DW_TAG_member
	.dwattr $C$DW$208, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$208, DW_AT_name("rsvd28")
	.dwattr $C$DW$208, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$208, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$208, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$208, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$208, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$208, DW_AT_decl_line(0x152)
	.dwattr $C$DW$208, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$43

	.dwattr $C$DW$T$43, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$43, DW_AT_decl_line(0x14a)
	.dwattr $C$DW$T$43, DW_AT_decl_column(0x12)
$C$DW$T$232	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$232, DW_AT_type(*$C$DW$T$43)

$C$DW$T$44	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$44, DW_AT_byte_size(0x04)
$C$DW$209	.dwtag  DW_TAG_member
	.dwattr $C$DW$209, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$209, DW_AT_name("CH_MAP_24")
	.dwattr $C$DW$209, DW_AT_TI_symbol_name("CH_MAP_24")
	.dwattr $C$DW$209, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$209, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$209, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$209, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$209, DW_AT_decl_line(0x15c)
	.dwattr $C$DW$209, DW_AT_decl_column(0x0d)
$C$DW$210	.dwtag  DW_TAG_member
	.dwattr $C$DW$210, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$210, DW_AT_name("rsvd4")
	.dwattr $C$DW$210, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$210, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$210, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$210, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$210, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$210, DW_AT_decl_line(0x15d)
	.dwattr $C$DW$210, DW_AT_decl_column(0x0d)
$C$DW$211	.dwtag  DW_TAG_member
	.dwattr $C$DW$211, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$211, DW_AT_name("CH_MAP_25")
	.dwattr $C$DW$211, DW_AT_TI_symbol_name("CH_MAP_25")
	.dwattr $C$DW$211, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$211, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$211, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$211, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$211, DW_AT_decl_line(0x15e)
	.dwattr $C$DW$211, DW_AT_decl_column(0x0d)
$C$DW$212	.dwtag  DW_TAG_member
	.dwattr $C$DW$212, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$212, DW_AT_name("rsvd12")
	.dwattr $C$DW$212, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$212, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$212, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$212, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$212, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$212, DW_AT_decl_line(0x15f)
	.dwattr $C$DW$212, DW_AT_decl_column(0x0d)
$C$DW$213	.dwtag  DW_TAG_member
	.dwattr $C$DW$213, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$213, DW_AT_name("CH_MAP_26")
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("CH_MAP_26")
	.dwattr $C$DW$213, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$213, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$213, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$213, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$213, DW_AT_decl_line(0x160)
	.dwattr $C$DW$213, DW_AT_decl_column(0x0d)
$C$DW$214	.dwtag  DW_TAG_member
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$214, DW_AT_name("rsvd20")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$214, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$214, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$214, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$214, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$214, DW_AT_decl_line(0x161)
	.dwattr $C$DW$214, DW_AT_decl_column(0x0d)
$C$DW$215	.dwtag  DW_TAG_member
	.dwattr $C$DW$215, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$215, DW_AT_name("CH_MAP_27")
	.dwattr $C$DW$215, DW_AT_TI_symbol_name("CH_MAP_27")
	.dwattr $C$DW$215, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$215, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$215, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$215, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$215, DW_AT_decl_line(0x162)
	.dwattr $C$DW$215, DW_AT_decl_column(0x0d)
$C$DW$216	.dwtag  DW_TAG_member
	.dwattr $C$DW$216, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$216, DW_AT_name("rsvd28")
	.dwattr $C$DW$216, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$216, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$216, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$216, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$216, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$216, DW_AT_decl_line(0x163)
	.dwattr $C$DW$216, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$44

	.dwattr $C$DW$T$44, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$44, DW_AT_decl_line(0x15b)
	.dwattr $C$DW$T$44, DW_AT_decl_column(0x12)
$C$DW$T$234	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$234, DW_AT_type(*$C$DW$T$44)

$C$DW$T$45	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$45, DW_AT_byte_size(0x04)
$C$DW$217	.dwtag  DW_TAG_member
	.dwattr $C$DW$217, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$217, DW_AT_name("CH_MAP_28")
	.dwattr $C$DW$217, DW_AT_TI_symbol_name("CH_MAP_28")
	.dwattr $C$DW$217, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$217, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$217, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$217, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$217, DW_AT_decl_line(0x16d)
	.dwattr $C$DW$217, DW_AT_decl_column(0x0d)
$C$DW$218	.dwtag  DW_TAG_member
	.dwattr $C$DW$218, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$218, DW_AT_name("rsvd4")
	.dwattr $C$DW$218, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$218, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$218, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$218, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$218, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$218, DW_AT_decl_line(0x16e)
	.dwattr $C$DW$218, DW_AT_decl_column(0x0d)
$C$DW$219	.dwtag  DW_TAG_member
	.dwattr $C$DW$219, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$219, DW_AT_name("CH_MAP_29")
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("CH_MAP_29")
	.dwattr $C$DW$219, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$219, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$219, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$219, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$219, DW_AT_decl_line(0x16f)
	.dwattr $C$DW$219, DW_AT_decl_column(0x0d)
$C$DW$220	.dwtag  DW_TAG_member
	.dwattr $C$DW$220, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$220, DW_AT_name("rsvd12")
	.dwattr $C$DW$220, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$220, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$220, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$220, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$220, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$220, DW_AT_decl_line(0x170)
	.dwattr $C$DW$220, DW_AT_decl_column(0x0d)
$C$DW$221	.dwtag  DW_TAG_member
	.dwattr $C$DW$221, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$221, DW_AT_name("CH_MAP_30")
	.dwattr $C$DW$221, DW_AT_TI_symbol_name("CH_MAP_30")
	.dwattr $C$DW$221, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$221, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$221, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$221, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$221, DW_AT_decl_line(0x171)
	.dwattr $C$DW$221, DW_AT_decl_column(0x0d)
$C$DW$222	.dwtag  DW_TAG_member
	.dwattr $C$DW$222, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$222, DW_AT_name("rsvd20")
	.dwattr $C$DW$222, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$222, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$222, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$222, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$222, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$222, DW_AT_decl_line(0x172)
	.dwattr $C$DW$222, DW_AT_decl_column(0x0d)
$C$DW$223	.dwtag  DW_TAG_member
	.dwattr $C$DW$223, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$223, DW_AT_name("CH_MAP_31")
	.dwattr $C$DW$223, DW_AT_TI_symbol_name("CH_MAP_31")
	.dwattr $C$DW$223, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$223, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$223, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$223, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$223, DW_AT_decl_line(0x173)
	.dwattr $C$DW$223, DW_AT_decl_column(0x0d)
$C$DW$224	.dwtag  DW_TAG_member
	.dwattr $C$DW$224, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$224, DW_AT_name("rsvd28")
	.dwattr $C$DW$224, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$224, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$224, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$224, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$224, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$224, DW_AT_decl_line(0x174)
	.dwattr $C$DW$224, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$45

	.dwattr $C$DW$T$45, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$45, DW_AT_decl_line(0x16c)
	.dwattr $C$DW$T$45, DW_AT_decl_column(0x12)
$C$DW$T$236	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$236, DW_AT_type(*$C$DW$T$45)

$C$DW$T$46	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$46, DW_AT_byte_size(0x04)
$C$DW$225	.dwtag  DW_TAG_member
	.dwattr $C$DW$225, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$225, DW_AT_name("CH_MAP_32")
	.dwattr $C$DW$225, DW_AT_TI_symbol_name("CH_MAP_32")
	.dwattr $C$DW$225, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$225, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$225, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$225, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$225, DW_AT_decl_line(0x17e)
	.dwattr $C$DW$225, DW_AT_decl_column(0x0d)
$C$DW$226	.dwtag  DW_TAG_member
	.dwattr $C$DW$226, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$226, DW_AT_name("rsvd4")
	.dwattr $C$DW$226, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$226, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$226, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$226, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$226, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$226, DW_AT_decl_line(0x17f)
	.dwattr $C$DW$226, DW_AT_decl_column(0x0d)
$C$DW$227	.dwtag  DW_TAG_member
	.dwattr $C$DW$227, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$227, DW_AT_name("CH_MAP_33")
	.dwattr $C$DW$227, DW_AT_TI_symbol_name("CH_MAP_33")
	.dwattr $C$DW$227, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$227, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$227, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$227, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$227, DW_AT_decl_line(0x180)
	.dwattr $C$DW$227, DW_AT_decl_column(0x0d)
$C$DW$228	.dwtag  DW_TAG_member
	.dwattr $C$DW$228, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$228, DW_AT_name("rsvd12")
	.dwattr $C$DW$228, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$228, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$228, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$228, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$228, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$228, DW_AT_decl_line(0x181)
	.dwattr $C$DW$228, DW_AT_decl_column(0x0d)
$C$DW$229	.dwtag  DW_TAG_member
	.dwattr $C$DW$229, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$229, DW_AT_name("CH_MAP_34")
	.dwattr $C$DW$229, DW_AT_TI_symbol_name("CH_MAP_34")
	.dwattr $C$DW$229, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$229, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$229, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$229, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$229, DW_AT_decl_line(0x182)
	.dwattr $C$DW$229, DW_AT_decl_column(0x0d)
$C$DW$230	.dwtag  DW_TAG_member
	.dwattr $C$DW$230, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$230, DW_AT_name("rsvd20")
	.dwattr $C$DW$230, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$230, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$230, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$230, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$230, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$230, DW_AT_decl_line(0x183)
	.dwattr $C$DW$230, DW_AT_decl_column(0x0d)
$C$DW$231	.dwtag  DW_TAG_member
	.dwattr $C$DW$231, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$231, DW_AT_name("CH_MAP_35")
	.dwattr $C$DW$231, DW_AT_TI_symbol_name("CH_MAP_35")
	.dwattr $C$DW$231, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$231, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$231, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$231, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$231, DW_AT_decl_line(0x184)
	.dwattr $C$DW$231, DW_AT_decl_column(0x0d)
$C$DW$232	.dwtag  DW_TAG_member
	.dwattr $C$DW$232, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$232, DW_AT_name("rsvd28")
	.dwattr $C$DW$232, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$232, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$232, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$232, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$232, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$232, DW_AT_decl_line(0x185)
	.dwattr $C$DW$232, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$46

	.dwattr $C$DW$T$46, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$46, DW_AT_decl_line(0x17d)
	.dwattr $C$DW$T$46, DW_AT_decl_column(0x12)
$C$DW$T$238	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$238, DW_AT_type(*$C$DW$T$46)

$C$DW$T$47	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$47, DW_AT_byte_size(0x04)
$C$DW$233	.dwtag  DW_TAG_member
	.dwattr $C$DW$233, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$233, DW_AT_name("CH_MAP_36")
	.dwattr $C$DW$233, DW_AT_TI_symbol_name("CH_MAP_36")
	.dwattr $C$DW$233, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$233, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$233, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$233, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$233, DW_AT_decl_line(0x18f)
	.dwattr $C$DW$233, DW_AT_decl_column(0x0d)
$C$DW$234	.dwtag  DW_TAG_member
	.dwattr $C$DW$234, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$234, DW_AT_name("rsvd4")
	.dwattr $C$DW$234, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$234, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$234, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$234, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$234, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$234, DW_AT_decl_line(0x190)
	.dwattr $C$DW$234, DW_AT_decl_column(0x0d)
$C$DW$235	.dwtag  DW_TAG_member
	.dwattr $C$DW$235, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$235, DW_AT_name("CH_MAP_37")
	.dwattr $C$DW$235, DW_AT_TI_symbol_name("CH_MAP_37")
	.dwattr $C$DW$235, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$235, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$235, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$235, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$235, DW_AT_decl_line(0x191)
	.dwattr $C$DW$235, DW_AT_decl_column(0x0d)
$C$DW$236	.dwtag  DW_TAG_member
	.dwattr $C$DW$236, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$236, DW_AT_name("rsvd12")
	.dwattr $C$DW$236, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$236, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$236, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$236, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$236, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$236, DW_AT_decl_line(0x192)
	.dwattr $C$DW$236, DW_AT_decl_column(0x0d)
$C$DW$237	.dwtag  DW_TAG_member
	.dwattr $C$DW$237, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$237, DW_AT_name("CH_MAP_38")
	.dwattr $C$DW$237, DW_AT_TI_symbol_name("CH_MAP_38")
	.dwattr $C$DW$237, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$237, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$237, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$237, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$237, DW_AT_decl_line(0x193)
	.dwattr $C$DW$237, DW_AT_decl_column(0x0d)
$C$DW$238	.dwtag  DW_TAG_member
	.dwattr $C$DW$238, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$238, DW_AT_name("rsvd20")
	.dwattr $C$DW$238, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$238, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$238, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$238, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$238, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$238, DW_AT_decl_line(0x194)
	.dwattr $C$DW$238, DW_AT_decl_column(0x0d)
$C$DW$239	.dwtag  DW_TAG_member
	.dwattr $C$DW$239, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$239, DW_AT_name("CH_MAP_39")
	.dwattr $C$DW$239, DW_AT_TI_symbol_name("CH_MAP_39")
	.dwattr $C$DW$239, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$239, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$239, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$239, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$239, DW_AT_decl_line(0x195)
	.dwattr $C$DW$239, DW_AT_decl_column(0x0d)
$C$DW$240	.dwtag  DW_TAG_member
	.dwattr $C$DW$240, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$240, DW_AT_name("rsvd28")
	.dwattr $C$DW$240, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$240, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$240, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$240, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$240, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$240, DW_AT_decl_line(0x196)
	.dwattr $C$DW$240, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$47

	.dwattr $C$DW$T$47, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$47, DW_AT_decl_line(0x18e)
	.dwattr $C$DW$T$47, DW_AT_decl_column(0x12)
$C$DW$T$240	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$240, DW_AT_type(*$C$DW$T$47)

$C$DW$T$48	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$48, DW_AT_byte_size(0x04)
$C$DW$241	.dwtag  DW_TAG_member
	.dwattr $C$DW$241, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$241, DW_AT_name("CH_MAP_40")
	.dwattr $C$DW$241, DW_AT_TI_symbol_name("CH_MAP_40")
	.dwattr $C$DW$241, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$241, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$241, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$241, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$241, DW_AT_decl_line(0x1a0)
	.dwattr $C$DW$241, DW_AT_decl_column(0x0d)
$C$DW$242	.dwtag  DW_TAG_member
	.dwattr $C$DW$242, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$242, DW_AT_name("rsvd4")
	.dwattr $C$DW$242, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$242, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$242, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$242, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$242, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$242, DW_AT_decl_line(0x1a1)
	.dwattr $C$DW$242, DW_AT_decl_column(0x0d)
$C$DW$243	.dwtag  DW_TAG_member
	.dwattr $C$DW$243, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$243, DW_AT_name("CH_MAP_41")
	.dwattr $C$DW$243, DW_AT_TI_symbol_name("CH_MAP_41")
	.dwattr $C$DW$243, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$243, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$243, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$243, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$243, DW_AT_decl_line(0x1a2)
	.dwattr $C$DW$243, DW_AT_decl_column(0x0d)
$C$DW$244	.dwtag  DW_TAG_member
	.dwattr $C$DW$244, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$244, DW_AT_name("rsvd12")
	.dwattr $C$DW$244, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$244, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$244, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$244, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$244, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$244, DW_AT_decl_line(0x1a3)
	.dwattr $C$DW$244, DW_AT_decl_column(0x0d)
$C$DW$245	.dwtag  DW_TAG_member
	.dwattr $C$DW$245, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$245, DW_AT_name("CH_MAP_42")
	.dwattr $C$DW$245, DW_AT_TI_symbol_name("CH_MAP_42")
	.dwattr $C$DW$245, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$245, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$245, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$245, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$245, DW_AT_decl_line(0x1a4)
	.dwattr $C$DW$245, DW_AT_decl_column(0x0d)
$C$DW$246	.dwtag  DW_TAG_member
	.dwattr $C$DW$246, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$246, DW_AT_name("rsvd20")
	.dwattr $C$DW$246, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$246, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$246, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$246, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$246, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$246, DW_AT_decl_line(0x1a5)
	.dwattr $C$DW$246, DW_AT_decl_column(0x0d)
$C$DW$247	.dwtag  DW_TAG_member
	.dwattr $C$DW$247, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$247, DW_AT_name("CH_MAP_43")
	.dwattr $C$DW$247, DW_AT_TI_symbol_name("CH_MAP_43")
	.dwattr $C$DW$247, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$247, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$247, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$247, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$247, DW_AT_decl_line(0x1a6)
	.dwattr $C$DW$247, DW_AT_decl_column(0x0d)
$C$DW$248	.dwtag  DW_TAG_member
	.dwattr $C$DW$248, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$248, DW_AT_name("rsvd28")
	.dwattr $C$DW$248, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$248, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$248, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$248, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$248, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$248, DW_AT_decl_line(0x1a7)
	.dwattr $C$DW$248, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$48

	.dwattr $C$DW$T$48, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$48, DW_AT_decl_line(0x19f)
	.dwattr $C$DW$T$48, DW_AT_decl_column(0x12)
$C$DW$T$242	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$242, DW_AT_type(*$C$DW$T$48)

$C$DW$T$49	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$49, DW_AT_byte_size(0x04)
$C$DW$249	.dwtag  DW_TAG_member
	.dwattr $C$DW$249, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$249, DW_AT_name("CH_MAP_44")
	.dwattr $C$DW$249, DW_AT_TI_symbol_name("CH_MAP_44")
	.dwattr $C$DW$249, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$249, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$249, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$249, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$249, DW_AT_decl_line(0x1b1)
	.dwattr $C$DW$249, DW_AT_decl_column(0x0d)
$C$DW$250	.dwtag  DW_TAG_member
	.dwattr $C$DW$250, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$250, DW_AT_name("rsvd4")
	.dwattr $C$DW$250, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$250, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$250, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$250, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$250, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$250, DW_AT_decl_line(0x1b2)
	.dwattr $C$DW$250, DW_AT_decl_column(0x0d)
$C$DW$251	.dwtag  DW_TAG_member
	.dwattr $C$DW$251, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$251, DW_AT_name("CH_MAP_45")
	.dwattr $C$DW$251, DW_AT_TI_symbol_name("CH_MAP_45")
	.dwattr $C$DW$251, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$251, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$251, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$251, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$251, DW_AT_decl_line(0x1b3)
	.dwattr $C$DW$251, DW_AT_decl_column(0x0d)
$C$DW$252	.dwtag  DW_TAG_member
	.dwattr $C$DW$252, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$252, DW_AT_name("rsvd12")
	.dwattr $C$DW$252, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$252, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$252, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$252, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$252, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$252, DW_AT_decl_line(0x1b4)
	.dwattr $C$DW$252, DW_AT_decl_column(0x0d)
$C$DW$253	.dwtag  DW_TAG_member
	.dwattr $C$DW$253, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$253, DW_AT_name("CH_MAP_46")
	.dwattr $C$DW$253, DW_AT_TI_symbol_name("CH_MAP_46")
	.dwattr $C$DW$253, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$253, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$253, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$253, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$253, DW_AT_decl_line(0x1b5)
	.dwattr $C$DW$253, DW_AT_decl_column(0x0d)
$C$DW$254	.dwtag  DW_TAG_member
	.dwattr $C$DW$254, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$254, DW_AT_name("rsvd20")
	.dwattr $C$DW$254, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$254, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$254, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$254, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$254, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$254, DW_AT_decl_line(0x1b6)
	.dwattr $C$DW$254, DW_AT_decl_column(0x0d)
$C$DW$255	.dwtag  DW_TAG_member
	.dwattr $C$DW$255, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$255, DW_AT_name("CH_MAP_47")
	.dwattr $C$DW$255, DW_AT_TI_symbol_name("CH_MAP_47")
	.dwattr $C$DW$255, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$255, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$255, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$255, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$255, DW_AT_decl_line(0x1b7)
	.dwattr $C$DW$255, DW_AT_decl_column(0x0d)
$C$DW$256	.dwtag  DW_TAG_member
	.dwattr $C$DW$256, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$256, DW_AT_name("rsvd28")
	.dwattr $C$DW$256, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$256, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$256, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$256, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$256, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$256, DW_AT_decl_line(0x1b8)
	.dwattr $C$DW$256, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$49

	.dwattr $C$DW$T$49, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$49, DW_AT_decl_line(0x1b0)
	.dwattr $C$DW$T$49, DW_AT_decl_column(0x12)
$C$DW$T$244	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$244, DW_AT_type(*$C$DW$T$49)

$C$DW$T$50	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$50, DW_AT_byte_size(0x04)
$C$DW$257	.dwtag  DW_TAG_member
	.dwattr $C$DW$257, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$257, DW_AT_name("CH_MAP_48")
	.dwattr $C$DW$257, DW_AT_TI_symbol_name("CH_MAP_48")
	.dwattr $C$DW$257, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$257, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$257, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$257, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$257, DW_AT_decl_line(0x1c2)
	.dwattr $C$DW$257, DW_AT_decl_column(0x0d)
$C$DW$258	.dwtag  DW_TAG_member
	.dwattr $C$DW$258, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$258, DW_AT_name("rsvd4")
	.dwattr $C$DW$258, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$258, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$258, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$258, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$258, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$258, DW_AT_decl_line(0x1c3)
	.dwattr $C$DW$258, DW_AT_decl_column(0x0d)
$C$DW$259	.dwtag  DW_TAG_member
	.dwattr $C$DW$259, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$259, DW_AT_name("CH_MAP_49")
	.dwattr $C$DW$259, DW_AT_TI_symbol_name("CH_MAP_49")
	.dwattr $C$DW$259, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$259, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$259, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$259, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$259, DW_AT_decl_line(0x1c4)
	.dwattr $C$DW$259, DW_AT_decl_column(0x0d)
$C$DW$260	.dwtag  DW_TAG_member
	.dwattr $C$DW$260, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$260, DW_AT_name("rsvd12")
	.dwattr $C$DW$260, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$260, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$260, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$260, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$260, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$260, DW_AT_decl_line(0x1c5)
	.dwattr $C$DW$260, DW_AT_decl_column(0x0d)
$C$DW$261	.dwtag  DW_TAG_member
	.dwattr $C$DW$261, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$261, DW_AT_name("CH_MAP_50")
	.dwattr $C$DW$261, DW_AT_TI_symbol_name("CH_MAP_50")
	.dwattr $C$DW$261, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$261, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$261, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$261, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$261, DW_AT_decl_line(0x1c6)
	.dwattr $C$DW$261, DW_AT_decl_column(0x0d)
$C$DW$262	.dwtag  DW_TAG_member
	.dwattr $C$DW$262, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$262, DW_AT_name("rsvd20")
	.dwattr $C$DW$262, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$262, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$262, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$262, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$262, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$262, DW_AT_decl_line(0x1c7)
	.dwattr $C$DW$262, DW_AT_decl_column(0x0d)
$C$DW$263	.dwtag  DW_TAG_member
	.dwattr $C$DW$263, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$263, DW_AT_name("CH_MAP_51")
	.dwattr $C$DW$263, DW_AT_TI_symbol_name("CH_MAP_51")
	.dwattr $C$DW$263, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$263, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$263, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$263, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$263, DW_AT_decl_line(0x1c8)
	.dwattr $C$DW$263, DW_AT_decl_column(0x0d)
$C$DW$264	.dwtag  DW_TAG_member
	.dwattr $C$DW$264, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$264, DW_AT_name("rsvd28")
	.dwattr $C$DW$264, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$264, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$264, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$264, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$264, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$264, DW_AT_decl_line(0x1c9)
	.dwattr $C$DW$264, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$50

	.dwattr $C$DW$T$50, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$50, DW_AT_decl_line(0x1c1)
	.dwattr $C$DW$T$50, DW_AT_decl_column(0x12)
$C$DW$T$246	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$246, DW_AT_type(*$C$DW$T$50)

$C$DW$T$51	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$51, DW_AT_byte_size(0x04)
$C$DW$265	.dwtag  DW_TAG_member
	.dwattr $C$DW$265, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$265, DW_AT_name("CH_MAP_52")
	.dwattr $C$DW$265, DW_AT_TI_symbol_name("CH_MAP_52")
	.dwattr $C$DW$265, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$265, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$265, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$265, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$265, DW_AT_decl_line(0x1d3)
	.dwattr $C$DW$265, DW_AT_decl_column(0x0d)
$C$DW$266	.dwtag  DW_TAG_member
	.dwattr $C$DW$266, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$266, DW_AT_name("rsvd4")
	.dwattr $C$DW$266, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$266, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$266, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$266, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$266, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$266, DW_AT_decl_line(0x1d4)
	.dwattr $C$DW$266, DW_AT_decl_column(0x0d)
$C$DW$267	.dwtag  DW_TAG_member
	.dwattr $C$DW$267, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$267, DW_AT_name("CH_MAP_53")
	.dwattr $C$DW$267, DW_AT_TI_symbol_name("CH_MAP_53")
	.dwattr $C$DW$267, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$267, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$267, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$267, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$267, DW_AT_decl_line(0x1d5)
	.dwattr $C$DW$267, DW_AT_decl_column(0x0d)
$C$DW$268	.dwtag  DW_TAG_member
	.dwattr $C$DW$268, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$268, DW_AT_name("rsvd12")
	.dwattr $C$DW$268, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$268, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$268, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$268, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$268, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$268, DW_AT_decl_line(0x1d6)
	.dwattr $C$DW$268, DW_AT_decl_column(0x0d)
$C$DW$269	.dwtag  DW_TAG_member
	.dwattr $C$DW$269, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$269, DW_AT_name("CH_MAP_54")
	.dwattr $C$DW$269, DW_AT_TI_symbol_name("CH_MAP_54")
	.dwattr $C$DW$269, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$269, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$269, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$269, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$269, DW_AT_decl_line(0x1d7)
	.dwattr $C$DW$269, DW_AT_decl_column(0x0d)
$C$DW$270	.dwtag  DW_TAG_member
	.dwattr $C$DW$270, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$270, DW_AT_name("rsvd20")
	.dwattr $C$DW$270, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$270, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$270, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$270, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$270, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$270, DW_AT_decl_line(0x1d8)
	.dwattr $C$DW$270, DW_AT_decl_column(0x0d)
$C$DW$271	.dwtag  DW_TAG_member
	.dwattr $C$DW$271, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$271, DW_AT_name("CH_MAP_55")
	.dwattr $C$DW$271, DW_AT_TI_symbol_name("CH_MAP_55")
	.dwattr $C$DW$271, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$271, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$271, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$271, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$271, DW_AT_decl_line(0x1d9)
	.dwattr $C$DW$271, DW_AT_decl_column(0x0d)
$C$DW$272	.dwtag  DW_TAG_member
	.dwattr $C$DW$272, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$272, DW_AT_name("rsvd28")
	.dwattr $C$DW$272, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$272, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$272, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$272, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$272, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$272, DW_AT_decl_line(0x1da)
	.dwattr $C$DW$272, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$51

	.dwattr $C$DW$T$51, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$51, DW_AT_decl_line(0x1d2)
	.dwattr $C$DW$T$51, DW_AT_decl_column(0x12)
$C$DW$T$248	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$248, DW_AT_type(*$C$DW$T$51)

$C$DW$T$52	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$52, DW_AT_byte_size(0x04)
$C$DW$273	.dwtag  DW_TAG_member
	.dwattr $C$DW$273, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$273, DW_AT_name("CH_MAP_56")
	.dwattr $C$DW$273, DW_AT_TI_symbol_name("CH_MAP_56")
	.dwattr $C$DW$273, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$273, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$273, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$273, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$273, DW_AT_decl_line(0x1e4)
	.dwattr $C$DW$273, DW_AT_decl_column(0x0d)
$C$DW$274	.dwtag  DW_TAG_member
	.dwattr $C$DW$274, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$274, DW_AT_name("rsvd4")
	.dwattr $C$DW$274, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$274, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$274, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$274, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$274, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$274, DW_AT_decl_line(0x1e5)
	.dwattr $C$DW$274, DW_AT_decl_column(0x0d)
$C$DW$275	.dwtag  DW_TAG_member
	.dwattr $C$DW$275, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$275, DW_AT_name("CH_MAP_57")
	.dwattr $C$DW$275, DW_AT_TI_symbol_name("CH_MAP_57")
	.dwattr $C$DW$275, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$275, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$275, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$275, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$275, DW_AT_decl_line(0x1e6)
	.dwattr $C$DW$275, DW_AT_decl_column(0x0d)
$C$DW$276	.dwtag  DW_TAG_member
	.dwattr $C$DW$276, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$276, DW_AT_name("rsvd12")
	.dwattr $C$DW$276, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$276, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$276, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$276, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$276, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$276, DW_AT_decl_line(0x1e7)
	.dwattr $C$DW$276, DW_AT_decl_column(0x0d)
$C$DW$277	.dwtag  DW_TAG_member
	.dwattr $C$DW$277, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$277, DW_AT_name("CH_MAP_58")
	.dwattr $C$DW$277, DW_AT_TI_symbol_name("CH_MAP_58")
	.dwattr $C$DW$277, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$277, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$277, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$277, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$277, DW_AT_decl_line(0x1e8)
	.dwattr $C$DW$277, DW_AT_decl_column(0x0d)
$C$DW$278	.dwtag  DW_TAG_member
	.dwattr $C$DW$278, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$278, DW_AT_name("rsvd20")
	.dwattr $C$DW$278, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$278, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$278, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$278, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$278, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$278, DW_AT_decl_line(0x1e9)
	.dwattr $C$DW$278, DW_AT_decl_column(0x0d)
$C$DW$279	.dwtag  DW_TAG_member
	.dwattr $C$DW$279, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$279, DW_AT_name("CH_MAP_59")
	.dwattr $C$DW$279, DW_AT_TI_symbol_name("CH_MAP_59")
	.dwattr $C$DW$279, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$279, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$279, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$279, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$279, DW_AT_decl_line(0x1ea)
	.dwattr $C$DW$279, DW_AT_decl_column(0x0d)
$C$DW$280	.dwtag  DW_TAG_member
	.dwattr $C$DW$280, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$280, DW_AT_name("rsvd28")
	.dwattr $C$DW$280, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$280, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$280, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$280, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$280, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$280, DW_AT_decl_line(0x1eb)
	.dwattr $C$DW$280, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$52

	.dwattr $C$DW$T$52, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$52, DW_AT_decl_line(0x1e3)
	.dwattr $C$DW$T$52, DW_AT_decl_column(0x12)
$C$DW$T$250	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$250, DW_AT_type(*$C$DW$T$52)

$C$DW$T$53	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$53, DW_AT_byte_size(0x04)
$C$DW$281	.dwtag  DW_TAG_member
	.dwattr $C$DW$281, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$281, DW_AT_name("CH_MAP_60")
	.dwattr $C$DW$281, DW_AT_TI_symbol_name("CH_MAP_60")
	.dwattr $C$DW$281, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$281, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$281, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$281, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$281, DW_AT_decl_line(0x1f5)
	.dwattr $C$DW$281, DW_AT_decl_column(0x0d)
$C$DW$282	.dwtag  DW_TAG_member
	.dwattr $C$DW$282, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$282, DW_AT_name("rsvd4")
	.dwattr $C$DW$282, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$282, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$282, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$282, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$282, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$282, DW_AT_decl_line(0x1f6)
	.dwattr $C$DW$282, DW_AT_decl_column(0x0d)
$C$DW$283	.dwtag  DW_TAG_member
	.dwattr $C$DW$283, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$283, DW_AT_name("CH_MAP_61")
	.dwattr $C$DW$283, DW_AT_TI_symbol_name("CH_MAP_61")
	.dwattr $C$DW$283, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$283, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$283, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$283, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$283, DW_AT_decl_line(0x1f7)
	.dwattr $C$DW$283, DW_AT_decl_column(0x0d)
$C$DW$284	.dwtag  DW_TAG_member
	.dwattr $C$DW$284, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$284, DW_AT_name("rsvd12")
	.dwattr $C$DW$284, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$284, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$284, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$284, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$284, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$284, DW_AT_decl_line(0x1f8)
	.dwattr $C$DW$284, DW_AT_decl_column(0x0d)
$C$DW$285	.dwtag  DW_TAG_member
	.dwattr $C$DW$285, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$285, DW_AT_name("CH_MAP_62")
	.dwattr $C$DW$285, DW_AT_TI_symbol_name("CH_MAP_62")
	.dwattr $C$DW$285, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$285, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$285, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$285, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$285, DW_AT_decl_line(0x1f9)
	.dwattr $C$DW$285, DW_AT_decl_column(0x0d)
$C$DW$286	.dwtag  DW_TAG_member
	.dwattr $C$DW$286, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$286, DW_AT_name("rsvd20")
	.dwattr $C$DW$286, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$286, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$286, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$286, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$286, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$286, DW_AT_decl_line(0x1fa)
	.dwattr $C$DW$286, DW_AT_decl_column(0x0d)
$C$DW$287	.dwtag  DW_TAG_member
	.dwattr $C$DW$287, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$287, DW_AT_name("CH_MAP_63")
	.dwattr $C$DW$287, DW_AT_TI_symbol_name("CH_MAP_63")
	.dwattr $C$DW$287, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$287, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$287, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$287, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$287, DW_AT_decl_line(0x1fb)
	.dwattr $C$DW$287, DW_AT_decl_column(0x0d)
$C$DW$288	.dwtag  DW_TAG_member
	.dwattr $C$DW$288, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$288, DW_AT_name("rsvd28")
	.dwattr $C$DW$288, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$288, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$288, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$288, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$288, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$288, DW_AT_decl_line(0x1fc)
	.dwattr $C$DW$288, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$53

	.dwattr $C$DW$T$53, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$53, DW_AT_decl_line(0x1f4)
	.dwattr $C$DW$T$53, DW_AT_decl_column(0x12)
$C$DW$T$252	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$252, DW_AT_type(*$C$DW$T$53)

$C$DW$T$54	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$54, DW_AT_byte_size(0x04)
$C$DW$289	.dwtag  DW_TAG_member
	.dwattr $C$DW$289, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$289, DW_AT_name("HINT_MAP_0")
	.dwattr $C$DW$289, DW_AT_TI_symbol_name("HINT_MAP_0")
	.dwattr $C$DW$289, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$289, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$289, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$289, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$289, DW_AT_decl_line(0x209)
	.dwattr $C$DW$289, DW_AT_decl_column(0x0d)
$C$DW$290	.dwtag  DW_TAG_member
	.dwattr $C$DW$290, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$290, DW_AT_name("rsvd4")
	.dwattr $C$DW$290, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$290, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$290, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$290, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$290, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$290, DW_AT_decl_line(0x20a)
	.dwattr $C$DW$290, DW_AT_decl_column(0x0d)
$C$DW$291	.dwtag  DW_TAG_member
	.dwattr $C$DW$291, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$291, DW_AT_name("HINT_MAP_1")
	.dwattr $C$DW$291, DW_AT_TI_symbol_name("HINT_MAP_1")
	.dwattr $C$DW$291, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$291, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$291, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$291, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$291, DW_AT_decl_line(0x20b)
	.dwattr $C$DW$291, DW_AT_decl_column(0x0d)
$C$DW$292	.dwtag  DW_TAG_member
	.dwattr $C$DW$292, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$292, DW_AT_name("rsvd12")
	.dwattr $C$DW$292, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$292, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$292, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$292, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$292, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$292, DW_AT_decl_line(0x20c)
	.dwattr $C$DW$292, DW_AT_decl_column(0x0d)
$C$DW$293	.dwtag  DW_TAG_member
	.dwattr $C$DW$293, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$293, DW_AT_name("HINT_MAP_2")
	.dwattr $C$DW$293, DW_AT_TI_symbol_name("HINT_MAP_2")
	.dwattr $C$DW$293, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$293, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$293, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$293, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$293, DW_AT_decl_line(0x20d)
	.dwattr $C$DW$293, DW_AT_decl_column(0x0d)
$C$DW$294	.dwtag  DW_TAG_member
	.dwattr $C$DW$294, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$294, DW_AT_name("rsvd20")
	.dwattr $C$DW$294, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$294, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$294, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$294, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$294, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$294, DW_AT_decl_line(0x20e)
	.dwattr $C$DW$294, DW_AT_decl_column(0x0d)
$C$DW$295	.dwtag  DW_TAG_member
	.dwattr $C$DW$295, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$295, DW_AT_name("HINT_MAP_3")
	.dwattr $C$DW$295, DW_AT_TI_symbol_name("HINT_MAP_3")
	.dwattr $C$DW$295, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$295, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$295, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$295, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$295, DW_AT_decl_line(0x20f)
	.dwattr $C$DW$295, DW_AT_decl_column(0x0d)
$C$DW$296	.dwtag  DW_TAG_member
	.dwattr $C$DW$296, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$296, DW_AT_name("rsvd28")
	.dwattr $C$DW$296, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$296, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$296, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$296, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$296, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$296, DW_AT_decl_line(0x210)
	.dwattr $C$DW$296, DW_AT_decl_column(0x0c)
	.dwendtag $C$DW$T$54

	.dwattr $C$DW$T$54, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$54, DW_AT_decl_line(0x208)
	.dwattr $C$DW$T$54, DW_AT_decl_column(0x12)
$C$DW$T$254	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$254, DW_AT_type(*$C$DW$T$54)

$C$DW$T$55	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$55, DW_AT_byte_size(0x04)
$C$DW$297	.dwtag  DW_TAG_member
	.dwattr $C$DW$297, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$297, DW_AT_name("HINT_MAP_4")
	.dwattr $C$DW$297, DW_AT_TI_symbol_name("HINT_MAP_4")
	.dwattr $C$DW$297, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$297, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$297, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$297, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$297, DW_AT_decl_line(0x21a)
	.dwattr $C$DW$297, DW_AT_decl_column(0x0d)
$C$DW$298	.dwtag  DW_TAG_member
	.dwattr $C$DW$298, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$298, DW_AT_name("rsvd4")
	.dwattr $C$DW$298, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$298, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$298, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$298, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$298, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$298, DW_AT_decl_line(0x21b)
	.dwattr $C$DW$298, DW_AT_decl_column(0x0d)
$C$DW$299	.dwtag  DW_TAG_member
	.dwattr $C$DW$299, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$299, DW_AT_name("HINT_MAP_5")
	.dwattr $C$DW$299, DW_AT_TI_symbol_name("HINT_MAP_5")
	.dwattr $C$DW$299, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$299, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$299, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$299, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$299, DW_AT_decl_line(0x21c)
	.dwattr $C$DW$299, DW_AT_decl_column(0x0d)
$C$DW$300	.dwtag  DW_TAG_member
	.dwattr $C$DW$300, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$300, DW_AT_name("rsvd12")
	.dwattr $C$DW$300, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$300, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$300, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$300, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$300, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$300, DW_AT_decl_line(0x21d)
	.dwattr $C$DW$300, DW_AT_decl_column(0x0d)
$C$DW$301	.dwtag  DW_TAG_member
	.dwattr $C$DW$301, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$301, DW_AT_name("HINT_MAP_6")
	.dwattr $C$DW$301, DW_AT_TI_symbol_name("HINT_MAP_6")
	.dwattr $C$DW$301, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$301, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$301, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$301, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$301, DW_AT_decl_line(0x21e)
	.dwattr $C$DW$301, DW_AT_decl_column(0x0d)
$C$DW$302	.dwtag  DW_TAG_member
	.dwattr $C$DW$302, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$302, DW_AT_name("rsvd20")
	.dwattr $C$DW$302, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$302, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$302, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$302, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$302, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$302, DW_AT_decl_line(0x21f)
	.dwattr $C$DW$302, DW_AT_decl_column(0x0d)
$C$DW$303	.dwtag  DW_TAG_member
	.dwattr $C$DW$303, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$303, DW_AT_name("HINT_MAP_7")
	.dwattr $C$DW$303, DW_AT_TI_symbol_name("HINT_MAP_7")
	.dwattr $C$DW$303, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$303, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$303, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$303, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$303, DW_AT_decl_line(0x220)
	.dwattr $C$DW$303, DW_AT_decl_column(0x0d)
$C$DW$304	.dwtag  DW_TAG_member
	.dwattr $C$DW$304, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$304, DW_AT_name("rsvd28")
	.dwattr $C$DW$304, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$304, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$304, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$304, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$304, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$304, DW_AT_decl_line(0x221)
	.dwattr $C$DW$304, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$55

	.dwattr $C$DW$T$55, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$55, DW_AT_decl_line(0x219)
	.dwattr $C$DW$T$55, DW_AT_decl_column(0x12)
$C$DW$T$256	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$256, DW_AT_type(*$C$DW$T$55)

$C$DW$T$56	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$56, DW_AT_byte_size(0x04)
$C$DW$305	.dwtag  DW_TAG_member
	.dwattr $C$DW$305, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$305, DW_AT_name("HINT_MAP_8")
	.dwattr $C$DW$305, DW_AT_TI_symbol_name("HINT_MAP_8")
	.dwattr $C$DW$305, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$305, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$305, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$305, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$305, DW_AT_decl_line(0x22b)
	.dwattr $C$DW$305, DW_AT_decl_column(0x0d)
$C$DW$306	.dwtag  DW_TAG_member
	.dwattr $C$DW$306, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$306, DW_AT_name("rsvd4")
	.dwattr $C$DW$306, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$306, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$306, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$306, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$306, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$306, DW_AT_decl_line(0x22c)
	.dwattr $C$DW$306, DW_AT_decl_column(0x0d)
$C$DW$307	.dwtag  DW_TAG_member
	.dwattr $C$DW$307, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$307, DW_AT_name("HINT_MAP_9")
	.dwattr $C$DW$307, DW_AT_TI_symbol_name("HINT_MAP_9")
	.dwattr $C$DW$307, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$307, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$307, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$307, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$307, DW_AT_decl_line(0x22d)
	.dwattr $C$DW$307, DW_AT_decl_column(0x0d)
$C$DW$308	.dwtag  DW_TAG_member
	.dwattr $C$DW$308, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$308, DW_AT_name("rsvd12")
	.dwattr $C$DW$308, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$308, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x14)
	.dwattr $C$DW$308, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$308, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$308, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$308, DW_AT_decl_line(0x22e)
	.dwattr $C$DW$308, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$56

	.dwattr $C$DW$T$56, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$56, DW_AT_decl_line(0x22a)
	.dwattr $C$DW$T$56, DW_AT_decl_column(0x12)
$C$DW$T$258	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$258, DW_AT_type(*$C$DW$T$56)

$C$DW$T$57	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$57, DW_AT_byte_size(0x04)
$C$DW$309	.dwtag  DW_TAG_member
	.dwattr $C$DW$309, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$309, DW_AT_name("PRI_HINT_0")
	.dwattr $C$DW$309, DW_AT_TI_symbol_name("PRI_HINT_0")
	.dwattr $C$DW$309, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$309, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$309, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$309, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$309, DW_AT_decl_line(0x23b)
	.dwattr $C$DW$309, DW_AT_decl_column(0x0d)
$C$DW$310	.dwtag  DW_TAG_member
	.dwattr $C$DW$310, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$310, DW_AT_name("rsvd10")
	.dwattr $C$DW$310, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$310, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$310, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$310, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$310, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$310, DW_AT_decl_line(0x23c)
	.dwattr $C$DW$310, DW_AT_decl_column(0x0d)
$C$DW$311	.dwtag  DW_TAG_member
	.dwattr $C$DW$311, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$311, DW_AT_name("NONE_HINT_0")
	.dwattr $C$DW$311, DW_AT_TI_symbol_name("NONE_HINT_0")
	.dwattr $C$DW$311, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$311, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$311, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$311, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$311, DW_AT_decl_line(0x23d)
	.dwattr $C$DW$311, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$57

	.dwattr $C$DW$T$57, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$57, DW_AT_decl_line(0x23a)
	.dwattr $C$DW$T$57, DW_AT_decl_column(0x12)
$C$DW$T$260	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$260, DW_AT_type(*$C$DW$T$57)

$C$DW$T$58	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$58, DW_AT_byte_size(0x04)
$C$DW$312	.dwtag  DW_TAG_member
	.dwattr $C$DW$312, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$312, DW_AT_name("PRI_HINT_1")
	.dwattr $C$DW$312, DW_AT_TI_symbol_name("PRI_HINT_1")
	.dwattr $C$DW$312, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$312, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$312, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$312, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$312, DW_AT_decl_line(0x247)
	.dwattr $C$DW$312, DW_AT_decl_column(0x0d)
$C$DW$313	.dwtag  DW_TAG_member
	.dwattr $C$DW$313, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$313, DW_AT_name("rsvd10")
	.dwattr $C$DW$313, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$313, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$313, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$313, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$313, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$313, DW_AT_decl_line(0x248)
	.dwattr $C$DW$313, DW_AT_decl_column(0x0d)
$C$DW$314	.dwtag  DW_TAG_member
	.dwattr $C$DW$314, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$314, DW_AT_name("NONE_HINT_1")
	.dwattr $C$DW$314, DW_AT_TI_symbol_name("NONE_HINT_1")
	.dwattr $C$DW$314, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$314, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$314, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$314, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$314, DW_AT_decl_line(0x249)
	.dwattr $C$DW$314, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$58

	.dwattr $C$DW$T$58, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$58, DW_AT_decl_line(0x246)
	.dwattr $C$DW$T$58, DW_AT_decl_column(0x12)
$C$DW$T$262	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$262, DW_AT_type(*$C$DW$T$58)

$C$DW$T$59	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$59, DW_AT_byte_size(0x04)
$C$DW$315	.dwtag  DW_TAG_member
	.dwattr $C$DW$315, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$315, DW_AT_name("PRI_HINT_2")
	.dwattr $C$DW$315, DW_AT_TI_symbol_name("PRI_HINT_2")
	.dwattr $C$DW$315, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$315, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$315, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$315, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$315, DW_AT_decl_line(0x253)
	.dwattr $C$DW$315, DW_AT_decl_column(0x0d)
$C$DW$316	.dwtag  DW_TAG_member
	.dwattr $C$DW$316, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$316, DW_AT_name("rsvd10")
	.dwattr $C$DW$316, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$316, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$316, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$316, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$316, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$316, DW_AT_decl_line(0x254)
	.dwattr $C$DW$316, DW_AT_decl_column(0x0d)
$C$DW$317	.dwtag  DW_TAG_member
	.dwattr $C$DW$317, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$317, DW_AT_name("NONE_HINT_2")
	.dwattr $C$DW$317, DW_AT_TI_symbol_name("NONE_HINT_2")
	.dwattr $C$DW$317, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$317, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$317, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$317, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$317, DW_AT_decl_line(0x255)
	.dwattr $C$DW$317, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$59

	.dwattr $C$DW$T$59, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$59, DW_AT_decl_line(0x252)
	.dwattr $C$DW$T$59, DW_AT_decl_column(0x12)
$C$DW$T$264	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$264, DW_AT_type(*$C$DW$T$59)

$C$DW$T$60	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$60, DW_AT_byte_size(0x04)
$C$DW$318	.dwtag  DW_TAG_member
	.dwattr $C$DW$318, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$318, DW_AT_name("PRI_HINT_3")
	.dwattr $C$DW$318, DW_AT_TI_symbol_name("PRI_HINT_3")
	.dwattr $C$DW$318, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$318, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$318, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$318, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$318, DW_AT_decl_line(0x25f)
	.dwattr $C$DW$318, DW_AT_decl_column(0x0d)
$C$DW$319	.dwtag  DW_TAG_member
	.dwattr $C$DW$319, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$319, DW_AT_name("rsvd10")
	.dwattr $C$DW$319, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$319, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$319, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$319, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$319, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$319, DW_AT_decl_line(0x260)
	.dwattr $C$DW$319, DW_AT_decl_column(0x0d)
$C$DW$320	.dwtag  DW_TAG_member
	.dwattr $C$DW$320, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$320, DW_AT_name("NONE_HINT_3")
	.dwattr $C$DW$320, DW_AT_TI_symbol_name("NONE_HINT_3")
	.dwattr $C$DW$320, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$320, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$320, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$320, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$320, DW_AT_decl_line(0x261)
	.dwattr $C$DW$320, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$60

	.dwattr $C$DW$T$60, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$60, DW_AT_decl_line(0x25e)
	.dwattr $C$DW$T$60, DW_AT_decl_column(0x12)
$C$DW$T$266	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$266, DW_AT_type(*$C$DW$T$60)

$C$DW$T$61	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$61, DW_AT_byte_size(0x04)
$C$DW$321	.dwtag  DW_TAG_member
	.dwattr $C$DW$321, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$321, DW_AT_name("PRI_HINT_4")
	.dwattr $C$DW$321, DW_AT_TI_symbol_name("PRI_HINT_4")
	.dwattr $C$DW$321, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$321, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$321, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$321, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$321, DW_AT_decl_line(0x26b)
	.dwattr $C$DW$321, DW_AT_decl_column(0x0d)
$C$DW$322	.dwtag  DW_TAG_member
	.dwattr $C$DW$322, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$322, DW_AT_name("rsvd10")
	.dwattr $C$DW$322, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$322, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$322, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$322, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$322, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$322, DW_AT_decl_line(0x26c)
	.dwattr $C$DW$322, DW_AT_decl_column(0x0d)
$C$DW$323	.dwtag  DW_TAG_member
	.dwattr $C$DW$323, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$323, DW_AT_name("NONE_HINT_4")
	.dwattr $C$DW$323, DW_AT_TI_symbol_name("NONE_HINT_4")
	.dwattr $C$DW$323, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$323, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$323, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$323, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$323, DW_AT_decl_line(0x26d)
	.dwattr $C$DW$323, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$61

	.dwattr $C$DW$T$61, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$61, DW_AT_decl_line(0x26a)
	.dwattr $C$DW$T$61, DW_AT_decl_column(0x12)
$C$DW$T$268	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$268, DW_AT_type(*$C$DW$T$61)

$C$DW$T$62	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$62, DW_AT_byte_size(0x04)
$C$DW$324	.dwtag  DW_TAG_member
	.dwattr $C$DW$324, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$324, DW_AT_name("PRI_HINT_5")
	.dwattr $C$DW$324, DW_AT_TI_symbol_name("PRI_HINT_5")
	.dwattr $C$DW$324, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$324, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$324, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$324, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$324, DW_AT_decl_line(0x277)
	.dwattr $C$DW$324, DW_AT_decl_column(0x0d)
$C$DW$325	.dwtag  DW_TAG_member
	.dwattr $C$DW$325, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$325, DW_AT_name("rsvd10")
	.dwattr $C$DW$325, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$325, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$325, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$325, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$325, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$325, DW_AT_decl_line(0x278)
	.dwattr $C$DW$325, DW_AT_decl_column(0x0d)
$C$DW$326	.dwtag  DW_TAG_member
	.dwattr $C$DW$326, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$326, DW_AT_name("NONE_HINT_5")
	.dwattr $C$DW$326, DW_AT_TI_symbol_name("NONE_HINT_5")
	.dwattr $C$DW$326, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$326, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$326, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$326, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$326, DW_AT_decl_line(0x279)
	.dwattr $C$DW$326, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$62

	.dwattr $C$DW$T$62, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$62, DW_AT_decl_line(0x276)
	.dwattr $C$DW$T$62, DW_AT_decl_column(0x12)
$C$DW$T$270	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$270, DW_AT_type(*$C$DW$T$62)

$C$DW$T$63	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$63, DW_AT_byte_size(0x04)
$C$DW$327	.dwtag  DW_TAG_member
	.dwattr $C$DW$327, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$327, DW_AT_name("PRI_HINT_6")
	.dwattr $C$DW$327, DW_AT_TI_symbol_name("PRI_HINT_6")
	.dwattr $C$DW$327, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$327, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$327, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$327, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$327, DW_AT_decl_line(0x283)
	.dwattr $C$DW$327, DW_AT_decl_column(0x0d)
$C$DW$328	.dwtag  DW_TAG_member
	.dwattr $C$DW$328, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$328, DW_AT_name("rsvd10")
	.dwattr $C$DW$328, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$328, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$328, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$328, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$328, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$328, DW_AT_decl_line(0x284)
	.dwattr $C$DW$328, DW_AT_decl_column(0x0d)
$C$DW$329	.dwtag  DW_TAG_member
	.dwattr $C$DW$329, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$329, DW_AT_name("NONE_HINT_6")
	.dwattr $C$DW$329, DW_AT_TI_symbol_name("NONE_HINT_6")
	.dwattr $C$DW$329, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$329, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$329, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$329, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$329, DW_AT_decl_line(0x285)
	.dwattr $C$DW$329, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$63

	.dwattr $C$DW$T$63, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$63, DW_AT_decl_line(0x282)
	.dwattr $C$DW$T$63, DW_AT_decl_column(0x12)
$C$DW$T$272	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$272, DW_AT_type(*$C$DW$T$63)

$C$DW$T$64	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$64, DW_AT_byte_size(0x04)
$C$DW$330	.dwtag  DW_TAG_member
	.dwattr $C$DW$330, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$330, DW_AT_name("PRI_HINT_7")
	.dwattr $C$DW$330, DW_AT_TI_symbol_name("PRI_HINT_7")
	.dwattr $C$DW$330, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$330, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$330, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$330, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$330, DW_AT_decl_line(0x28f)
	.dwattr $C$DW$330, DW_AT_decl_column(0x0d)
$C$DW$331	.dwtag  DW_TAG_member
	.dwattr $C$DW$331, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$331, DW_AT_name("rsvd10")
	.dwattr $C$DW$331, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$331, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$331, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$331, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$331, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$331, DW_AT_decl_line(0x290)
	.dwattr $C$DW$331, DW_AT_decl_column(0x0d)
$C$DW$332	.dwtag  DW_TAG_member
	.dwattr $C$DW$332, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$332, DW_AT_name("NONE_HINT_7")
	.dwattr $C$DW$332, DW_AT_TI_symbol_name("NONE_HINT_7")
	.dwattr $C$DW$332, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$332, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$332, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$332, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$332, DW_AT_decl_line(0x291)
	.dwattr $C$DW$332, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$64

	.dwattr $C$DW$T$64, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$64, DW_AT_decl_line(0x28e)
	.dwattr $C$DW$T$64, DW_AT_decl_column(0x12)
$C$DW$T$274	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$274, DW_AT_type(*$C$DW$T$64)

$C$DW$T$65	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$65, DW_AT_byte_size(0x04)
$C$DW$333	.dwtag  DW_TAG_member
	.dwattr $C$DW$333, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$333, DW_AT_name("PRI_HINT_8")
	.dwattr $C$DW$333, DW_AT_TI_symbol_name("PRI_HINT_8")
	.dwattr $C$DW$333, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$333, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$333, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$333, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$333, DW_AT_decl_line(0x29b)
	.dwattr $C$DW$333, DW_AT_decl_column(0x0d)
$C$DW$334	.dwtag  DW_TAG_member
	.dwattr $C$DW$334, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$334, DW_AT_name("rsvd10")
	.dwattr $C$DW$334, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$334, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$334, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$334, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$334, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$334, DW_AT_decl_line(0x29c)
	.dwattr $C$DW$334, DW_AT_decl_column(0x0d)
$C$DW$335	.dwtag  DW_TAG_member
	.dwattr $C$DW$335, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$335, DW_AT_name("NONE_HINT_8")
	.dwattr $C$DW$335, DW_AT_TI_symbol_name("NONE_HINT_8")
	.dwattr $C$DW$335, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$335, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$335, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$335, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$335, DW_AT_decl_line(0x29d)
	.dwattr $C$DW$335, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$65

	.dwattr $C$DW$T$65, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$65, DW_AT_decl_line(0x29a)
	.dwattr $C$DW$T$65, DW_AT_decl_column(0x12)
$C$DW$T$276	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$276, DW_AT_type(*$C$DW$T$65)

$C$DW$T$66	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$66, DW_AT_byte_size(0x04)
$C$DW$336	.dwtag  DW_TAG_member
	.dwattr $C$DW$336, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$336, DW_AT_name("PRI_HINT_9")
	.dwattr $C$DW$336, DW_AT_TI_symbol_name("PRI_HINT_9")
	.dwattr $C$DW$336, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$336, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$336, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$336, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$336, DW_AT_decl_line(0x2a7)
	.dwattr $C$DW$336, DW_AT_decl_column(0x0d)
$C$DW$337	.dwtag  DW_TAG_member
	.dwattr $C$DW$337, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$337, DW_AT_name("rsvd10")
	.dwattr $C$DW$337, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$337, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$337, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$337, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$337, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$337, DW_AT_decl_line(0x2a8)
	.dwattr $C$DW$337, DW_AT_decl_column(0x0d)
$C$DW$338	.dwtag  DW_TAG_member
	.dwattr $C$DW$338, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$338, DW_AT_name("NONE_HINT_9")
	.dwattr $C$DW$338, DW_AT_TI_symbol_name("NONE_HINT_9")
	.dwattr $C$DW$338, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$338, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$338, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$338, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$338, DW_AT_decl_line(0x2a9)
	.dwattr $C$DW$338, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$66

	.dwattr $C$DW$T$66, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$66, DW_AT_decl_line(0x2a6)
	.dwattr $C$DW$T$66, DW_AT_decl_column(0x12)
$C$DW$T$278	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$278, DW_AT_type(*$C$DW$T$66)

$C$DW$T$67	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$67, DW_AT_byte_size(0x04)
$C$DW$339	.dwtag  DW_TAG_member
	.dwattr $C$DW$339, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$339, DW_AT_name("POLARITY_31_0")
	.dwattr $C$DW$339, DW_AT_TI_symbol_name("POLARITY_31_0")
	.dwattr $C$DW$339, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$339, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$339, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$339, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$339, DW_AT_decl_line(0x2b6)
	.dwattr $C$DW$339, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$67

	.dwattr $C$DW$T$67, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$67, DW_AT_decl_line(0x2b5)
	.dwattr $C$DW$T$67, DW_AT_decl_column(0x12)
$C$DW$T$280	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$280, DW_AT_type(*$C$DW$T$67)

$C$DW$T$68	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$68, DW_AT_byte_size(0x04)
$C$DW$340	.dwtag  DW_TAG_member
	.dwattr $C$DW$340, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$340, DW_AT_name("POLARITY_63_32")
	.dwattr $C$DW$340, DW_AT_TI_symbol_name("POLARITY_63_32")
	.dwattr $C$DW$340, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$340, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$340, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$340, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$340, DW_AT_decl_line(0x2c0)
	.dwattr $C$DW$340, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$68

	.dwattr $C$DW$T$68, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$68, DW_AT_decl_line(0x2bf)
	.dwattr $C$DW$T$68, DW_AT_decl_column(0x12)
$C$DW$T$282	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$282, DW_AT_type(*$C$DW$T$68)

$C$DW$T$69	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$69, DW_AT_byte_size(0x04)
$C$DW$341	.dwtag  DW_TAG_member
	.dwattr $C$DW$341, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$341, DW_AT_name("TYPE_31_0")
	.dwattr $C$DW$341, DW_AT_TI_symbol_name("TYPE_31_0")
	.dwattr $C$DW$341, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$341, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$341, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$341, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$341, DW_AT_decl_line(0x2cd)
	.dwattr $C$DW$341, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$69

	.dwattr $C$DW$T$69, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$69, DW_AT_decl_line(0x2cc)
	.dwattr $C$DW$T$69, DW_AT_decl_column(0x12)
$C$DW$T$284	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$284, DW_AT_type(*$C$DW$T$69)

$C$DW$T$70	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$70, DW_AT_byte_size(0x04)
$C$DW$342	.dwtag  DW_TAG_member
	.dwattr $C$DW$342, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$342, DW_AT_name("TYPE_63_32")
	.dwattr $C$DW$342, DW_AT_TI_symbol_name("TYPE_63_32")
	.dwattr $C$DW$342, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$342, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$342, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$342, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$342, DW_AT_decl_line(0x2d7)
	.dwattr $C$DW$342, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$70

	.dwattr $C$DW$T$70, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$70, DW_AT_decl_line(0x2d6)
	.dwattr $C$DW$T$70, DW_AT_decl_column(0x12)
$C$DW$T$286	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$286, DW_AT_type(*$C$DW$T$70)

$C$DW$T$71	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$71, DW_AT_byte_size(0x04)
$C$DW$343	.dwtag  DW_TAG_member
	.dwattr $C$DW$343, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$343, DW_AT_name("NEST_HINT_0")
	.dwattr $C$DW$343, DW_AT_TI_symbol_name("NEST_HINT_0")
	.dwattr $C$DW$343, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$343, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$343, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$343, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$343, DW_AT_decl_line(0x2e4)
	.dwattr $C$DW$343, DW_AT_decl_column(0x0d)
$C$DW$344	.dwtag  DW_TAG_member
	.dwattr $C$DW$344, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$344, DW_AT_name("rsvd9")
	.dwattr $C$DW$344, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$344, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$344, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$344, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$344, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$344, DW_AT_decl_line(0x2e5)
	.dwattr $C$DW$344, DW_AT_decl_column(0x0d)
$C$DW$345	.dwtag  DW_TAG_member
	.dwattr $C$DW$345, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$345, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$345, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$345, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$345, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$345, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$345, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$345, DW_AT_decl_line(0x2e6)
	.dwattr $C$DW$345, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$71

	.dwattr $C$DW$T$71, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$71, DW_AT_decl_line(0x2e3)
	.dwattr $C$DW$T$71, DW_AT_decl_column(0x12)
$C$DW$T$288	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$288, DW_AT_type(*$C$DW$T$71)

$C$DW$T$72	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$72, DW_AT_byte_size(0x04)
$C$DW$346	.dwtag  DW_TAG_member
	.dwattr $C$DW$346, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$346, DW_AT_name("NEST_HINT_1")
	.dwattr $C$DW$346, DW_AT_TI_symbol_name("NEST_HINT_1")
	.dwattr $C$DW$346, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$346, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$346, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$346, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$346, DW_AT_decl_line(0x2f0)
	.dwattr $C$DW$346, DW_AT_decl_column(0x0d)
$C$DW$347	.dwtag  DW_TAG_member
	.dwattr $C$DW$347, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$347, DW_AT_name("rsvd9")
	.dwattr $C$DW$347, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$347, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$347, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$347, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$347, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$347, DW_AT_decl_line(0x2f1)
	.dwattr $C$DW$347, DW_AT_decl_column(0x0d)
$C$DW$348	.dwtag  DW_TAG_member
	.dwattr $C$DW$348, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$348, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$348, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$348, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$348, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$348, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$348, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$348, DW_AT_decl_line(0x2f2)
	.dwattr $C$DW$348, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$72

	.dwattr $C$DW$T$72, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$72, DW_AT_decl_line(0x2ef)
	.dwattr $C$DW$T$72, DW_AT_decl_column(0x12)
$C$DW$T$290	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$290, DW_AT_type(*$C$DW$T$72)

$C$DW$T$73	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$73, DW_AT_byte_size(0x04)
$C$DW$349	.dwtag  DW_TAG_member
	.dwattr $C$DW$349, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$349, DW_AT_name("NEST_HINT_2")
	.dwattr $C$DW$349, DW_AT_TI_symbol_name("NEST_HINT_2")
	.dwattr $C$DW$349, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$349, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$349, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$349, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$349, DW_AT_decl_line(0x2fc)
	.dwattr $C$DW$349, DW_AT_decl_column(0x0d)
$C$DW$350	.dwtag  DW_TAG_member
	.dwattr $C$DW$350, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$350, DW_AT_name("rsvd9")
	.dwattr $C$DW$350, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$350, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$350, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$350, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$350, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$350, DW_AT_decl_line(0x2fd)
	.dwattr $C$DW$350, DW_AT_decl_column(0x0d)
$C$DW$351	.dwtag  DW_TAG_member
	.dwattr $C$DW$351, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$351, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$351, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$351, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$351, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$351, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$351, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$351, DW_AT_decl_line(0x2fe)
	.dwattr $C$DW$351, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$73

	.dwattr $C$DW$T$73, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$73, DW_AT_decl_line(0x2fb)
	.dwattr $C$DW$T$73, DW_AT_decl_column(0x12)
$C$DW$T$292	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$292, DW_AT_type(*$C$DW$T$73)

$C$DW$T$74	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$74, DW_AT_byte_size(0x04)
$C$DW$352	.dwtag  DW_TAG_member
	.dwattr $C$DW$352, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$352, DW_AT_name("NEST_HINT_3")
	.dwattr $C$DW$352, DW_AT_TI_symbol_name("NEST_HINT_3")
	.dwattr $C$DW$352, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$352, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$352, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$352, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$352, DW_AT_decl_line(0x308)
	.dwattr $C$DW$352, DW_AT_decl_column(0x0d)
$C$DW$353	.dwtag  DW_TAG_member
	.dwattr $C$DW$353, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$353, DW_AT_name("rsvd9")
	.dwattr $C$DW$353, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$353, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$353, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$353, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$353, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$353, DW_AT_decl_line(0x309)
	.dwattr $C$DW$353, DW_AT_decl_column(0x0d)
$C$DW$354	.dwtag  DW_TAG_member
	.dwattr $C$DW$354, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$354, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$354, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$354, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$354, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$354, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$354, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$354, DW_AT_decl_line(0x30a)
	.dwattr $C$DW$354, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$74

	.dwattr $C$DW$T$74, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$74, DW_AT_decl_line(0x307)
	.dwattr $C$DW$T$74, DW_AT_decl_column(0x12)
$C$DW$T$294	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$294, DW_AT_type(*$C$DW$T$74)

$C$DW$T$75	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$75, DW_AT_byte_size(0x04)
$C$DW$355	.dwtag  DW_TAG_member
	.dwattr $C$DW$355, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$355, DW_AT_name("NEST_HINT_4")
	.dwattr $C$DW$355, DW_AT_TI_symbol_name("NEST_HINT_4")
	.dwattr $C$DW$355, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$355, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$355, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$355, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$355, DW_AT_decl_line(0x314)
	.dwattr $C$DW$355, DW_AT_decl_column(0x0d)
$C$DW$356	.dwtag  DW_TAG_member
	.dwattr $C$DW$356, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$356, DW_AT_name("rsvd9")
	.dwattr $C$DW$356, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$356, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$356, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$356, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$356, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$356, DW_AT_decl_line(0x315)
	.dwattr $C$DW$356, DW_AT_decl_column(0x0d)
$C$DW$357	.dwtag  DW_TAG_member
	.dwattr $C$DW$357, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$357, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$357, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$357, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$357, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$357, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$357, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$357, DW_AT_decl_line(0x316)
	.dwattr $C$DW$357, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$75

	.dwattr $C$DW$T$75, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$75, DW_AT_decl_line(0x313)
	.dwattr $C$DW$T$75, DW_AT_decl_column(0x12)
$C$DW$T$296	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$296, DW_AT_type(*$C$DW$T$75)

$C$DW$T$76	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$76, DW_AT_byte_size(0x04)
$C$DW$358	.dwtag  DW_TAG_member
	.dwattr $C$DW$358, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$358, DW_AT_name("NEST_HINT_5")
	.dwattr $C$DW$358, DW_AT_TI_symbol_name("NEST_HINT_5")
	.dwattr $C$DW$358, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$358, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$358, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$358, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$358, DW_AT_decl_line(0x320)
	.dwattr $C$DW$358, DW_AT_decl_column(0x0d)
$C$DW$359	.dwtag  DW_TAG_member
	.dwattr $C$DW$359, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$359, DW_AT_name("rsvd9")
	.dwattr $C$DW$359, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$359, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$359, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$359, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$359, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$359, DW_AT_decl_line(0x321)
	.dwattr $C$DW$359, DW_AT_decl_column(0x0d)
$C$DW$360	.dwtag  DW_TAG_member
	.dwattr $C$DW$360, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$360, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$360, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$360, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$360, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$360, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$360, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$360, DW_AT_decl_line(0x322)
	.dwattr $C$DW$360, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$76

	.dwattr $C$DW$T$76, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$76, DW_AT_decl_line(0x31f)
	.dwattr $C$DW$T$76, DW_AT_decl_column(0x12)
$C$DW$T$298	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$298, DW_AT_type(*$C$DW$T$76)

$C$DW$T$77	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$77, DW_AT_byte_size(0x04)
$C$DW$361	.dwtag  DW_TAG_member
	.dwattr $C$DW$361, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$361, DW_AT_name("NEST_HINT_6")
	.dwattr $C$DW$361, DW_AT_TI_symbol_name("NEST_HINT_6")
	.dwattr $C$DW$361, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$361, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$361, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$361, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$361, DW_AT_decl_line(0x32c)
	.dwattr $C$DW$361, DW_AT_decl_column(0x0d)
$C$DW$362	.dwtag  DW_TAG_member
	.dwattr $C$DW$362, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$362, DW_AT_name("rsvd9")
	.dwattr $C$DW$362, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$362, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$362, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$362, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$362, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$362, DW_AT_decl_line(0x32d)
	.dwattr $C$DW$362, DW_AT_decl_column(0x0d)
$C$DW$363	.dwtag  DW_TAG_member
	.dwattr $C$DW$363, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$363, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$363, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$363, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$363, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$363, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$363, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$363, DW_AT_decl_line(0x32e)
	.dwattr $C$DW$363, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$77

	.dwattr $C$DW$T$77, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$77, DW_AT_decl_line(0x32b)
	.dwattr $C$DW$T$77, DW_AT_decl_column(0x12)
$C$DW$T$300	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$300, DW_AT_type(*$C$DW$T$77)

$C$DW$T$78	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$78, DW_AT_byte_size(0x04)
$C$DW$364	.dwtag  DW_TAG_member
	.dwattr $C$DW$364, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$364, DW_AT_name("NEST_HINT_7")
	.dwattr $C$DW$364, DW_AT_TI_symbol_name("NEST_HINT_7")
	.dwattr $C$DW$364, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$364, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$364, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$364, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$364, DW_AT_decl_line(0x338)
	.dwattr $C$DW$364, DW_AT_decl_column(0x0d)
$C$DW$365	.dwtag  DW_TAG_member
	.dwattr $C$DW$365, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$365, DW_AT_name("rsvd9")
	.dwattr $C$DW$365, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$365, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$365, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$365, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$365, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$365, DW_AT_decl_line(0x339)
	.dwattr $C$DW$365, DW_AT_decl_column(0x0d)
$C$DW$366	.dwtag  DW_TAG_member
	.dwattr $C$DW$366, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$366, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$366, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$366, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$366, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$366, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$366, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$366, DW_AT_decl_line(0x33a)
	.dwattr $C$DW$366, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$78

	.dwattr $C$DW$T$78, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$78, DW_AT_decl_line(0x337)
	.dwattr $C$DW$T$78, DW_AT_decl_column(0x12)
$C$DW$T$302	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$302, DW_AT_type(*$C$DW$T$78)

$C$DW$T$79	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$79, DW_AT_byte_size(0x04)
$C$DW$367	.dwtag  DW_TAG_member
	.dwattr $C$DW$367, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$367, DW_AT_name("NEST_HINT_8")
	.dwattr $C$DW$367, DW_AT_TI_symbol_name("NEST_HINT_8")
	.dwattr $C$DW$367, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$367, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$367, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$367, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$367, DW_AT_decl_line(0x344)
	.dwattr $C$DW$367, DW_AT_decl_column(0x0d)
$C$DW$368	.dwtag  DW_TAG_member
	.dwattr $C$DW$368, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$368, DW_AT_name("rsvd9")
	.dwattr $C$DW$368, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$368, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$368, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$368, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$368, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$368, DW_AT_decl_line(0x345)
	.dwattr $C$DW$368, DW_AT_decl_column(0x0d)
$C$DW$369	.dwtag  DW_TAG_member
	.dwattr $C$DW$369, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$369, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$369, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$369, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$369, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$369, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$369, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$369, DW_AT_decl_line(0x346)
	.dwattr $C$DW$369, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$79

	.dwattr $C$DW$T$79, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$79, DW_AT_decl_line(0x343)
	.dwattr $C$DW$T$79, DW_AT_decl_column(0x12)
$C$DW$T$304	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$304, DW_AT_type(*$C$DW$T$79)

$C$DW$T$80	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$80, DW_AT_byte_size(0x04)
$C$DW$370	.dwtag  DW_TAG_member
	.dwattr $C$DW$370, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$370, DW_AT_name("NEST_HINT_9")
	.dwattr $C$DW$370, DW_AT_TI_symbol_name("NEST_HINT_9")
	.dwattr $C$DW$370, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$370, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$370, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$370, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$370, DW_AT_decl_line(0x350)
	.dwattr $C$DW$370, DW_AT_decl_column(0x0d)
$C$DW$371	.dwtag  DW_TAG_member
	.dwattr $C$DW$371, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$371, DW_AT_name("rsvd9")
	.dwattr $C$DW$371, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$371, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$371, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$371, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$371, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$371, DW_AT_decl_line(0x351)
	.dwattr $C$DW$371, DW_AT_decl_column(0x0d)
$C$DW$372	.dwtag  DW_TAG_member
	.dwattr $C$DW$372, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$372, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$372, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$372, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$372, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$372, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$372, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$372, DW_AT_decl_line(0x352)
	.dwattr $C$DW$372, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$80

	.dwattr $C$DW$T$80, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$80, DW_AT_decl_line(0x34f)
	.dwattr $C$DW$T$80, DW_AT_decl_column(0x12)
$C$DW$T$306	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$306, DW_AT_type(*$C$DW$T$80)

$C$DW$T$81	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$81, DW_AT_byte_size(0x04)
$C$DW$373	.dwtag  DW_TAG_member
	.dwattr $C$DW$373, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$373, DW_AT_name("EN_HINT")
	.dwattr $C$DW$373, DW_AT_TI_symbol_name("EN_HINT")
	.dwattr $C$DW$373, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$373, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$373, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$373, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$373, DW_AT_decl_line(0x35f)
	.dwattr $C$DW$373, DW_AT_decl_column(0x0d)
$C$DW$374	.dwtag  DW_TAG_member
	.dwattr $C$DW$374, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$374, DW_AT_name("rsvd9")
	.dwattr $C$DW$374, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$374, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$374, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$374, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$374, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$374, DW_AT_decl_line(0x360)
	.dwattr $C$DW$374, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$81

	.dwattr $C$DW$T$81, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$81, DW_AT_decl_line(0x35e)
	.dwattr $C$DW$T$81, DW_AT_decl_column(0x12)
$C$DW$T$308	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$308, DW_AT_type(*$C$DW$T$81)

$C$DW$T$91	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$91, DW_AT_byte_size(0x1504)
$C$DW$375	.dwtag  DW_TAG_member
	.dwattr $C$DW$375, DW_AT_type(*$C$DW$T$185)
	.dwattr $C$DW$375, DW_AT_name("$P$T0")
	.dwattr $C$DW$375, DW_AT_TI_symbol_name("$P$T0")
	.dwattr $C$DW$375, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$375, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$375, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$375, DW_AT_decl_line(0x06)
	.dwattr $C$DW$375, DW_AT_decl_column(0x02)
$C$DW$376	.dwtag  DW_TAG_member
	.dwattr $C$DW$376, DW_AT_type(*$C$DW$T$187)
	.dwattr $C$DW$376, DW_AT_name("$P$T1")
	.dwattr $C$DW$376, DW_AT_TI_symbol_name("$P$T1")
	.dwattr $C$DW$376, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$376, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$376, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$376, DW_AT_decl_line(0x16)
	.dwattr $C$DW$376, DW_AT_decl_column(0x02)
$C$DW$377	.dwtag  DW_TAG_member
	.dwattr $C$DW$377, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$377, DW_AT_name("rsvd8")
	.dwattr $C$DW$377, DW_AT_TI_symbol_name("rsvd8")
	.dwattr $C$DW$377, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$377, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$377, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$377, DW_AT_decl_line(0x21)
	.dwattr $C$DW$377, DW_AT_decl_column(0x0b)
$C$DW$378	.dwtag  DW_TAG_member
	.dwattr $C$DW$378, DW_AT_type(*$C$DW$T$189)
	.dwattr $C$DW$378, DW_AT_name("$P$T2")
	.dwattr $C$DW$378, DW_AT_TI_symbol_name("$P$T2")
	.dwattr $C$DW$378, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$378, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$378, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$378, DW_AT_decl_line(0x25)
	.dwattr $C$DW$378, DW_AT_decl_column(0x02)
$C$DW$379	.dwtag  DW_TAG_member
	.dwattr $C$DW$379, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$379, DW_AT_name("rsvd14")
	.dwattr $C$DW$379, DW_AT_TI_symbol_name("rsvd14")
	.dwattr $C$DW$379, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$379, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$379, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$379, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$379, DW_AT_decl_column(0x0b)
$C$DW$380	.dwtag  DW_TAG_member
	.dwattr $C$DW$380, DW_AT_type(*$C$DW$T$191)
	.dwattr $C$DW$380, DW_AT_name("$P$T3")
	.dwattr $C$DW$380, DW_AT_TI_symbol_name("$P$T3")
	.dwattr $C$DW$380, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$380, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$380, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$380, DW_AT_decl_line(0x33)
	.dwattr $C$DW$380, DW_AT_decl_column(0x02)
$C$DW$381	.dwtag  DW_TAG_member
	.dwattr $C$DW$381, DW_AT_type(*$C$DW$T$193)
	.dwattr $C$DW$381, DW_AT_name("$P$T4")
	.dwattr $C$DW$381, DW_AT_TI_symbol_name("$P$T4")
	.dwattr $C$DW$381, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$381, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$381, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$381, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$381, DW_AT_decl_column(0x02)
$C$DW$382	.dwtag  DW_TAG_member
	.dwattr $C$DW$382, DW_AT_type(*$C$DW$T$195)
	.dwattr $C$DW$382, DW_AT_name("$P$T5")
	.dwattr $C$DW$382, DW_AT_TI_symbol_name("$P$T5")
	.dwattr $C$DW$382, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$382, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$382, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$382, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$382, DW_AT_decl_column(0x02)
$C$DW$383	.dwtag  DW_TAG_member
	.dwattr $C$DW$383, DW_AT_type(*$C$DW$T$197)
	.dwattr $C$DW$383, DW_AT_name("$P$T6")
	.dwattr $C$DW$383, DW_AT_TI_symbol_name("$P$T6")
	.dwattr $C$DW$383, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$383, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$383, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$383, DW_AT_decl_line(0x55)
	.dwattr $C$DW$383, DW_AT_decl_column(0x02)
$C$DW$384	.dwtag  DW_TAG_member
	.dwattr $C$DW$384, DW_AT_type(*$C$DW$T$199)
	.dwattr $C$DW$384, DW_AT_name("$P$T7")
	.dwattr $C$DW$384, DW_AT_TI_symbol_name("$P$T7")
	.dwattr $C$DW$384, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$384, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$384, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$384, DW_AT_decl_line(0x60)
	.dwattr $C$DW$384, DW_AT_decl_column(0x02)
$C$DW$385	.dwtag  DW_TAG_member
	.dwattr $C$DW$385, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$385, DW_AT_name("rsvd30")
	.dwattr $C$DW$385, DW_AT_TI_symbol_name("rsvd30")
	.dwattr $C$DW$385, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$385, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$385, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$385, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$385, DW_AT_decl_column(0x0b)
$C$DW$386	.dwtag  DW_TAG_member
	.dwattr $C$DW$386, DW_AT_type(*$C$DW$T$201)
	.dwattr $C$DW$386, DW_AT_name("$P$T8")
	.dwattr $C$DW$386, DW_AT_TI_symbol_name("$P$T8")
	.dwattr $C$DW$386, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$386, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$386, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$386, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$386, DW_AT_decl_column(0x02)
$C$DW$387	.dwtag  DW_TAG_member
	.dwattr $C$DW$387, DW_AT_type(*$C$DW$T$203)
	.dwattr $C$DW$387, DW_AT_name("$P$T9")
	.dwattr $C$DW$387, DW_AT_TI_symbol_name("$P$T9")
	.dwattr $C$DW$387, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$387, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$387, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$387, DW_AT_decl_line(0x79)
	.dwattr $C$DW$387, DW_AT_decl_column(0x02)
$C$DW$388	.dwtag  DW_TAG_member
	.dwattr $C$DW$388, DW_AT_type(*$C$DW$T$84)
	.dwattr $C$DW$388, DW_AT_name("rsvd3C")
	.dwattr $C$DW$388, DW_AT_TI_symbol_name("rsvd3C")
	.dwattr $C$DW$388, DW_AT_data_member_location[DW_OP_plus_uconst 0x3c]
	.dwattr $C$DW$388, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$388, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$388, DW_AT_decl_line(0x83)
	.dwattr $C$DW$388, DW_AT_decl_column(0x0b)
$C$DW$389	.dwtag  DW_TAG_member
	.dwattr $C$DW$389, DW_AT_type(*$C$DW$T$205)
	.dwattr $C$DW$389, DW_AT_name("$P$T10")
	.dwattr $C$DW$389, DW_AT_TI_symbol_name("$P$T10")
	.dwattr $C$DW$389, DW_AT_data_member_location[DW_OP_plus_uconst 0x80]
	.dwattr $C$DW$389, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$389, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$389, DW_AT_decl_line(0x87)
	.dwattr $C$DW$389, DW_AT_decl_column(0x02)
$C$DW$390	.dwtag  DW_TAG_member
	.dwattr $C$DW$390, DW_AT_type(*$C$DW$T$85)
	.dwattr $C$DW$390, DW_AT_name("rsvd84")
	.dwattr $C$DW$390, DW_AT_TI_symbol_name("rsvd84")
	.dwattr $C$DW$390, DW_AT_data_member_location[DW_OP_plus_uconst 0x84]
	.dwattr $C$DW$390, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$390, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$390, DW_AT_decl_line(0x92)
	.dwattr $C$DW$390, DW_AT_decl_column(0x0b)
$C$DW$391	.dwtag  DW_TAG_member
	.dwattr $C$DW$391, DW_AT_type(*$C$DW$T$207)
	.dwattr $C$DW$391, DW_AT_name("$P$T11")
	.dwattr $C$DW$391, DW_AT_TI_symbol_name("$P$T11")
	.dwattr $C$DW$391, DW_AT_data_member_location[DW_OP_plus_uconst 0x200]
	.dwattr $C$DW$391, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$391, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$391, DW_AT_decl_line(0x96)
	.dwattr $C$DW$391, DW_AT_decl_column(0x02)
$C$DW$392	.dwtag  DW_TAG_member
	.dwattr $C$DW$392, DW_AT_type(*$C$DW$T$209)
	.dwattr $C$DW$392, DW_AT_name("$P$T12")
	.dwattr $C$DW$392, DW_AT_TI_symbol_name("$P$T12")
	.dwattr $C$DW$392, DW_AT_data_member_location[DW_OP_plus_uconst 0x204]
	.dwattr $C$DW$392, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$392, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$392, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$392, DW_AT_decl_column(0x02)
$C$DW$393	.dwtag  DW_TAG_member
	.dwattr $C$DW$393, DW_AT_type(*$C$DW$T$86)
	.dwattr $C$DW$393, DW_AT_name("rsvd208")
	.dwattr $C$DW$393, DW_AT_TI_symbol_name("rsvd208")
	.dwattr $C$DW$393, DW_AT_data_member_location[DW_OP_plus_uconst 0x208]
	.dwattr $C$DW$393, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$393, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$393, DW_AT_decl_line(0xa9)
	.dwattr $C$DW$393, DW_AT_decl_column(0x0b)
$C$DW$394	.dwtag  DW_TAG_member
	.dwattr $C$DW$394, DW_AT_type(*$C$DW$T$211)
	.dwattr $C$DW$394, DW_AT_name("$P$T13")
	.dwattr $C$DW$394, DW_AT_TI_symbol_name("$P$T13")
	.dwattr $C$DW$394, DW_AT_data_member_location[DW_OP_plus_uconst 0x280]
	.dwattr $C$DW$394, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$394, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$394, DW_AT_decl_line(0xad)
	.dwattr $C$DW$394, DW_AT_decl_column(0x02)
$C$DW$395	.dwtag  DW_TAG_member
	.dwattr $C$DW$395, DW_AT_type(*$C$DW$T$213)
	.dwattr $C$DW$395, DW_AT_name("$P$T14")
	.dwattr $C$DW$395, DW_AT_TI_symbol_name("$P$T14")
	.dwattr $C$DW$395, DW_AT_data_member_location[DW_OP_plus_uconst 0x284]
	.dwattr $C$DW$395, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$395, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$395, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$395, DW_AT_decl_column(0x02)
$C$DW$396	.dwtag  DW_TAG_member
	.dwattr $C$DW$396, DW_AT_type(*$C$DW$T$86)
	.dwattr $C$DW$396, DW_AT_name("rsvd288")
	.dwattr $C$DW$396, DW_AT_TI_symbol_name("rsvd288")
	.dwattr $C$DW$396, DW_AT_data_member_location[DW_OP_plus_uconst 0x288]
	.dwattr $C$DW$396, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$396, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$396, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$396, DW_AT_decl_column(0x0b)
$C$DW$397	.dwtag  DW_TAG_member
	.dwattr $C$DW$397, DW_AT_type(*$C$DW$T$215)
	.dwattr $C$DW$397, DW_AT_name("$P$T15")
	.dwattr $C$DW$397, DW_AT_TI_symbol_name("$P$T15")
	.dwattr $C$DW$397, DW_AT_data_member_location[DW_OP_plus_uconst 0x300]
	.dwattr $C$DW$397, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$397, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$397, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$397, DW_AT_decl_column(0x02)
$C$DW$398	.dwtag  DW_TAG_member
	.dwattr $C$DW$398, DW_AT_type(*$C$DW$T$217)
	.dwattr $C$DW$398, DW_AT_name("$P$T16")
	.dwattr $C$DW$398, DW_AT_TI_symbol_name("$P$T16")
	.dwattr $C$DW$398, DW_AT_data_member_location[DW_OP_plus_uconst 0x304]
	.dwattr $C$DW$398, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$398, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$398, DW_AT_decl_line(0xce)
	.dwattr $C$DW$398, DW_AT_decl_column(0x02)
$C$DW$399	.dwtag  DW_TAG_member
	.dwattr $C$DW$399, DW_AT_type(*$C$DW$T$86)
	.dwattr $C$DW$399, DW_AT_name("rsvd308")
	.dwattr $C$DW$399, DW_AT_TI_symbol_name("rsvd308")
	.dwattr $C$DW$399, DW_AT_data_member_location[DW_OP_plus_uconst 0x308]
	.dwattr $C$DW$399, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$399, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$399, DW_AT_decl_line(0xd7)
	.dwattr $C$DW$399, DW_AT_decl_column(0x0b)
$C$DW$400	.dwtag  DW_TAG_member
	.dwattr $C$DW$400, DW_AT_type(*$C$DW$T$219)
	.dwattr $C$DW$400, DW_AT_name("$P$T17")
	.dwattr $C$DW$400, DW_AT_TI_symbol_name("$P$T17")
	.dwattr $C$DW$400, DW_AT_data_member_location[DW_OP_plus_uconst 0x380]
	.dwattr $C$DW$400, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$400, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$400, DW_AT_decl_line(0xdb)
	.dwattr $C$DW$400, DW_AT_decl_column(0x02)
$C$DW$401	.dwtag  DW_TAG_member
	.dwattr $C$DW$401, DW_AT_type(*$C$DW$T$221)
	.dwattr $C$DW$401, DW_AT_name("$P$T18")
	.dwattr $C$DW$401, DW_AT_TI_symbol_name("$P$T18")
	.dwattr $C$DW$401, DW_AT_data_member_location[DW_OP_plus_uconst 0x384]
	.dwattr $C$DW$401, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$401, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$401, DW_AT_decl_line(0xe5)
	.dwattr $C$DW$401, DW_AT_decl_column(0x02)
$C$DW$402	.dwtag  DW_TAG_member
	.dwattr $C$DW$402, DW_AT_type(*$C$DW$T$86)
	.dwattr $C$DW$402, DW_AT_name("rsvd388")
	.dwattr $C$DW$402, DW_AT_TI_symbol_name("rsvd388")
	.dwattr $C$DW$402, DW_AT_data_member_location[DW_OP_plus_uconst 0x388]
	.dwattr $C$DW$402, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$402, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$402, DW_AT_decl_line(0xee)
	.dwattr $C$DW$402, DW_AT_decl_column(0x0b)
$C$DW$403	.dwtag  DW_TAG_member
	.dwattr $C$DW$403, DW_AT_type(*$C$DW$T$223)
	.dwattr $C$DW$403, DW_AT_name("$P$T19")
	.dwattr $C$DW$403, DW_AT_TI_symbol_name("$P$T19")
	.dwattr $C$DW$403, DW_AT_data_member_location[DW_OP_plus_uconst 0x400]
	.dwattr $C$DW$403, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$403, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$403, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$403, DW_AT_decl_column(0x02)
$C$DW$404	.dwtag  DW_TAG_member
	.dwattr $C$DW$404, DW_AT_type(*$C$DW$T$225)
	.dwattr $C$DW$404, DW_AT_name("$P$T20")
	.dwattr $C$DW$404, DW_AT_TI_symbol_name("$P$T20")
	.dwattr $C$DW$404, DW_AT_data_member_location[DW_OP_plus_uconst 0x404]
	.dwattr $C$DW$404, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$404, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$404, DW_AT_decl_line(0x103)
	.dwattr $C$DW$404, DW_AT_decl_column(0x02)
$C$DW$405	.dwtag  DW_TAG_member
	.dwattr $C$DW$405, DW_AT_type(*$C$DW$T$227)
	.dwattr $C$DW$405, DW_AT_name("$P$T21")
	.dwattr $C$DW$405, DW_AT_TI_symbol_name("$P$T21")
	.dwattr $C$DW$405, DW_AT_data_member_location[DW_OP_plus_uconst 0x408]
	.dwattr $C$DW$405, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$405, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$405, DW_AT_decl_line(0x114)
	.dwattr $C$DW$405, DW_AT_decl_column(0x02)
$C$DW$406	.dwtag  DW_TAG_member
	.dwattr $C$DW$406, DW_AT_type(*$C$DW$T$229)
	.dwattr $C$DW$406, DW_AT_name("$P$T22")
	.dwattr $C$DW$406, DW_AT_TI_symbol_name("$P$T22")
	.dwattr $C$DW$406, DW_AT_data_member_location[DW_OP_plus_uconst 0x40c]
	.dwattr $C$DW$406, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$406, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$406, DW_AT_decl_line(0x125)
	.dwattr $C$DW$406, DW_AT_decl_column(0x02)
$C$DW$407	.dwtag  DW_TAG_member
	.dwattr $C$DW$407, DW_AT_type(*$C$DW$T$231)
	.dwattr $C$DW$407, DW_AT_name("$P$T23")
	.dwattr $C$DW$407, DW_AT_TI_symbol_name("$P$T23")
	.dwattr $C$DW$407, DW_AT_data_member_location[DW_OP_plus_uconst 0x410]
	.dwattr $C$DW$407, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$407, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$407, DW_AT_decl_line(0x136)
	.dwattr $C$DW$407, DW_AT_decl_column(0x02)
$C$DW$408	.dwtag  DW_TAG_member
	.dwattr $C$DW$408, DW_AT_type(*$C$DW$T$233)
	.dwattr $C$DW$408, DW_AT_name("$P$T24")
	.dwattr $C$DW$408, DW_AT_TI_symbol_name("$P$T24")
	.dwattr $C$DW$408, DW_AT_data_member_location[DW_OP_plus_uconst 0x414]
	.dwattr $C$DW$408, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$408, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$408, DW_AT_decl_line(0x147)
	.dwattr $C$DW$408, DW_AT_decl_column(0x02)
$C$DW$409	.dwtag  DW_TAG_member
	.dwattr $C$DW$409, DW_AT_type(*$C$DW$T$235)
	.dwattr $C$DW$409, DW_AT_name("$P$T25")
	.dwattr $C$DW$409, DW_AT_TI_symbol_name("$P$T25")
	.dwattr $C$DW$409, DW_AT_data_member_location[DW_OP_plus_uconst 0x418]
	.dwattr $C$DW$409, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$409, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$409, DW_AT_decl_line(0x158)
	.dwattr $C$DW$409, DW_AT_decl_column(0x02)
$C$DW$410	.dwtag  DW_TAG_member
	.dwattr $C$DW$410, DW_AT_type(*$C$DW$T$237)
	.dwattr $C$DW$410, DW_AT_name("$P$T26")
	.dwattr $C$DW$410, DW_AT_TI_symbol_name("$P$T26")
	.dwattr $C$DW$410, DW_AT_data_member_location[DW_OP_plus_uconst 0x41c]
	.dwattr $C$DW$410, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$410, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$410, DW_AT_decl_line(0x169)
	.dwattr $C$DW$410, DW_AT_decl_column(0x02)
$C$DW$411	.dwtag  DW_TAG_member
	.dwattr $C$DW$411, DW_AT_type(*$C$DW$T$239)
	.dwattr $C$DW$411, DW_AT_name("$P$T27")
	.dwattr $C$DW$411, DW_AT_TI_symbol_name("$P$T27")
	.dwattr $C$DW$411, DW_AT_data_member_location[DW_OP_plus_uconst 0x420]
	.dwattr $C$DW$411, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$411, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$411, DW_AT_decl_line(0x17a)
	.dwattr $C$DW$411, DW_AT_decl_column(0x02)
$C$DW$412	.dwtag  DW_TAG_member
	.dwattr $C$DW$412, DW_AT_type(*$C$DW$T$241)
	.dwattr $C$DW$412, DW_AT_name("$P$T28")
	.dwattr $C$DW$412, DW_AT_TI_symbol_name("$P$T28")
	.dwattr $C$DW$412, DW_AT_data_member_location[DW_OP_plus_uconst 0x424]
	.dwattr $C$DW$412, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$412, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$412, DW_AT_decl_line(0x18b)
	.dwattr $C$DW$412, DW_AT_decl_column(0x02)
$C$DW$413	.dwtag  DW_TAG_member
	.dwattr $C$DW$413, DW_AT_type(*$C$DW$T$243)
	.dwattr $C$DW$413, DW_AT_name("$P$T29")
	.dwattr $C$DW$413, DW_AT_TI_symbol_name("$P$T29")
	.dwattr $C$DW$413, DW_AT_data_member_location[DW_OP_plus_uconst 0x428]
	.dwattr $C$DW$413, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$413, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$413, DW_AT_decl_line(0x19c)
	.dwattr $C$DW$413, DW_AT_decl_column(0x02)
$C$DW$414	.dwtag  DW_TAG_member
	.dwattr $C$DW$414, DW_AT_type(*$C$DW$T$245)
	.dwattr $C$DW$414, DW_AT_name("$P$T30")
	.dwattr $C$DW$414, DW_AT_TI_symbol_name("$P$T30")
	.dwattr $C$DW$414, DW_AT_data_member_location[DW_OP_plus_uconst 0x42c]
	.dwattr $C$DW$414, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$414, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$414, DW_AT_decl_line(0x1ad)
	.dwattr $C$DW$414, DW_AT_decl_column(0x02)
$C$DW$415	.dwtag  DW_TAG_member
	.dwattr $C$DW$415, DW_AT_type(*$C$DW$T$247)
	.dwattr $C$DW$415, DW_AT_name("$P$T31")
	.dwattr $C$DW$415, DW_AT_TI_symbol_name("$P$T31")
	.dwattr $C$DW$415, DW_AT_data_member_location[DW_OP_plus_uconst 0x430]
	.dwattr $C$DW$415, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$415, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$415, DW_AT_decl_line(0x1be)
	.dwattr $C$DW$415, DW_AT_decl_column(0x02)
$C$DW$416	.dwtag  DW_TAG_member
	.dwattr $C$DW$416, DW_AT_type(*$C$DW$T$249)
	.dwattr $C$DW$416, DW_AT_name("$P$T32")
	.dwattr $C$DW$416, DW_AT_TI_symbol_name("$P$T32")
	.dwattr $C$DW$416, DW_AT_data_member_location[DW_OP_plus_uconst 0x434]
	.dwattr $C$DW$416, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$416, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$416, DW_AT_decl_line(0x1cf)
	.dwattr $C$DW$416, DW_AT_decl_column(0x02)
$C$DW$417	.dwtag  DW_TAG_member
	.dwattr $C$DW$417, DW_AT_type(*$C$DW$T$251)
	.dwattr $C$DW$417, DW_AT_name("$P$T33")
	.dwattr $C$DW$417, DW_AT_TI_symbol_name("$P$T33")
	.dwattr $C$DW$417, DW_AT_data_member_location[DW_OP_plus_uconst 0x438]
	.dwattr $C$DW$417, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$417, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$417, DW_AT_decl_line(0x1e0)
	.dwattr $C$DW$417, DW_AT_decl_column(0x02)
$C$DW$418	.dwtag  DW_TAG_member
	.dwattr $C$DW$418, DW_AT_type(*$C$DW$T$253)
	.dwattr $C$DW$418, DW_AT_name("$P$T34")
	.dwattr $C$DW$418, DW_AT_TI_symbol_name("$P$T34")
	.dwattr $C$DW$418, DW_AT_data_member_location[DW_OP_plus_uconst 0x43c]
	.dwattr $C$DW$418, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$418, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$418, DW_AT_decl_line(0x1f1)
	.dwattr $C$DW$418, DW_AT_decl_column(0x02)
$C$DW$419	.dwtag  DW_TAG_member
	.dwattr $C$DW$419, DW_AT_type(*$C$DW$T$87)
	.dwattr $C$DW$419, DW_AT_name("rsvd440")
	.dwattr $C$DW$419, DW_AT_TI_symbol_name("rsvd440")
	.dwattr $C$DW$419, DW_AT_data_member_location[DW_OP_plus_uconst 0x440]
	.dwattr $C$DW$419, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$419, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$419, DW_AT_decl_line(0x201)
	.dwattr $C$DW$419, DW_AT_decl_column(0x0b)
$C$DW$420	.dwtag  DW_TAG_member
	.dwattr $C$DW$420, DW_AT_type(*$C$DW$T$255)
	.dwattr $C$DW$420, DW_AT_name("$P$T35")
	.dwattr $C$DW$420, DW_AT_TI_symbol_name("$P$T35")
	.dwattr $C$DW$420, DW_AT_data_member_location[DW_OP_plus_uconst 0x800]
	.dwattr $C$DW$420, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$420, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$420, DW_AT_decl_line(0x205)
	.dwattr $C$DW$420, DW_AT_decl_column(0x02)
$C$DW$421	.dwtag  DW_TAG_member
	.dwattr $C$DW$421, DW_AT_type(*$C$DW$T$257)
	.dwattr $C$DW$421, DW_AT_name("$P$T36")
	.dwattr $C$DW$421, DW_AT_TI_symbol_name("$P$T36")
	.dwattr $C$DW$421, DW_AT_data_member_location[DW_OP_plus_uconst 0x804]
	.dwattr $C$DW$421, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$421, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$421, DW_AT_decl_line(0x216)
	.dwattr $C$DW$421, DW_AT_decl_column(0x02)
$C$DW$422	.dwtag  DW_TAG_member
	.dwattr $C$DW$422, DW_AT_type(*$C$DW$T$259)
	.dwattr $C$DW$422, DW_AT_name("$P$T37")
	.dwattr $C$DW$422, DW_AT_TI_symbol_name("$P$T37")
	.dwattr $C$DW$422, DW_AT_data_member_location[DW_OP_plus_uconst 0x808]
	.dwattr $C$DW$422, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$422, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$422, DW_AT_decl_line(0x227)
	.dwattr $C$DW$422, DW_AT_decl_column(0x02)
$C$DW$423	.dwtag  DW_TAG_member
	.dwattr $C$DW$423, DW_AT_type(*$C$DW$T$88)
	.dwattr $C$DW$423, DW_AT_name("rsvd80C")
	.dwattr $C$DW$423, DW_AT_TI_symbol_name("rsvd80C")
	.dwattr $C$DW$423, DW_AT_data_member_location[DW_OP_plus_uconst 0x80c]
	.dwattr $C$DW$423, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$423, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$423, DW_AT_decl_line(0x233)
	.dwattr $C$DW$423, DW_AT_decl_column(0x0b)
$C$DW$424	.dwtag  DW_TAG_member
	.dwattr $C$DW$424, DW_AT_type(*$C$DW$T$261)
	.dwattr $C$DW$424, DW_AT_name("$P$T38")
	.dwattr $C$DW$424, DW_AT_TI_symbol_name("$P$T38")
	.dwattr $C$DW$424, DW_AT_data_member_location[DW_OP_plus_uconst 0x900]
	.dwattr $C$DW$424, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$424, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$424, DW_AT_decl_line(0x237)
	.dwattr $C$DW$424, DW_AT_decl_column(0x02)
$C$DW$425	.dwtag  DW_TAG_member
	.dwattr $C$DW$425, DW_AT_type(*$C$DW$T$263)
	.dwattr $C$DW$425, DW_AT_name("$P$T39")
	.dwattr $C$DW$425, DW_AT_TI_symbol_name("$P$T39")
	.dwattr $C$DW$425, DW_AT_data_member_location[DW_OP_plus_uconst 0x904]
	.dwattr $C$DW$425, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$425, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$425, DW_AT_decl_line(0x243)
	.dwattr $C$DW$425, DW_AT_decl_column(0x02)
$C$DW$426	.dwtag  DW_TAG_member
	.dwattr $C$DW$426, DW_AT_type(*$C$DW$T$265)
	.dwattr $C$DW$426, DW_AT_name("$P$T40")
	.dwattr $C$DW$426, DW_AT_TI_symbol_name("$P$T40")
	.dwattr $C$DW$426, DW_AT_data_member_location[DW_OP_plus_uconst 0x908]
	.dwattr $C$DW$426, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$426, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$426, DW_AT_decl_line(0x24f)
	.dwattr $C$DW$426, DW_AT_decl_column(0x02)
$C$DW$427	.dwtag  DW_TAG_member
	.dwattr $C$DW$427, DW_AT_type(*$C$DW$T$267)
	.dwattr $C$DW$427, DW_AT_name("$P$T41")
	.dwattr $C$DW$427, DW_AT_TI_symbol_name("$P$T41")
	.dwattr $C$DW$427, DW_AT_data_member_location[DW_OP_plus_uconst 0x90c]
	.dwattr $C$DW$427, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$427, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$427, DW_AT_decl_line(0x25b)
	.dwattr $C$DW$427, DW_AT_decl_column(0x02)
$C$DW$428	.dwtag  DW_TAG_member
	.dwattr $C$DW$428, DW_AT_type(*$C$DW$T$269)
	.dwattr $C$DW$428, DW_AT_name("$P$T42")
	.dwattr $C$DW$428, DW_AT_TI_symbol_name("$P$T42")
	.dwattr $C$DW$428, DW_AT_data_member_location[DW_OP_plus_uconst 0x910]
	.dwattr $C$DW$428, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$428, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$428, DW_AT_decl_line(0x267)
	.dwattr $C$DW$428, DW_AT_decl_column(0x02)
$C$DW$429	.dwtag  DW_TAG_member
	.dwattr $C$DW$429, DW_AT_type(*$C$DW$T$271)
	.dwattr $C$DW$429, DW_AT_name("$P$T43")
	.dwattr $C$DW$429, DW_AT_TI_symbol_name("$P$T43")
	.dwattr $C$DW$429, DW_AT_data_member_location[DW_OP_plus_uconst 0x914]
	.dwattr $C$DW$429, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$429, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$429, DW_AT_decl_line(0x273)
	.dwattr $C$DW$429, DW_AT_decl_column(0x02)
$C$DW$430	.dwtag  DW_TAG_member
	.dwattr $C$DW$430, DW_AT_type(*$C$DW$T$273)
	.dwattr $C$DW$430, DW_AT_name("$P$T44")
	.dwattr $C$DW$430, DW_AT_TI_symbol_name("$P$T44")
	.dwattr $C$DW$430, DW_AT_data_member_location[DW_OP_plus_uconst 0x918]
	.dwattr $C$DW$430, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$430, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$430, DW_AT_decl_line(0x27f)
	.dwattr $C$DW$430, DW_AT_decl_column(0x02)
$C$DW$431	.dwtag  DW_TAG_member
	.dwattr $C$DW$431, DW_AT_type(*$C$DW$T$275)
	.dwattr $C$DW$431, DW_AT_name("$P$T45")
	.dwattr $C$DW$431, DW_AT_TI_symbol_name("$P$T45")
	.dwattr $C$DW$431, DW_AT_data_member_location[DW_OP_plus_uconst 0x91c]
	.dwattr $C$DW$431, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$431, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$431, DW_AT_decl_line(0x28b)
	.dwattr $C$DW$431, DW_AT_decl_column(0x02)
$C$DW$432	.dwtag  DW_TAG_member
	.dwattr $C$DW$432, DW_AT_type(*$C$DW$T$277)
	.dwattr $C$DW$432, DW_AT_name("$P$T46")
	.dwattr $C$DW$432, DW_AT_TI_symbol_name("$P$T46")
	.dwattr $C$DW$432, DW_AT_data_member_location[DW_OP_plus_uconst 0x920]
	.dwattr $C$DW$432, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$432, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$432, DW_AT_decl_line(0x297)
	.dwattr $C$DW$432, DW_AT_decl_column(0x02)
$C$DW$433	.dwtag  DW_TAG_member
	.dwattr $C$DW$433, DW_AT_type(*$C$DW$T$279)
	.dwattr $C$DW$433, DW_AT_name("$P$T47")
	.dwattr $C$DW$433, DW_AT_TI_symbol_name("$P$T47")
	.dwattr $C$DW$433, DW_AT_data_member_location[DW_OP_plus_uconst 0x924]
	.dwattr $C$DW$433, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$433, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$433, DW_AT_decl_line(0x2a3)
	.dwattr $C$DW$433, DW_AT_decl_column(0x02)
$C$DW$434	.dwtag  DW_TAG_member
	.dwattr $C$DW$434, DW_AT_type(*$C$DW$T$89)
	.dwattr $C$DW$434, DW_AT_name("rsvd928")
	.dwattr $C$DW$434, DW_AT_TI_symbol_name("rsvd928")
	.dwattr $C$DW$434, DW_AT_data_member_location[DW_OP_plus_uconst 0x928]
	.dwattr $C$DW$434, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$434, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$434, DW_AT_decl_line(0x2ae)
	.dwattr $C$DW$434, DW_AT_decl_column(0x0b)
$C$DW$435	.dwtag  DW_TAG_member
	.dwattr $C$DW$435, DW_AT_type(*$C$DW$T$281)
	.dwattr $C$DW$435, DW_AT_name("$P$T48")
	.dwattr $C$DW$435, DW_AT_TI_symbol_name("$P$T48")
	.dwattr $C$DW$435, DW_AT_data_member_location[DW_OP_plus_uconst 0xd00]
	.dwattr $C$DW$435, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$435, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$435, DW_AT_decl_line(0x2b2)
	.dwattr $C$DW$435, DW_AT_decl_column(0x02)
$C$DW$436	.dwtag  DW_TAG_member
	.dwattr $C$DW$436, DW_AT_type(*$C$DW$T$283)
	.dwattr $C$DW$436, DW_AT_name("$P$T49")
	.dwattr $C$DW$436, DW_AT_TI_symbol_name("$P$T49")
	.dwattr $C$DW$436, DW_AT_data_member_location[DW_OP_plus_uconst 0xd04]
	.dwattr $C$DW$436, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$436, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$436, DW_AT_decl_line(0x2bc)
	.dwattr $C$DW$436, DW_AT_decl_column(0x02)
$C$DW$437	.dwtag  DW_TAG_member
	.dwattr $C$DW$437, DW_AT_type(*$C$DW$T$86)
	.dwattr $C$DW$437, DW_AT_name("rsvdD08")
	.dwattr $C$DW$437, DW_AT_TI_symbol_name("rsvdD08")
	.dwattr $C$DW$437, DW_AT_data_member_location[DW_OP_plus_uconst 0xd08]
	.dwattr $C$DW$437, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$437, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$437, DW_AT_decl_line(0x2c5)
	.dwattr $C$DW$437, DW_AT_decl_column(0x0b)
$C$DW$438	.dwtag  DW_TAG_member
	.dwattr $C$DW$438, DW_AT_type(*$C$DW$T$285)
	.dwattr $C$DW$438, DW_AT_name("$P$T50")
	.dwattr $C$DW$438, DW_AT_TI_symbol_name("$P$T50")
	.dwattr $C$DW$438, DW_AT_data_member_location[DW_OP_plus_uconst 0xd80]
	.dwattr $C$DW$438, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$438, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$438, DW_AT_decl_line(0x2c9)
	.dwattr $C$DW$438, DW_AT_decl_column(0x02)
$C$DW$439	.dwtag  DW_TAG_member
	.dwattr $C$DW$439, DW_AT_type(*$C$DW$T$287)
	.dwattr $C$DW$439, DW_AT_name("$P$T51")
	.dwattr $C$DW$439, DW_AT_TI_symbol_name("$P$T51")
	.dwattr $C$DW$439, DW_AT_data_member_location[DW_OP_plus_uconst 0xd84]
	.dwattr $C$DW$439, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$439, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$439, DW_AT_decl_line(0x2d3)
	.dwattr $C$DW$439, DW_AT_decl_column(0x02)
$C$DW$440	.dwtag  DW_TAG_member
	.dwattr $C$DW$440, DW_AT_type(*$C$DW$T$90)
	.dwattr $C$DW$440, DW_AT_name("rsvdD84")
	.dwattr $C$DW$440, DW_AT_TI_symbol_name("rsvdD84")
	.dwattr $C$DW$440, DW_AT_data_member_location[DW_OP_plus_uconst 0xd88]
	.dwattr $C$DW$440, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$440, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$440, DW_AT_decl_line(0x2dc)
	.dwattr $C$DW$440, DW_AT_decl_column(0x0b)
$C$DW$441	.dwtag  DW_TAG_member
	.dwattr $C$DW$441, DW_AT_type(*$C$DW$T$289)
	.dwattr $C$DW$441, DW_AT_name("$P$T52")
	.dwattr $C$DW$441, DW_AT_TI_symbol_name("$P$T52")
	.dwattr $C$DW$441, DW_AT_data_member_location[DW_OP_plus_uconst 0x1100]
	.dwattr $C$DW$441, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$441, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$441, DW_AT_decl_line(0x2e0)
	.dwattr $C$DW$441, DW_AT_decl_column(0x02)
$C$DW$442	.dwtag  DW_TAG_member
	.dwattr $C$DW$442, DW_AT_type(*$C$DW$T$291)
	.dwattr $C$DW$442, DW_AT_name("$P$T53")
	.dwattr $C$DW$442, DW_AT_TI_symbol_name("$P$T53")
	.dwattr $C$DW$442, DW_AT_data_member_location[DW_OP_plus_uconst 0x1104]
	.dwattr $C$DW$442, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$442, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$442, DW_AT_decl_line(0x2ec)
	.dwattr $C$DW$442, DW_AT_decl_column(0x02)
$C$DW$443	.dwtag  DW_TAG_member
	.dwattr $C$DW$443, DW_AT_type(*$C$DW$T$293)
	.dwattr $C$DW$443, DW_AT_name("$P$T54")
	.dwattr $C$DW$443, DW_AT_TI_symbol_name("$P$T54")
	.dwattr $C$DW$443, DW_AT_data_member_location[DW_OP_plus_uconst 0x1108]
	.dwattr $C$DW$443, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$443, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$443, DW_AT_decl_line(0x2f8)
	.dwattr $C$DW$443, DW_AT_decl_column(0x02)
$C$DW$444	.dwtag  DW_TAG_member
	.dwattr $C$DW$444, DW_AT_type(*$C$DW$T$295)
	.dwattr $C$DW$444, DW_AT_name("$P$T55")
	.dwattr $C$DW$444, DW_AT_TI_symbol_name("$P$T55")
	.dwattr $C$DW$444, DW_AT_data_member_location[DW_OP_plus_uconst 0x110c]
	.dwattr $C$DW$444, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$444, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$444, DW_AT_decl_line(0x304)
	.dwattr $C$DW$444, DW_AT_decl_column(0x02)
$C$DW$445	.dwtag  DW_TAG_member
	.dwattr $C$DW$445, DW_AT_type(*$C$DW$T$297)
	.dwattr $C$DW$445, DW_AT_name("$P$T56")
	.dwattr $C$DW$445, DW_AT_TI_symbol_name("$P$T56")
	.dwattr $C$DW$445, DW_AT_data_member_location[DW_OP_plus_uconst 0x1110]
	.dwattr $C$DW$445, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$445, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$445, DW_AT_decl_line(0x310)
	.dwattr $C$DW$445, DW_AT_decl_column(0x02)
$C$DW$446	.dwtag  DW_TAG_member
	.dwattr $C$DW$446, DW_AT_type(*$C$DW$T$299)
	.dwattr $C$DW$446, DW_AT_name("$P$T57")
	.dwattr $C$DW$446, DW_AT_TI_symbol_name("$P$T57")
	.dwattr $C$DW$446, DW_AT_data_member_location[DW_OP_plus_uconst 0x1114]
	.dwattr $C$DW$446, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$446, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$446, DW_AT_decl_line(0x31c)
	.dwattr $C$DW$446, DW_AT_decl_column(0x02)
$C$DW$447	.dwtag  DW_TAG_member
	.dwattr $C$DW$447, DW_AT_type(*$C$DW$T$301)
	.dwattr $C$DW$447, DW_AT_name("$P$T58")
	.dwattr $C$DW$447, DW_AT_TI_symbol_name("$P$T58")
	.dwattr $C$DW$447, DW_AT_data_member_location[DW_OP_plus_uconst 0x1118]
	.dwattr $C$DW$447, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$447, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$447, DW_AT_decl_line(0x328)
	.dwattr $C$DW$447, DW_AT_decl_column(0x02)
$C$DW$448	.dwtag  DW_TAG_member
	.dwattr $C$DW$448, DW_AT_type(*$C$DW$T$303)
	.dwattr $C$DW$448, DW_AT_name("$P$T59")
	.dwattr $C$DW$448, DW_AT_TI_symbol_name("$P$T59")
	.dwattr $C$DW$448, DW_AT_data_member_location[DW_OP_plus_uconst 0x111c]
	.dwattr $C$DW$448, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$448, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$448, DW_AT_decl_line(0x334)
	.dwattr $C$DW$448, DW_AT_decl_column(0x02)
$C$DW$449	.dwtag  DW_TAG_member
	.dwattr $C$DW$449, DW_AT_type(*$C$DW$T$305)
	.dwattr $C$DW$449, DW_AT_name("$P$T60")
	.dwattr $C$DW$449, DW_AT_TI_symbol_name("$P$T60")
	.dwattr $C$DW$449, DW_AT_data_member_location[DW_OP_plus_uconst 0x1120]
	.dwattr $C$DW$449, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$449, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$449, DW_AT_decl_line(0x340)
	.dwattr $C$DW$449, DW_AT_decl_column(0x02)
$C$DW$450	.dwtag  DW_TAG_member
	.dwattr $C$DW$450, DW_AT_type(*$C$DW$T$307)
	.dwattr $C$DW$450, DW_AT_name("$P$T61")
	.dwattr $C$DW$450, DW_AT_TI_symbol_name("$P$T61")
	.dwattr $C$DW$450, DW_AT_data_member_location[DW_OP_plus_uconst 0x1124]
	.dwattr $C$DW$450, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$450, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$450, DW_AT_decl_line(0x34c)
	.dwattr $C$DW$450, DW_AT_decl_column(0x02)
$C$DW$451	.dwtag  DW_TAG_member
	.dwattr $C$DW$451, DW_AT_type(*$C$DW$T$89)
	.dwattr $C$DW$451, DW_AT_name("rsvd1128")
	.dwattr $C$DW$451, DW_AT_TI_symbol_name("rsvd1128")
	.dwattr $C$DW$451, DW_AT_data_member_location[DW_OP_plus_uconst 0x1128]
	.dwattr $C$DW$451, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$451, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$451, DW_AT_decl_line(0x357)
	.dwattr $C$DW$451, DW_AT_decl_column(0x0b)
$C$DW$452	.dwtag  DW_TAG_member
	.dwattr $C$DW$452, DW_AT_type(*$C$DW$T$309)
	.dwattr $C$DW$452, DW_AT_name("$P$T62")
	.dwattr $C$DW$452, DW_AT_TI_symbol_name("$P$T62")
	.dwattr $C$DW$452, DW_AT_data_member_location[DW_OP_plus_uconst 0x1500]
	.dwattr $C$DW$452, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$452, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$452, DW_AT_decl_line(0x35b)
	.dwattr $C$DW$452, DW_AT_decl_column(0x02)
	.dwendtag $C$DW$T$91

	.dwattr $C$DW$T$91, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$91, DW_AT_decl_line(0x03)
	.dwattr $C$DW$T$91, DW_AT_decl_column(0x0f)
$C$DW$T$479	.dwtag  DW_TAG_typedef, DW_AT_name("pruIntc")
	.dwattr $C$DW$T$479, DW_AT_type(*$C$DW$T$91)
	.dwattr $C$DW$T$479, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$479, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$479, DW_AT_decl_line(0x364)
	.dwattr $C$DW$T$479, DW_AT_decl_column(0x03)
$C$DW$T$480	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$480, DW_AT_type(*$C$DW$T$479)

$C$DW$T$92	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$92, DW_AT_byte_size(0x04)
$C$DW$453	.dwtag  DW_TAG_member
	.dwattr $C$DW$453, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$453, DW_AT_name("REVID")
	.dwattr $C$DW$453, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$453, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$453, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$453, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$453, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$453, DW_AT_decl_line(0x0a)
	.dwattr $C$DW$453, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$92

	.dwattr $C$DW$T$92, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$92, DW_AT_decl_line(0x09)
	.dwattr $C$DW$T$92, DW_AT_decl_column(0x13)
$C$DW$T$310	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$310, DW_AT_type(*$C$DW$T$92)

$C$DW$T$93	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$93, DW_AT_byte_size(0x04)
$C$DW$454	.dwtag  DW_TAG_member
	.dwattr $C$DW$454, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$454, DW_AT_name("IDLE_MODE")
	.dwattr $C$DW$454, DW_AT_TI_symbol_name("IDLE_MODE")
	.dwattr $C$DW$454, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$454, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$454, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$454, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$454, DW_AT_decl_line(0x14)
	.dwattr $C$DW$454, DW_AT_decl_column(0x0d)
$C$DW$455	.dwtag  DW_TAG_member
	.dwattr $C$DW$455, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$455, DW_AT_name("STANDBY_MODE")
	.dwattr $C$DW$455, DW_AT_TI_symbol_name("STANDBY_MODE")
	.dwattr $C$DW$455, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x02)
	.dwattr $C$DW$455, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$455, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$455, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$455, DW_AT_decl_line(0x15)
	.dwattr $C$DW$455, DW_AT_decl_column(0x0d)
$C$DW$456	.dwtag  DW_TAG_member
	.dwattr $C$DW$456, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$456, DW_AT_name("STANDBY_INIT")
	.dwattr $C$DW$456, DW_AT_TI_symbol_name("STANDBY_INIT")
	.dwattr $C$DW$456, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$456, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$456, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$456, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$456, DW_AT_decl_line(0x16)
	.dwattr $C$DW$456, DW_AT_decl_column(0x0d)
$C$DW$457	.dwtag  DW_TAG_member
	.dwattr $C$DW$457, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$457, DW_AT_name("SUB_MWAIT")
	.dwattr $C$DW$457, DW_AT_TI_symbol_name("SUB_MWAIT")
	.dwattr $C$DW$457, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x01)
	.dwattr $C$DW$457, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$457, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$457, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$457, DW_AT_decl_line(0x17)
	.dwattr $C$DW$457, DW_AT_decl_column(0x0d)
$C$DW$458	.dwtag  DW_TAG_member
	.dwattr $C$DW$458, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$458, DW_AT_name("rsvd6")
	.dwattr $C$DW$458, DW_AT_TI_symbol_name("rsvd6")
	.dwattr $C$DW$458, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1a)
	.dwattr $C$DW$458, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$458, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$458, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$458, DW_AT_decl_line(0x18)
	.dwattr $C$DW$458, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$93

	.dwattr $C$DW$T$93, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$93, DW_AT_decl_line(0x13)
	.dwattr $C$DW$T$93, DW_AT_decl_column(0x12)
$C$DW$T$312	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$312, DW_AT_type(*$C$DW$T$93)

$C$DW$T$94	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$94, DW_AT_byte_size(0x04)
$C$DW$459	.dwtag  DW_TAG_member
	.dwattr $C$DW$459, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$459, DW_AT_name("PRU0_GPI_MODE")
	.dwattr $C$DW$459, DW_AT_TI_symbol_name("PRU0_GPI_MODE")
	.dwattr $C$DW$459, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$459, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$459, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$459, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$459, DW_AT_decl_line(0x22)
	.dwattr $C$DW$459, DW_AT_decl_column(0x0d)
$C$DW$460	.dwtag  DW_TAG_member
	.dwattr $C$DW$460, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$460, DW_AT_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$460, DW_AT_TI_symbol_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$460, DW_AT_bit_offset(0x1d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$460, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$460, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$460, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$460, DW_AT_decl_line(0x23)
	.dwattr $C$DW$460, DW_AT_decl_column(0x0d)
$C$DW$461	.dwtag  DW_TAG_member
	.dwattr $C$DW$461, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$461, DW_AT_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$461, DW_AT_TI_symbol_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$461, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x05)
	.dwattr $C$DW$461, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$461, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$461, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$461, DW_AT_decl_line(0x24)
	.dwattr $C$DW$461, DW_AT_decl_column(0x0d)
$C$DW$462	.dwtag  DW_TAG_member
	.dwattr $C$DW$462, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$462, DW_AT_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$462, DW_AT_TI_symbol_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$462, DW_AT_bit_offset(0x13), DW_AT_bit_size(0x05)
	.dwattr $C$DW$462, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$462, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$462, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$462, DW_AT_decl_line(0x25)
	.dwattr $C$DW$462, DW_AT_decl_column(0x0d)
$C$DW$463	.dwtag  DW_TAG_member
	.dwattr $C$DW$463, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$463, DW_AT_name("PRU0_GPI_SB")
	.dwattr $C$DW$463, DW_AT_TI_symbol_name("PRU0_GPI_SB")
	.dwattr $C$DW$463, DW_AT_bit_offset(0x12), DW_AT_bit_size(0x01)
	.dwattr $C$DW$463, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$463, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$463, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$463, DW_AT_decl_line(0x26)
	.dwattr $C$DW$463, DW_AT_decl_column(0x0d)
$C$DW$464	.dwtag  DW_TAG_member
	.dwattr $C$DW$464, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$464, DW_AT_name("PRU0_GPO_MODE")
	.dwattr $C$DW$464, DW_AT_TI_symbol_name("PRU0_GPO_MODE")
	.dwattr $C$DW$464, DW_AT_bit_offset(0x11), DW_AT_bit_size(0x01)
	.dwattr $C$DW$464, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$464, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$464, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$464, DW_AT_decl_line(0x27)
	.dwattr $C$DW$464, DW_AT_decl_column(0x0d)
$C$DW$465	.dwtag  DW_TAG_member
	.dwattr $C$DW$465, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$465, DW_AT_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$465, DW_AT_TI_symbol_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$465, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x05)
	.dwattr $C$DW$465, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$465, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$465, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$465, DW_AT_decl_line(0x28)
	.dwattr $C$DW$465, DW_AT_decl_column(0x0d)
$C$DW$466	.dwtag  DW_TAG_member
	.dwattr $C$DW$466, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$466, DW_AT_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$466, DW_AT_TI_symbol_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$466, DW_AT_bit_offset(0x07), DW_AT_bit_size(0x05)
	.dwattr $C$DW$466, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$466, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$466, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$466, DW_AT_decl_line(0x29)
	.dwattr $C$DW$466, DW_AT_decl_column(0x0d)
$C$DW$467	.dwtag  DW_TAG_member
	.dwattr $C$DW$467, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$467, DW_AT_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$467, DW_AT_TI_symbol_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$467, DW_AT_bit_offset(0x06), DW_AT_bit_size(0x01)
	.dwattr $C$DW$467, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$467, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$467, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$467, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$467, DW_AT_decl_column(0x0d)
$C$DW$468	.dwtag  DW_TAG_member
	.dwattr $C$DW$468, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$468, DW_AT_name("rsvd26")
	.dwattr $C$DW$468, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$468, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x06)
	.dwattr $C$DW$468, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$468, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$468, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$468, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$468, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$94

	.dwattr $C$DW$T$94, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$94, DW_AT_decl_line(0x21)
	.dwattr $C$DW$T$94, DW_AT_decl_column(0x12)
$C$DW$T$314	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$314, DW_AT_type(*$C$DW$T$94)

$C$DW$T$95	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$95, DW_AT_byte_size(0x04)
$C$DW$469	.dwtag  DW_TAG_member
	.dwattr $C$DW$469, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$469, DW_AT_name("PRU1_GPI_MODE")
	.dwattr $C$DW$469, DW_AT_TI_symbol_name("PRU1_GPI_MODE")
	.dwattr $C$DW$469, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$469, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$469, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$469, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$469, DW_AT_decl_line(0x35)
	.dwattr $C$DW$469, DW_AT_decl_column(0x0d)
$C$DW$470	.dwtag  DW_TAG_member
	.dwattr $C$DW$470, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$470, DW_AT_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$470, DW_AT_TI_symbol_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$470, DW_AT_bit_offset(0x1d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$470, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$470, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$470, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$470, DW_AT_decl_line(0x36)
	.dwattr $C$DW$470, DW_AT_decl_column(0x0d)
$C$DW$471	.dwtag  DW_TAG_member
	.dwattr $C$DW$471, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$471, DW_AT_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$471, DW_AT_TI_symbol_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$471, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x05)
	.dwattr $C$DW$471, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$471, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$471, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$471, DW_AT_decl_line(0x37)
	.dwattr $C$DW$471, DW_AT_decl_column(0x0d)
$C$DW$472	.dwtag  DW_TAG_member
	.dwattr $C$DW$472, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$472, DW_AT_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$472, DW_AT_TI_symbol_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$472, DW_AT_bit_offset(0x13), DW_AT_bit_size(0x05)
	.dwattr $C$DW$472, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$472, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$472, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$472, DW_AT_decl_line(0x38)
	.dwattr $C$DW$472, DW_AT_decl_column(0x0d)
$C$DW$473	.dwtag  DW_TAG_member
	.dwattr $C$DW$473, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$473, DW_AT_name("PRU1_GPI_SB")
	.dwattr $C$DW$473, DW_AT_TI_symbol_name("PRU1_GPI_SB")
	.dwattr $C$DW$473, DW_AT_bit_offset(0x12), DW_AT_bit_size(0x01)
	.dwattr $C$DW$473, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$473, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$473, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$473, DW_AT_decl_line(0x39)
	.dwattr $C$DW$473, DW_AT_decl_column(0x0d)
$C$DW$474	.dwtag  DW_TAG_member
	.dwattr $C$DW$474, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$474, DW_AT_name("PRU1_GPO_MODE")
	.dwattr $C$DW$474, DW_AT_TI_symbol_name("PRU1_GPO_MODE")
	.dwattr $C$DW$474, DW_AT_bit_offset(0x11), DW_AT_bit_size(0x01)
	.dwattr $C$DW$474, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$474, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$474, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$474, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$474, DW_AT_decl_column(0x0d)
$C$DW$475	.dwtag  DW_TAG_member
	.dwattr $C$DW$475, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$475, DW_AT_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$475, DW_AT_TI_symbol_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$475, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x05)
	.dwattr $C$DW$475, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$475, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$475, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$475, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$475, DW_AT_decl_column(0x0d)
$C$DW$476	.dwtag  DW_TAG_member
	.dwattr $C$DW$476, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$476, DW_AT_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$476, DW_AT_TI_symbol_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$476, DW_AT_bit_offset(0x07), DW_AT_bit_size(0x05)
	.dwattr $C$DW$476, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$476, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$476, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$476, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$476, DW_AT_decl_column(0x0d)
$C$DW$477	.dwtag  DW_TAG_member
	.dwattr $C$DW$477, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$477, DW_AT_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$477, DW_AT_TI_symbol_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$477, DW_AT_bit_offset(0x06), DW_AT_bit_size(0x01)
	.dwattr $C$DW$477, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$477, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$477, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$477, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$477, DW_AT_decl_column(0x0d)
$C$DW$478	.dwtag  DW_TAG_member
	.dwattr $C$DW$478, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$478, DW_AT_name("rsvd26")
	.dwattr $C$DW$478, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$478, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x06)
	.dwattr $C$DW$478, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$478, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$478, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$478, DW_AT_decl_line(0x3e)
	.dwattr $C$DW$478, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$95

	.dwattr $C$DW$T$95, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$95, DW_AT_decl_line(0x34)
	.dwattr $C$DW$T$95, DW_AT_decl_column(0x12)
$C$DW$T$316	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$316, DW_AT_type(*$C$DW$T$95)

$C$DW$T$96	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$96, DW_AT_byte_size(0x04)
$C$DW$479	.dwtag  DW_TAG_member
	.dwattr $C$DW$479, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$479, DW_AT_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$479, DW_AT_TI_symbol_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$479, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$479, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$479, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$479, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$479, DW_AT_decl_line(0x48)
	.dwattr $C$DW$479, DW_AT_decl_column(0x0d)
$C$DW$480	.dwtag  DW_TAG_member
	.dwattr $C$DW$480, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$480, DW_AT_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$480, DW_AT_TI_symbol_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$480, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x01)
	.dwattr $C$DW$480, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$480, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$480, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$480, DW_AT_decl_line(0x49)
	.dwattr $C$DW$480, DW_AT_decl_column(0x0d)
$C$DW$481	.dwtag  DW_TAG_member
	.dwattr $C$DW$481, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$481, DW_AT_name("PRU0_CLK_EN")
	.dwattr $C$DW$481, DW_AT_TI_symbol_name("PRU0_CLK_EN")
	.dwattr $C$DW$481, DW_AT_bit_offset(0x1d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$481, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$481, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$481, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$481, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$481, DW_AT_decl_column(0x0d)
$C$DW$482	.dwtag  DW_TAG_member
	.dwattr $C$DW$482, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$482, DW_AT_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$482, DW_AT_TI_symbol_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$482, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x01)
	.dwattr $C$DW$482, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$482, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$482, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$482, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$482, DW_AT_decl_column(0x0d)
$C$DW$483	.dwtag  DW_TAG_member
	.dwattr $C$DW$483, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$483, DW_AT_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$483, DW_AT_TI_symbol_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$483, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$483, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$483, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$483, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$483, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$483, DW_AT_decl_column(0x0d)
$C$DW$484	.dwtag  DW_TAG_member
	.dwattr $C$DW$484, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$484, DW_AT_name("PRU1_CLK_EN")
	.dwattr $C$DW$484, DW_AT_TI_symbol_name("PRU1_CLK_EN")
	.dwattr $C$DW$484, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x01)
	.dwattr $C$DW$484, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$484, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$484, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$484, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$484, DW_AT_decl_column(0x0d)
$C$DW$485	.dwtag  DW_TAG_member
	.dwattr $C$DW$485, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$485, DW_AT_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$485, DW_AT_TI_symbol_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$485, DW_AT_bit_offset(0x19), DW_AT_bit_size(0x01)
	.dwattr $C$DW$485, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$485, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$485, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$485, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$485, DW_AT_decl_column(0x0d)
$C$DW$486	.dwtag  DW_TAG_member
	.dwattr $C$DW$486, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$486, DW_AT_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$486, DW_AT_TI_symbol_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$486, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x01)
	.dwattr $C$DW$486, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$486, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$486, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$486, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$486, DW_AT_decl_column(0x0d)
$C$DW$487	.dwtag  DW_TAG_member
	.dwattr $C$DW$487, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$487, DW_AT_name("INTC_CLK_EN")
	.dwattr $C$DW$487, DW_AT_TI_symbol_name("INTC_CLK_EN")
	.dwattr $C$DW$487, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x01)
	.dwattr $C$DW$487, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$487, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$487, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$487, DW_AT_decl_line(0x50)
	.dwattr $C$DW$487, DW_AT_decl_column(0x0d)
$C$DW$488	.dwtag  DW_TAG_member
	.dwattr $C$DW$488, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$488, DW_AT_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$488, DW_AT_TI_symbol_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$488, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x01)
	.dwattr $C$DW$488, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$488, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$488, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$488, DW_AT_decl_line(0x51)
	.dwattr $C$DW$488, DW_AT_decl_column(0x0d)
$C$DW$489	.dwtag  DW_TAG_member
	.dwattr $C$DW$489, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$489, DW_AT_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$489, DW_AT_TI_symbol_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$489, DW_AT_bit_offset(0x15), DW_AT_bit_size(0x01)
	.dwattr $C$DW$489, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$489, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$489, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$489, DW_AT_decl_line(0x52)
	.dwattr $C$DW$489, DW_AT_decl_column(0x0d)
$C$DW$490	.dwtag  DW_TAG_member
	.dwattr $C$DW$490, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$490, DW_AT_name("UART_CLK_EN")
	.dwattr $C$DW$490, DW_AT_TI_symbol_name("UART_CLK_EN")
	.dwattr $C$DW$490, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x01)
	.dwattr $C$DW$490, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$490, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$490, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$490, DW_AT_decl_line(0x53)
	.dwattr $C$DW$490, DW_AT_decl_column(0x0d)
$C$DW$491	.dwtag  DW_TAG_member
	.dwattr $C$DW$491, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$491, DW_AT_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$491, DW_AT_TI_symbol_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$491, DW_AT_bit_offset(0x13), DW_AT_bit_size(0x01)
	.dwattr $C$DW$491, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$491, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$491, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$491, DW_AT_decl_line(0x54)
	.dwattr $C$DW$491, DW_AT_decl_column(0x0d)
$C$DW$492	.dwtag  DW_TAG_member
	.dwattr $C$DW$492, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$492, DW_AT_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$492, DW_AT_TI_symbol_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$492, DW_AT_bit_offset(0x12), DW_AT_bit_size(0x01)
	.dwattr $C$DW$492, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$492, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$492, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$492, DW_AT_decl_line(0x55)
	.dwattr $C$DW$492, DW_AT_decl_column(0x0d)
$C$DW$493	.dwtag  DW_TAG_member
	.dwattr $C$DW$493, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$493, DW_AT_name("ECAP_CLK_EN")
	.dwattr $C$DW$493, DW_AT_TI_symbol_name("ECAP_CLK_EN")
	.dwattr $C$DW$493, DW_AT_bit_offset(0x11), DW_AT_bit_size(0x01)
	.dwattr $C$DW$493, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$493, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$493, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$493, DW_AT_decl_line(0x56)
	.dwattr $C$DW$493, DW_AT_decl_column(0x0d)
$C$DW$494	.dwtag  DW_TAG_member
	.dwattr $C$DW$494, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$494, DW_AT_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$494, DW_AT_TI_symbol_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$494, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x01)
	.dwattr $C$DW$494, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$494, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$494, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$494, DW_AT_decl_line(0x57)
	.dwattr $C$DW$494, DW_AT_decl_column(0x0d)
$C$DW$495	.dwtag  DW_TAG_member
	.dwattr $C$DW$495, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$495, DW_AT_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$495, DW_AT_TI_symbol_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$495, DW_AT_bit_offset(0x0f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$495, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$495, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$495, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$495, DW_AT_decl_line(0x58)
	.dwattr $C$DW$495, DW_AT_decl_column(0x0d)
$C$DW$496	.dwtag  DW_TAG_member
	.dwattr $C$DW$496, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$496, DW_AT_name("IEP_CLK_EN")
	.dwattr $C$DW$496, DW_AT_TI_symbol_name("IEP_CLK_EN")
	.dwattr $C$DW$496, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x01)
	.dwattr $C$DW$496, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$496, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$496, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$496, DW_AT_decl_line(0x59)
	.dwattr $C$DW$496, DW_AT_decl_column(0x0d)
$C$DW$497	.dwtag  DW_TAG_member
	.dwattr $C$DW$497, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$497, DW_AT_name("rsvd18")
	.dwattr $C$DW$497, DW_AT_TI_symbol_name("rsvd18")
	.dwattr $C$DW$497, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$497, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$497, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$497, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$497, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$497, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$96

	.dwattr $C$DW$T$96, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$96, DW_AT_decl_line(0x47)
	.dwattr $C$DW$T$96, DW_AT_decl_column(0x12)
$C$DW$T$318	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$318, DW_AT_type(*$C$DW$T$96)

$C$DW$T$97	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$97, DW_AT_byte_size(0x04)
$C$DW$498	.dwtag  DW_TAG_member
	.dwattr $C$DW$498, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$498, DW_AT_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$498, DW_AT_TI_symbol_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$498, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$498, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$498, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$498, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$498, DW_AT_decl_line(0x64)
	.dwattr $C$DW$498, DW_AT_decl_column(0x0d)
$C$DW$499	.dwtag  DW_TAG_member
	.dwattr $C$DW$499, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$499, DW_AT_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$499, DW_AT_TI_symbol_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$499, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$499, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$499, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$499, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$499, DW_AT_decl_line(0x65)
	.dwattr $C$DW$499, DW_AT_decl_column(0x0d)
$C$DW$500	.dwtag  DW_TAG_member
	.dwattr $C$DW$500, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$500, DW_AT_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$500, DW_AT_TI_symbol_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$500, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$500, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$500, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$500, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$500, DW_AT_decl_line(0x66)
	.dwattr $C$DW$500, DW_AT_decl_column(0x0d)
$C$DW$501	.dwtag  DW_TAG_member
	.dwattr $C$DW$501, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$501, DW_AT_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$501, DW_AT_TI_symbol_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$501, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$501, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$501, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$501, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$501, DW_AT_decl_line(0x67)
	.dwattr $C$DW$501, DW_AT_decl_column(0x0d)
$C$DW$502	.dwtag  DW_TAG_member
	.dwattr $C$DW$502, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$502, DW_AT_name("RAM_PE_RAW")
	.dwattr $C$DW$502, DW_AT_TI_symbol_name("RAM_PE_RAW")
	.dwattr $C$DW$502, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$502, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$502, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$502, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$502, DW_AT_decl_line(0x68)
	.dwattr $C$DW$502, DW_AT_decl_column(0x0d)
$C$DW$503	.dwtag  DW_TAG_member
	.dwattr $C$DW$503, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$503, DW_AT_name("rsvd20")
	.dwattr $C$DW$503, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$503, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0c)
	.dwattr $C$DW$503, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$503, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$503, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$503, DW_AT_decl_line(0x69)
	.dwattr $C$DW$503, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$97

	.dwattr $C$DW$T$97, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$97, DW_AT_decl_line(0x63)
	.dwattr $C$DW$T$97, DW_AT_decl_column(0x13)
$C$DW$T$320	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$320, DW_AT_type(*$C$DW$T$97)

$C$DW$T$98	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$98, DW_AT_byte_size(0x04)
$C$DW$504	.dwtag  DW_TAG_member
	.dwattr $C$DW$504, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$504, DW_AT_name("PRU0_IMEM_PE")
	.dwattr $C$DW$504, DW_AT_TI_symbol_name("PRU0_IMEM_PE")
	.dwattr $C$DW$504, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$504, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$504, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$504, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$504, DW_AT_decl_line(0x73)
	.dwattr $C$DW$504, DW_AT_decl_column(0x0d)
$C$DW$505	.dwtag  DW_TAG_member
	.dwattr $C$DW$505, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$505, DW_AT_name("PRU0_DMEM_PE")
	.dwattr $C$DW$505, DW_AT_TI_symbol_name("PRU0_DMEM_PE")
	.dwattr $C$DW$505, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$505, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$505, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$505, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$505, DW_AT_decl_line(0x74)
	.dwattr $C$DW$505, DW_AT_decl_column(0x0d)
$C$DW$506	.dwtag  DW_TAG_member
	.dwattr $C$DW$506, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$506, DW_AT_name("PRU1_IMEM_PE")
	.dwattr $C$DW$506, DW_AT_TI_symbol_name("PRU1_IMEM_PE")
	.dwattr $C$DW$506, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$506, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$506, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$506, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$506, DW_AT_decl_line(0x75)
	.dwattr $C$DW$506, DW_AT_decl_column(0x0d)
$C$DW$507	.dwtag  DW_TAG_member
	.dwattr $C$DW$507, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$507, DW_AT_name("PRU1_DMEM_PE")
	.dwattr $C$DW$507, DW_AT_TI_symbol_name("PRU1_DMEM_PE")
	.dwattr $C$DW$507, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$507, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$507, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$507, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$507, DW_AT_decl_line(0x76)
	.dwattr $C$DW$507, DW_AT_decl_column(0x0d)
$C$DW$508	.dwtag  DW_TAG_member
	.dwattr $C$DW$508, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$508, DW_AT_name("RAM_PE")
	.dwattr $C$DW$508, DW_AT_TI_symbol_name("RAM_PE")
	.dwattr $C$DW$508, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$508, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$508, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$508, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$508, DW_AT_decl_line(0x77)
	.dwattr $C$DW$508, DW_AT_decl_column(0x0d)
$C$DW$509	.dwtag  DW_TAG_member
	.dwattr $C$DW$509, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$509, DW_AT_name("rsvd20")
	.dwattr $C$DW$509, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$509, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0c)
	.dwattr $C$DW$509, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$509, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$509, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$509, DW_AT_decl_line(0x78)
	.dwattr $C$DW$509, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$98

	.dwattr $C$DW$T$98, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$98, DW_AT_decl_line(0x72)
	.dwattr $C$DW$T$98, DW_AT_decl_column(0x13)
$C$DW$T$322	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$322, DW_AT_type(*$C$DW$T$98)

$C$DW$T$99	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$99, DW_AT_byte_size(0x04)
$C$DW$510	.dwtag  DW_TAG_member
	.dwattr $C$DW$510, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$510, DW_AT_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$510, DW_AT_TI_symbol_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$510, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$510, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$510, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$510, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$510, DW_AT_decl_line(0x81)
	.dwattr $C$DW$510, DW_AT_decl_column(0x0d)
$C$DW$511	.dwtag  DW_TAG_member
	.dwattr $C$DW$511, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$511, DW_AT_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$511, DW_AT_TI_symbol_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$511, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$511, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$511, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$511, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$511, DW_AT_decl_line(0x82)
	.dwattr $C$DW$511, DW_AT_decl_column(0x0d)
$C$DW$512	.dwtag  DW_TAG_member
	.dwattr $C$DW$512, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$512, DW_AT_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$512, DW_AT_TI_symbol_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$512, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$512, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$512, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$512, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$512, DW_AT_decl_line(0x83)
	.dwattr $C$DW$512, DW_AT_decl_column(0x0d)
$C$DW$513	.dwtag  DW_TAG_member
	.dwattr $C$DW$513, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$513, DW_AT_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$513, DW_AT_TI_symbol_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$513, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$513, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$513, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$513, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$513, DW_AT_decl_line(0x84)
	.dwattr $C$DW$513, DW_AT_decl_column(0x0d)
$C$DW$514	.dwtag  DW_TAG_member
	.dwattr $C$DW$514, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$514, DW_AT_name("RAM_PE_SET")
	.dwattr $C$DW$514, DW_AT_TI_symbol_name("RAM_PE_SET")
	.dwattr $C$DW$514, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$514, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$514, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$514, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$514, DW_AT_decl_line(0x85)
	.dwattr $C$DW$514, DW_AT_decl_column(0x0d)
$C$DW$515	.dwtag  DW_TAG_member
	.dwattr $C$DW$515, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$515, DW_AT_name("rsvd20")
	.dwattr $C$DW$515, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$515, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0c)
	.dwattr $C$DW$515, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$515, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$515, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$515, DW_AT_decl_line(0x86)
	.dwattr $C$DW$515, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$99

	.dwattr $C$DW$T$99, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$99, DW_AT_decl_line(0x80)
	.dwattr $C$DW$T$99, DW_AT_decl_column(0x12)
$C$DW$T$324	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$324, DW_AT_type(*$C$DW$T$99)

$C$DW$T$100	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$100, DW_AT_byte_size(0x04)
$C$DW$516	.dwtag  DW_TAG_member
	.dwattr $C$DW$516, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$516, DW_AT_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$516, DW_AT_TI_symbol_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$516, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$516, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$516, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$516, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$516, DW_AT_decl_line(0x90)
	.dwattr $C$DW$516, DW_AT_decl_column(0x0d)
$C$DW$517	.dwtag  DW_TAG_member
	.dwattr $C$DW$517, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$517, DW_AT_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$517, DW_AT_TI_symbol_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$517, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$517, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$517, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$517, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$517, DW_AT_decl_line(0x91)
	.dwattr $C$DW$517, DW_AT_decl_column(0x0d)
$C$DW$518	.dwtag  DW_TAG_member
	.dwattr $C$DW$518, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$518, DW_AT_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$518, DW_AT_TI_symbol_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$518, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$518, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$518, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$518, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$518, DW_AT_decl_line(0x92)
	.dwattr $C$DW$518, DW_AT_decl_column(0x0d)
$C$DW$519	.dwtag  DW_TAG_member
	.dwattr $C$DW$519, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$519, DW_AT_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$519, DW_AT_TI_symbol_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$519, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$519, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$519, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$519, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$519, DW_AT_decl_line(0x93)
	.dwattr $C$DW$519, DW_AT_decl_column(0x0d)
$C$DW$520	.dwtag  DW_TAG_member
	.dwattr $C$DW$520, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$520, DW_AT_name("rsvd16")
	.dwattr $C$DW$520, DW_AT_TI_symbol_name("rsvd16")
	.dwattr $C$DW$520, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x10)
	.dwattr $C$DW$520, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$520, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$520, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$520, DW_AT_decl_line(0x94)
	.dwattr $C$DW$520, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$100

	.dwattr $C$DW$T$100, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$100, DW_AT_decl_line(0x8f)
	.dwattr $C$DW$T$100, DW_AT_decl_column(0x12)
$C$DW$T$326	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$326, DW_AT_type(*$C$DW$T$100)

$C$DW$T$101	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$101, DW_AT_byte_size(0x04)
$C$DW$521	.dwtag  DW_TAG_member
	.dwattr $C$DW$521, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$521, DW_AT_name("PMAO_PRU0")
	.dwattr $C$DW$521, DW_AT_TI_symbol_name("PMAO_PRU0")
	.dwattr $C$DW$521, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$521, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$521, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$521, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$521, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$521, DW_AT_decl_column(0x0d)
$C$DW$522	.dwtag  DW_TAG_member
	.dwattr $C$DW$522, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$522, DW_AT_name("PMAO_PRU1")
	.dwattr $C$DW$522, DW_AT_TI_symbol_name("PMAO_PRU1")
	.dwattr $C$DW$522, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x01)
	.dwattr $C$DW$522, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$522, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$522, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$522, DW_AT_decl_line(0xa2)
	.dwattr $C$DW$522, DW_AT_decl_column(0x0d)
$C$DW$523	.dwtag  DW_TAG_member
	.dwattr $C$DW$523, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$523, DW_AT_name("rsvd2")
	.dwattr $C$DW$523, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$523, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1e)
	.dwattr $C$DW$523, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$523, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$523, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$523, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$523, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$101

	.dwattr $C$DW$T$101, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$101, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$T$101, DW_AT_decl_column(0x12)
$C$DW$T$328	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$328, DW_AT_type(*$C$DW$T$101)

$C$DW$T$102	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$102, DW_AT_byte_size(0x04)
$C$DW$524	.dwtag  DW_TAG_member
	.dwattr $C$DW$524, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$524, DW_AT_name("OCP_EN")
	.dwattr $C$DW$524, DW_AT_TI_symbol_name("OCP_EN")
	.dwattr $C$DW$524, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$524, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$524, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$524, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$524, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$524, DW_AT_decl_column(0x0d)
$C$DW$525	.dwtag  DW_TAG_member
	.dwattr $C$DW$525, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$525, DW_AT_name("rsvd1")
	.dwattr $C$DW$525, DW_AT_TI_symbol_name("rsvd1")
	.dwattr $C$DW$525, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1f)
	.dwattr $C$DW$525, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$525, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$525, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$525, DW_AT_decl_line(0xb1)
	.dwattr $C$DW$525, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$102

	.dwattr $C$DW$T$102, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$102, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$T$102, DW_AT_decl_column(0x12)
$C$DW$T$330	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$330, DW_AT_type(*$C$DW$T$102)

$C$DW$T$103	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$103, DW_AT_byte_size(0x04)
$C$DW$526	.dwtag  DW_TAG_member
	.dwattr $C$DW$526, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$526, DW_AT_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$526, DW_AT_TI_symbol_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$526, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$526, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$526, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$526, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$526, DW_AT_decl_line(0xbb)
	.dwattr $C$DW$526, DW_AT_decl_column(0x0d)
$C$DW$527	.dwtag  DW_TAG_member
	.dwattr $C$DW$527, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$527, DW_AT_name("XFR_SHIFT_EN")
	.dwattr $C$DW$527, DW_AT_TI_symbol_name("XFR_SHIFT_EN")
	.dwattr $C$DW$527, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x01)
	.dwattr $C$DW$527, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$527, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$527, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$527, DW_AT_decl_line(0xbc)
	.dwattr $C$DW$527, DW_AT_decl_column(0x0d)
$C$DW$528	.dwtag  DW_TAG_member
	.dwattr $C$DW$528, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$528, DW_AT_name("rsvd2")
	.dwattr $C$DW$528, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$528, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1e)
	.dwattr $C$DW$528, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$528, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$528, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$528, DW_AT_decl_line(0xbd)
	.dwattr $C$DW$528, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$103

	.dwattr $C$DW$T$103, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$103, DW_AT_decl_line(0xba)
	.dwattr $C$DW$T$103, DW_AT_decl_column(0x12)
$C$DW$T$332	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$332, DW_AT_type(*$C$DW$T$103)

$C$DW$T$104	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$104, DW_AT_byte_size(0x04)
$C$DW$529	.dwtag  DW_TAG_member
	.dwattr $C$DW$529, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$529, DW_AT_name("PIN_MUX_SEL")
	.dwattr $C$DW$529, DW_AT_TI_symbol_name("PIN_MUX_SEL")
	.dwattr $C$DW$529, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x08)
	.dwattr $C$DW$529, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$529, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$529, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$529, DW_AT_decl_line(0xc9)
	.dwattr $C$DW$529, DW_AT_decl_column(0x0d)
$C$DW$530	.dwtag  DW_TAG_member
	.dwattr $C$DW$530, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$530, DW_AT_name("rsvd2")
	.dwattr $C$DW$530, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$530, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x18)
	.dwattr $C$DW$530, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$530, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$530, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$530, DW_AT_decl_line(0xca)
	.dwattr $C$DW$530, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$104

	.dwattr $C$DW$T$104, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$104, DW_AT_decl_line(0xc8)
	.dwattr $C$DW$T$104, DW_AT_decl_column(0x13)
$C$DW$T$334	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$334, DW_AT_type(*$C$DW$T$104)

$C$DW$T$106	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$106, DW_AT_byte_size(0x44)
$C$DW$531	.dwtag  DW_TAG_member
	.dwattr $C$DW$531, DW_AT_type(*$C$DW$T$311)
	.dwattr $C$DW$531, DW_AT_name("$P$T63")
	.dwattr $C$DW$531, DW_AT_TI_symbol_name("$P$T63")
	.dwattr $C$DW$531, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$531, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$531, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$531, DW_AT_decl_line(0x06)
	.dwattr $C$DW$531, DW_AT_decl_column(0x02)
$C$DW$532	.dwtag  DW_TAG_member
	.dwattr $C$DW$532, DW_AT_type(*$C$DW$T$313)
	.dwattr $C$DW$532, DW_AT_name("$P$T64")
	.dwattr $C$DW$532, DW_AT_TI_symbol_name("$P$T64")
	.dwattr $C$DW$532, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$532, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$532, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$532, DW_AT_decl_line(0x10)
	.dwattr $C$DW$532, DW_AT_decl_column(0x02)
$C$DW$533	.dwtag  DW_TAG_member
	.dwattr $C$DW$533, DW_AT_type(*$C$DW$T$315)
	.dwattr $C$DW$533, DW_AT_name("$P$T65")
	.dwattr $C$DW$533, DW_AT_TI_symbol_name("$P$T65")
	.dwattr $C$DW$533, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$533, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$533, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$533, DW_AT_decl_line(0x1e)
	.dwattr $C$DW$533, DW_AT_decl_column(0x02)
$C$DW$534	.dwtag  DW_TAG_member
	.dwattr $C$DW$534, DW_AT_type(*$C$DW$T$317)
	.dwattr $C$DW$534, DW_AT_name("$P$T66")
	.dwattr $C$DW$534, DW_AT_TI_symbol_name("$P$T66")
	.dwattr $C$DW$534, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$534, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$534, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$534, DW_AT_decl_line(0x31)
	.dwattr $C$DW$534, DW_AT_decl_column(0x02)
$C$DW$535	.dwtag  DW_TAG_member
	.dwattr $C$DW$535, DW_AT_type(*$C$DW$T$319)
	.dwattr $C$DW$535, DW_AT_name("$P$T67")
	.dwattr $C$DW$535, DW_AT_TI_symbol_name("$P$T67")
	.dwattr $C$DW$535, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$535, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$535, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$535, DW_AT_decl_line(0x44)
	.dwattr $C$DW$535, DW_AT_decl_column(0x02)
$C$DW$536	.dwtag  DW_TAG_member
	.dwattr $C$DW$536, DW_AT_type(*$C$DW$T$321)
	.dwattr $C$DW$536, DW_AT_name("$P$T68")
	.dwattr $C$DW$536, DW_AT_TI_symbol_name("$P$T68")
	.dwattr $C$DW$536, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$536, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$536, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$536, DW_AT_decl_line(0x60)
	.dwattr $C$DW$536, DW_AT_decl_column(0x02)
$C$DW$537	.dwtag  DW_TAG_member
	.dwattr $C$DW$537, DW_AT_type(*$C$DW$T$323)
	.dwattr $C$DW$537, DW_AT_name("$P$T69")
	.dwattr $C$DW$537, DW_AT_TI_symbol_name("$P$T69")
	.dwattr $C$DW$537, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$537, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$537, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$537, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$537, DW_AT_decl_column(0x02)
$C$DW$538	.dwtag  DW_TAG_member
	.dwattr $C$DW$538, DW_AT_type(*$C$DW$T$325)
	.dwattr $C$DW$538, DW_AT_name("$P$T70")
	.dwattr $C$DW$538, DW_AT_TI_symbol_name("$P$T70")
	.dwattr $C$DW$538, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$538, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$538, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$538, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$538, DW_AT_decl_column(0x02)
$C$DW$539	.dwtag  DW_TAG_member
	.dwattr $C$DW$539, DW_AT_type(*$C$DW$T$327)
	.dwattr $C$DW$539, DW_AT_name("$P$T71")
	.dwattr $C$DW$539, DW_AT_TI_symbol_name("$P$T71")
	.dwattr $C$DW$539, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$539, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$539, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$539, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$539, DW_AT_decl_column(0x02)
$C$DW$540	.dwtag  DW_TAG_member
	.dwattr $C$DW$540, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$540, DW_AT_name("rsvd24")
	.dwattr $C$DW$540, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$540, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$540, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$540, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$540, DW_AT_decl_line(0x99)
	.dwattr $C$DW$540, DW_AT_decl_column(0x0b)
$C$DW$541	.dwtag  DW_TAG_member
	.dwattr $C$DW$541, DW_AT_type(*$C$DW$T$329)
	.dwattr $C$DW$541, DW_AT_name("$P$T72")
	.dwattr $C$DW$541, DW_AT_TI_symbol_name("$P$T72")
	.dwattr $C$DW$541, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$541, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$541, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$541, DW_AT_decl_line(0x9d)
	.dwattr $C$DW$541, DW_AT_decl_column(0x02)
$C$DW$542	.dwtag  DW_TAG_member
	.dwattr $C$DW$542, DW_AT_type(*$C$DW$T$105)
	.dwattr $C$DW$542, DW_AT_name("rsvd2c")
	.dwattr $C$DW$542, DW_AT_TI_symbol_name("rsvd2c")
	.dwattr $C$DW$542, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$542, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$542, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$542, DW_AT_decl_line(0xa8)
	.dwattr $C$DW$542, DW_AT_decl_column(0x12)
$C$DW$543	.dwtag  DW_TAG_member
	.dwattr $C$DW$543, DW_AT_type(*$C$DW$T$331)
	.dwattr $C$DW$543, DW_AT_name("$P$T73")
	.dwattr $C$DW$543, DW_AT_TI_symbol_name("$P$T73")
	.dwattr $C$DW$543, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$543, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$543, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$543, DW_AT_decl_line(0xac)
	.dwattr $C$DW$543, DW_AT_decl_column(0x02)
$C$DW$544	.dwtag  DW_TAG_member
	.dwattr $C$DW$544, DW_AT_type(*$C$DW$T$333)
	.dwattr $C$DW$544, DW_AT_name("$P$T74")
	.dwattr $C$DW$544, DW_AT_TI_symbol_name("$P$T74")
	.dwattr $C$DW$544, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$544, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$544, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$544, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$544, DW_AT_decl_column(0x02)
$C$DW$545	.dwtag  DW_TAG_member
	.dwattr $C$DW$545, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$545, DW_AT_name("rsvd38")
	.dwattr $C$DW$545, DW_AT_TI_symbol_name("rsvd38")
	.dwattr $C$DW$545, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$545, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$545, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$545, DW_AT_decl_line(0xc2)
	.dwattr $C$DW$545, DW_AT_decl_column(0x0b)
$C$DW$546	.dwtag  DW_TAG_member
	.dwattr $C$DW$546, DW_AT_type(*$C$DW$T$335)
	.dwattr $C$DW$546, DW_AT_name("$P$T75")
	.dwattr $C$DW$546, DW_AT_TI_symbol_name("$P$T75")
	.dwattr $C$DW$546, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$546, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$546, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$546, DW_AT_decl_line(0xc5)
	.dwattr $C$DW$546, DW_AT_decl_column(0x02)
	.dwendtag $C$DW$T$106

	.dwattr $C$DW$T$106, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$106, DW_AT_decl_line(0x03)
	.dwattr $C$DW$T$106, DW_AT_decl_column(0x0f)
$C$DW$T$481	.dwtag  DW_TAG_typedef, DW_AT_name("pruCfg")
	.dwattr $C$DW$T$481, DW_AT_type(*$C$DW$T$106)
	.dwattr $C$DW$T$481, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$481, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$481, DW_AT_decl_line(0xcd)
	.dwattr $C$DW$T$481, DW_AT_decl_column(0x03)
$C$DW$T$482	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$482, DW_AT_type(*$C$DW$T$481)

$C$DW$T$107	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$107, DW_AT_byte_size(0x04)
$C$DW$547	.dwtag  DW_TAG_member
	.dwattr $C$DW$547, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$547, DW_AT_name("clktrctrl")
	.dwattr $C$DW$547, DW_AT_TI_symbol_name("clktrctrl")
	.dwattr $C$DW$547, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$547, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$547, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$547, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$547, DW_AT_decl_line(0x15)
	.dwattr $C$DW$547, DW_AT_decl_column(0x0d)
$C$DW$548	.dwtag  DW_TAG_member
	.dwattr $C$DW$548, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$548, DW_AT_name("resv7")
	.dwattr $C$DW$548, DW_AT_TI_symbol_name("resv7")
	.dwattr $C$DW$548, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x06)
	.dwattr $C$DW$548, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$548, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$548, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$548, DW_AT_decl_line(0x16)
	.dwattr $C$DW$548, DW_AT_decl_column(0x0d)
$C$DW$549	.dwtag  DW_TAG_member
	.dwattr $C$DW$549, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$549, DW_AT_name("clkactivity_l4ls_gclk")
	.dwattr $C$DW$549, DW_AT_TI_symbol_name("clkactivity_l4ls_gclk")
	.dwattr $C$DW$549, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x01)
	.dwattr $C$DW$549, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$549, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$549, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$549, DW_AT_decl_line(0x17)
	.dwattr $C$DW$549, DW_AT_decl_column(0x0d)
$C$DW$550	.dwtag  DW_TAG_member
	.dwattr $C$DW$550, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$550, DW_AT_name("resv6")
	.dwattr $C$DW$550, DW_AT_TI_symbol_name("resv6")
	.dwattr $C$DW$550, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x01)
	.dwattr $C$DW$550, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$550, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$550, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$550, DW_AT_decl_line(0x18)
	.dwattr $C$DW$550, DW_AT_decl_column(0x0d)
$C$DW$551	.dwtag  DW_TAG_member
	.dwattr $C$DW$551, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$551, DW_AT_name("clkactivity_uart_gfclk")
	.dwattr $C$DW$551, DW_AT_TI_symbol_name("clkactivity_uart_gfclk")
	.dwattr $C$DW$551, DW_AT_bit_offset(0x15), DW_AT_bit_size(0x01)
	.dwattr $C$DW$551, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$551, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$551, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$551, DW_AT_decl_line(0x19)
	.dwattr $C$DW$551, DW_AT_decl_column(0x0d)
$C$DW$552	.dwtag  DW_TAG_member
	.dwattr $C$DW$552, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$552, DW_AT_name("clkactivity_can_clk")
	.dwattr $C$DW$552, DW_AT_TI_symbol_name("clkactivity_can_clk")
	.dwattr $C$DW$552, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x01)
	.dwattr $C$DW$552, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$552, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$552, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$552, DW_AT_decl_line(0x1a)
	.dwattr $C$DW$552, DW_AT_decl_column(0x0d)
$C$DW$553	.dwtag  DW_TAG_member
	.dwattr $C$DW$553, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$553, DW_AT_name("resv5")
	.dwattr $C$DW$553, DW_AT_TI_symbol_name("resv5")
	.dwattr $C$DW$553, DW_AT_bit_offset(0x13), DW_AT_bit_size(0x01)
	.dwattr $C$DW$553, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$553, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$553, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$553, DW_AT_decl_line(0x1b)
	.dwattr $C$DW$553, DW_AT_decl_column(0x0d)
$C$DW$554	.dwtag  DW_TAG_member
	.dwattr $C$DW$554, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$554, DW_AT_name("clkactivity_timer7_gclk")
	.dwattr $C$DW$554, DW_AT_TI_symbol_name("clkactivity_timer7_gclk")
	.dwattr $C$DW$554, DW_AT_bit_offset(0x12), DW_AT_bit_size(0x01)
	.dwattr $C$DW$554, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$554, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$554, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$554, DW_AT_decl_line(0x1c)
	.dwattr $C$DW$554, DW_AT_decl_column(0x0d)
$C$DW$555	.dwtag  DW_TAG_member
	.dwattr $C$DW$555, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$555, DW_AT_name("clkactivity_timer2_gclk")
	.dwattr $C$DW$555, DW_AT_TI_symbol_name("clkactivity_timer2_gclk")
	.dwattr $C$DW$555, DW_AT_bit_offset(0x11), DW_AT_bit_size(0x01)
	.dwattr $C$DW$555, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$555, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$555, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$555, DW_AT_decl_line(0x1d)
	.dwattr $C$DW$555, DW_AT_decl_column(0x0d)
$C$DW$556	.dwtag  DW_TAG_member
	.dwattr $C$DW$556, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$556, DW_AT_name("clkactivity_timer3_gclk")
	.dwattr $C$DW$556, DW_AT_TI_symbol_name("clkactivity_timer3_gclk")
	.dwattr $C$DW$556, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x01)
	.dwattr $C$DW$556, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$556, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$556, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$556, DW_AT_decl_line(0x1e)
	.dwattr $C$DW$556, DW_AT_decl_column(0x0d)
$C$DW$557	.dwtag  DW_TAG_member
	.dwattr $C$DW$557, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$557, DW_AT_name("clkactivity_timer4_gclk")
	.dwattr $C$DW$557, DW_AT_TI_symbol_name("clkactivity_timer4_gclk")
	.dwattr $C$DW$557, DW_AT_bit_offset(0x0f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$557, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$557, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$557, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$557, DW_AT_decl_line(0x1f)
	.dwattr $C$DW$557, DW_AT_decl_column(0x0d)
$C$DW$558	.dwtag  DW_TAG_member
	.dwattr $C$DW$558, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$558, DW_AT_name("clkactivity_lcdc_gclk")
	.dwattr $C$DW$558, DW_AT_TI_symbol_name("clkactivity_lcdc_gclk")
	.dwattr $C$DW$558, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x01)
	.dwattr $C$DW$558, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$558, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$558, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$558, DW_AT_decl_line(0x20)
	.dwattr $C$DW$558, DW_AT_decl_column(0x0d)
$C$DW$559	.dwtag  DW_TAG_member
	.dwattr $C$DW$559, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$559, DW_AT_name("resv4")
	.dwattr $C$DW$559, DW_AT_TI_symbol_name("resv4")
	.dwattr $C$DW$559, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$559, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$559, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$559, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$559, DW_AT_decl_line(0x21)
	.dwattr $C$DW$559, DW_AT_decl_column(0x0d)
$C$DW$560	.dwtag  DW_TAG_member
	.dwattr $C$DW$560, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$560, DW_AT_name("clkactivity_gpio_1_gdbclk")
	.dwattr $C$DW$560, DW_AT_TI_symbol_name("clkactivity_gpio_1_gdbclk")
	.dwattr $C$DW$560, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x01)
	.dwattr $C$DW$560, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$560, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$560, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$560, DW_AT_decl_line(0x22)
	.dwattr $C$DW$560, DW_AT_decl_column(0x0d)
$C$DW$561	.dwtag  DW_TAG_member
	.dwattr $C$DW$561, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$561, DW_AT_name("clkactivity_gpio_2_gdbclk")
	.dwattr $C$DW$561, DW_AT_TI_symbol_name("clkactivity_gpio_2_gdbclk")
	.dwattr $C$DW$561, DW_AT_bit_offset(0x0b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$561, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$561, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$561, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$561, DW_AT_decl_line(0x23)
	.dwattr $C$DW$561, DW_AT_decl_column(0x0d)
$C$DW$562	.dwtag  DW_TAG_member
	.dwattr $C$DW$562, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$562, DW_AT_name("clkactivity_gpio_3_gdbclk")
	.dwattr $C$DW$562, DW_AT_TI_symbol_name("clkactivity_gpio_3_gdbclk")
	.dwattr $C$DW$562, DW_AT_bit_offset(0x0a), DW_AT_bit_size(0x01)
	.dwattr $C$DW$562, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$562, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$562, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$562, DW_AT_decl_line(0x24)
	.dwattr $C$DW$562, DW_AT_decl_column(0x0d)
$C$DW$563	.dwtag  DW_TAG_member
	.dwattr $C$DW$563, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$563, DW_AT_name("resv3i")
	.dwattr $C$DW$563, DW_AT_TI_symbol_name("resv3i")
	.dwattr $C$DW$563, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x02)
	.dwattr $C$DW$563, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$563, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$563, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$563, DW_AT_decl_line(0x25)
	.dwattr $C$DW$563, DW_AT_decl_column(0x0d)
$C$DW$564	.dwtag  DW_TAG_member
	.dwattr $C$DW$564, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$564, DW_AT_name("clkactivity_i2c_fclk")
	.dwattr $C$DW$564, DW_AT_TI_symbol_name("clkactivity_i2c_fclk")
	.dwattr $C$DW$564, DW_AT_bit_offset(0x07), DW_AT_bit_size(0x01)
	.dwattr $C$DW$564, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$564, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$564, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$564, DW_AT_decl_line(0x26)
	.dwattr $C$DW$564, DW_AT_decl_column(0x0d)
$C$DW$565	.dwtag  DW_TAG_member
	.dwattr $C$DW$565, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$565, DW_AT_name("clkactivity_spi_gclk")
	.dwattr $C$DW$565, DW_AT_TI_symbol_name("clkactivity_spi_gclk")
	.dwattr $C$DW$565, DW_AT_bit_offset(0x06), DW_AT_bit_size(0x01)
	.dwattr $C$DW$565, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$565, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$565, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$565, DW_AT_decl_line(0x27)
	.dwattr $C$DW$565, DW_AT_decl_column(0x0d)
$C$DW$566	.dwtag  DW_TAG_member
	.dwattr $C$DW$566, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$566, DW_AT_name("resv2")
	.dwattr $C$DW$566, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$566, DW_AT_bit_offset(0x05), DW_AT_bit_size(0x01)
	.dwattr $C$DW$566, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$566, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$566, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$566, DW_AT_decl_line(0x28)
	.dwattr $C$DW$566, DW_AT_decl_column(0x0d)
$C$DW$567	.dwtag  DW_TAG_member
	.dwattr $C$DW$567, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$567, DW_AT_name("clkactivity_timer5_gclk")
	.dwattr $C$DW$567, DW_AT_TI_symbol_name("clkactivity_timer5_gclk")
	.dwattr $C$DW$567, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x01)
	.dwattr $C$DW$567, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$567, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$567, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$567, DW_AT_decl_line(0x29)
	.dwattr $C$DW$567, DW_AT_decl_column(0x0d)
$C$DW$568	.dwtag  DW_TAG_member
	.dwattr $C$DW$568, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$568, DW_AT_name("clkactivity_timer6_gclk")
	.dwattr $C$DW$568, DW_AT_TI_symbol_name("clkactivity_timer6_gclk")
	.dwattr $C$DW$568, DW_AT_bit_offset(0x03), DW_AT_bit_size(0x01)
	.dwattr $C$DW$568, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$568, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$568, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$568, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$568, DW_AT_decl_column(0x0d)
$C$DW$569	.dwtag  DW_TAG_member
	.dwattr $C$DW$569, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$569, DW_AT_name("resv1")
	.dwattr $C$DW$569, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$569, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x03)
	.dwattr $C$DW$569, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$569, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$569, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$569, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$569, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$107

	.dwattr $C$DW$T$107, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$107, DW_AT_decl_line(0x14)
	.dwattr $C$DW$T$107, DW_AT_decl_column(0x13)
$C$DW$T$336	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$336, DW_AT_type(*$C$DW$T$107)

$C$DW$T$108	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$108, DW_AT_byte_size(0x04)
$C$DW$570	.dwtag  DW_TAG_member
	.dwattr $C$DW$570, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$570, DW_AT_name("clktrctrl")
	.dwattr $C$DW$570, DW_AT_TI_symbol_name("clktrctrl")
	.dwattr $C$DW$570, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$570, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$570, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$570, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$570, DW_AT_decl_line(0x34)
	.dwattr $C$DW$570, DW_AT_decl_column(0x0d)
$C$DW$571	.dwtag  DW_TAG_member
	.dwattr $C$DW$571, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$571, DW_AT_name("resv2")
	.dwattr $C$DW$571, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$571, DW_AT_bit_offset(0x1d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$571, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$571, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$571, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$571, DW_AT_decl_line(0x35)
	.dwattr $C$DW$571, DW_AT_decl_column(0x0d)
$C$DW$572	.dwtag  DW_TAG_member
	.dwattr $C$DW$572, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$572, DW_AT_name("clkactivity_l3s_gclk")
	.dwattr $C$DW$572, DW_AT_TI_symbol_name("clkactivity_l3s_gclk")
	.dwattr $C$DW$572, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x01)
	.dwattr $C$DW$572, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$572, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$572, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$572, DW_AT_decl_line(0x36)
	.dwattr $C$DW$572, DW_AT_decl_column(0x0d)
$C$DW$573	.dwtag  DW_TAG_member
	.dwattr $C$DW$573, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$573, DW_AT_name("resv1")
	.dwattr $C$DW$573, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$573, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1c)
	.dwattr $C$DW$573, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$573, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$573, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$573, DW_AT_decl_line(0x37)
	.dwattr $C$DW$573, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$108

	.dwattr $C$DW$T$108, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$108, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$108, DW_AT_decl_column(0x13)
$C$DW$T$338	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$338, DW_AT_type(*$C$DW$T$108)

$C$DW$T$109	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$109, DW_AT_byte_size(0x04)
$C$DW$574	.dwtag  DW_TAG_member
	.dwattr $C$DW$574, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$574, DW_AT_name("clktrctrl")
	.dwattr $C$DW$574, DW_AT_TI_symbol_name("clktrctrl")
	.dwattr $C$DW$574, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$574, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$574, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$574, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$574, DW_AT_decl_line(0x44)
	.dwattr $C$DW$574, DW_AT_decl_column(0x0d)
$C$DW$575	.dwtag  DW_TAG_member
	.dwattr $C$DW$575, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$575, DW_AT_name("clkactivity_emif_gclk")
	.dwattr $C$DW$575, DW_AT_TI_symbol_name("clkactivity_emif_gclk")
	.dwattr $C$DW$575, DW_AT_bit_offset(0x1d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$575, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$575, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$575, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$575, DW_AT_decl_line(0x45)
	.dwattr $C$DW$575, DW_AT_decl_column(0x0d)
$C$DW$576	.dwtag  DW_TAG_member
	.dwattr $C$DW$576, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$576, DW_AT_name("clkactivity_mmc_gclk")
	.dwattr $C$DW$576, DW_AT_TI_symbol_name("clkactivity_mmc_gclk")
	.dwattr $C$DW$576, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x01)
	.dwattr $C$DW$576, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$576, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$576, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$576, DW_AT_decl_line(0x46)
	.dwattr $C$DW$576, DW_AT_decl_column(0x0d)
$C$DW$577	.dwtag  DW_TAG_member
	.dwattr $C$DW$577, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$577, DW_AT_name("clkactivity_l3_gclk")
	.dwattr $C$DW$577, DW_AT_TI_symbol_name("clkactivity_l3_gclk")
	.dwattr $C$DW$577, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$577, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$577, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$577, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$577, DW_AT_decl_line(0x47)
	.dwattr $C$DW$577, DW_AT_decl_column(0x0d)
$C$DW$578	.dwtag  DW_TAG_member
	.dwattr $C$DW$578, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$578, DW_AT_name("resv2")
	.dwattr $C$DW$578, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$578, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x01)
	.dwattr $C$DW$578, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$578, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$578, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$578, DW_AT_decl_line(0x48)
	.dwattr $C$DW$578, DW_AT_decl_column(0x0d)
$C$DW$579	.dwtag  DW_TAG_member
	.dwattr $C$DW$579, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$579, DW_AT_name("clkactivity_cpts_rft_gclk")
	.dwattr $C$DW$579, DW_AT_TI_symbol_name("clkactivity_cpts_rft_gclk")
	.dwattr $C$DW$579, DW_AT_bit_offset(0x19), DW_AT_bit_size(0x01)
	.dwattr $C$DW$579, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$579, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$579, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$579, DW_AT_decl_line(0x49)
	.dwattr $C$DW$579, DW_AT_decl_column(0x0d)
$C$DW$580	.dwtag  DW_TAG_member
	.dwattr $C$DW$580, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$580, DW_AT_name("clkactivity_mcasp_gclk")
	.dwattr $C$DW$580, DW_AT_TI_symbol_name("clkactivity_mcasp_gclk")
	.dwattr $C$DW$580, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x01)
	.dwattr $C$DW$580, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$580, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$580, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$580, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$580, DW_AT_decl_column(0x0d)
$C$DW$581	.dwtag  DW_TAG_member
	.dwattr $C$DW$581, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$581, DW_AT_name("resv1")
	.dwattr $C$DW$581, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$581, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x18)
	.dwattr $C$DW$581, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$581, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$581, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$581, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$581, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$109

	.dwattr $C$DW$T$109, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$109, DW_AT_decl_line(0x43)
	.dwattr $C$DW$T$109, DW_AT_decl_column(0x13)
$C$DW$T$340	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$340, DW_AT_type(*$C$DW$T$109)

$C$DW$T$110	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$110, DW_AT_byte_size(0x04)
$C$DW$582	.dwtag  DW_TAG_member
	.dwattr $C$DW$582, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$582, DW_AT_name("modulemode")
	.dwattr $C$DW$582, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$582, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$582, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$582, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$582, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$582, DW_AT_decl_line(0x58)
	.dwattr $C$DW$582, DW_AT_decl_column(0x0d)
$C$DW$583	.dwtag  DW_TAG_member
	.dwattr $C$DW$583, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$583, DW_AT_name("resv2")
	.dwattr $C$DW$583, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$583, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$583, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$583, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$583, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$583, DW_AT_decl_line(0x59)
	.dwattr $C$DW$583, DW_AT_decl_column(0x0d)
$C$DW$584	.dwtag  DW_TAG_member
	.dwattr $C$DW$584, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$584, DW_AT_name("idlest")
	.dwattr $C$DW$584, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$584, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$584, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$584, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$584, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$584, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$584, DW_AT_decl_column(0x0d)
$C$DW$585	.dwtag  DW_TAG_member
	.dwattr $C$DW$585, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$585, DW_AT_name("stbyst")
	.dwattr $C$DW$585, DW_AT_TI_symbol_name("stbyst")
	.dwattr $C$DW$585, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$585, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$585, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$585, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$585, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$585, DW_AT_decl_column(0x0d)
$C$DW$586	.dwtag  DW_TAG_member
	.dwattr $C$DW$586, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$586, DW_AT_name("resv1")
	.dwattr $C$DW$586, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$586, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$586, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$586, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$586, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$586, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$586, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$110

	.dwattr $C$DW$T$110, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$110, DW_AT_decl_line(0x57)
	.dwattr $C$DW$T$110, DW_AT_decl_column(0x13)
$C$DW$T$342	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$342, DW_AT_type(*$C$DW$T$110)

$C$DW$T$111	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$111, DW_AT_byte_size(0x04)
$C$DW$587	.dwtag  DW_TAG_member
	.dwattr $C$DW$587, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$587, DW_AT_name("modulemode")
	.dwattr $C$DW$587, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$587, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$587, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$587, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$587, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$587, DW_AT_decl_line(0x65)
	.dwattr $C$DW$587, DW_AT_decl_column(0x0d)
$C$DW$588	.dwtag  DW_TAG_member
	.dwattr $C$DW$588, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$588, DW_AT_name("resv2")
	.dwattr $C$DW$588, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$588, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$588, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$588, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$588, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$588, DW_AT_decl_line(0x66)
	.dwattr $C$DW$588, DW_AT_decl_column(0x0d)
$C$DW$589	.dwtag  DW_TAG_member
	.dwattr $C$DW$589, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$589, DW_AT_name("idlest")
	.dwattr $C$DW$589, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$589, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$589, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$589, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$589, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$589, DW_AT_decl_line(0x67)
	.dwattr $C$DW$589, DW_AT_decl_column(0x0d)
$C$DW$590	.dwtag  DW_TAG_member
	.dwattr $C$DW$590, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$590, DW_AT_name("stbyst")
	.dwattr $C$DW$590, DW_AT_TI_symbol_name("stbyst")
	.dwattr $C$DW$590, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$590, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$590, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$590, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$590, DW_AT_decl_line(0x68)
	.dwattr $C$DW$590, DW_AT_decl_column(0x0d)
$C$DW$591	.dwtag  DW_TAG_member
	.dwattr $C$DW$591, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$591, DW_AT_name("resv1")
	.dwattr $C$DW$591, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$591, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$591, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$591, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$591, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$591, DW_AT_decl_line(0x69)
	.dwattr $C$DW$591, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$111

	.dwattr $C$DW$T$111, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$111, DW_AT_decl_line(0x64)
	.dwattr $C$DW$T$111, DW_AT_decl_column(0x13)
$C$DW$T$344	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$344, DW_AT_type(*$C$DW$T$111)

$C$DW$T$112	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$112, DW_AT_byte_size(0x04)
$C$DW$592	.dwtag  DW_TAG_member
	.dwattr $C$DW$592, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$592, DW_AT_name("modulemode")
	.dwattr $C$DW$592, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$592, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$592, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$592, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$592, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$592, DW_AT_decl_line(0x72)
	.dwattr $C$DW$592, DW_AT_decl_column(0x0d)
$C$DW$593	.dwtag  DW_TAG_member
	.dwattr $C$DW$593, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$593, DW_AT_name("resv2")
	.dwattr $C$DW$593, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$593, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$593, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$593, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$593, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$593, DW_AT_decl_line(0x73)
	.dwattr $C$DW$593, DW_AT_decl_column(0x0d)
$C$DW$594	.dwtag  DW_TAG_member
	.dwattr $C$DW$594, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$594, DW_AT_name("idlest")
	.dwattr $C$DW$594, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$594, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$594, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$594, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$594, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$594, DW_AT_decl_line(0x74)
	.dwattr $C$DW$594, DW_AT_decl_column(0x0d)
$C$DW$595	.dwtag  DW_TAG_member
	.dwattr $C$DW$595, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$595, DW_AT_name("stbyst")
	.dwattr $C$DW$595, DW_AT_TI_symbol_name("stbyst")
	.dwattr $C$DW$595, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$595, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$595, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$595, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$595, DW_AT_decl_line(0x75)
	.dwattr $C$DW$595, DW_AT_decl_column(0x0d)
$C$DW$596	.dwtag  DW_TAG_member
	.dwattr $C$DW$596, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$596, DW_AT_name("resv1")
	.dwattr $C$DW$596, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$596, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$596, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$596, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$596, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$596, DW_AT_decl_line(0x76)
	.dwattr $C$DW$596, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$112

	.dwattr $C$DW$T$112, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$112, DW_AT_decl_line(0x71)
	.dwattr $C$DW$T$112, DW_AT_decl_column(0x13)
$C$DW$T$346	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$346, DW_AT_type(*$C$DW$T$112)

$C$DW$T$113	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$113, DW_AT_byte_size(0x04)
$C$DW$597	.dwtag  DW_TAG_member
	.dwattr $C$DW$597, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$597, DW_AT_name("modulemode")
	.dwattr $C$DW$597, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$597, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$597, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$597, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$597, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$597, DW_AT_decl_line(0x83)
	.dwattr $C$DW$597, DW_AT_decl_column(0x0d)
$C$DW$598	.dwtag  DW_TAG_member
	.dwattr $C$DW$598, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$598, DW_AT_name("resv2")
	.dwattr $C$DW$598, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$598, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$598, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$598, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$598, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$598, DW_AT_decl_line(0x84)
	.dwattr $C$DW$598, DW_AT_decl_column(0x0d)
$C$DW$599	.dwtag  DW_TAG_member
	.dwattr $C$DW$599, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$599, DW_AT_name("idlest")
	.dwattr $C$DW$599, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$599, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$599, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$599, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$599, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$599, DW_AT_decl_line(0x85)
	.dwattr $C$DW$599, DW_AT_decl_column(0x0d)
$C$DW$600	.dwtag  DW_TAG_member
	.dwattr $C$DW$600, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$600, DW_AT_name("stbyst")
	.dwattr $C$DW$600, DW_AT_TI_symbol_name("stbyst")
	.dwattr $C$DW$600, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$600, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$600, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$600, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$600, DW_AT_decl_line(0x86)
	.dwattr $C$DW$600, DW_AT_decl_column(0x0d)
$C$DW$601	.dwtag  DW_TAG_member
	.dwattr $C$DW$601, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$601, DW_AT_name("resv1")
	.dwattr $C$DW$601, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$601, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$601, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$601, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$601, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$601, DW_AT_decl_line(0x87)
	.dwattr $C$DW$601, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$113

	.dwattr $C$DW$T$113, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$113, DW_AT_decl_line(0x82)
	.dwattr $C$DW$T$113, DW_AT_decl_column(0x13)
$C$DW$T$348	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$348, DW_AT_type(*$C$DW$T$113)

$C$DW$T$114	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$114, DW_AT_byte_size(0x04)
$C$DW$602	.dwtag  DW_TAG_member
	.dwattr $C$DW$602, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$602, DW_AT_name("modulemode")
	.dwattr $C$DW$602, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$602, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$602, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$602, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$602, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$602, DW_AT_decl_line(0x90)
	.dwattr $C$DW$602, DW_AT_decl_column(0x0d)
$C$DW$603	.dwtag  DW_TAG_member
	.dwattr $C$DW$603, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$603, DW_AT_name("resv2")
	.dwattr $C$DW$603, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$603, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$603, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$603, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$603, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$603, DW_AT_decl_line(0x91)
	.dwattr $C$DW$603, DW_AT_decl_column(0x0d)
$C$DW$604	.dwtag  DW_TAG_member
	.dwattr $C$DW$604, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$604, DW_AT_name("idlest")
	.dwattr $C$DW$604, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$604, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$604, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$604, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$604, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$604, DW_AT_decl_line(0x92)
	.dwattr $C$DW$604, DW_AT_decl_column(0x0d)
$C$DW$605	.dwtag  DW_TAG_member
	.dwattr $C$DW$605, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$605, DW_AT_name("resv1")
	.dwattr $C$DW$605, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$605, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$605, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$605, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$605, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$605, DW_AT_decl_line(0x93)
	.dwattr $C$DW$605, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$114

	.dwattr $C$DW$T$114, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$114, DW_AT_decl_line(0x8f)
	.dwattr $C$DW$T$114, DW_AT_decl_column(0x13)
$C$DW$T$350	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$350, DW_AT_type(*$C$DW$T$114)

$C$DW$T$115	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$115, DW_AT_byte_size(0x04)
$C$DW$606	.dwtag  DW_TAG_member
	.dwattr $C$DW$606, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$606, DW_AT_name("modulemode")
	.dwattr $C$DW$606, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$606, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$606, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$606, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$606, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$606, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$606, DW_AT_decl_column(0x0d)
$C$DW$607	.dwtag  DW_TAG_member
	.dwattr $C$DW$607, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$607, DW_AT_name("resv2")
	.dwattr $C$DW$607, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$607, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$607, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$607, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$607, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$607, DW_AT_decl_line(0x9d)
	.dwattr $C$DW$607, DW_AT_decl_column(0x0d)
$C$DW$608	.dwtag  DW_TAG_member
	.dwattr $C$DW$608, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$608, DW_AT_name("idlest")
	.dwattr $C$DW$608, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$608, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$608, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$608, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$608, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$608, DW_AT_decl_line(0x9e)
	.dwattr $C$DW$608, DW_AT_decl_column(0x0d)
$C$DW$609	.dwtag  DW_TAG_member
	.dwattr $C$DW$609, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$609, DW_AT_name("resv1")
	.dwattr $C$DW$609, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$609, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$609, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$609, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$609, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$609, DW_AT_decl_line(0x9f)
	.dwattr $C$DW$609, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$115

	.dwattr $C$DW$T$115, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$115, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$T$115, DW_AT_decl_column(0x13)
$C$DW$T$352	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$352, DW_AT_type(*$C$DW$T$115)

$C$DW$T$116	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$116, DW_AT_byte_size(0x04)
$C$DW$610	.dwtag  DW_TAG_member
	.dwattr $C$DW$610, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$610, DW_AT_name("modulemode")
	.dwattr $C$DW$610, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$610, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$610, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$610, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$610, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$610, DW_AT_decl_line(0xa8)
	.dwattr $C$DW$610, DW_AT_decl_column(0x0d)
$C$DW$611	.dwtag  DW_TAG_member
	.dwattr $C$DW$611, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$611, DW_AT_name("resv2")
	.dwattr $C$DW$611, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$611, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$611, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$611, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$611, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$611, DW_AT_decl_line(0xa9)
	.dwattr $C$DW$611, DW_AT_decl_column(0x0d)
$C$DW$612	.dwtag  DW_TAG_member
	.dwattr $C$DW$612, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$612, DW_AT_name("idlest")
	.dwattr $C$DW$612, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$612, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$612, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$612, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$612, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$612, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$612, DW_AT_decl_column(0x0d)
$C$DW$613	.dwtag  DW_TAG_member
	.dwattr $C$DW$613, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$613, DW_AT_name("resv1")
	.dwattr $C$DW$613, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$613, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$613, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$613, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$613, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$613, DW_AT_decl_line(0xab)
	.dwattr $C$DW$613, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$116

	.dwattr $C$DW$T$116, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$116, DW_AT_decl_line(0xa7)
	.dwattr $C$DW$T$116, DW_AT_decl_column(0x13)
$C$DW$T$354	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$354, DW_AT_type(*$C$DW$T$116)

$C$DW$T$117	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$117, DW_AT_byte_size(0x04)
$C$DW$614	.dwtag  DW_TAG_member
	.dwattr $C$DW$614, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$614, DW_AT_name("modulemode")
	.dwattr $C$DW$614, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$614, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$614, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$614, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$614, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$614, DW_AT_decl_line(0xb4)
	.dwattr $C$DW$614, DW_AT_decl_column(0x0d)
$C$DW$615	.dwtag  DW_TAG_member
	.dwattr $C$DW$615, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$615, DW_AT_name("resv2")
	.dwattr $C$DW$615, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$615, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$615, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$615, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$615, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$615, DW_AT_decl_line(0xb5)
	.dwattr $C$DW$615, DW_AT_decl_column(0x0d)
$C$DW$616	.dwtag  DW_TAG_member
	.dwattr $C$DW$616, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$616, DW_AT_name("idlest")
	.dwattr $C$DW$616, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$616, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$616, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$616, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$616, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$616, DW_AT_decl_line(0xb6)
	.dwattr $C$DW$616, DW_AT_decl_column(0x0d)
$C$DW$617	.dwtag  DW_TAG_member
	.dwattr $C$DW$617, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$617, DW_AT_name("resv1")
	.dwattr $C$DW$617, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$617, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$617, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$617, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$617, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$617, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$617, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$117

	.dwattr $C$DW$T$117, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$117, DW_AT_decl_line(0xb3)
	.dwattr $C$DW$T$117, DW_AT_decl_column(0x13)
$C$DW$T$356	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$356, DW_AT_type(*$C$DW$T$117)

$C$DW$T$118	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$118, DW_AT_byte_size(0x04)
$C$DW$618	.dwtag  DW_TAG_member
	.dwattr $C$DW$618, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$618, DW_AT_name("modulemode")
	.dwattr $C$DW$618, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$618, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$618, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$618, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$618, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$618, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$618, DW_AT_decl_column(0x0d)
$C$DW$619	.dwtag  DW_TAG_member
	.dwattr $C$DW$619, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$619, DW_AT_name("resv2")
	.dwattr $C$DW$619, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$619, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$619, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$619, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$619, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$619, DW_AT_decl_line(0xc1)
	.dwattr $C$DW$619, DW_AT_decl_column(0x0d)
$C$DW$620	.dwtag  DW_TAG_member
	.dwattr $C$DW$620, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$620, DW_AT_name("idlest")
	.dwattr $C$DW$620, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$620, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$620, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$620, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$620, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$620, DW_AT_decl_line(0xc2)
	.dwattr $C$DW$620, DW_AT_decl_column(0x0d)
$C$DW$621	.dwtag  DW_TAG_member
	.dwattr $C$DW$621, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$621, DW_AT_name("resv1")
	.dwattr $C$DW$621, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$621, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$621, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$621, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$621, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$621, DW_AT_decl_line(0xc3)
	.dwattr $C$DW$621, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$118

	.dwattr $C$DW$T$118, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$118, DW_AT_decl_line(0xbf)
	.dwattr $C$DW$T$118, DW_AT_decl_column(0x13)
$C$DW$T$358	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$358, DW_AT_type(*$C$DW$T$118)

$C$DW$T$119	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$119, DW_AT_byte_size(0x04)
$C$DW$622	.dwtag  DW_TAG_member
	.dwattr $C$DW$622, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$622, DW_AT_name("modulemode")
	.dwattr $C$DW$622, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$622, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$622, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$622, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$622, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$622, DW_AT_decl_line(0xcc)
	.dwattr $C$DW$622, DW_AT_decl_column(0x0d)
$C$DW$623	.dwtag  DW_TAG_member
	.dwattr $C$DW$623, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$623, DW_AT_name("resv2")
	.dwattr $C$DW$623, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$623, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$623, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$623, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$623, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$623, DW_AT_decl_line(0xcd)
	.dwattr $C$DW$623, DW_AT_decl_column(0x0d)
$C$DW$624	.dwtag  DW_TAG_member
	.dwattr $C$DW$624, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$624, DW_AT_name("idlest")
	.dwattr $C$DW$624, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$624, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$624, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$624, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$624, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$624, DW_AT_decl_line(0xce)
	.dwattr $C$DW$624, DW_AT_decl_column(0x0d)
$C$DW$625	.dwtag  DW_TAG_member
	.dwattr $C$DW$625, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$625, DW_AT_name("resv1")
	.dwattr $C$DW$625, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$625, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$625, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$625, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$625, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$625, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$625, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$119

	.dwattr $C$DW$T$119, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$119, DW_AT_decl_line(0xcb)
	.dwattr $C$DW$T$119, DW_AT_decl_column(0x13)
$C$DW$T$360	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$360, DW_AT_type(*$C$DW$T$119)

$C$DW$T$120	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$120, DW_AT_byte_size(0x04)
$C$DW$626	.dwtag  DW_TAG_member
	.dwattr $C$DW$626, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$626, DW_AT_name("modulemode")
	.dwattr $C$DW$626, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$626, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$626, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$626, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$626, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$626, DW_AT_decl_line(0xd8)
	.dwattr $C$DW$626, DW_AT_decl_column(0x0d)
$C$DW$627	.dwtag  DW_TAG_member
	.dwattr $C$DW$627, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$627, DW_AT_name("resv2")
	.dwattr $C$DW$627, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$627, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$627, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$627, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$627, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$627, DW_AT_decl_line(0xd9)
	.dwattr $C$DW$627, DW_AT_decl_column(0x0d)
$C$DW$628	.dwtag  DW_TAG_member
	.dwattr $C$DW$628, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$628, DW_AT_name("idlest")
	.dwattr $C$DW$628, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$628, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$628, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$628, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$628, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$628, DW_AT_decl_line(0xda)
	.dwattr $C$DW$628, DW_AT_decl_column(0x0d)
$C$DW$629	.dwtag  DW_TAG_member
	.dwattr $C$DW$629, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$629, DW_AT_name("resv1")
	.dwattr $C$DW$629, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$629, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$629, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$629, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$629, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$629, DW_AT_decl_line(0xdb)
	.dwattr $C$DW$629, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$120

	.dwattr $C$DW$T$120, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$120, DW_AT_decl_line(0xd7)
	.dwattr $C$DW$T$120, DW_AT_decl_column(0x13)
$C$DW$T$362	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$362, DW_AT_type(*$C$DW$T$120)

$C$DW$T$121	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$121, DW_AT_byte_size(0x04)
$C$DW$630	.dwtag  DW_TAG_member
	.dwattr $C$DW$630, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$630, DW_AT_name("modulemode")
	.dwattr $C$DW$630, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$630, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$630, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$630, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$630, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$630, DW_AT_decl_line(0xe4)
	.dwattr $C$DW$630, DW_AT_decl_column(0x0d)
$C$DW$631	.dwtag  DW_TAG_member
	.dwattr $C$DW$631, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$631, DW_AT_name("resv2")
	.dwattr $C$DW$631, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$631, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$631, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$631, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$631, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$631, DW_AT_decl_line(0xe5)
	.dwattr $C$DW$631, DW_AT_decl_column(0x0d)
$C$DW$632	.dwtag  DW_TAG_member
	.dwattr $C$DW$632, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$632, DW_AT_name("idlest")
	.dwattr $C$DW$632, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$632, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$632, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$632, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$632, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$632, DW_AT_decl_line(0xe6)
	.dwattr $C$DW$632, DW_AT_decl_column(0x0d)
$C$DW$633	.dwtag  DW_TAG_member
	.dwattr $C$DW$633, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$633, DW_AT_name("resv1")
	.dwattr $C$DW$633, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$633, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$633, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$633, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$633, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$633, DW_AT_decl_line(0xe7)
	.dwattr $C$DW$633, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$121

	.dwattr $C$DW$T$121, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$121, DW_AT_decl_line(0xe3)
	.dwattr $C$DW$T$121, DW_AT_decl_column(0x13)
$C$DW$T$364	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$364, DW_AT_type(*$C$DW$T$121)

$C$DW$T$122	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$122, DW_AT_byte_size(0x04)
$C$DW$634	.dwtag  DW_TAG_member
	.dwattr $C$DW$634, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$634, DW_AT_name("modulemode")
	.dwattr $C$DW$634, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$634, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$634, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$634, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$634, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$634, DW_AT_decl_line(0xf0)
	.dwattr $C$DW$634, DW_AT_decl_column(0x0d)
$C$DW$635	.dwtag  DW_TAG_member
	.dwattr $C$DW$635, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$635, DW_AT_name("resv2")
	.dwattr $C$DW$635, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$635, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$635, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$635, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$635, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$635, DW_AT_decl_line(0xf1)
	.dwattr $C$DW$635, DW_AT_decl_column(0x0d)
$C$DW$636	.dwtag  DW_TAG_member
	.dwattr $C$DW$636, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$636, DW_AT_name("idlest")
	.dwattr $C$DW$636, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$636, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$636, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$636, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$636, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$636, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$636, DW_AT_decl_column(0x0d)
$C$DW$637	.dwtag  DW_TAG_member
	.dwattr $C$DW$637, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$637, DW_AT_name("resv1")
	.dwattr $C$DW$637, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$637, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$637, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$637, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$637, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$637, DW_AT_decl_line(0xf3)
	.dwattr $C$DW$637, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$122

	.dwattr $C$DW$T$122, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$122, DW_AT_decl_line(0xef)
	.dwattr $C$DW$T$122, DW_AT_decl_column(0x13)
$C$DW$T$366	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$366, DW_AT_type(*$C$DW$T$122)

$C$DW$T$123	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$123, DW_AT_byte_size(0x04)
$C$DW$638	.dwtag  DW_TAG_member
	.dwattr $C$DW$638, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$638, DW_AT_name("modulemode")
	.dwattr $C$DW$638, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$638, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$638, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$638, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$638, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$638, DW_AT_decl_line(0xfc)
	.dwattr $C$DW$638, DW_AT_decl_column(0x0d)
$C$DW$639	.dwtag  DW_TAG_member
	.dwattr $C$DW$639, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$639, DW_AT_name("resv2")
	.dwattr $C$DW$639, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$639, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$639, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$639, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$639, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$639, DW_AT_decl_line(0xfd)
	.dwattr $C$DW$639, DW_AT_decl_column(0x0d)
$C$DW$640	.dwtag  DW_TAG_member
	.dwattr $C$DW$640, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$640, DW_AT_name("idlest")
	.dwattr $C$DW$640, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$640, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$640, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$640, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$640, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$640, DW_AT_decl_line(0xfe)
	.dwattr $C$DW$640, DW_AT_decl_column(0x0d)
$C$DW$641	.dwtag  DW_TAG_member
	.dwattr $C$DW$641, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$641, DW_AT_name("resv1")
	.dwattr $C$DW$641, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$641, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$641, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$641, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$641, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$641, DW_AT_decl_line(0xff)
	.dwattr $C$DW$641, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$123

	.dwattr $C$DW$T$123, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$123, DW_AT_decl_line(0xfb)
	.dwattr $C$DW$T$123, DW_AT_decl_column(0x13)
$C$DW$T$368	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$368, DW_AT_type(*$C$DW$T$123)

$C$DW$T$124	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$124, DW_AT_byte_size(0x04)
$C$DW$642	.dwtag  DW_TAG_member
	.dwattr $C$DW$642, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$642, DW_AT_name("modulemode")
	.dwattr $C$DW$642, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$642, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$642, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$642, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$642, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$642, DW_AT_decl_line(0x108)
	.dwattr $C$DW$642, DW_AT_decl_column(0x0d)
$C$DW$643	.dwtag  DW_TAG_member
	.dwattr $C$DW$643, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$643, DW_AT_name("resv2")
	.dwattr $C$DW$643, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$643, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$643, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$643, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$643, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$643, DW_AT_decl_line(0x109)
	.dwattr $C$DW$643, DW_AT_decl_column(0x0d)
$C$DW$644	.dwtag  DW_TAG_member
	.dwattr $C$DW$644, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$644, DW_AT_name("idlest")
	.dwattr $C$DW$644, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$644, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$644, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$644, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$644, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$644, DW_AT_decl_line(0x10a)
	.dwattr $C$DW$644, DW_AT_decl_column(0x0d)
$C$DW$645	.dwtag  DW_TAG_member
	.dwattr $C$DW$645, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$645, DW_AT_name("resv1")
	.dwattr $C$DW$645, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$645, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$645, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$645, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$645, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$645, DW_AT_decl_line(0x10b)
	.dwattr $C$DW$645, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$124

	.dwattr $C$DW$T$124, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$124, DW_AT_decl_line(0x107)
	.dwattr $C$DW$T$124, DW_AT_decl_column(0x13)
$C$DW$T$370	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$370, DW_AT_type(*$C$DW$T$124)

$C$DW$T$125	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$125, DW_AT_byte_size(0x04)
$C$DW$646	.dwtag  DW_TAG_member
	.dwattr $C$DW$646, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$646, DW_AT_name("modulemode")
	.dwattr $C$DW$646, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$646, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$646, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$646, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$646, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$646, DW_AT_decl_line(0x120)
	.dwattr $C$DW$646, DW_AT_decl_column(0x0d)
$C$DW$647	.dwtag  DW_TAG_member
	.dwattr $C$DW$647, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$647, DW_AT_name("resv2")
	.dwattr $C$DW$647, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$647, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$647, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$647, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$647, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$647, DW_AT_decl_line(0x121)
	.dwattr $C$DW$647, DW_AT_decl_column(0x0d)
$C$DW$648	.dwtag  DW_TAG_member
	.dwattr $C$DW$648, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$648, DW_AT_name("idlest")
	.dwattr $C$DW$648, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$648, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$648, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$648, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$648, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$648, DW_AT_decl_line(0x122)
	.dwattr $C$DW$648, DW_AT_decl_column(0x0d)
$C$DW$649	.dwtag  DW_TAG_member
	.dwattr $C$DW$649, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$649, DW_AT_name("resv1")
	.dwattr $C$DW$649, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$649, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$649, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$649, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$649, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$649, DW_AT_decl_line(0x123)
	.dwattr $C$DW$649, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$125

	.dwattr $C$DW$T$125, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$125, DW_AT_decl_line(0x11f)
	.dwattr $C$DW$T$125, DW_AT_decl_column(0x13)
$C$DW$T$372	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$372, DW_AT_type(*$C$DW$T$125)

$C$DW$T$126	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$126, DW_AT_byte_size(0x04)
$C$DW$650	.dwtag  DW_TAG_member
	.dwattr $C$DW$650, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$650, DW_AT_name("modulemode")
	.dwattr $C$DW$650, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$650, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$650, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$650, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$650, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$650, DW_AT_decl_line(0x130)
	.dwattr $C$DW$650, DW_AT_decl_column(0x0d)
$C$DW$651	.dwtag  DW_TAG_member
	.dwattr $C$DW$651, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$651, DW_AT_name("resv2")
	.dwattr $C$DW$651, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$651, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$651, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$651, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$651, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$651, DW_AT_decl_line(0x131)
	.dwattr $C$DW$651, DW_AT_decl_column(0x0d)
$C$DW$652	.dwtag  DW_TAG_member
	.dwattr $C$DW$652, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$652, DW_AT_name("idlest")
	.dwattr $C$DW$652, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$652, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$652, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$652, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$652, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$652, DW_AT_decl_line(0x132)
	.dwattr $C$DW$652, DW_AT_decl_column(0x0d)
$C$DW$653	.dwtag  DW_TAG_member
	.dwattr $C$DW$653, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$653, DW_AT_name("resv1")
	.dwattr $C$DW$653, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$653, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$653, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$653, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$653, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$653, DW_AT_decl_line(0x133)
	.dwattr $C$DW$653, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$126

	.dwattr $C$DW$T$126, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$126, DW_AT_decl_line(0x12f)
	.dwattr $C$DW$T$126, DW_AT_decl_column(0x13)
$C$DW$T$374	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$374, DW_AT_type(*$C$DW$T$126)

$C$DW$T$127	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$127, DW_AT_byte_size(0x04)
$C$DW$654	.dwtag  DW_TAG_member
	.dwattr $C$DW$654, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$654, DW_AT_name("modulemode")
	.dwattr $C$DW$654, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$654, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$654, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$654, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$654, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$654, DW_AT_decl_line(0x13c)
	.dwattr $C$DW$654, DW_AT_decl_column(0x0d)
$C$DW$655	.dwtag  DW_TAG_member
	.dwattr $C$DW$655, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$655, DW_AT_name("resv2")
	.dwattr $C$DW$655, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$655, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$655, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$655, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$655, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$655, DW_AT_decl_line(0x13d)
	.dwattr $C$DW$655, DW_AT_decl_column(0x0d)
$C$DW$656	.dwtag  DW_TAG_member
	.dwattr $C$DW$656, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$656, DW_AT_name("idlest")
	.dwattr $C$DW$656, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$656, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$656, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$656, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$656, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$656, DW_AT_decl_line(0x13e)
	.dwattr $C$DW$656, DW_AT_decl_column(0x0d)
$C$DW$657	.dwtag  DW_TAG_member
	.dwattr $C$DW$657, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$657, DW_AT_name("resv1")
	.dwattr $C$DW$657, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$657, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$657, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$657, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$657, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$657, DW_AT_decl_line(0x13f)
	.dwattr $C$DW$657, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$127

	.dwattr $C$DW$T$127, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$127, DW_AT_decl_line(0x13b)
	.dwattr $C$DW$T$127, DW_AT_decl_column(0x13)
$C$DW$T$376	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$376, DW_AT_type(*$C$DW$T$127)

$C$DW$T$128	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$128, DW_AT_byte_size(0x04)
$C$DW$658	.dwtag  DW_TAG_member
	.dwattr $C$DW$658, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$658, DW_AT_name("modulemode")
	.dwattr $C$DW$658, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$658, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$658, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$658, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$658, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$658, DW_AT_decl_line(0x148)
	.dwattr $C$DW$658, DW_AT_decl_column(0x0d)
$C$DW$659	.dwtag  DW_TAG_member
	.dwattr $C$DW$659, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$659, DW_AT_name("resv2")
	.dwattr $C$DW$659, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$659, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$659, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$659, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$659, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$659, DW_AT_decl_line(0x149)
	.dwattr $C$DW$659, DW_AT_decl_column(0x0d)
$C$DW$660	.dwtag  DW_TAG_member
	.dwattr $C$DW$660, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$660, DW_AT_name("idlest")
	.dwattr $C$DW$660, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$660, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$660, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$660, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$660, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$660, DW_AT_decl_line(0x14a)
	.dwattr $C$DW$660, DW_AT_decl_column(0x0d)
$C$DW$661	.dwtag  DW_TAG_member
	.dwattr $C$DW$661, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$661, DW_AT_name("resv1")
	.dwattr $C$DW$661, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$661, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$661, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$661, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$661, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$661, DW_AT_decl_line(0x14b)
	.dwattr $C$DW$661, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$128

	.dwattr $C$DW$T$128, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$128, DW_AT_decl_line(0x147)
	.dwattr $C$DW$T$128, DW_AT_decl_column(0x13)
$C$DW$T$378	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$378, DW_AT_type(*$C$DW$T$128)

$C$DW$T$129	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$129, DW_AT_byte_size(0x04)
$C$DW$662	.dwtag  DW_TAG_member
	.dwattr $C$DW$662, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$662, DW_AT_name("modulemode")
	.dwattr $C$DW$662, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$662, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$662, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$662, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$662, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$662, DW_AT_decl_line(0x154)
	.dwattr $C$DW$662, DW_AT_decl_column(0x0d)
$C$DW$663	.dwtag  DW_TAG_member
	.dwattr $C$DW$663, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$663, DW_AT_name("resv2")
	.dwattr $C$DW$663, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$663, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$663, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$663, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$663, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$663, DW_AT_decl_line(0x155)
	.dwattr $C$DW$663, DW_AT_decl_column(0x0d)
$C$DW$664	.dwtag  DW_TAG_member
	.dwattr $C$DW$664, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$664, DW_AT_name("idlest")
	.dwattr $C$DW$664, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$664, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$664, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$664, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$664, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$664, DW_AT_decl_line(0x156)
	.dwattr $C$DW$664, DW_AT_decl_column(0x0d)
$C$DW$665	.dwtag  DW_TAG_member
	.dwattr $C$DW$665, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$665, DW_AT_name("resv1")
	.dwattr $C$DW$665, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$665, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$665, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$665, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$665, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$665, DW_AT_decl_line(0x157)
	.dwattr $C$DW$665, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$129

	.dwattr $C$DW$T$129, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$129, DW_AT_decl_line(0x153)
	.dwattr $C$DW$T$129, DW_AT_decl_column(0x13)
$C$DW$T$380	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$380, DW_AT_type(*$C$DW$T$129)

$C$DW$T$130	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$130, DW_AT_byte_size(0x04)
$C$DW$666	.dwtag  DW_TAG_member
	.dwattr $C$DW$666, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$666, DW_AT_name("modulemode")
	.dwattr $C$DW$666, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$666, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$666, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$666, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$666, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$666, DW_AT_decl_line(0x160)
	.dwattr $C$DW$666, DW_AT_decl_column(0x0d)
$C$DW$667	.dwtag  DW_TAG_member
	.dwattr $C$DW$667, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$667, DW_AT_name("resv2")
	.dwattr $C$DW$667, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$667, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$667, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$667, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$667, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$667, DW_AT_decl_line(0x161)
	.dwattr $C$DW$667, DW_AT_decl_column(0x0d)
$C$DW$668	.dwtag  DW_TAG_member
	.dwattr $C$DW$668, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$668, DW_AT_name("idlest")
	.dwattr $C$DW$668, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$668, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$668, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$668, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$668, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$668, DW_AT_decl_line(0x162)
	.dwattr $C$DW$668, DW_AT_decl_column(0x0d)
$C$DW$669	.dwtag  DW_TAG_member
	.dwattr $C$DW$669, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$669, DW_AT_name("resv1")
	.dwattr $C$DW$669, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$669, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$669, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$669, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$669, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$669, DW_AT_decl_line(0x163)
	.dwattr $C$DW$669, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$130

	.dwattr $C$DW$T$130, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$130, DW_AT_decl_line(0x15f)
	.dwattr $C$DW$T$130, DW_AT_decl_column(0x13)
$C$DW$T$382	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$382, DW_AT_type(*$C$DW$T$130)

$C$DW$T$131	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$131, DW_AT_byte_size(0x04)
$C$DW$670	.dwtag  DW_TAG_member
	.dwattr $C$DW$670, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$670, DW_AT_name("modulemode")
	.dwattr $C$DW$670, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$670, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$670, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$670, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$670, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$670, DW_AT_decl_line(0x16c)
	.dwattr $C$DW$670, DW_AT_decl_column(0x0d)
$C$DW$671	.dwtag  DW_TAG_member
	.dwattr $C$DW$671, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$671, DW_AT_name("resv2")
	.dwattr $C$DW$671, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$671, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$671, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$671, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$671, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$671, DW_AT_decl_line(0x16d)
	.dwattr $C$DW$671, DW_AT_decl_column(0x0d)
$C$DW$672	.dwtag  DW_TAG_member
	.dwattr $C$DW$672, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$672, DW_AT_name("idlest")
	.dwattr $C$DW$672, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$672, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$672, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$672, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$672, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$672, DW_AT_decl_line(0x16e)
	.dwattr $C$DW$672, DW_AT_decl_column(0x0d)
$C$DW$673	.dwtag  DW_TAG_member
	.dwattr $C$DW$673, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$673, DW_AT_name("resv1")
	.dwattr $C$DW$673, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$673, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$673, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$673, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$673, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$673, DW_AT_decl_line(0x16f)
	.dwattr $C$DW$673, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$131

	.dwattr $C$DW$T$131, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$131, DW_AT_decl_line(0x16b)
	.dwattr $C$DW$T$131, DW_AT_decl_column(0x13)
$C$DW$T$384	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$384, DW_AT_type(*$C$DW$T$131)

$C$DW$T$132	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$132, DW_AT_byte_size(0x04)
$C$DW$674	.dwtag  DW_TAG_member
	.dwattr $C$DW$674, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$674, DW_AT_name("modulemode")
	.dwattr $C$DW$674, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$674, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$674, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$674, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$674, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$674, DW_AT_decl_line(0x178)
	.dwattr $C$DW$674, DW_AT_decl_column(0x0d)
$C$DW$675	.dwtag  DW_TAG_member
	.dwattr $C$DW$675, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$675, DW_AT_name("resv2")
	.dwattr $C$DW$675, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$675, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$675, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$675, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$675, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$675, DW_AT_decl_line(0x179)
	.dwattr $C$DW$675, DW_AT_decl_column(0x0d)
$C$DW$676	.dwtag  DW_TAG_member
	.dwattr $C$DW$676, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$676, DW_AT_name("idlest")
	.dwattr $C$DW$676, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$676, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$676, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$676, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$676, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$676, DW_AT_decl_line(0x17a)
	.dwattr $C$DW$676, DW_AT_decl_column(0x0d)
$C$DW$677	.dwtag  DW_TAG_member
	.dwattr $C$DW$677, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$677, DW_AT_name("resv1")
	.dwattr $C$DW$677, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$677, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$677, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$677, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$677, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$677, DW_AT_decl_line(0x17b)
	.dwattr $C$DW$677, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$132

	.dwattr $C$DW$T$132, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$132, DW_AT_decl_line(0x177)
	.dwattr $C$DW$T$132, DW_AT_decl_column(0x13)
$C$DW$T$386	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$386, DW_AT_type(*$C$DW$T$132)

$C$DW$T$133	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$133, DW_AT_byte_size(0x04)
$C$DW$678	.dwtag  DW_TAG_member
	.dwattr $C$DW$678, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$678, DW_AT_name("modulemode")
	.dwattr $C$DW$678, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$678, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$678, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$678, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$678, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$678, DW_AT_decl_line(0x184)
	.dwattr $C$DW$678, DW_AT_decl_column(0x0d)
$C$DW$679	.dwtag  DW_TAG_member
	.dwattr $C$DW$679, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$679, DW_AT_name("resv2")
	.dwattr $C$DW$679, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$679, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$679, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$679, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$679, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$679, DW_AT_decl_line(0x185)
	.dwattr $C$DW$679, DW_AT_decl_column(0x0d)
$C$DW$680	.dwtag  DW_TAG_member
	.dwattr $C$DW$680, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$680, DW_AT_name("idlest")
	.dwattr $C$DW$680, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$680, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$680, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$680, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$680, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$680, DW_AT_decl_line(0x186)
	.dwattr $C$DW$680, DW_AT_decl_column(0x0d)
$C$DW$681	.dwtag  DW_TAG_member
	.dwattr $C$DW$681, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$681, DW_AT_name("resv1")
	.dwattr $C$DW$681, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$681, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$681, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$681, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$681, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$681, DW_AT_decl_line(0x187)
	.dwattr $C$DW$681, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$133

	.dwattr $C$DW$T$133, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$133, DW_AT_decl_line(0x183)
	.dwattr $C$DW$T$133, DW_AT_decl_column(0x13)
$C$DW$T$388	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$388, DW_AT_type(*$C$DW$T$133)

$C$DW$T$134	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$134, DW_AT_byte_size(0x04)
$C$DW$682	.dwtag  DW_TAG_member
	.dwattr $C$DW$682, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$682, DW_AT_name("modulemode")
	.dwattr $C$DW$682, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$682, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$682, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$682, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$682, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$682, DW_AT_decl_line(0x190)
	.dwattr $C$DW$682, DW_AT_decl_column(0x0d)
$C$DW$683	.dwtag  DW_TAG_member
	.dwattr $C$DW$683, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$683, DW_AT_name("resv2")
	.dwattr $C$DW$683, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$683, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$683, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$683, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$683, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$683, DW_AT_decl_line(0x191)
	.dwattr $C$DW$683, DW_AT_decl_column(0x0d)
$C$DW$684	.dwtag  DW_TAG_member
	.dwattr $C$DW$684, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$684, DW_AT_name("idlest")
	.dwattr $C$DW$684, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$684, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$684, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$684, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$684, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$684, DW_AT_decl_line(0x192)
	.dwattr $C$DW$684, DW_AT_decl_column(0x0d)
$C$DW$685	.dwtag  DW_TAG_member
	.dwattr $C$DW$685, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$685, DW_AT_name("resv1")
	.dwattr $C$DW$685, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$685, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$685, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$685, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$685, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$685, DW_AT_decl_line(0x193)
	.dwattr $C$DW$685, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$134

	.dwattr $C$DW$T$134, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$134, DW_AT_decl_line(0x18f)
	.dwattr $C$DW$T$134, DW_AT_decl_column(0x13)
$C$DW$T$390	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$390, DW_AT_type(*$C$DW$T$134)

$C$DW$T$135	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$135, DW_AT_byte_size(0x04)
$C$DW$686	.dwtag  DW_TAG_member
	.dwattr $C$DW$686, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$686, DW_AT_name("modulemode")
	.dwattr $C$DW$686, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$686, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$686, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$686, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$686, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$686, DW_AT_decl_line(0x1a0)
	.dwattr $C$DW$686, DW_AT_decl_column(0x0d)
$C$DW$687	.dwtag  DW_TAG_member
	.dwattr $C$DW$687, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$687, DW_AT_name("resv2")
	.dwattr $C$DW$687, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$687, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$687, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$687, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$687, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$687, DW_AT_decl_line(0x1a1)
	.dwattr $C$DW$687, DW_AT_decl_column(0x0d)
$C$DW$688	.dwtag  DW_TAG_member
	.dwattr $C$DW$688, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$688, DW_AT_name("idlest")
	.dwattr $C$DW$688, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$688, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$688, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$688, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$688, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$688, DW_AT_decl_line(0x1a2)
	.dwattr $C$DW$688, DW_AT_decl_column(0x0d)
$C$DW$689	.dwtag  DW_TAG_member
	.dwattr $C$DW$689, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$689, DW_AT_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$689, DW_AT_TI_symbol_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$689, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$689, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$689, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$689, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$689, DW_AT_decl_line(0x1a3)
	.dwattr $C$DW$689, DW_AT_decl_column(0x0d)
$C$DW$690	.dwtag  DW_TAG_member
	.dwattr $C$DW$690, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$690, DW_AT_name("resv1")
	.dwattr $C$DW$690, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$690, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$690, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$690, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$690, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$690, DW_AT_decl_line(0x1a4)
	.dwattr $C$DW$690, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$135

	.dwattr $C$DW$T$135, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$135, DW_AT_decl_line(0x19f)
	.dwattr $C$DW$T$135, DW_AT_decl_column(0x13)
$C$DW$T$392	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$392, DW_AT_type(*$C$DW$T$135)

$C$DW$T$136	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$136, DW_AT_byte_size(0x04)
$C$DW$691	.dwtag  DW_TAG_member
	.dwattr $C$DW$691, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$691, DW_AT_name("modulemode")
	.dwattr $C$DW$691, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$691, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$691, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$691, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$691, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$691, DW_AT_decl_line(0x1ad)
	.dwattr $C$DW$691, DW_AT_decl_column(0x0d)
$C$DW$692	.dwtag  DW_TAG_member
	.dwattr $C$DW$692, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$692, DW_AT_name("resv2")
	.dwattr $C$DW$692, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$692, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$692, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$692, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$692, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$692, DW_AT_decl_line(0x1ae)
	.dwattr $C$DW$692, DW_AT_decl_column(0x0d)
$C$DW$693	.dwtag  DW_TAG_member
	.dwattr $C$DW$693, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$693, DW_AT_name("idlest")
	.dwattr $C$DW$693, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$693, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$693, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$693, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$693, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$693, DW_AT_decl_line(0x1af)
	.dwattr $C$DW$693, DW_AT_decl_column(0x0d)
$C$DW$694	.dwtag  DW_TAG_member
	.dwattr $C$DW$694, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$694, DW_AT_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$694, DW_AT_TI_symbol_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$694, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$694, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$694, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$694, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$694, DW_AT_decl_line(0x1b0)
	.dwattr $C$DW$694, DW_AT_decl_column(0x0d)
$C$DW$695	.dwtag  DW_TAG_member
	.dwattr $C$DW$695, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$695, DW_AT_name("resv1")
	.dwattr $C$DW$695, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$695, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$695, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$695, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$695, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$695, DW_AT_decl_line(0x1b1)
	.dwattr $C$DW$695, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$136

	.dwattr $C$DW$T$136, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$136, DW_AT_decl_line(0x1ac)
	.dwattr $C$DW$T$136, DW_AT_decl_column(0x13)
$C$DW$T$394	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$394, DW_AT_type(*$C$DW$T$136)

$C$DW$T$137	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$137, DW_AT_byte_size(0x04)
$C$DW$696	.dwtag  DW_TAG_member
	.dwattr $C$DW$696, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$696, DW_AT_name("modulemode")
	.dwattr $C$DW$696, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$696, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$696, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$696, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$696, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$696, DW_AT_decl_line(0x1ba)
	.dwattr $C$DW$696, DW_AT_decl_column(0x0d)
$C$DW$697	.dwtag  DW_TAG_member
	.dwattr $C$DW$697, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$697, DW_AT_name("resv2")
	.dwattr $C$DW$697, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$697, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$697, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$697, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$697, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$697, DW_AT_decl_line(0x1bb)
	.dwattr $C$DW$697, DW_AT_decl_column(0x0d)
$C$DW$698	.dwtag  DW_TAG_member
	.dwattr $C$DW$698, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$698, DW_AT_name("idlest")
	.dwattr $C$DW$698, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$698, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$698, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$698, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$698, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$698, DW_AT_decl_line(0x1bc)
	.dwattr $C$DW$698, DW_AT_decl_column(0x0d)
$C$DW$699	.dwtag  DW_TAG_member
	.dwattr $C$DW$699, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$699, DW_AT_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$699, DW_AT_TI_symbol_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$699, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$699, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$699, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$699, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$699, DW_AT_decl_line(0x1bd)
	.dwattr $C$DW$699, DW_AT_decl_column(0x0d)
$C$DW$700	.dwtag  DW_TAG_member
	.dwattr $C$DW$700, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$700, DW_AT_name("resv1")
	.dwattr $C$DW$700, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$700, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$700, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$700, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$700, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$700, DW_AT_decl_line(0x1be)
	.dwattr $C$DW$700, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$137

	.dwattr $C$DW$T$137, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$137, DW_AT_decl_line(0x1b9)
	.dwattr $C$DW$T$137, DW_AT_decl_column(0x13)
$C$DW$T$396	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$396, DW_AT_type(*$C$DW$T$137)

$C$DW$T$138	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$138, DW_AT_byte_size(0x04)
$C$DW$701	.dwtag  DW_TAG_member
	.dwattr $C$DW$701, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$701, DW_AT_name("modulemode")
	.dwattr $C$DW$701, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$701, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$701, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$701, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$701, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$701, DW_AT_decl_line(0x1cb)
	.dwattr $C$DW$701, DW_AT_decl_column(0x0d)
$C$DW$702	.dwtag  DW_TAG_member
	.dwattr $C$DW$702, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$702, DW_AT_name("resv2")
	.dwattr $C$DW$702, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$702, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$702, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$702, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$702, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$702, DW_AT_decl_line(0x1cc)
	.dwattr $C$DW$702, DW_AT_decl_column(0x0d)
$C$DW$703	.dwtag  DW_TAG_member
	.dwattr $C$DW$703, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$703, DW_AT_name("idlest")
	.dwattr $C$DW$703, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$703, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$703, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$703, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$703, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$703, DW_AT_decl_line(0x1cd)
	.dwattr $C$DW$703, DW_AT_decl_column(0x0d)
$C$DW$704	.dwtag  DW_TAG_member
	.dwattr $C$DW$704, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$704, DW_AT_name("resv1")
	.dwattr $C$DW$704, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$704, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$704, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$704, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$704, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$704, DW_AT_decl_line(0x1ce)
	.dwattr $C$DW$704, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$138

	.dwattr $C$DW$T$138, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$138, DW_AT_decl_line(0x1ca)
	.dwattr $C$DW$T$138, DW_AT_decl_column(0x13)
$C$DW$T$398	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$398, DW_AT_type(*$C$DW$T$138)

$C$DW$T$139	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$139, DW_AT_byte_size(0x04)
$C$DW$705	.dwtag  DW_TAG_member
	.dwattr $C$DW$705, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$705, DW_AT_name("modulemode")
	.dwattr $C$DW$705, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$705, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$705, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$705, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$705, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$705, DW_AT_decl_line(0x1d7)
	.dwattr $C$DW$705, DW_AT_decl_column(0x0d)
$C$DW$706	.dwtag  DW_TAG_member
	.dwattr $C$DW$706, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$706, DW_AT_name("resv2")
	.dwattr $C$DW$706, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$706, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$706, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$706, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$706, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$706, DW_AT_decl_line(0x1d8)
	.dwattr $C$DW$706, DW_AT_decl_column(0x0d)
$C$DW$707	.dwtag  DW_TAG_member
	.dwattr $C$DW$707, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$707, DW_AT_name("idlest")
	.dwattr $C$DW$707, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$707, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$707, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$707, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$707, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$707, DW_AT_decl_line(0x1d9)
	.dwattr $C$DW$707, DW_AT_decl_column(0x0d)
$C$DW$708	.dwtag  DW_TAG_member
	.dwattr $C$DW$708, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$708, DW_AT_name("resv1")
	.dwattr $C$DW$708, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$708, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$708, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$708, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$708, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$708, DW_AT_decl_line(0x1da)
	.dwattr $C$DW$708, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$139

	.dwattr $C$DW$T$139, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$139, DW_AT_decl_line(0x1d6)
	.dwattr $C$DW$T$139, DW_AT_decl_column(0x13)
$C$DW$T$400	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$400, DW_AT_type(*$C$DW$T$139)

$C$DW$T$140	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$140, DW_AT_byte_size(0x04)
$C$DW$709	.dwtag  DW_TAG_member
	.dwattr $C$DW$709, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$709, DW_AT_name("modulemode")
	.dwattr $C$DW$709, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$709, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$709, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$709, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$709, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$709, DW_AT_decl_line(0x1e3)
	.dwattr $C$DW$709, DW_AT_decl_column(0x0d)
$C$DW$710	.dwtag  DW_TAG_member
	.dwattr $C$DW$710, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$710, DW_AT_name("resv2")
	.dwattr $C$DW$710, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$710, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$710, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$710, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$710, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$710, DW_AT_decl_line(0x1e4)
	.dwattr $C$DW$710, DW_AT_decl_column(0x0d)
$C$DW$711	.dwtag  DW_TAG_member
	.dwattr $C$DW$711, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$711, DW_AT_name("idlest")
	.dwattr $C$DW$711, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$711, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$711, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$711, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$711, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$711, DW_AT_decl_line(0x1e5)
	.dwattr $C$DW$711, DW_AT_decl_column(0x0d)
$C$DW$712	.dwtag  DW_TAG_member
	.dwattr $C$DW$712, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$712, DW_AT_name("resv1")
	.dwattr $C$DW$712, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$712, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$712, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$712, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$712, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$712, DW_AT_decl_line(0x1e6)
	.dwattr $C$DW$712, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$140

	.dwattr $C$DW$T$140, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$140, DW_AT_decl_line(0x1e2)
	.dwattr $C$DW$T$140, DW_AT_decl_column(0x13)
$C$DW$T$402	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$402, DW_AT_type(*$C$DW$T$140)

$C$DW$T$141	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$141, DW_AT_byte_size(0x04)
$C$DW$713	.dwtag  DW_TAG_member
	.dwattr $C$DW$713, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$713, DW_AT_name("modulemode")
	.dwattr $C$DW$713, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$713, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$713, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$713, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$713, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$713, DW_AT_decl_line(0x1f3)
	.dwattr $C$DW$713, DW_AT_decl_column(0x0d)
$C$DW$714	.dwtag  DW_TAG_member
	.dwattr $C$DW$714, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$714, DW_AT_name("resv2")
	.dwattr $C$DW$714, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$714, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$714, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$714, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$714, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$714, DW_AT_decl_line(0x1f4)
	.dwattr $C$DW$714, DW_AT_decl_column(0x0d)
$C$DW$715	.dwtag  DW_TAG_member
	.dwattr $C$DW$715, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$715, DW_AT_name("idlest")
	.dwattr $C$DW$715, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$715, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$715, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$715, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$715, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$715, DW_AT_decl_line(0x1f5)
	.dwattr $C$DW$715, DW_AT_decl_column(0x0d)
$C$DW$716	.dwtag  DW_TAG_member
	.dwattr $C$DW$716, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$716, DW_AT_name("resv1")
	.dwattr $C$DW$716, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$716, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$716, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$716, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$716, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$716, DW_AT_decl_line(0x1f6)
	.dwattr $C$DW$716, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$141

	.dwattr $C$DW$T$141, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$141, DW_AT_decl_line(0x1f2)
	.dwattr $C$DW$T$141, DW_AT_decl_column(0x13)
$C$DW$T$404	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$404, DW_AT_type(*$C$DW$T$141)

$C$DW$T$142	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$142, DW_AT_byte_size(0x04)
$C$DW$717	.dwtag  DW_TAG_member
	.dwattr $C$DW$717, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$717, DW_AT_name("modulemode")
	.dwattr $C$DW$717, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$717, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$717, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$717, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$717, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$717, DW_AT_decl_line(0x203)
	.dwattr $C$DW$717, DW_AT_decl_column(0x0d)
$C$DW$718	.dwtag  DW_TAG_member
	.dwattr $C$DW$718, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$718, DW_AT_name("resv2")
	.dwattr $C$DW$718, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$718, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$718, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$718, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$718, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$718, DW_AT_decl_line(0x204)
	.dwattr $C$DW$718, DW_AT_decl_column(0x0d)
$C$DW$719	.dwtag  DW_TAG_member
	.dwattr $C$DW$719, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$719, DW_AT_name("idlest")
	.dwattr $C$DW$719, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$719, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$719, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$719, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$719, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$719, DW_AT_decl_line(0x205)
	.dwattr $C$DW$719, DW_AT_decl_column(0x0d)
$C$DW$720	.dwtag  DW_TAG_member
	.dwattr $C$DW$720, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$720, DW_AT_name("resv1")
	.dwattr $C$DW$720, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$720, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$720, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$720, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$720, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$720, DW_AT_decl_line(0x206)
	.dwattr $C$DW$720, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$142

	.dwattr $C$DW$T$142, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$142, DW_AT_decl_line(0x202)
	.dwattr $C$DW$T$142, DW_AT_decl_column(0x13)
$C$DW$T$406	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$406, DW_AT_type(*$C$DW$T$142)

$C$DW$T$143	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$143, DW_AT_byte_size(0x04)
$C$DW$721	.dwtag  DW_TAG_member
	.dwattr $C$DW$721, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$721, DW_AT_name("modulemode")
	.dwattr $C$DW$721, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$721, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$721, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$721, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$721, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$721, DW_AT_decl_line(0x20f)
	.dwattr $C$DW$721, DW_AT_decl_column(0x0d)
$C$DW$722	.dwtag  DW_TAG_member
	.dwattr $C$DW$722, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$722, DW_AT_name("resv2")
	.dwattr $C$DW$722, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$722, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$722, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$722, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$722, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$722, DW_AT_decl_line(0x210)
	.dwattr $C$DW$722, DW_AT_decl_column(0x0d)
$C$DW$723	.dwtag  DW_TAG_member
	.dwattr $C$DW$723, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$723, DW_AT_name("idlest")
	.dwattr $C$DW$723, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$723, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$723, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$723, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$723, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$723, DW_AT_decl_line(0x211)
	.dwattr $C$DW$723, DW_AT_decl_column(0x0d)
$C$DW$724	.dwtag  DW_TAG_member
	.dwattr $C$DW$724, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$724, DW_AT_name("resv1")
	.dwattr $C$DW$724, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$724, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$724, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$724, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$724, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$724, DW_AT_decl_line(0x212)
	.dwattr $C$DW$724, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$143

	.dwattr $C$DW$T$143, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$143, DW_AT_decl_line(0x20e)
	.dwattr $C$DW$T$143, DW_AT_decl_column(0x13)
$C$DW$T$408	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$408, DW_AT_type(*$C$DW$T$143)

$C$DW$T$144	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$144, DW_AT_byte_size(0x04)
$C$DW$725	.dwtag  DW_TAG_member
	.dwattr $C$DW$725, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$725, DW_AT_name("modulemode")
	.dwattr $C$DW$725, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$725, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$725, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$725, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$725, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$725, DW_AT_decl_line(0x21b)
	.dwattr $C$DW$725, DW_AT_decl_column(0x0d)
$C$DW$726	.dwtag  DW_TAG_member
	.dwattr $C$DW$726, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$726, DW_AT_name("resv2")
	.dwattr $C$DW$726, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$726, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$726, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$726, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$726, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$726, DW_AT_decl_line(0x21c)
	.dwattr $C$DW$726, DW_AT_decl_column(0x0d)
$C$DW$727	.dwtag  DW_TAG_member
	.dwattr $C$DW$727, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$727, DW_AT_name("idlest")
	.dwattr $C$DW$727, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$727, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$727, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$727, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$727, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$727, DW_AT_decl_line(0x21d)
	.dwattr $C$DW$727, DW_AT_decl_column(0x0d)
$C$DW$728	.dwtag  DW_TAG_member
	.dwattr $C$DW$728, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$728, DW_AT_name("resv1")
	.dwattr $C$DW$728, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$728, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$728, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$728, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$728, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$728, DW_AT_decl_line(0x21e)
	.dwattr $C$DW$728, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$144

	.dwattr $C$DW$T$144, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$144, DW_AT_decl_line(0x21a)
	.dwattr $C$DW$T$144, DW_AT_decl_column(0x13)
$C$DW$T$410	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$410, DW_AT_type(*$C$DW$T$144)

$C$DW$T$145	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$145, DW_AT_byte_size(0x04)
$C$DW$729	.dwtag  DW_TAG_member
	.dwattr $C$DW$729, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$729, DW_AT_name("modulemode")
	.dwattr $C$DW$729, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$729, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$729, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$729, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$729, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$729, DW_AT_decl_line(0x227)
	.dwattr $C$DW$729, DW_AT_decl_column(0x0d)
$C$DW$730	.dwtag  DW_TAG_member
	.dwattr $C$DW$730, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$730, DW_AT_name("resv2")
	.dwattr $C$DW$730, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$730, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$730, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$730, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$730, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$730, DW_AT_decl_line(0x228)
	.dwattr $C$DW$730, DW_AT_decl_column(0x0d)
$C$DW$731	.dwtag  DW_TAG_member
	.dwattr $C$DW$731, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$731, DW_AT_name("idlest")
	.dwattr $C$DW$731, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$731, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$731, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$731, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$731, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$731, DW_AT_decl_line(0x229)
	.dwattr $C$DW$731, DW_AT_decl_column(0x0d)
$C$DW$732	.dwtag  DW_TAG_member
	.dwattr $C$DW$732, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$732, DW_AT_name("resv1")
	.dwattr $C$DW$732, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$732, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$732, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$732, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$732, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$732, DW_AT_decl_line(0x22a)
	.dwattr $C$DW$732, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$145

	.dwattr $C$DW$T$145, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$145, DW_AT_decl_line(0x226)
	.dwattr $C$DW$T$145, DW_AT_decl_column(0x13)
$C$DW$T$412	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$412, DW_AT_type(*$C$DW$T$145)

$C$DW$T$146	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$146, DW_AT_byte_size(0x04)
$C$DW$733	.dwtag  DW_TAG_member
	.dwattr $C$DW$733, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$733, DW_AT_name("modulemode")
	.dwattr $C$DW$733, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$733, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$733, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$733, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$733, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$733, DW_AT_decl_line(0x233)
	.dwattr $C$DW$733, DW_AT_decl_column(0x0d)
$C$DW$734	.dwtag  DW_TAG_member
	.dwattr $C$DW$734, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$734, DW_AT_name("resv2")
	.dwattr $C$DW$734, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$734, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$734, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$734, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$734, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$734, DW_AT_decl_line(0x234)
	.dwattr $C$DW$734, DW_AT_decl_column(0x0d)
$C$DW$735	.dwtag  DW_TAG_member
	.dwattr $C$DW$735, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$735, DW_AT_name("idlest")
	.dwattr $C$DW$735, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$735, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$735, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$735, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$735, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$735, DW_AT_decl_line(0x235)
	.dwattr $C$DW$735, DW_AT_decl_column(0x0d)
$C$DW$736	.dwtag  DW_TAG_member
	.dwattr $C$DW$736, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$736, DW_AT_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$736, DW_AT_TI_symbol_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$736, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$736, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$736, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$736, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$736, DW_AT_decl_line(0x236)
	.dwattr $C$DW$736, DW_AT_decl_column(0x0d)
$C$DW$737	.dwtag  DW_TAG_member
	.dwattr $C$DW$737, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$737, DW_AT_name("resv1")
	.dwattr $C$DW$737, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$737, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$737, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$737, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$737, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$737, DW_AT_decl_line(0x237)
	.dwattr $C$DW$737, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$146

	.dwattr $C$DW$T$146, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$146, DW_AT_decl_line(0x232)
	.dwattr $C$DW$T$146, DW_AT_decl_column(0x13)
$C$DW$T$414	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$414, DW_AT_type(*$C$DW$T$146)

$C$DW$T$147	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$147, DW_AT_byte_size(0x04)
$C$DW$738	.dwtag  DW_TAG_member
	.dwattr $C$DW$738, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$738, DW_AT_name("modulemode")
	.dwattr $C$DW$738, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$738, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$738, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$738, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$738, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$738, DW_AT_decl_line(0x240)
	.dwattr $C$DW$738, DW_AT_decl_column(0x0d)
$C$DW$739	.dwtag  DW_TAG_member
	.dwattr $C$DW$739, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$739, DW_AT_name("resv2")
	.dwattr $C$DW$739, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$739, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$739, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$739, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$739, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$739, DW_AT_decl_line(0x241)
	.dwattr $C$DW$739, DW_AT_decl_column(0x0d)
$C$DW$740	.dwtag  DW_TAG_member
	.dwattr $C$DW$740, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$740, DW_AT_name("idlest")
	.dwattr $C$DW$740, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$740, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$740, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$740, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$740, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$740, DW_AT_decl_line(0x242)
	.dwattr $C$DW$740, DW_AT_decl_column(0x0d)
$C$DW$741	.dwtag  DW_TAG_member
	.dwattr $C$DW$741, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$741, DW_AT_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$741, DW_AT_TI_symbol_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$741, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$741, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$741, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$741, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$741, DW_AT_decl_line(0x243)
	.dwattr $C$DW$741, DW_AT_decl_column(0x0d)
$C$DW$742	.dwtag  DW_TAG_member
	.dwattr $C$DW$742, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$742, DW_AT_name("resv1")
	.dwattr $C$DW$742, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$742, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$742, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$742, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$742, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$742, DW_AT_decl_line(0x244)
	.dwattr $C$DW$742, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$147

	.dwattr $C$DW$T$147, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$147, DW_AT_decl_line(0x23f)
	.dwattr $C$DW$T$147, DW_AT_decl_column(0x13)
$C$DW$T$416	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$416, DW_AT_type(*$C$DW$T$147)

$C$DW$T$148	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$148, DW_AT_byte_size(0x04)
$C$DW$743	.dwtag  DW_TAG_member
	.dwattr $C$DW$743, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$743, DW_AT_name("modulemode")
	.dwattr $C$DW$743, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$743, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$743, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$743, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$743, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$743, DW_AT_decl_line(0x24d)
	.dwattr $C$DW$743, DW_AT_decl_column(0x0d)
$C$DW$744	.dwtag  DW_TAG_member
	.dwattr $C$DW$744, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$744, DW_AT_name("resv2")
	.dwattr $C$DW$744, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$744, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$744, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$744, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$744, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$744, DW_AT_decl_line(0x24e)
	.dwattr $C$DW$744, DW_AT_decl_column(0x0d)
$C$DW$745	.dwtag  DW_TAG_member
	.dwattr $C$DW$745, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$745, DW_AT_name("idlest")
	.dwattr $C$DW$745, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$745, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$745, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$745, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$745, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$745, DW_AT_decl_line(0x24f)
	.dwattr $C$DW$745, DW_AT_decl_column(0x0d)
$C$DW$746	.dwtag  DW_TAG_member
	.dwattr $C$DW$746, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$746, DW_AT_name("resv1")
	.dwattr $C$DW$746, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$746, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$746, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$746, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$746, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$746, DW_AT_decl_line(0x250)
	.dwattr $C$DW$746, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$148

	.dwattr $C$DW$T$148, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$148, DW_AT_decl_line(0x24c)
	.dwattr $C$DW$T$148, DW_AT_decl_column(0x13)
$C$DW$T$418	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$418, DW_AT_type(*$C$DW$T$148)

$C$DW$T$149	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$149, DW_AT_byte_size(0x04)
$C$DW$747	.dwtag  DW_TAG_member
	.dwattr $C$DW$747, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$747, DW_AT_name("modulemode")
	.dwattr $C$DW$747, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$747, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$747, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$747, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$747, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$747, DW_AT_decl_line(0x259)
	.dwattr $C$DW$747, DW_AT_decl_column(0x0d)
$C$DW$748	.dwtag  DW_TAG_member
	.dwattr $C$DW$748, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$748, DW_AT_name("resv2")
	.dwattr $C$DW$748, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$748, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$748, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$748, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$748, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$748, DW_AT_decl_line(0x25a)
	.dwattr $C$DW$748, DW_AT_decl_column(0x0d)
$C$DW$749	.dwtag  DW_TAG_member
	.dwattr $C$DW$749, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$749, DW_AT_name("idlest")
	.dwattr $C$DW$749, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$749, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$749, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$749, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$749, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$749, DW_AT_decl_line(0x25b)
	.dwattr $C$DW$749, DW_AT_decl_column(0x0d)
$C$DW$750	.dwtag  DW_TAG_member
	.dwattr $C$DW$750, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$750, DW_AT_name("resv1")
	.dwattr $C$DW$750, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$750, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$750, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$750, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$750, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$750, DW_AT_decl_line(0x25c)
	.dwattr $C$DW$750, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$149

	.dwattr $C$DW$T$149, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$149, DW_AT_decl_line(0x258)
	.dwattr $C$DW$T$149, DW_AT_decl_column(0x13)
$C$DW$T$420	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$420, DW_AT_type(*$C$DW$T$149)

$C$DW$T$150	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$150, DW_AT_byte_size(0x04)
$C$DW$751	.dwtag  DW_TAG_member
	.dwattr $C$DW$751, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$751, DW_AT_name("modulemode")
	.dwattr $C$DW$751, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$751, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$751, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$751, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$751, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$751, DW_AT_decl_line(0x265)
	.dwattr $C$DW$751, DW_AT_decl_column(0x0d)
$C$DW$752	.dwtag  DW_TAG_member
	.dwattr $C$DW$752, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$752, DW_AT_name("resv2")
	.dwattr $C$DW$752, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$752, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$752, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$752, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$752, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$752, DW_AT_decl_line(0x266)
	.dwattr $C$DW$752, DW_AT_decl_column(0x0d)
$C$DW$753	.dwtag  DW_TAG_member
	.dwattr $C$DW$753, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$753, DW_AT_name("idlest")
	.dwattr $C$DW$753, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$753, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$753, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$753, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$753, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$753, DW_AT_decl_line(0x267)
	.dwattr $C$DW$753, DW_AT_decl_column(0x0d)
$C$DW$754	.dwtag  DW_TAG_member
	.dwattr $C$DW$754, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$754, DW_AT_name("resv1")
	.dwattr $C$DW$754, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$754, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$754, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$754, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$754, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$754, DW_AT_decl_line(0x268)
	.dwattr $C$DW$754, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$150

	.dwattr $C$DW$T$150, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$150, DW_AT_decl_line(0x264)
	.dwattr $C$DW$T$150, DW_AT_decl_column(0x13)
$C$DW$T$422	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$422, DW_AT_type(*$C$DW$T$150)

$C$DW$T$151	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$151, DW_AT_byte_size(0x04)
$C$DW$755	.dwtag  DW_TAG_member
	.dwattr $C$DW$755, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$755, DW_AT_name("modulemode")
	.dwattr $C$DW$755, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$755, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$755, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$755, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$755, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$755, DW_AT_decl_line(0x271)
	.dwattr $C$DW$755, DW_AT_decl_column(0x0d)
$C$DW$756	.dwtag  DW_TAG_member
	.dwattr $C$DW$756, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$756, DW_AT_name("resv2")
	.dwattr $C$DW$756, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$756, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$756, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$756, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$756, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$756, DW_AT_decl_line(0x272)
	.dwattr $C$DW$756, DW_AT_decl_column(0x0d)
$C$DW$757	.dwtag  DW_TAG_member
	.dwattr $C$DW$757, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$757, DW_AT_name("idlest")
	.dwattr $C$DW$757, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$757, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$757, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$757, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$757, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$757, DW_AT_decl_line(0x273)
	.dwattr $C$DW$757, DW_AT_decl_column(0x0d)
$C$DW$758	.dwtag  DW_TAG_member
	.dwattr $C$DW$758, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$758, DW_AT_name("resv1")
	.dwattr $C$DW$758, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$758, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$758, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$758, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$758, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$758, DW_AT_decl_line(0x274)
	.dwattr $C$DW$758, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$151

	.dwattr $C$DW$T$151, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$151, DW_AT_decl_line(0x270)
	.dwattr $C$DW$T$151, DW_AT_decl_column(0x13)
$C$DW$T$424	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$424, DW_AT_type(*$C$DW$T$151)

$C$DW$T$152	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$152, DW_AT_byte_size(0x04)
$C$DW$759	.dwtag  DW_TAG_member
	.dwattr $C$DW$759, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$759, DW_AT_name("modulemode")
	.dwattr $C$DW$759, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$759, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$759, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$759, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$759, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$759, DW_AT_decl_line(0x27d)
	.dwattr $C$DW$759, DW_AT_decl_column(0x0d)
$C$DW$760	.dwtag  DW_TAG_member
	.dwattr $C$DW$760, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$760, DW_AT_name("resv2")
	.dwattr $C$DW$760, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$760, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$760, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$760, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$760, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$760, DW_AT_decl_line(0x27e)
	.dwattr $C$DW$760, DW_AT_decl_column(0x0d)
$C$DW$761	.dwtag  DW_TAG_member
	.dwattr $C$DW$761, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$761, DW_AT_name("idlest")
	.dwattr $C$DW$761, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$761, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$761, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$761, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$761, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$761, DW_AT_decl_line(0x27f)
	.dwattr $C$DW$761, DW_AT_decl_column(0x0d)
$C$DW$762	.dwtag  DW_TAG_member
	.dwattr $C$DW$762, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$762, DW_AT_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$762, DW_AT_TI_symbol_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$762, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$762, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$762, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$762, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$762, DW_AT_decl_line(0x280)
	.dwattr $C$DW$762, DW_AT_decl_column(0x0d)
$C$DW$763	.dwtag  DW_TAG_member
	.dwattr $C$DW$763, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$763, DW_AT_name("resv1")
	.dwattr $C$DW$763, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$763, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$763, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$763, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$763, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$763, DW_AT_decl_line(0x281)
	.dwattr $C$DW$763, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$152

	.dwattr $C$DW$T$152, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$152, DW_AT_decl_line(0x27c)
	.dwattr $C$DW$T$152, DW_AT_decl_column(0x13)
$C$DW$T$426	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$426, DW_AT_type(*$C$DW$T$152)

$C$DW$T$153	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$153, DW_AT_byte_size(0x04)
$C$DW$764	.dwtag  DW_TAG_member
	.dwattr $C$DW$764, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$764, DW_AT_name("modulemode")
	.dwattr $C$DW$764, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$764, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$764, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$764, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$764, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$764, DW_AT_decl_line(0x28a)
	.dwattr $C$DW$764, DW_AT_decl_column(0x0d)
$C$DW$765	.dwtag  DW_TAG_member
	.dwattr $C$DW$765, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$765, DW_AT_name("resv2")
	.dwattr $C$DW$765, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$765, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$765, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$765, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$765, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$765, DW_AT_decl_line(0x28b)
	.dwattr $C$DW$765, DW_AT_decl_column(0x0d)
$C$DW$766	.dwtag  DW_TAG_member
	.dwattr $C$DW$766, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$766, DW_AT_name("idlest")
	.dwattr $C$DW$766, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$766, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$766, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$766, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$766, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$766, DW_AT_decl_line(0x28c)
	.dwattr $C$DW$766, DW_AT_decl_column(0x0d)
$C$DW$767	.dwtag  DW_TAG_member
	.dwattr $C$DW$767, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$767, DW_AT_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$767, DW_AT_TI_symbol_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$767, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$767, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$767, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$767, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$767, DW_AT_decl_line(0x28d)
	.dwattr $C$DW$767, DW_AT_decl_column(0x0d)
$C$DW$768	.dwtag  DW_TAG_member
	.dwattr $C$DW$768, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$768, DW_AT_name("resv1")
	.dwattr $C$DW$768, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$768, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$768, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$768, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$768, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$768, DW_AT_decl_line(0x28e)
	.dwattr $C$DW$768, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$153

	.dwattr $C$DW$T$153, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$153, DW_AT_decl_line(0x289)
	.dwattr $C$DW$T$153, DW_AT_decl_column(0x13)
$C$DW$T$428	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$428, DW_AT_type(*$C$DW$T$153)

$C$DW$T$154	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$154, DW_AT_byte_size(0x04)
$C$DW$769	.dwtag  DW_TAG_member
	.dwattr $C$DW$769, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$769, DW_AT_name("modulemode")
	.dwattr $C$DW$769, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$769, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$769, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$769, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$769, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$769, DW_AT_decl_line(0x29f)
	.dwattr $C$DW$769, DW_AT_decl_column(0x0d)
$C$DW$770	.dwtag  DW_TAG_member
	.dwattr $C$DW$770, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$770, DW_AT_name("resv2")
	.dwattr $C$DW$770, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$770, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$770, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$770, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$770, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$770, DW_AT_decl_line(0x2a0)
	.dwattr $C$DW$770, DW_AT_decl_column(0x0d)
$C$DW$771	.dwtag  DW_TAG_member
	.dwattr $C$DW$771, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$771, DW_AT_name("idlest")
	.dwattr $C$DW$771, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$771, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$771, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$771, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$771, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$771, DW_AT_decl_line(0x2a1)
	.dwattr $C$DW$771, DW_AT_decl_column(0x0d)
$C$DW$772	.dwtag  DW_TAG_member
	.dwattr $C$DW$772, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$772, DW_AT_name("resv1")
	.dwattr $C$DW$772, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$772, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$772, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$772, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$772, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$772, DW_AT_decl_line(0x2a2)
	.dwattr $C$DW$772, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$154

	.dwattr $C$DW$T$154, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$154, DW_AT_decl_line(0x29e)
	.dwattr $C$DW$T$154, DW_AT_decl_column(0x13)
$C$DW$T$430	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$430, DW_AT_type(*$C$DW$T$154)

$C$DW$T$155	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$155, DW_AT_byte_size(0x04)
$C$DW$773	.dwtag  DW_TAG_member
	.dwattr $C$DW$773, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$773, DW_AT_name("modulemode")
	.dwattr $C$DW$773, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$773, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$773, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$773, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$773, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$773, DW_AT_decl_line(0x2ab)
	.dwattr $C$DW$773, DW_AT_decl_column(0x0d)
$C$DW$774	.dwtag  DW_TAG_member
	.dwattr $C$DW$774, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$774, DW_AT_name("resv2")
	.dwattr $C$DW$774, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$774, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$774, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$774, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$774, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$774, DW_AT_decl_line(0x2ac)
	.dwattr $C$DW$774, DW_AT_decl_column(0x0d)
$C$DW$775	.dwtag  DW_TAG_member
	.dwattr $C$DW$775, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$775, DW_AT_name("idlest")
	.dwattr $C$DW$775, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$775, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$775, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$775, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$775, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$775, DW_AT_decl_line(0x2ad)
	.dwattr $C$DW$775, DW_AT_decl_column(0x0d)
$C$DW$776	.dwtag  DW_TAG_member
	.dwattr $C$DW$776, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$776, DW_AT_name("resv1")
	.dwattr $C$DW$776, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$776, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$776, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$776, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$776, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$776, DW_AT_decl_line(0x2ae)
	.dwattr $C$DW$776, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$155

	.dwattr $C$DW$T$155, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$155, DW_AT_decl_line(0x2aa)
	.dwattr $C$DW$T$155, DW_AT_decl_column(0x13)
$C$DW$T$432	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$432, DW_AT_type(*$C$DW$T$155)

$C$DW$T$156	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$156, DW_AT_byte_size(0x04)
$C$DW$777	.dwtag  DW_TAG_member
	.dwattr $C$DW$777, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$777, DW_AT_name("clktrctrl")
	.dwattr $C$DW$777, DW_AT_TI_symbol_name("clktrctrl")
	.dwattr $C$DW$777, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$777, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$777, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$777, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$777, DW_AT_decl_line(0x2bf)
	.dwattr $C$DW$777, DW_AT_decl_column(0x0d)
$C$DW$778	.dwtag  DW_TAG_member
	.dwattr $C$DW$778, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$778, DW_AT_name("resv2")
	.dwattr $C$DW$778, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$778, DW_AT_bit_offset(0x1d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$778, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$778, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$778, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$778, DW_AT_decl_line(0x2c0)
	.dwattr $C$DW$778, DW_AT_decl_column(0x0d)
$C$DW$779	.dwtag  DW_TAG_member
	.dwattr $C$DW$779, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$779, DW_AT_name("clkactivity_l4hs_gclk")
	.dwattr $C$DW$779, DW_AT_TI_symbol_name("clkactivity_l4hs_gclk")
	.dwattr $C$DW$779, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x01)
	.dwattr $C$DW$779, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$779, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$779, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$779, DW_AT_decl_line(0x2c1)
	.dwattr $C$DW$779, DW_AT_decl_column(0x0d)
$C$DW$780	.dwtag  DW_TAG_member
	.dwattr $C$DW$780, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$780, DW_AT_name("clkactivity_cpsw_250mhz_gclk")
	.dwattr $C$DW$780, DW_AT_TI_symbol_name("clkactivity_cpsw_250mhz_gclk")
	.dwattr $C$DW$780, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$780, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$780, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$780, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$780, DW_AT_decl_line(0x2c2)
	.dwattr $C$DW$780, DW_AT_decl_column(0x0d)
$C$DW$781	.dwtag  DW_TAG_member
	.dwattr $C$DW$781, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$781, DW_AT_name("clkactivity_cpsw_50mhz_gclk")
	.dwattr $C$DW$781, DW_AT_TI_symbol_name("clkactivity_cpsw_50mhz_gclk")
	.dwattr $C$DW$781, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x01)
	.dwattr $C$DW$781, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$781, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$781, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$781, DW_AT_decl_line(0x2c3)
	.dwattr $C$DW$781, DW_AT_decl_column(0x0d)
$C$DW$782	.dwtag  DW_TAG_member
	.dwattr $C$DW$782, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$782, DW_AT_name("clkactivity_cpsw_5mhz_gclk")
	.dwattr $C$DW$782, DW_AT_TI_symbol_name("clkactivity_cpsw_5mhz_gclk")
	.dwattr $C$DW$782, DW_AT_bit_offset(0x19), DW_AT_bit_size(0x01)
	.dwattr $C$DW$782, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$782, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$782, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$782, DW_AT_decl_line(0x2c4)
	.dwattr $C$DW$782, DW_AT_decl_column(0x0d)
$C$DW$783	.dwtag  DW_TAG_member
	.dwattr $C$DW$783, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$783, DW_AT_name("resv1")
	.dwattr $C$DW$783, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$783, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x19)
	.dwattr $C$DW$783, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$783, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$783, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$783, DW_AT_decl_line(0x2c5)
	.dwattr $C$DW$783, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$156

	.dwattr $C$DW$T$156, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$156, DW_AT_decl_line(0x2be)
	.dwattr $C$DW$T$156, DW_AT_decl_column(0x13)
$C$DW$T$434	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$434, DW_AT_type(*$C$DW$T$156)

$C$DW$T$157	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$157, DW_AT_byte_size(0x04)
$C$DW$784	.dwtag  DW_TAG_member
	.dwattr $C$DW$784, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$784, DW_AT_name("modulemode")
	.dwattr $C$DW$784, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$784, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$784, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$784, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$784, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$784, DW_AT_decl_line(0x2ce)
	.dwattr $C$DW$784, DW_AT_decl_column(0x0d)
$C$DW$785	.dwtag  DW_TAG_member
	.dwattr $C$DW$785, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$785, DW_AT_name("resv2")
	.dwattr $C$DW$785, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$785, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$785, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$785, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$785, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$785, DW_AT_decl_line(0x2cf)
	.dwattr $C$DW$785, DW_AT_decl_column(0x0d)
$C$DW$786	.dwtag  DW_TAG_member
	.dwattr $C$DW$786, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$786, DW_AT_name("idlest")
	.dwattr $C$DW$786, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$786, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$786, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$786, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$786, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$786, DW_AT_decl_line(0x2d0)
	.dwattr $C$DW$786, DW_AT_decl_column(0x0d)
$C$DW$787	.dwtag  DW_TAG_member
	.dwattr $C$DW$787, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$787, DW_AT_name("resv1")
	.dwattr $C$DW$787, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$787, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$787, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$787, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$787, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$787, DW_AT_decl_line(0x2d1)
	.dwattr $C$DW$787, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$157

	.dwattr $C$DW$T$157, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$157, DW_AT_decl_line(0x2cd)
	.dwattr $C$DW$T$157, DW_AT_decl_column(0x13)
$C$DW$T$436	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$436, DW_AT_type(*$C$DW$T$157)

$C$DW$T$158	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$158, DW_AT_byte_size(0x04)
$C$DW$788	.dwtag  DW_TAG_member
	.dwattr $C$DW$788, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$788, DW_AT_name("clktrctrl")
	.dwattr $C$DW$788, DW_AT_TI_symbol_name("clktrctrl")
	.dwattr $C$DW$788, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$788, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$788, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$788, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$788, DW_AT_decl_line(0x2e2)
	.dwattr $C$DW$788, DW_AT_decl_column(0x0d)
$C$DW$789	.dwtag  DW_TAG_member
	.dwattr $C$DW$789, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$789, DW_AT_name("resv2")
	.dwattr $C$DW$789, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$789, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x02)
	.dwattr $C$DW$789, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$789, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$789, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$789, DW_AT_decl_line(0x2e3)
	.dwattr $C$DW$789, DW_AT_decl_column(0x0d)
$C$DW$790	.dwtag  DW_TAG_member
	.dwattr $C$DW$790, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$790, DW_AT_name("clkactivity_ocpwp_l3_gclk")
	.dwattr $C$DW$790, DW_AT_TI_symbol_name("clkactivity_ocpwp_l3_gclk")
	.dwattr $C$DW$790, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$790, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$790, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$790, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$790, DW_AT_decl_line(0x2e4)
	.dwattr $C$DW$790, DW_AT_decl_column(0x0d)
$C$DW$791	.dwtag  DW_TAG_member
	.dwattr $C$DW$791, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$791, DW_AT_name("clkactivity_ocpsw_l4_gclk")
	.dwattr $C$DW$791, DW_AT_TI_symbol_name("clkactivity_ocpsw_l4_gclk")
	.dwattr $C$DW$791, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x01)
	.dwattr $C$DW$791, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$791, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$791, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$791, DW_AT_decl_line(0x2e5)
	.dwattr $C$DW$791, DW_AT_decl_column(0x0d)
$C$DW$792	.dwtag  DW_TAG_member
	.dwattr $C$DW$792, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$792, DW_AT_name("resv1")
	.dwattr $C$DW$792, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$792, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1a)
	.dwattr $C$DW$792, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$792, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$792, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$792, DW_AT_decl_line(0x2e6)
	.dwattr $C$DW$792, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$158

	.dwattr $C$DW$T$158, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$158, DW_AT_decl_line(0x2e1)
	.dwattr $C$DW$T$158, DW_AT_decl_column(0x13)
$C$DW$T$438	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$438, DW_AT_type(*$C$DW$T$158)

$C$DW$T$159	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$159, DW_AT_byte_size(0x04)
$C$DW$793	.dwtag  DW_TAG_member
	.dwattr $C$DW$793, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$793, DW_AT_name("modulemode")
	.dwattr $C$DW$793, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$793, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$793, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$793, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$793, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$793, DW_AT_decl_line(0x2ef)
	.dwattr $C$DW$793, DW_AT_decl_column(0x0d)
$C$DW$794	.dwtag  DW_TAG_member
	.dwattr $C$DW$794, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$794, DW_AT_name("resv2")
	.dwattr $C$DW$794, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$794, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$794, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$794, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$794, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$794, DW_AT_decl_line(0x2f0)
	.dwattr $C$DW$794, DW_AT_decl_column(0x0d)
$C$DW$795	.dwtag  DW_TAG_member
	.dwattr $C$DW$795, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$795, DW_AT_name("idlest")
	.dwattr $C$DW$795, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$795, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$795, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$795, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$795, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$795, DW_AT_decl_line(0x2f1)
	.dwattr $C$DW$795, DW_AT_decl_column(0x0d)
$C$DW$796	.dwtag  DW_TAG_member
	.dwattr $C$DW$796, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$796, DW_AT_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$796, DW_AT_TI_symbol_name("optfclken_gpio_1_gdbclk")
	.dwattr $C$DW$796, DW_AT_bit_offset(0x0d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$796, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$796, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$796, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$796, DW_AT_decl_line(0x2f2)
	.dwattr $C$DW$796, DW_AT_decl_column(0x0d)
$C$DW$797	.dwtag  DW_TAG_member
	.dwattr $C$DW$797, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$797, DW_AT_name("resv1")
	.dwattr $C$DW$797, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$797, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0d)
	.dwattr $C$DW$797, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$797, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$797, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$797, DW_AT_decl_line(0x2f3)
	.dwattr $C$DW$797, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$159

	.dwattr $C$DW$T$159, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$159, DW_AT_decl_line(0x2ee)
	.dwattr $C$DW$T$159, DW_AT_decl_column(0x13)
$C$DW$T$440	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$440, DW_AT_type(*$C$DW$T$159)

$C$DW$T$160	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$160, DW_AT_byte_size(0x04)
$C$DW$798	.dwtag  DW_TAG_member
	.dwattr $C$DW$798, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$798, DW_AT_name("clktrctrl")
	.dwattr $C$DW$798, DW_AT_TI_symbol_name("clktrctrl")
	.dwattr $C$DW$798, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$798, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$798, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$798, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$798, DW_AT_decl_line(0x308)
	.dwattr $C$DW$798, DW_AT_decl_column(0x0d)
$C$DW$799	.dwtag  DW_TAG_member
	.dwattr $C$DW$799, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$799, DW_AT_name("resv2")
	.dwattr $C$DW$799, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$799, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x02)
	.dwattr $C$DW$799, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$799, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$799, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$799, DW_AT_decl_line(0x309)
	.dwattr $C$DW$799, DW_AT_decl_column(0x0d)
$C$DW$800	.dwtag  DW_TAG_member
	.dwattr $C$DW$800, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$800, DW_AT_name("clkactivity_pru_icss_ocp_gclk")
	.dwattr $C$DW$800, DW_AT_TI_symbol_name("clkactivity_pru_icss_ocp_gclk")
	.dwattr $C$DW$800, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$800, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$800, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$800, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$800, DW_AT_decl_line(0x30a)
	.dwattr $C$DW$800, DW_AT_decl_column(0x0d)
$C$DW$801	.dwtag  DW_TAG_member
	.dwattr $C$DW$801, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$801, DW_AT_name("clkactivity_pru_icss_iep_gclk")
	.dwattr $C$DW$801, DW_AT_TI_symbol_name("clkactivity_pru_icss_iep_gclk")
	.dwattr $C$DW$801, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x01)
	.dwattr $C$DW$801, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$801, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$801, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$801, DW_AT_decl_line(0x30b)
	.dwattr $C$DW$801, DW_AT_decl_column(0x0d)
$C$DW$802	.dwtag  DW_TAG_member
	.dwattr $C$DW$802, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$802, DW_AT_name("clkactivity_pru_icss_uart_gclk")
	.dwattr $C$DW$802, DW_AT_TI_symbol_name("clkactivity_pru_icss_uart_gclk")
	.dwattr $C$DW$802, DW_AT_bit_offset(0x19), DW_AT_bit_size(0x01)
	.dwattr $C$DW$802, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$802, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$802, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$802, DW_AT_decl_line(0x30c)
	.dwattr $C$DW$802, DW_AT_decl_column(0x0d)
$C$DW$803	.dwtag  DW_TAG_member
	.dwattr $C$DW$803, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$803, DW_AT_name("resv1")
	.dwattr $C$DW$803, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$803, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x19)
	.dwattr $C$DW$803, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$803, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$803, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$803, DW_AT_decl_line(0x30d)
	.dwattr $C$DW$803, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$160

	.dwattr $C$DW$T$160, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$160, DW_AT_decl_line(0x307)
	.dwattr $C$DW$T$160, DW_AT_decl_column(0x13)
$C$DW$T$442	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$442, DW_AT_type(*$C$DW$T$160)

$C$DW$T$161	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$161, DW_AT_byte_size(0x04)
$C$DW$804	.dwtag  DW_TAG_member
	.dwattr $C$DW$804, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$804, DW_AT_name("clktrctrl")
	.dwattr $C$DW$804, DW_AT_TI_symbol_name("clktrctrl")
	.dwattr $C$DW$804, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$804, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$804, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$804, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$804, DW_AT_decl_line(0x316)
	.dwattr $C$DW$804, DW_AT_decl_column(0x0d)
$C$DW$805	.dwtag  DW_TAG_member
	.dwattr $C$DW$805, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$805, DW_AT_name("resv2")
	.dwattr $C$DW$805, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$805, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x02)
	.dwattr $C$DW$805, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$805, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$805, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$805, DW_AT_decl_line(0x317)
	.dwattr $C$DW$805, DW_AT_decl_column(0x0d)
$C$DW$806	.dwtag  DW_TAG_member
	.dwattr $C$DW$806, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$806, DW_AT_name("clkactivity_cpsw_125mhz_gclk")
	.dwattr $C$DW$806, DW_AT_TI_symbol_name("clkactivity_cpsw_125mhz_gclk")
	.dwattr $C$DW$806, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$806, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$806, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$806, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$806, DW_AT_decl_line(0x318)
	.dwattr $C$DW$806, DW_AT_decl_column(0x0d)
$C$DW$807	.dwtag  DW_TAG_member
	.dwattr $C$DW$807, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$807, DW_AT_name("resv1")
	.dwattr $C$DW$807, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$807, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1b)
	.dwattr $C$DW$807, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$807, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$807, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$807, DW_AT_decl_line(0x319)
	.dwattr $C$DW$807, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$161

	.dwattr $C$DW$T$161, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$161, DW_AT_decl_line(0x315)
	.dwattr $C$DW$T$161, DW_AT_decl_column(0x13)
$C$DW$T$444	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$444, DW_AT_type(*$C$DW$T$161)

$C$DW$T$162	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$162, DW_AT_byte_size(0x04)
$C$DW$808	.dwtag  DW_TAG_member
	.dwattr $C$DW$808, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$808, DW_AT_name("clktrctrl")
	.dwattr $C$DW$808, DW_AT_TI_symbol_name("clktrctrl")
	.dwattr $C$DW$808, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$808, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$808, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$808, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$808, DW_AT_decl_line(0x322)
	.dwattr $C$DW$808, DW_AT_decl_column(0x0d)
$C$DW$809	.dwtag  DW_TAG_member
	.dwattr $C$DW$809, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$809, DW_AT_name("resv2")
	.dwattr $C$DW$809, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$809, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x02)
	.dwattr $C$DW$809, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$809, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$809, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$809, DW_AT_decl_line(0x323)
	.dwattr $C$DW$809, DW_AT_decl_column(0x0d)
$C$DW$810	.dwtag  DW_TAG_member
	.dwattr $C$DW$810, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$810, DW_AT_name("clkactivity_lcdc_l3_ocp_gclk")
	.dwattr $C$DW$810, DW_AT_TI_symbol_name("clkactivity_lcdc_l3_ocp_gclk")
	.dwattr $C$DW$810, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$810, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$810, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$810, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$810, DW_AT_decl_line(0x324)
	.dwattr $C$DW$810, DW_AT_decl_column(0x0d)
$C$DW$811	.dwtag  DW_TAG_member
	.dwattr $C$DW$811, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$811, DW_AT_name("clkactivity_lcdc_l4_ocp_gclk")
	.dwattr $C$DW$811, DW_AT_TI_symbol_name("clkactivity_lcdc_l4_ocp_gclk")
	.dwattr $C$DW$811, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x01)
	.dwattr $C$DW$811, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$811, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$811, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$811, DW_AT_decl_line(0x325)
	.dwattr $C$DW$811, DW_AT_decl_column(0x0d)
$C$DW$812	.dwtag  DW_TAG_member
	.dwattr $C$DW$812, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$812, DW_AT_name("resv1")
	.dwattr $C$DW$812, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$812, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1a)
	.dwattr $C$DW$812, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$812, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$812, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$812, DW_AT_decl_line(0x326)
	.dwattr $C$DW$812, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$162

	.dwattr $C$DW$T$162, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$162, DW_AT_decl_line(0x321)
	.dwattr $C$DW$T$162, DW_AT_decl_column(0x13)
$C$DW$T$446	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$446, DW_AT_type(*$C$DW$T$162)

$C$DW$T$163	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$163, DW_AT_byte_size(0x04)
$C$DW$813	.dwtag  DW_TAG_member
	.dwattr $C$DW$813, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$813, DW_AT_name("modulemode")
	.dwattr $C$DW$813, DW_AT_TI_symbol_name("modulemode")
	.dwattr $C$DW$813, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$813, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$813, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$813, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$813, DW_AT_decl_line(0x32f)
	.dwattr $C$DW$813, DW_AT_decl_column(0x0d)
$C$DW$814	.dwtag  DW_TAG_member
	.dwattr $C$DW$814, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$814, DW_AT_name("resv2")
	.dwattr $C$DW$814, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$814, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$814, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$814, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$814, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$814, DW_AT_decl_line(0x330)
	.dwattr $C$DW$814, DW_AT_decl_column(0x0d)
$C$DW$815	.dwtag  DW_TAG_member
	.dwattr $C$DW$815, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$815, DW_AT_name("idlest")
	.dwattr $C$DW$815, DW_AT_TI_symbol_name("idlest")
	.dwattr $C$DW$815, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$815, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$815, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$815, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$815, DW_AT_decl_line(0x331)
	.dwattr $C$DW$815, DW_AT_decl_column(0x0d)
$C$DW$816	.dwtag  DW_TAG_member
	.dwattr $C$DW$816, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$816, DW_AT_name("resv1")
	.dwattr $C$DW$816, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$816, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$816, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$816, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$816, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$816, DW_AT_decl_line(0x332)
	.dwattr $C$DW$816, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$163

	.dwattr $C$DW$T$163, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$163, DW_AT_decl_line(0x32e)
	.dwattr $C$DW$T$163, DW_AT_decl_column(0x13)
$C$DW$T$448	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$448, DW_AT_type(*$C$DW$T$163)

$C$DW$T$164	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$164, DW_AT_byte_size(0x04)
$C$DW$817	.dwtag  DW_TAG_member
	.dwattr $C$DW$817, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$817, DW_AT_name("clktrctrl")
	.dwattr $C$DW$817, DW_AT_TI_symbol_name("clktrctrl")
	.dwattr $C$DW$817, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$817, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$817, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$817, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$817, DW_AT_decl_line(0x33b)
	.dwattr $C$DW$817, DW_AT_decl_column(0x0d)
$C$DW$818	.dwtag  DW_TAG_member
	.dwattr $C$DW$818, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$818, DW_AT_name("resv2")
	.dwattr $C$DW$818, DW_AT_TI_symbol_name("resv2")
	.dwattr $C$DW$818, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x02)
	.dwattr $C$DW$818, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$818, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$818, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$818, DW_AT_decl_line(0x33c)
	.dwattr $C$DW$818, DW_AT_decl_column(0x0d)
$C$DW$819	.dwtag  DW_TAG_member
	.dwattr $C$DW$819, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$819, DW_AT_name("clkactivity_clk_24mhz_gclk")
	.dwattr $C$DW$819, DW_AT_TI_symbol_name("clkactivity_clk_24mhz_gclk")
	.dwattr $C$DW$819, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$819, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$819, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$819, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$819, DW_AT_decl_line(0x33d)
	.dwattr $C$DW$819, DW_AT_decl_column(0x0d)
$C$DW$820	.dwtag  DW_TAG_member
	.dwattr $C$DW$820, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$820, DW_AT_name("resv1")
	.dwattr $C$DW$820, DW_AT_TI_symbol_name("resv1")
	.dwattr $C$DW$820, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1b)
	.dwattr $C$DW$820, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$820, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$820, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$820, DW_AT_decl_line(0x33e)
	.dwattr $C$DW$820, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$164

	.dwattr $C$DW$T$164, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$164, DW_AT_decl_line(0x33a)
	.dwattr $C$DW$T$164, DW_AT_decl_column(0x13)
$C$DW$T$450	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$450, DW_AT_type(*$C$DW$T$164)

$C$DW$T$166	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$166, DW_AT_byte_size(0x154)
$C$DW$821	.dwtag  DW_TAG_member
	.dwattr $C$DW$821, DW_AT_type(*$C$DW$T$337)
	.dwattr $C$DW$821, DW_AT_name("$P$T76")
	.dwattr $C$DW$821, DW_AT_TI_symbol_name("$P$T76")
	.dwattr $C$DW$821, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$821, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$821, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$821, DW_AT_decl_line(0x10)
	.dwattr $C$DW$821, DW_AT_decl_column(0x02)
$C$DW$822	.dwtag  DW_TAG_member
	.dwattr $C$DW$822, DW_AT_type(*$C$DW$T$339)
	.dwattr $C$DW$822, DW_AT_name("$P$T77")
	.dwattr $C$DW$822, DW_AT_TI_symbol_name("$P$T77")
	.dwattr $C$DW$822, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$822, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$822, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$822, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$822, DW_AT_decl_column(0x02)
$C$DW$823	.dwtag  DW_TAG_member
	.dwattr $C$DW$823, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$823, DW_AT_name("EMPTY_SPACE_1")
	.dwattr $C$DW$823, DW_AT_TI_symbol_name("EMPTY_SPACE_1")
	.dwattr $C$DW$823, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$823, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$823, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$823, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$823, DW_AT_decl_column(0x0c)
$C$DW$824	.dwtag  DW_TAG_member
	.dwattr $C$DW$824, DW_AT_type(*$C$DW$T$341)
	.dwattr $C$DW$824, DW_AT_name("$P$T78")
	.dwattr $C$DW$824, DW_AT_TI_symbol_name("$P$T78")
	.dwattr $C$DW$824, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$824, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$824, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$824, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$824, DW_AT_decl_column(0x09)
$C$DW$825	.dwtag  DW_TAG_member
	.dwattr $C$DW$825, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$825, DW_AT_name("EMPTY_SPACE_2")
	.dwattr $C$DW$825, DW_AT_TI_symbol_name("EMPTY_SPACE_2")
	.dwattr $C$DW$825, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$825, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$825, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$825, DW_AT_decl_line(0x51)
	.dwattr $C$DW$825, DW_AT_decl_column(0x0c)
$C$DW$826	.dwtag  DW_TAG_member
	.dwattr $C$DW$826, DW_AT_type(*$C$DW$T$343)
	.dwattr $C$DW$826, DW_AT_name("$P$T79")
	.dwattr $C$DW$826, DW_AT_TI_symbol_name("$P$T79")
	.dwattr $C$DW$826, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$826, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$826, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$826, DW_AT_decl_line(0x53)
	.dwattr $C$DW$826, DW_AT_decl_column(0x02)
$C$DW$827	.dwtag  DW_TAG_member
	.dwattr $C$DW$827, DW_AT_type(*$C$DW$T$345)
	.dwattr $C$DW$827, DW_AT_name("$P$T80")
	.dwattr $C$DW$827, DW_AT_TI_symbol_name("$P$T80")
	.dwattr $C$DW$827, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$827, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$827, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$827, DW_AT_decl_line(0x60)
	.dwattr $C$DW$827, DW_AT_decl_column(0x02)
$C$DW$828	.dwtag  DW_TAG_member
	.dwattr $C$DW$828, DW_AT_type(*$C$DW$T$347)
	.dwattr $C$DW$828, DW_AT_name("$P$T81")
	.dwattr $C$DW$828, DW_AT_TI_symbol_name("$P$T81")
	.dwattr $C$DW$828, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$828, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$828, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$828, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$828, DW_AT_decl_column(0x02)
$C$DW$829	.dwtag  DW_TAG_member
	.dwattr $C$DW$829, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$829, DW_AT_name("EMPTY_SPACE_3")
	.dwattr $C$DW$829, DW_AT_TI_symbol_name("EMPTY_SPACE_3")
	.dwattr $C$DW$829, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$829, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$829, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$829, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$829, DW_AT_decl_column(0x0c)
$C$DW$830	.dwtag  DW_TAG_member
	.dwattr $C$DW$830, DW_AT_type(*$C$DW$T$349)
	.dwattr $C$DW$830, DW_AT_name("$P$T82")
	.dwattr $C$DW$830, DW_AT_TI_symbol_name("$P$T82")
	.dwattr $C$DW$830, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$830, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$830, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$830, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$830, DW_AT_decl_column(0x02)
$C$DW$831	.dwtag  DW_TAG_member
	.dwattr $C$DW$831, DW_AT_type(*$C$DW$T$351)
	.dwattr $C$DW$831, DW_AT_name("$P$T83")
	.dwattr $C$DW$831, DW_AT_TI_symbol_name("$P$T83")
	.dwattr $C$DW$831, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$831, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$831, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$831, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$831, DW_AT_decl_column(0x02)
$C$DW$832	.dwtag  DW_TAG_member
	.dwattr $C$DW$832, DW_AT_type(*$C$DW$T$353)
	.dwattr $C$DW$832, DW_AT_name("$P$T84")
	.dwattr $C$DW$832, DW_AT_TI_symbol_name("$P$T84")
	.dwattr $C$DW$832, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$832, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$832, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$832, DW_AT_decl_line(0x97)
	.dwattr $C$DW$832, DW_AT_decl_column(0x02)
$C$DW$833	.dwtag  DW_TAG_member
	.dwattr $C$DW$833, DW_AT_type(*$C$DW$T$355)
	.dwattr $C$DW$833, DW_AT_name("$P$T85")
	.dwattr $C$DW$833, DW_AT_TI_symbol_name("$P$T85")
	.dwattr $C$DW$833, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$833, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$833, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$833, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$833, DW_AT_decl_column(0x02)
$C$DW$834	.dwtag  DW_TAG_member
	.dwattr $C$DW$834, DW_AT_type(*$C$DW$T$357)
	.dwattr $C$DW$834, DW_AT_name("$P$T86")
	.dwattr $C$DW$834, DW_AT_TI_symbol_name("$P$T86")
	.dwattr $C$DW$834, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$834, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$834, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$834, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$834, DW_AT_decl_column(0x02)
$C$DW$835	.dwtag  DW_TAG_member
	.dwattr $C$DW$835, DW_AT_type(*$C$DW$T$359)
	.dwattr $C$DW$835, DW_AT_name("$P$T87")
	.dwattr $C$DW$835, DW_AT_TI_symbol_name("$P$T87")
	.dwattr $C$DW$835, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$835, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$835, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$835, DW_AT_decl_line(0xbb)
	.dwattr $C$DW$835, DW_AT_decl_column(0x02)
$C$DW$836	.dwtag  DW_TAG_member
	.dwattr $C$DW$836, DW_AT_type(*$C$DW$T$361)
	.dwattr $C$DW$836, DW_AT_name("$P$T88")
	.dwattr $C$DW$836, DW_AT_TI_symbol_name("$P$T88")
	.dwattr $C$DW$836, DW_AT_data_member_location[DW_OP_plus_uconst 0x3c]
	.dwattr $C$DW$836, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$836, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$836, DW_AT_decl_line(0xc7)
	.dwattr $C$DW$836, DW_AT_decl_column(0x02)
$C$DW$837	.dwtag  DW_TAG_member
	.dwattr $C$DW$837, DW_AT_type(*$C$DW$T$363)
	.dwattr $C$DW$837, DW_AT_name("$P$T89")
	.dwattr $C$DW$837, DW_AT_TI_symbol_name("$P$T89")
	.dwattr $C$DW$837, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$837, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$837, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$837, DW_AT_decl_line(0xd3)
	.dwattr $C$DW$837, DW_AT_decl_column(0x02)
$C$DW$838	.dwtag  DW_TAG_member
	.dwattr $C$DW$838, DW_AT_type(*$C$DW$T$365)
	.dwattr $C$DW$838, DW_AT_name("$P$T90")
	.dwattr $C$DW$838, DW_AT_TI_symbol_name("$P$T90")
	.dwattr $C$DW$838, DW_AT_data_member_location[DW_OP_plus_uconst 0x44]
	.dwattr $C$DW$838, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$838, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$838, DW_AT_decl_line(0xdf)
	.dwattr $C$DW$838, DW_AT_decl_column(0x02)
$C$DW$839	.dwtag  DW_TAG_member
	.dwattr $C$DW$839, DW_AT_type(*$C$DW$T$367)
	.dwattr $C$DW$839, DW_AT_name("$P$T91")
	.dwattr $C$DW$839, DW_AT_TI_symbol_name("$P$T91")
	.dwattr $C$DW$839, DW_AT_data_member_location[DW_OP_plus_uconst 0x48]
	.dwattr $C$DW$839, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$839, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$839, DW_AT_decl_line(0xeb)
	.dwattr $C$DW$839, DW_AT_decl_column(0x02)
$C$DW$840	.dwtag  DW_TAG_member
	.dwattr $C$DW$840, DW_AT_type(*$C$DW$T$369)
	.dwattr $C$DW$840, DW_AT_name("$P$T92")
	.dwattr $C$DW$840, DW_AT_TI_symbol_name("$P$T92")
	.dwattr $C$DW$840, DW_AT_data_member_location[DW_OP_plus_uconst 0x4c]
	.dwattr $C$DW$840, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$840, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$840, DW_AT_decl_line(0xf7)
	.dwattr $C$DW$840, DW_AT_decl_column(0x02)
$C$DW$841	.dwtag  DW_TAG_member
	.dwattr $C$DW$841, DW_AT_type(*$C$DW$T$371)
	.dwattr $C$DW$841, DW_AT_name("$P$T93")
	.dwattr $C$DW$841, DW_AT_TI_symbol_name("$P$T93")
	.dwattr $C$DW$841, DW_AT_data_member_location[DW_OP_plus_uconst 0x50]
	.dwattr $C$DW$841, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$841, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$841, DW_AT_decl_line(0x103)
	.dwattr $C$DW$841, DW_AT_decl_column(0x02)
$C$DW$842	.dwtag  DW_TAG_member
	.dwattr $C$DW$842, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$842, DW_AT_name("EMPTY_SPACE_4")
	.dwattr $C$DW$842, DW_AT_TI_symbol_name("EMPTY_SPACE_4")
	.dwattr $C$DW$842, DW_AT_data_member_location[DW_OP_plus_uconst 0x54]
	.dwattr $C$DW$842, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$842, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$842, DW_AT_decl_line(0x111)
	.dwattr $C$DW$842, DW_AT_decl_column(0x0c)
$C$DW$843	.dwtag  DW_TAG_member
	.dwattr $C$DW$843, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$843, DW_AT_name("EMPTY_SPACE_5")
	.dwattr $C$DW$843, DW_AT_TI_symbol_name("EMPTY_SPACE_5")
	.dwattr $C$DW$843, DW_AT_data_member_location[DW_OP_plus_uconst 0x58]
	.dwattr $C$DW$843, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$843, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$843, DW_AT_decl_line(0x115)
	.dwattr $C$DW$843, DW_AT_decl_column(0x0c)
$C$DW$844	.dwtag  DW_TAG_member
	.dwattr $C$DW$844, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$844, DW_AT_name("EMPTY_SPACE_6")
	.dwattr $C$DW$844, DW_AT_TI_symbol_name("EMPTY_SPACE_6")
	.dwattr $C$DW$844, DW_AT_data_member_location[DW_OP_plus_uconst 0x5c]
	.dwattr $C$DW$844, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$844, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$844, DW_AT_decl_line(0x119)
	.dwattr $C$DW$844, DW_AT_decl_column(0x0c)
$C$DW$845	.dwtag  DW_TAG_member
	.dwattr $C$DW$845, DW_AT_type(*$C$DW$T$373)
	.dwattr $C$DW$845, DW_AT_name("$P$T94")
	.dwattr $C$DW$845, DW_AT_TI_symbol_name("$P$T94")
	.dwattr $C$DW$845, DW_AT_data_member_location[DW_OP_plus_uconst 0x60]
	.dwattr $C$DW$845, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$845, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$845, DW_AT_decl_line(0x11b)
	.dwattr $C$DW$845, DW_AT_decl_column(0x02)
$C$DW$846	.dwtag  DW_TAG_member
	.dwattr $C$DW$846, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$846, DW_AT_name("EMPTY_SPACE_7")
	.dwattr $C$DW$846, DW_AT_TI_symbol_name("EMPTY_SPACE_7")
	.dwattr $C$DW$846, DW_AT_data_member_location[DW_OP_plus_uconst 0x64]
	.dwattr $C$DW$846, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$846, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$846, DW_AT_decl_line(0x129)
	.dwattr $C$DW$846, DW_AT_decl_column(0x0c)
$C$DW$847	.dwtag  DW_TAG_member
	.dwattr $C$DW$847, DW_AT_type(*$C$DW$T$375)
	.dwattr $C$DW$847, DW_AT_name("$P$T95")
	.dwattr $C$DW$847, DW_AT_TI_symbol_name("$P$T95")
	.dwattr $C$DW$847, DW_AT_data_member_location[DW_OP_plus_uconst 0x68]
	.dwattr $C$DW$847, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$847, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$847, DW_AT_decl_line(0x12b)
	.dwattr $C$DW$847, DW_AT_decl_column(0x02)
$C$DW$848	.dwtag  DW_TAG_member
	.dwattr $C$DW$848, DW_AT_type(*$C$DW$T$377)
	.dwattr $C$DW$848, DW_AT_name("$P$T96")
	.dwattr $C$DW$848, DW_AT_TI_symbol_name("$P$T96")
	.dwattr $C$DW$848, DW_AT_data_member_location[DW_OP_plus_uconst 0x6c]
	.dwattr $C$DW$848, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$848, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$848, DW_AT_decl_line(0x137)
	.dwattr $C$DW$848, DW_AT_decl_column(0x02)
$C$DW$849	.dwtag  DW_TAG_member
	.dwattr $C$DW$849, DW_AT_type(*$C$DW$T$379)
	.dwattr $C$DW$849, DW_AT_name("$P$T97")
	.dwattr $C$DW$849, DW_AT_TI_symbol_name("$P$T97")
	.dwattr $C$DW$849, DW_AT_data_member_location[DW_OP_plus_uconst 0x70]
	.dwattr $C$DW$849, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$849, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$849, DW_AT_decl_line(0x143)
	.dwattr $C$DW$849, DW_AT_decl_column(0x02)
$C$DW$850	.dwtag  DW_TAG_member
	.dwattr $C$DW$850, DW_AT_type(*$C$DW$T$381)
	.dwattr $C$DW$850, DW_AT_name("$P$T98")
	.dwattr $C$DW$850, DW_AT_TI_symbol_name("$P$T98")
	.dwattr $C$DW$850, DW_AT_data_member_location[DW_OP_plus_uconst 0x74]
	.dwattr $C$DW$850, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$850, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$850, DW_AT_decl_line(0x14f)
	.dwattr $C$DW$850, DW_AT_decl_column(0x02)
$C$DW$851	.dwtag  DW_TAG_member
	.dwattr $C$DW$851, DW_AT_type(*$C$DW$T$383)
	.dwattr $C$DW$851, DW_AT_name("$P$T99")
	.dwattr $C$DW$851, DW_AT_TI_symbol_name("$P$T99")
	.dwattr $C$DW$851, DW_AT_data_member_location[DW_OP_plus_uconst 0x78]
	.dwattr $C$DW$851, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$851, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$851, DW_AT_decl_line(0x15b)
	.dwattr $C$DW$851, DW_AT_decl_column(0x02)
$C$DW$852	.dwtag  DW_TAG_member
	.dwattr $C$DW$852, DW_AT_type(*$C$DW$T$385)
	.dwattr $C$DW$852, DW_AT_name("$P$T100")
	.dwattr $C$DW$852, DW_AT_TI_symbol_name("$P$T100")
	.dwattr $C$DW$852, DW_AT_data_member_location[DW_OP_plus_uconst 0x7c]
	.dwattr $C$DW$852, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$852, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$852, DW_AT_decl_line(0x167)
	.dwattr $C$DW$852, DW_AT_decl_column(0x02)
$C$DW$853	.dwtag  DW_TAG_member
	.dwattr $C$DW$853, DW_AT_type(*$C$DW$T$387)
	.dwattr $C$DW$853, DW_AT_name("$P$T101")
	.dwattr $C$DW$853, DW_AT_TI_symbol_name("$P$T101")
	.dwattr $C$DW$853, DW_AT_data_member_location[DW_OP_plus_uconst 0x80]
	.dwattr $C$DW$853, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$853, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$853, DW_AT_decl_line(0x173)
	.dwattr $C$DW$853, DW_AT_decl_column(0x02)
$C$DW$854	.dwtag  DW_TAG_member
	.dwattr $C$DW$854, DW_AT_type(*$C$DW$T$389)
	.dwattr $C$DW$854, DW_AT_name("$P$T102")
	.dwattr $C$DW$854, DW_AT_TI_symbol_name("$P$T102")
	.dwattr $C$DW$854, DW_AT_data_member_location[DW_OP_plus_uconst 0x84]
	.dwattr $C$DW$854, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$854, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$854, DW_AT_decl_line(0x17f)
	.dwattr $C$DW$854, DW_AT_decl_column(0x02)
$C$DW$855	.dwtag  DW_TAG_member
	.dwattr $C$DW$855, DW_AT_type(*$C$DW$T$391)
	.dwattr $C$DW$855, DW_AT_name("$P$T103")
	.dwattr $C$DW$855, DW_AT_TI_symbol_name("$P$T103")
	.dwattr $C$DW$855, DW_AT_data_member_location[DW_OP_plus_uconst 0x88]
	.dwattr $C$DW$855, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$855, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$855, DW_AT_decl_line(0x18b)
	.dwattr $C$DW$855, DW_AT_decl_column(0x02)
$C$DW$856	.dwtag  DW_TAG_member
	.dwattr $C$DW$856, DW_AT_type(*$C$DW$T$165)
	.dwattr $C$DW$856, DW_AT_name("EMPTY_SPACE_9")
	.dwattr $C$DW$856, DW_AT_TI_symbol_name("EMPTY_SPACE_9")
	.dwattr $C$DW$856, DW_AT_data_member_location[DW_OP_plus_uconst 0x8c]
	.dwattr $C$DW$856, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$856, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$856, DW_AT_decl_line(0x199)
	.dwattr $C$DW$856, DW_AT_decl_column(0x0c)
$C$DW$857	.dwtag  DW_TAG_member
	.dwattr $C$DW$857, DW_AT_type(*$C$DW$T$393)
	.dwattr $C$DW$857, DW_AT_name("$P$T104")
	.dwattr $C$DW$857, DW_AT_TI_symbol_name("$P$T104")
	.dwattr $C$DW$857, DW_AT_data_member_location[DW_OP_plus_uconst 0xac]
	.dwattr $C$DW$857, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$857, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$857, DW_AT_decl_line(0x19b)
	.dwattr $C$DW$857, DW_AT_decl_column(0x02)
$C$DW$858	.dwtag  DW_TAG_member
	.dwattr $C$DW$858, DW_AT_type(*$C$DW$T$395)
	.dwattr $C$DW$858, DW_AT_name("$P$T105")
	.dwattr $C$DW$858, DW_AT_TI_symbol_name("$P$T105")
	.dwattr $C$DW$858, DW_AT_data_member_location[DW_OP_plus_uconst 0xb0]
	.dwattr $C$DW$858, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$858, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$858, DW_AT_decl_line(0x1a8)
	.dwattr $C$DW$858, DW_AT_decl_column(0x02)
$C$DW$859	.dwtag  DW_TAG_member
	.dwattr $C$DW$859, DW_AT_type(*$C$DW$T$397)
	.dwattr $C$DW$859, DW_AT_name("$P$T106")
	.dwattr $C$DW$859, DW_AT_TI_symbol_name("$P$T106")
	.dwattr $C$DW$859, DW_AT_data_member_location[DW_OP_plus_uconst 0xb4]
	.dwattr $C$DW$859, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$859, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$859, DW_AT_decl_line(0x1b5)
	.dwattr $C$DW$859, DW_AT_decl_column(0x02)
$C$DW$860	.dwtag  DW_TAG_member
	.dwattr $C$DW$860, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$860, DW_AT_name("EMPTY_SPACE_10")
	.dwattr $C$DW$860, DW_AT_TI_symbol_name("EMPTY_SPACE_10")
	.dwattr $C$DW$860, DW_AT_data_member_location[DW_OP_plus_uconst 0xb8]
	.dwattr $C$DW$860, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$860, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$860, DW_AT_decl_line(0x1c4)
	.dwattr $C$DW$860, DW_AT_decl_column(0x0c)
$C$DW$861	.dwtag  DW_TAG_member
	.dwattr $C$DW$861, DW_AT_type(*$C$DW$T$399)
	.dwattr $C$DW$861, DW_AT_name("$P$T107")
	.dwattr $C$DW$861, DW_AT_TI_symbol_name("$P$T107")
	.dwattr $C$DW$861, DW_AT_data_member_location[DW_OP_plus_uconst 0xbc]
	.dwattr $C$DW$861, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$861, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$861, DW_AT_decl_line(0x1c6)
	.dwattr $C$DW$861, DW_AT_decl_column(0x02)
$C$DW$862	.dwtag  DW_TAG_member
	.dwattr $C$DW$862, DW_AT_type(*$C$DW$T$401)
	.dwattr $C$DW$862, DW_AT_name("$P$T108")
	.dwattr $C$DW$862, DW_AT_TI_symbol_name("$P$T108")
	.dwattr $C$DW$862, DW_AT_data_member_location[DW_OP_plus_uconst 0xc0]
	.dwattr $C$DW$862, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$862, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$862, DW_AT_decl_line(0x1d2)
	.dwattr $C$DW$862, DW_AT_decl_column(0x02)
$C$DW$863	.dwtag  DW_TAG_member
	.dwattr $C$DW$863, DW_AT_type(*$C$DW$T$403)
	.dwattr $C$DW$863, DW_AT_name("$P$T109")
	.dwattr $C$DW$863, DW_AT_TI_symbol_name("$P$T109")
	.dwattr $C$DW$863, DW_AT_data_member_location[DW_OP_plus_uconst 0xc4]
	.dwattr $C$DW$863, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$863, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$863, DW_AT_decl_line(0x1de)
	.dwattr $C$DW$863, DW_AT_decl_column(0x02)
$C$DW$864	.dwtag  DW_TAG_member
	.dwattr $C$DW$864, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$864, DW_AT_name("EMPTY_SPACE_11")
	.dwattr $C$DW$864, DW_AT_TI_symbol_name("EMPTY_SPACE_11")
	.dwattr $C$DW$864, DW_AT_data_member_location[DW_OP_plus_uconst 0xc8]
	.dwattr $C$DW$864, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$864, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$864, DW_AT_decl_line(0x1ec)
	.dwattr $C$DW$864, DW_AT_decl_column(0x0c)
$C$DW$865	.dwtag  DW_TAG_member
	.dwattr $C$DW$865, DW_AT_type(*$C$DW$T$405)
	.dwattr $C$DW$865, DW_AT_name("$P$T110")
	.dwattr $C$DW$865, DW_AT_TI_symbol_name("$P$T110")
	.dwattr $C$DW$865, DW_AT_data_member_location[DW_OP_plus_uconst 0xcc]
	.dwattr $C$DW$865, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$865, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$865, DW_AT_decl_line(0x1ee)
	.dwattr $C$DW$865, DW_AT_decl_column(0x02)
$C$DW$866	.dwtag  DW_TAG_member
	.dwattr $C$DW$866, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$866, DW_AT_name("EMPTY_SPACE_12")
	.dwattr $C$DW$866, DW_AT_TI_symbol_name("EMPTY_SPACE_12")
	.dwattr $C$DW$866, DW_AT_data_member_location[DW_OP_plus_uconst 0xd0]
	.dwattr $C$DW$866, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$866, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$866, DW_AT_decl_line(0x1fc)
	.dwattr $C$DW$866, DW_AT_decl_column(0x0c)
$C$DW$867	.dwtag  DW_TAG_member
	.dwattr $C$DW$867, DW_AT_type(*$C$DW$T$407)
	.dwattr $C$DW$867, DW_AT_name("$P$T111")
	.dwattr $C$DW$867, DW_AT_TI_symbol_name("$P$T111")
	.dwattr $C$DW$867, DW_AT_data_member_location[DW_OP_plus_uconst 0xd4]
	.dwattr $C$DW$867, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$867, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$867, DW_AT_decl_line(0x1fe)
	.dwattr $C$DW$867, DW_AT_decl_column(0x02)
$C$DW$868	.dwtag  DW_TAG_member
	.dwattr $C$DW$868, DW_AT_type(*$C$DW$T$409)
	.dwattr $C$DW$868, DW_AT_name("$P$T112")
	.dwattr $C$DW$868, DW_AT_TI_symbol_name("$P$T112")
	.dwattr $C$DW$868, DW_AT_data_member_location[DW_OP_plus_uconst 0xd8]
	.dwattr $C$DW$868, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$868, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$868, DW_AT_decl_line(0x20a)
	.dwattr $C$DW$868, DW_AT_decl_column(0x02)
$C$DW$869	.dwtag  DW_TAG_member
	.dwattr $C$DW$869, DW_AT_type(*$C$DW$T$411)
	.dwattr $C$DW$869, DW_AT_name("$P$T113")
	.dwattr $C$DW$869, DW_AT_TI_symbol_name("$P$T113")
	.dwattr $C$DW$869, DW_AT_data_member_location[DW_OP_plus_uconst 0xdc]
	.dwattr $C$DW$869, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$869, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$869, DW_AT_decl_line(0x216)
	.dwattr $C$DW$869, DW_AT_decl_column(0x02)
$C$DW$870	.dwtag  DW_TAG_member
	.dwattr $C$DW$870, DW_AT_type(*$C$DW$T$413)
	.dwattr $C$DW$870, DW_AT_name("$P$T114")
	.dwattr $C$DW$870, DW_AT_TI_symbol_name("$P$T114")
	.dwattr $C$DW$870, DW_AT_data_member_location[DW_OP_plus_uconst 0xe0]
	.dwattr $C$DW$870, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$870, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$870, DW_AT_decl_line(0x222)
	.dwattr $C$DW$870, DW_AT_decl_column(0x02)
$C$DW$871	.dwtag  DW_TAG_member
	.dwattr $C$DW$871, DW_AT_type(*$C$DW$T$415)
	.dwattr $C$DW$871, DW_AT_name("$P$T115")
	.dwattr $C$DW$871, DW_AT_TI_symbol_name("$P$T115")
	.dwattr $C$DW$871, DW_AT_data_member_location[DW_OP_plus_uconst 0xe4]
	.dwattr $C$DW$871, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$871, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$871, DW_AT_decl_line(0x22e)
	.dwattr $C$DW$871, DW_AT_decl_column(0x02)
$C$DW$872	.dwtag  DW_TAG_member
	.dwattr $C$DW$872, DW_AT_type(*$C$DW$T$417)
	.dwattr $C$DW$872, DW_AT_name("$P$T116")
	.dwattr $C$DW$872, DW_AT_TI_symbol_name("$P$T116")
	.dwattr $C$DW$872, DW_AT_data_member_location[DW_OP_plus_uconst 0xe8]
	.dwattr $C$DW$872, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$872, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$872, DW_AT_decl_line(0x23b)
	.dwattr $C$DW$872, DW_AT_decl_column(0x02)
$C$DW$873	.dwtag  DW_TAG_member
	.dwattr $C$DW$873, DW_AT_type(*$C$DW$T$419)
	.dwattr $C$DW$873, DW_AT_name("$P$T117")
	.dwattr $C$DW$873, DW_AT_TI_symbol_name("$P$T117")
	.dwattr $C$DW$873, DW_AT_data_member_location[DW_OP_plus_uconst 0xec]
	.dwattr $C$DW$873, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$873, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$873, DW_AT_decl_line(0x248)
	.dwattr $C$DW$873, DW_AT_decl_column(0x02)
$C$DW$874	.dwtag  DW_TAG_member
	.dwattr $C$DW$874, DW_AT_type(*$C$DW$T$421)
	.dwattr $C$DW$874, DW_AT_name("$P$T118")
	.dwattr $C$DW$874, DW_AT_TI_symbol_name("$P$T118")
	.dwattr $C$DW$874, DW_AT_data_member_location[DW_OP_plus_uconst 0xf0]
	.dwattr $C$DW$874, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$874, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$874, DW_AT_decl_line(0x254)
	.dwattr $C$DW$874, DW_AT_decl_column(0x02)
$C$DW$875	.dwtag  DW_TAG_member
	.dwattr $C$DW$875, DW_AT_type(*$C$DW$T$423)
	.dwattr $C$DW$875, DW_AT_name("$P$T119")
	.dwattr $C$DW$875, DW_AT_TI_symbol_name("$P$T119")
	.dwattr $C$DW$875, DW_AT_data_member_location[DW_OP_plus_uconst 0xf4]
	.dwattr $C$DW$875, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$875, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$875, DW_AT_decl_line(0x260)
	.dwattr $C$DW$875, DW_AT_decl_column(0x02)
$C$DW$876	.dwtag  DW_TAG_member
	.dwattr $C$DW$876, DW_AT_type(*$C$DW$T$425)
	.dwattr $C$DW$876, DW_AT_name("$P$T120")
	.dwattr $C$DW$876, DW_AT_TI_symbol_name("$P$T120")
	.dwattr $C$DW$876, DW_AT_data_member_location[DW_OP_plus_uconst 0xf8]
	.dwattr $C$DW$876, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$876, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$876, DW_AT_decl_line(0x26c)
	.dwattr $C$DW$876, DW_AT_decl_column(0x02)
$C$DW$877	.dwtag  DW_TAG_member
	.dwattr $C$DW$877, DW_AT_type(*$C$DW$T$427)
	.dwattr $C$DW$877, DW_AT_name("$P$T121")
	.dwattr $C$DW$877, DW_AT_TI_symbol_name("$P$T121")
	.dwattr $C$DW$877, DW_AT_data_member_location[DW_OP_plus_uconst 0xfc]
	.dwattr $C$DW$877, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$877, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$877, DW_AT_decl_line(0x278)
	.dwattr $C$DW$877, DW_AT_decl_column(0x02)
$C$DW$878	.dwtag  DW_TAG_member
	.dwattr $C$DW$878, DW_AT_type(*$C$DW$T$429)
	.dwattr $C$DW$878, DW_AT_name("$P$T122")
	.dwattr $C$DW$878, DW_AT_TI_symbol_name("$P$T122")
	.dwattr $C$DW$878, DW_AT_data_member_location[DW_OP_plus_uconst 0x100]
	.dwattr $C$DW$878, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$878, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$878, DW_AT_decl_line(0x285)
	.dwattr $C$DW$878, DW_AT_decl_column(0x02)
$C$DW$879	.dwtag  DW_TAG_member
	.dwattr $C$DW$879, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$879, DW_AT_name("EMPTY_SPACE_13")
	.dwattr $C$DW$879, DW_AT_TI_symbol_name("EMPTY_SPACE_13")
	.dwattr $C$DW$879, DW_AT_data_member_location[DW_OP_plus_uconst 0x104]
	.dwattr $C$DW$879, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$879, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$879, DW_AT_decl_line(0x294)
	.dwattr $C$DW$879, DW_AT_decl_column(0x0c)
$C$DW$880	.dwtag  DW_TAG_member
	.dwattr $C$DW$880, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$880, DW_AT_name("EMPTY_SPACE_14")
	.dwattr $C$DW$880, DW_AT_TI_symbol_name("EMPTY_SPACE_14")
	.dwattr $C$DW$880, DW_AT_data_member_location[DW_OP_plus_uconst 0x108]
	.dwattr $C$DW$880, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$880, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$880, DW_AT_decl_line(0x298)
	.dwattr $C$DW$880, DW_AT_decl_column(0x0c)
$C$DW$881	.dwtag  DW_TAG_member
	.dwattr $C$DW$881, DW_AT_type(*$C$DW$T$431)
	.dwattr $C$DW$881, DW_AT_name("$P$T123")
	.dwattr $C$DW$881, DW_AT_TI_symbol_name("$P$T123")
	.dwattr $C$DW$881, DW_AT_data_member_location[DW_OP_plus_uconst 0x10c]
	.dwattr $C$DW$881, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$881, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$881, DW_AT_decl_line(0x29a)
	.dwattr $C$DW$881, DW_AT_decl_column(0x02)
$C$DW$882	.dwtag  DW_TAG_member
	.dwattr $C$DW$882, DW_AT_type(*$C$DW$T$433)
	.dwattr $C$DW$882, DW_AT_name("$P$T124")
	.dwattr $C$DW$882, DW_AT_TI_symbol_name("$P$T124")
	.dwattr $C$DW$882, DW_AT_data_member_location[DW_OP_plus_uconst 0x110]
	.dwattr $C$DW$882, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$882, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$882, DW_AT_decl_line(0x2a6)
	.dwattr $C$DW$882, DW_AT_decl_column(0x02)
$C$DW$883	.dwtag  DW_TAG_member
	.dwattr $C$DW$883, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$883, DW_AT_name("EMPTY_SPACE_15")
	.dwattr $C$DW$883, DW_AT_TI_symbol_name("EMPTY_SPACE_15")
	.dwattr $C$DW$883, DW_AT_data_member_location[DW_OP_plus_uconst 0x114]
	.dwattr $C$DW$883, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$883, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$883, DW_AT_decl_line(0x2b4)
	.dwattr $C$DW$883, DW_AT_decl_column(0x0c)
$C$DW$884	.dwtag  DW_TAG_member
	.dwattr $C$DW$884, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$884, DW_AT_name("EMPTY_SPACE_16")
	.dwattr $C$DW$884, DW_AT_TI_symbol_name("EMPTY_SPACE_16")
	.dwattr $C$DW$884, DW_AT_data_member_location[DW_OP_plus_uconst 0x118]
	.dwattr $C$DW$884, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$884, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$884, DW_AT_decl_line(0x2b8)
	.dwattr $C$DW$884, DW_AT_decl_column(0x0c)
$C$DW$885	.dwtag  DW_TAG_member
	.dwattr $C$DW$885, DW_AT_type(*$C$DW$T$435)
	.dwattr $C$DW$885, DW_AT_name("$P$T125")
	.dwattr $C$DW$885, DW_AT_TI_symbol_name("$P$T125")
	.dwattr $C$DW$885, DW_AT_data_member_location[DW_OP_plus_uconst 0x11c]
	.dwattr $C$DW$885, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$885, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$885, DW_AT_decl_line(0x2ba)
	.dwattr $C$DW$885, DW_AT_decl_column(0x02)
$C$DW$886	.dwtag  DW_TAG_member
	.dwattr $C$DW$886, DW_AT_type(*$C$DW$T$437)
	.dwattr $C$DW$886, DW_AT_name("$P$T126")
	.dwattr $C$DW$886, DW_AT_TI_symbol_name("$P$T126")
	.dwattr $C$DW$886, DW_AT_data_member_location[DW_OP_plus_uconst 0x120]
	.dwattr $C$DW$886, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$886, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$886, DW_AT_decl_line(0x2c9)
	.dwattr $C$DW$886, DW_AT_decl_column(0x02)
$C$DW$887	.dwtag  DW_TAG_member
	.dwattr $C$DW$887, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$887, DW_AT_name("EMPTY_SPACE_17")
	.dwattr $C$DW$887, DW_AT_TI_symbol_name("EMPTY_SPACE_17")
	.dwattr $C$DW$887, DW_AT_data_member_location[DW_OP_plus_uconst 0x124]
	.dwattr $C$DW$887, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$887, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$887, DW_AT_decl_line(0x2d7)
	.dwattr $C$DW$887, DW_AT_decl_column(0x0c)
$C$DW$888	.dwtag  DW_TAG_member
	.dwattr $C$DW$888, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$888, DW_AT_name("EMPTY_SPACE_18")
	.dwattr $C$DW$888, DW_AT_TI_symbol_name("EMPTY_SPACE_18")
	.dwattr $C$DW$888, DW_AT_data_member_location[DW_OP_plus_uconst 0x128]
	.dwattr $C$DW$888, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$888, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$888, DW_AT_decl_line(0x2db)
	.dwattr $C$DW$888, DW_AT_decl_column(0x0c)
$C$DW$889	.dwtag  DW_TAG_member
	.dwattr $C$DW$889, DW_AT_type(*$C$DW$T$439)
	.dwattr $C$DW$889, DW_AT_name("$P$T127")
	.dwattr $C$DW$889, DW_AT_TI_symbol_name("$P$T127")
	.dwattr $C$DW$889, DW_AT_data_member_location[DW_OP_plus_uconst 0x12c]
	.dwattr $C$DW$889, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$889, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$889, DW_AT_decl_line(0x2dd)
	.dwattr $C$DW$889, DW_AT_decl_column(0x02)
$C$DW$890	.dwtag  DW_TAG_member
	.dwattr $C$DW$890, DW_AT_type(*$C$DW$T$441)
	.dwattr $C$DW$890, DW_AT_name("$P$T128")
	.dwattr $C$DW$890, DW_AT_TI_symbol_name("$P$T128")
	.dwattr $C$DW$890, DW_AT_data_member_location[DW_OP_plus_uconst 0x130]
	.dwattr $C$DW$890, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$890, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$890, DW_AT_decl_line(0x2ea)
	.dwattr $C$DW$890, DW_AT_decl_column(0x02)
$C$DW$891	.dwtag  DW_TAG_member
	.dwattr $C$DW$891, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$891, DW_AT_name("EMPTY_SPACE_19")
	.dwattr $C$DW$891, DW_AT_TI_symbol_name("EMPTY_SPACE_19")
	.dwattr $C$DW$891, DW_AT_data_member_location[DW_OP_plus_uconst 0x134]
	.dwattr $C$DW$891, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$891, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$891, DW_AT_decl_line(0x2f9)
	.dwattr $C$DW$891, DW_AT_decl_column(0x0c)
$C$DW$892	.dwtag  DW_TAG_member
	.dwattr $C$DW$892, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$892, DW_AT_name("EMPTY_SPACE_20")
	.dwattr $C$DW$892, DW_AT_TI_symbol_name("EMPTY_SPACE_20")
	.dwattr $C$DW$892, DW_AT_data_member_location[DW_OP_plus_uconst 0x138]
	.dwattr $C$DW$892, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$892, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$892, DW_AT_decl_line(0x2fd)
	.dwattr $C$DW$892, DW_AT_decl_column(0x0c)
$C$DW$893	.dwtag  DW_TAG_member
	.dwattr $C$DW$893, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$893, DW_AT_name("EMPTY_SPACE_21")
	.dwattr $C$DW$893, DW_AT_TI_symbol_name("EMPTY_SPACE_21")
	.dwattr $C$DW$893, DW_AT_data_member_location[DW_OP_plus_uconst 0x13c]
	.dwattr $C$DW$893, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$893, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$893, DW_AT_decl_line(0x301)
	.dwattr $C$DW$893, DW_AT_decl_column(0x0c)
$C$DW$894	.dwtag  DW_TAG_member
	.dwattr $C$DW$894, DW_AT_type(*$C$DW$T$443)
	.dwattr $C$DW$894, DW_AT_name("$P$T129")
	.dwattr $C$DW$894, DW_AT_TI_symbol_name("$P$T129")
	.dwattr $C$DW$894, DW_AT_data_member_location[DW_OP_plus_uconst 0x140]
	.dwattr $C$DW$894, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$894, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$894, DW_AT_decl_line(0x303)
	.dwattr $C$DW$894, DW_AT_decl_column(0x02)
$C$DW$895	.dwtag  DW_TAG_member
	.dwattr $C$DW$895, DW_AT_type(*$C$DW$T$445)
	.dwattr $C$DW$895, DW_AT_name("$P$T130")
	.dwattr $C$DW$895, DW_AT_TI_symbol_name("$P$T130")
	.dwattr $C$DW$895, DW_AT_data_member_location[DW_OP_plus_uconst 0x144]
	.dwattr $C$DW$895, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$895, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$895, DW_AT_decl_line(0x311)
	.dwattr $C$DW$895, DW_AT_decl_column(0x02)
$C$DW$896	.dwtag  DW_TAG_member
	.dwattr $C$DW$896, DW_AT_type(*$C$DW$T$447)
	.dwattr $C$DW$896, DW_AT_name("$P$T131")
	.dwattr $C$DW$896, DW_AT_TI_symbol_name("$P$T131")
	.dwattr $C$DW$896, DW_AT_data_member_location[DW_OP_plus_uconst 0x148]
	.dwattr $C$DW$896, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$896, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$896, DW_AT_decl_line(0x31d)
	.dwattr $C$DW$896, DW_AT_decl_column(0x02)
$C$DW$897	.dwtag  DW_TAG_member
	.dwattr $C$DW$897, DW_AT_type(*$C$DW$T$449)
	.dwattr $C$DW$897, DW_AT_name("$P$T132")
	.dwattr $C$DW$897, DW_AT_TI_symbol_name("$P$T132")
	.dwattr $C$DW$897, DW_AT_data_member_location[DW_OP_plus_uconst 0x14c]
	.dwattr $C$DW$897, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$897, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$897, DW_AT_decl_line(0x32a)
	.dwattr $C$DW$897, DW_AT_decl_column(0x02)
$C$DW$898	.dwtag  DW_TAG_member
	.dwattr $C$DW$898, DW_AT_type(*$C$DW$T$451)
	.dwattr $C$DW$898, DW_AT_name("$P$T133")
	.dwattr $C$DW$898, DW_AT_TI_symbol_name("$P$T133")
	.dwattr $C$DW$898, DW_AT_data_member_location[DW_OP_plus_uconst 0x150]
	.dwattr $C$DW$898, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$898, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$898, DW_AT_decl_line(0x336)
	.dwattr $C$DW$898, DW_AT_decl_column(0x02)
	.dwendtag $C$DW$T$166

	.dwattr $C$DW$T$166, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$166, DW_AT_decl_line(0x0f)
	.dwattr $C$DW$T$166, DW_AT_decl_column(0x10)
$C$DW$T$483	.dwtag  DW_TAG_typedef, DW_AT_name("cmperCfg_s")
	.dwattr $C$DW$T$483, DW_AT_type(*$C$DW$T$166)
	.dwattr $C$DW$T$483, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$483, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$483, DW_AT_decl_line(0x341)
	.dwattr $C$DW$T$483, DW_AT_decl_column(0x03)
$C$DW$T$484	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$484, DW_AT_type(*$C$DW$T$483)
$C$DW$T$485	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$485, DW_AT_type(*$C$DW$T$484)
	.dwattr $C$DW$T$485, DW_AT_address_class(0x20)

$C$DW$T$168	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$168, DW_AT_byte_size(0x04)
$C$DW$899	.dwtag  DW_TAG_member
	.dwattr $C$DW$899, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$899, DW_AT_name("ch1")
	.dwattr $C$DW$899, DW_AT_TI_symbol_name("ch1")
	.dwattr $C$DW$899, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$899, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$899, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$899, DW_AT_decl_line(0x30)
	.dwattr $C$DW$899, DW_AT_decl_column(0x0c)
$C$DW$900	.dwtag  DW_TAG_member
	.dwattr $C$DW$900, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$900, DW_AT_name("ch2")
	.dwattr $C$DW$900, DW_AT_TI_symbol_name("ch2")
	.dwattr $C$DW$900, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$900, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$900, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$900, DW_AT_decl_line(0x30)
	.dwattr $C$DW$900, DW_AT_decl_column(0x11)
	.dwendtag $C$DW$T$168

	.dwattr $C$DW$T$168, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$T$168, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$T$168, DW_AT_decl_column(0x09)

$C$DW$T$170	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$170, DW_AT_type(*$C$DW$T$168)
	.dwattr $C$DW$T$170, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$170, DW_AT_byte_size(0x400)
$C$DW$901	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$901, DW_AT_upper_bound(0xff)
	.dwendtag $C$DW$T$170


$C$DW$T$171	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$171, DW_AT_byte_size(0x42e)
$C$DW$902	.dwtag  DW_TAG_member
	.dwattr $C$DW$902, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$902, DW_AT_name("magic")
	.dwattr $C$DW$902, DW_AT_TI_symbol_name("magic")
	.dwattr $C$DW$902, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$902, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$902, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$902, DW_AT_decl_line(0x15)
	.dwattr $C$DW$902, DW_AT_decl_column(0x0b)
$C$DW$903	.dwtag  DW_TAG_member
	.dwattr $C$DW$903, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$903, DW_AT_name("readyFlag")
	.dwattr $C$DW$903, DW_AT_TI_symbol_name("readyFlag")
	.dwattr $C$DW$903, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$903, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$903, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$903, DW_AT_decl_line(0x16)
	.dwattr $C$DW$903, DW_AT_decl_column(0x0b)
$C$DW$904	.dwtag  DW_TAG_member
	.dwattr $C$DW$904, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$904, DW_AT_name("mosiWordOut_ch1")
	.dwattr $C$DW$904, DW_AT_TI_symbol_name("mosiWordOut_ch1")
	.dwattr $C$DW$904, DW_AT_data_member_location[DW_OP_plus_uconst 0x6]
	.dwattr $C$DW$904, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$904, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$904, DW_AT_decl_line(0x17)
	.dwattr $C$DW$904, DW_AT_decl_column(0x0b)
$C$DW$905	.dwtag  DW_TAG_member
	.dwattr $C$DW$905, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$905, DW_AT_name("mosiWordOut_ch2")
	.dwattr $C$DW$905, DW_AT_TI_symbol_name("mosiWordOut_ch2")
	.dwattr $C$DW$905, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$905, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$905, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$905, DW_AT_decl_line(0x18)
	.dwattr $C$DW$905, DW_AT_decl_column(0x0b)
$C$DW$906	.dwtag  DW_TAG_member
	.dwattr $C$DW$906, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$906, DW_AT_name("mosiWordLen")
	.dwattr $C$DW$906, DW_AT_TI_symbol_name("mosiWordLen")
	.dwattr $C$DW$906, DW_AT_data_member_location[DW_OP_plus_uconst 0xa]
	.dwattr $C$DW$906, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$906, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$906, DW_AT_decl_line(0x19)
	.dwattr $C$DW$906, DW_AT_decl_column(0x0c)
$C$DW$907	.dwtag  DW_TAG_member
	.dwattr $C$DW$907, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$907, DW_AT_name("spiReadBits")
	.dwattr $C$DW$907, DW_AT_TI_symbol_name("spiReadBits")
	.dwattr $C$DW$907, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$907, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$907, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$907, DW_AT_decl_line(0x1a)
	.dwattr $C$DW$907, DW_AT_decl_column(0x0b)
$C$DW$908	.dwtag  DW_TAG_member
	.dwattr $C$DW$908, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$908, DW_AT_name("pConfigFlag")
	.dwattr $C$DW$908, DW_AT_TI_symbol_name("pConfigFlag")
	.dwattr $C$DW$908, DW_AT_data_member_location[DW_OP_plus_uconst 0xe]
	.dwattr $C$DW$908, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$908, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$908, DW_AT_decl_line(0x1c)
	.dwattr $C$DW$908, DW_AT_decl_column(0x0b)
$C$DW$909	.dwtag  DW_TAG_member
	.dwattr $C$DW$909, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$909, DW_AT_name("pSampleRate")
	.dwattr $C$DW$909, DW_AT_TI_symbol_name("pSampleRate")
	.dwattr $C$DW$909, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$909, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$909, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$909, DW_AT_decl_line(0x1d)
	.dwattr $C$DW$909, DW_AT_decl_column(0x0b)
$C$DW$910	.dwtag  DW_TAG_member
	.dwattr $C$DW$910, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$910, DW_AT_name("pAvgWindow")
	.dwattr $C$DW$910, DW_AT_TI_symbol_name("pAvgWindow")
	.dwattr $C$DW$910, DW_AT_data_member_location[DW_OP_plus_uconst 0x12]
	.dwattr $C$DW$910, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$910, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$910, DW_AT_decl_line(0x1e)
	.dwattr $C$DW$910, DW_AT_decl_column(0x0b)
$C$DW$911	.dwtag  DW_TAG_member
	.dwattr $C$DW$911, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$911, DW_AT_name("pInterval")
	.dwattr $C$DW$911, DW_AT_TI_symbol_name("pInterval")
	.dwattr $C$DW$911, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$911, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$911, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$911, DW_AT_decl_line(0x1f)
	.dwattr $C$DW$911, DW_AT_decl_column(0x0b)
$C$DW$912	.dwtag  DW_TAG_member
	.dwattr $C$DW$912, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$912, DW_AT_name("spiPort")
	.dwattr $C$DW$912, DW_AT_TI_symbol_name("spiPort")
	.dwattr $C$DW$912, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$912, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$912, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$912, DW_AT_decl_line(0x23)
	.dwattr $C$DW$912, DW_AT_decl_column(0x0b)
$C$DW$913	.dwtag  DW_TAG_member
	.dwattr $C$DW$913, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$913, DW_AT_name("spiCh")
	.dwattr $C$DW$913, DW_AT_TI_symbol_name("spiCh")
	.dwattr $C$DW$913, DW_AT_data_member_location[DW_OP_plus_uconst 0x1a]
	.dwattr $C$DW$913, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$913, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$913, DW_AT_decl_line(0x24)
	.dwattr $C$DW$913, DW_AT_decl_column(0x0b)
$C$DW$914	.dwtag  DW_TAG_member
	.dwattr $C$DW$914, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$914, DW_AT_name("spiEnableSB")
	.dwattr $C$DW$914, DW_AT_TI_symbol_name("spiEnableSB")
	.dwattr $C$DW$914, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$914, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$914, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$914, DW_AT_decl_line(0x25)
	.dwattr $C$DW$914, DW_AT_decl_column(0x0b)
$C$DW$915	.dwtag  DW_TAG_member
	.dwattr $C$DW$915, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$915, DW_AT_name("spiClkMode")
	.dwattr $C$DW$915, DW_AT_TI_symbol_name("spiClkMode")
	.dwattr $C$DW$915, DW_AT_data_member_location[DW_OP_plus_uconst 0x1e]
	.dwattr $C$DW$915, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$915, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$915, DW_AT_decl_line(0x26)
	.dwattr $C$DW$915, DW_AT_decl_column(0x0b)
$C$DW$916	.dwtag  DW_TAG_member
	.dwattr $C$DW$916, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$916, DW_AT_name("stackLock")
	.dwattr $C$DW$916, DW_AT_TI_symbol_name("stackLock")
	.dwattr $C$DW$916, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$916, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$916, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$916, DW_AT_decl_line(0x28)
	.dwattr $C$DW$916, DW_AT_decl_column(0x0b)
$C$DW$917	.dwtag  DW_TAG_member
	.dwattr $C$DW$917, DW_AT_type(*$C$DW$T$169)
	.dwattr $C$DW$917, DW_AT_name("stackCount")
	.dwattr $C$DW$917, DW_AT_TI_symbol_name("stackCount")
	.dwattr $C$DW$917, DW_AT_data_member_location[DW_OP_plus_uconst 0x22]
	.dwattr $C$DW$917, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$917, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$917, DW_AT_decl_line(0x29)
	.dwattr $C$DW$917, DW_AT_decl_column(0x0b)
$C$DW$918	.dwtag  DW_TAG_member
	.dwattr $C$DW$918, DW_AT_type(*$C$DW$T$169)
	.dwattr $C$DW$918, DW_AT_name("stackHead")
	.dwattr $C$DW$918, DW_AT_TI_symbol_name("stackHead")
	.dwattr $C$DW$918, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$918, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$918, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$918, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$918, DW_AT_decl_column(0x0b)
$C$DW$919	.dwtag  DW_TAG_member
	.dwattr $C$DW$919, DW_AT_type(*$C$DW$T$169)
	.dwattr $C$DW$919, DW_AT_name("stackTail")
	.dwattr $C$DW$919, DW_AT_TI_symbol_name("stackTail")
	.dwattr $C$DW$919, DW_AT_data_member_location[DW_OP_plus_uconst 0x26]
	.dwattr $C$DW$919, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$919, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$919, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$919, DW_AT_decl_column(0x0b)
$C$DW$920	.dwtag  DW_TAG_member
	.dwattr $C$DW$920, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$920, DW_AT_name("ch1avg")
	.dwattr $C$DW$920, DW_AT_TI_symbol_name("ch1avg")
	.dwattr $C$DW$920, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$920, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$920, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$920, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$920, DW_AT_decl_column(0x0b)
$C$DW$921	.dwtag  DW_TAG_member
	.dwattr $C$DW$921, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$921, DW_AT_name("ch2avg")
	.dwattr $C$DW$921, DW_AT_TI_symbol_name("ch2avg")
	.dwattr $C$DW$921, DW_AT_data_member_location[DW_OP_plus_uconst 0x2a]
	.dwattr $C$DW$921, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$921, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$921, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$921, DW_AT_decl_column(0x0b)
$C$DW$922	.dwtag  DW_TAG_member
	.dwattr $C$DW$922, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$922, DW_AT_name("avgWindow")
	.dwattr $C$DW$922, DW_AT_TI_symbol_name("avgWindow")
	.dwattr $C$DW$922, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$922, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$922, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$922, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$922, DW_AT_decl_column(0x0b)
$C$DW$923	.dwtag  DW_TAG_member
	.dwattr $C$DW$923, DW_AT_type(*$C$DW$T$170)
	.dwattr $C$DW$923, DW_AT_name("stack")
	.dwattr $C$DW$923, DW_AT_TI_symbol_name("stack")
	.dwattr $C$DW$923, DW_AT_data_member_location[DW_OP_plus_uconst 0x2e]
	.dwattr $C$DW$923, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$923, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$923, DW_AT_decl_line(0x31)
	.dwattr $C$DW$923, DW_AT_decl_column(0x04)
	.dwendtag $C$DW$T$171

	.dwattr $C$DW$T$171, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$T$171, DW_AT_decl_line(0x14)
	.dwattr $C$DW$T$171, DW_AT_decl_column(0x2c)
$C$DW$T$489	.dwtag  DW_TAG_typedef, DW_AT_name("ctrlData_s")
	.dwattr $C$DW$T$489, DW_AT_type(*$C$DW$T$171)
	.dwattr $C$DW$T$489, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$489, DW_AT_decl_file("../mcp3202.h")
	.dwattr $C$DW$T$489, DW_AT_decl_line(0x32)
	.dwattr $C$DW$T$489, DW_AT_decl_column(0x03)
$C$DW$T$490	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$490, DW_AT_type(*$C$DW$T$489)

$C$DW$T$172	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$172, DW_AT_byte_size(0x04)
$C$DW$924	.dwtag  DW_TAG_member
	.dwattr $C$DW$924, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$924, DW_AT_name("C28_BLK_POINTER")
	.dwattr $C$DW$924, DW_AT_TI_symbol_name("C28_BLK_POINTER")
	.dwattr $C$DW$924, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x10)
	.dwattr $C$DW$924, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$924, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$924, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$924, DW_AT_decl_line(0x63)
	.dwattr $C$DW$924, DW_AT_decl_column(0x0d)
$C$DW$925	.dwtag  DW_TAG_member
	.dwattr $C$DW$925, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$925, DW_AT_name("C29_BLK_POINTER")
	.dwattr $C$DW$925, DW_AT_TI_symbol_name("C29_BLK_POINTER")
	.dwattr $C$DW$925, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x10)
	.dwattr $C$DW$925, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$925, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$925, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$925, DW_AT_decl_line(0x64)
	.dwattr $C$DW$925, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$172

	.dwattr $C$DW$T$172, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$172, DW_AT_decl_line(0x62)
	.dwattr $C$DW$T$172, DW_AT_decl_column(0x12)
$C$DW$T$452	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$452, DW_AT_type(*$C$DW$T$172)

$C$DW$T$173	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$173, DW_AT_byte_size(0x04)
$C$DW$926	.dwtag  DW_TAG_member
	.dwattr $C$DW$926, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$926, DW_AT_name("SOFT_RST_N")
	.dwattr $C$DW$926, DW_AT_TI_symbol_name("SOFT_RST_N")
	.dwattr $C$DW$926, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$926, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$926, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$926, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$926, DW_AT_decl_line(0x0b)
	.dwattr $C$DW$926, DW_AT_decl_column(0x0d)
$C$DW$927	.dwtag  DW_TAG_member
	.dwattr $C$DW$927, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$927, DW_AT_name("EN")
	.dwattr $C$DW$927, DW_AT_TI_symbol_name("EN")
	.dwattr $C$DW$927, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x01)
	.dwattr $C$DW$927, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$927, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$927, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$927, DW_AT_decl_line(0x0c)
	.dwattr $C$DW$927, DW_AT_decl_column(0x0d)
$C$DW$928	.dwtag  DW_TAG_member
	.dwattr $C$DW$928, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$928, DW_AT_name("SLEEPING")
	.dwattr $C$DW$928, DW_AT_TI_symbol_name("SLEEPING")
	.dwattr $C$DW$928, DW_AT_bit_offset(0x1d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$928, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$928, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$928, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$928, DW_AT_decl_line(0x0d)
	.dwattr $C$DW$928, DW_AT_decl_column(0x0d)
$C$DW$929	.dwtag  DW_TAG_member
	.dwattr $C$DW$929, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$929, DW_AT_name("CTR_EN")
	.dwattr $C$DW$929, DW_AT_TI_symbol_name("CTR_EN")
	.dwattr $C$DW$929, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x01)
	.dwattr $C$DW$929, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$929, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$929, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$929, DW_AT_decl_line(0x0e)
	.dwattr $C$DW$929, DW_AT_decl_column(0x0d)
$C$DW$930	.dwtag  DW_TAG_member
	.dwattr $C$DW$930, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$930, DW_AT_name("rsvd4")
	.dwattr $C$DW$930, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$930, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$930, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$930, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$930, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$930, DW_AT_decl_line(0x0f)
	.dwattr $C$DW$930, DW_AT_decl_column(0x0d)
$C$DW$931	.dwtag  DW_TAG_member
	.dwattr $C$DW$931, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$931, DW_AT_name("SINGLE_STEP")
	.dwattr $C$DW$931, DW_AT_TI_symbol_name("SINGLE_STEP")
	.dwattr $C$DW$931, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x01)
	.dwattr $C$DW$931, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$931, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$931, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$931, DW_AT_decl_line(0x10)
	.dwattr $C$DW$931, DW_AT_decl_column(0x0d)
$C$DW$932	.dwtag  DW_TAG_member
	.dwattr $C$DW$932, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$932, DW_AT_name("rsvd9")
	.dwattr $C$DW$932, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$932, DW_AT_bit_offset(0x11), DW_AT_bit_size(0x06)
	.dwattr $C$DW$932, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$932, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$932, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$932, DW_AT_decl_line(0x11)
	.dwattr $C$DW$932, DW_AT_decl_column(0x0d)
$C$DW$933	.dwtag  DW_TAG_member
	.dwattr $C$DW$933, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$933, DW_AT_name("RUNSTATE")
	.dwattr $C$DW$933, DW_AT_TI_symbol_name("RUNSTATE")
	.dwattr $C$DW$933, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x01)
	.dwattr $C$DW$933, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$933, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$933, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$933, DW_AT_decl_line(0x12)
	.dwattr $C$DW$933, DW_AT_decl_column(0x0d)
$C$DW$934	.dwtag  DW_TAG_member
	.dwattr $C$DW$934, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$934, DW_AT_name("PCTR_RST_VAL")
	.dwattr $C$DW$934, DW_AT_TI_symbol_name("PCTR_RST_VAL")
	.dwattr $C$DW$934, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x10)
	.dwattr $C$DW$934, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$934, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$934, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$934, DW_AT_decl_line(0x13)
	.dwattr $C$DW$934, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$173

	.dwattr $C$DW$T$173, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$173, DW_AT_decl_line(0x0a)
	.dwattr $C$DW$T$173, DW_AT_decl_column(0x12)
$C$DW$T$454	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$454, DW_AT_type(*$C$DW$T$173)

$C$DW$T$174	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$174, DW_AT_byte_size(0x04)
$C$DW$935	.dwtag  DW_TAG_member
	.dwattr $C$DW$935, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$935, DW_AT_name("PCTR")
	.dwattr $C$DW$935, DW_AT_TI_symbol_name("PCTR")
	.dwattr $C$DW$935, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x10)
	.dwattr $C$DW$935, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$935, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$935, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$935, DW_AT_decl_line(0x1d)
	.dwattr $C$DW$935, DW_AT_decl_column(0x0d)
$C$DW$936	.dwtag  DW_TAG_member
	.dwattr $C$DW$936, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$936, DW_AT_name("rsvd16")
	.dwattr $C$DW$936, DW_AT_TI_symbol_name("rsvd16")
	.dwattr $C$DW$936, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x10)
	.dwattr $C$DW$936, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$936, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$936, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$936, DW_AT_decl_line(0x1e)
	.dwattr $C$DW$936, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$174

	.dwattr $C$DW$T$174, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$174, DW_AT_decl_line(0x1c)
	.dwattr $C$DW$T$174, DW_AT_decl_column(0x12)
$C$DW$T$456	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$456, DW_AT_type(*$C$DW$T$174)

$C$DW$T$175	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$175, DW_AT_byte_size(0x04)
$C$DW$937	.dwtag  DW_TAG_member
	.dwattr $C$DW$937, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$937, DW_AT_name("BITWISE_ENS")
	.dwattr $C$DW$937, DW_AT_TI_symbol_name("BITWISE_ENS")
	.dwattr $C$DW$937, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$937, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$937, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$937, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$937, DW_AT_decl_line(0x28)
	.dwattr $C$DW$937, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$175

	.dwattr $C$DW$T$175, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$175, DW_AT_decl_line(0x27)
	.dwattr $C$DW$T$175, DW_AT_decl_column(0x12)
$C$DW$T$458	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$458, DW_AT_type(*$C$DW$T$175)

$C$DW$T$176	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$176, DW_AT_byte_size(0x04)
$C$DW$938	.dwtag  DW_TAG_member
	.dwattr $C$DW$938, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$938, DW_AT_name("CYCLECOUNT")
	.dwattr $C$DW$938, DW_AT_TI_symbol_name("CYCLECOUNT")
	.dwattr $C$DW$938, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$938, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$938, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$938, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$938, DW_AT_decl_line(0x32)
	.dwattr $C$DW$938, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$176

	.dwattr $C$DW$T$176, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$176, DW_AT_decl_line(0x31)
	.dwattr $C$DW$T$176, DW_AT_decl_column(0x12)
$C$DW$T$460	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$460, DW_AT_type(*$C$DW$T$176)

$C$DW$T$177	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$177, DW_AT_byte_size(0x04)
$C$DW$939	.dwtag  DW_TAG_member
	.dwattr $C$DW$939, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$939, DW_AT_name("STALLCOUNT")
	.dwattr $C$DW$939, DW_AT_TI_symbol_name("STALLCOUNT")
	.dwattr $C$DW$939, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$939, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$939, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$939, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$939, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$939, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$177

	.dwattr $C$DW$T$177, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$177, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$T$177, DW_AT_decl_column(0x13)
$C$DW$T$462	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$462, DW_AT_type(*$C$DW$T$177)

$C$DW$T$178	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$178, DW_AT_byte_size(0x04)
$C$DW$940	.dwtag  DW_TAG_member
	.dwattr $C$DW$940, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$940, DW_AT_name("C24_BLK_IDX")
	.dwattr $C$DW$940, DW_AT_TI_symbol_name("C24_BLK_IDX")
	.dwattr $C$DW$940, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x08)
	.dwattr $C$DW$940, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$940, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$940, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$940, DW_AT_decl_line(0x49)
	.dwattr $C$DW$940, DW_AT_decl_column(0x0d)
$C$DW$941	.dwtag  DW_TAG_member
	.dwattr $C$DW$941, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$941, DW_AT_name("rsvd8")
	.dwattr $C$DW$941, DW_AT_TI_symbol_name("rsvd8")
	.dwattr $C$DW$941, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x08)
	.dwattr $C$DW$941, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$941, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$941, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$941, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$941, DW_AT_decl_column(0x0d)
$C$DW$942	.dwtag  DW_TAG_member
	.dwattr $C$DW$942, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$942, DW_AT_name("C25_BLK_IDX")
	.dwattr $C$DW$942, DW_AT_TI_symbol_name("C25_BLK_IDX")
	.dwattr $C$DW$942, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x08)
	.dwattr $C$DW$942, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$942, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$942, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$942, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$942, DW_AT_decl_column(0x0d)
$C$DW$943	.dwtag  DW_TAG_member
	.dwattr $C$DW$943, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$943, DW_AT_name("rsvd24")
	.dwattr $C$DW$943, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$943, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x08)
	.dwattr $C$DW$943, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$943, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$943, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$943, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$943, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$178

	.dwattr $C$DW$T$178, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$178, DW_AT_decl_line(0x48)
	.dwattr $C$DW$T$178, DW_AT_decl_column(0x12)
$C$DW$T$464	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$464, DW_AT_type(*$C$DW$T$178)

$C$DW$T$179	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$179, DW_AT_byte_size(0x04)
$C$DW$944	.dwtag  DW_TAG_member
	.dwattr $C$DW$944, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$944, DW_AT_name("C26_BLK_IDX")
	.dwattr $C$DW$944, DW_AT_TI_symbol_name("C26_BLK_IDX")
	.dwattr $C$DW$944, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x08)
	.dwattr $C$DW$944, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$944, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$944, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$944, DW_AT_decl_line(0x56)
	.dwattr $C$DW$944, DW_AT_decl_column(0x0d)
$C$DW$945	.dwtag  DW_TAG_member
	.dwattr $C$DW$945, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$945, DW_AT_name("rsvd8")
	.dwattr $C$DW$945, DW_AT_TI_symbol_name("rsvd8")
	.dwattr $C$DW$945, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x08)
	.dwattr $C$DW$945, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$945, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$945, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$945, DW_AT_decl_line(0x57)
	.dwattr $C$DW$945, DW_AT_decl_column(0x0d)
$C$DW$946	.dwtag  DW_TAG_member
	.dwattr $C$DW$946, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$946, DW_AT_name("C27_BLK_IDX")
	.dwattr $C$DW$946, DW_AT_TI_symbol_name("C27_BLK_IDX")
	.dwattr $C$DW$946, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x08)
	.dwattr $C$DW$946, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$946, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$946, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$946, DW_AT_decl_line(0x58)
	.dwattr $C$DW$946, DW_AT_decl_column(0x0d)
$C$DW$947	.dwtag  DW_TAG_member
	.dwattr $C$DW$947, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$947, DW_AT_name("rsvd24")
	.dwattr $C$DW$947, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$947, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x08)
	.dwattr $C$DW$947, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$947, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$947, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$947, DW_AT_decl_line(0x59)
	.dwattr $C$DW$947, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$179

	.dwattr $C$DW$T$179, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$179, DW_AT_decl_line(0x55)
	.dwattr $C$DW$T$179, DW_AT_decl_column(0x12)
$C$DW$T$466	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$466, DW_AT_type(*$C$DW$T$179)

$C$DW$T$180	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$180, DW_AT_byte_size(0x04)
$C$DW$948	.dwtag  DW_TAG_member
	.dwattr $C$DW$948, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$948, DW_AT_name("C30_BLK_POINTER")
	.dwattr $C$DW$948, DW_AT_TI_symbol_name("C30_BLK_POINTER")
	.dwattr $C$DW$948, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x10)
	.dwattr $C$DW$948, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$948, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$948, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$948, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$948, DW_AT_decl_column(0x0d)
$C$DW$949	.dwtag  DW_TAG_member
	.dwattr $C$DW$949, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$949, DW_AT_name("C31_BLK_POINTER")
	.dwattr $C$DW$949, DW_AT_TI_symbol_name("C31_BLK_POINTER")
	.dwattr $C$DW$949, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x10)
	.dwattr $C$DW$949, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$949, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$949, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$949, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$949, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$180

	.dwattr $C$DW$T$180, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$180, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$T$180, DW_AT_decl_column(0x12)
$C$DW$T$468	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$468, DW_AT_type(*$C$DW$T$180)

$C$DW$T$182	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$182, DW_AT_byte_size(0x30)
$C$DW$950	.dwtag  DW_TAG_member
	.dwattr $C$DW$950, DW_AT_type(*$C$DW$T$455)
	.dwattr $C$DW$950, DW_AT_name("$P$T134")
	.dwattr $C$DW$950, DW_AT_TI_symbol_name("$P$T134")
	.dwattr $C$DW$950, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$950, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$950, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$950, DW_AT_decl_line(0x07)
	.dwattr $C$DW$950, DW_AT_decl_column(0x02)
$C$DW$951	.dwtag  DW_TAG_member
	.dwattr $C$DW$951, DW_AT_type(*$C$DW$T$457)
	.dwattr $C$DW$951, DW_AT_name("$P$T135")
	.dwattr $C$DW$951, DW_AT_TI_symbol_name("$P$T135")
	.dwattr $C$DW$951, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$951, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$951, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$951, DW_AT_decl_line(0x19)
	.dwattr $C$DW$951, DW_AT_decl_column(0x02)
$C$DW$952	.dwtag  DW_TAG_member
	.dwattr $C$DW$952, DW_AT_type(*$C$DW$T$459)
	.dwattr $C$DW$952, DW_AT_name("$P$T136")
	.dwattr $C$DW$952, DW_AT_TI_symbol_name("$P$T136")
	.dwattr $C$DW$952, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$952, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$952, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$952, DW_AT_decl_line(0x24)
	.dwattr $C$DW$952, DW_AT_decl_column(0x02)
$C$DW$953	.dwtag  DW_TAG_member
	.dwattr $C$DW$953, DW_AT_type(*$C$DW$T$461)
	.dwattr $C$DW$953, DW_AT_name("$P$T137")
	.dwattr $C$DW$953, DW_AT_TI_symbol_name("$P$T137")
	.dwattr $C$DW$953, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$953, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$953, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$953, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$953, DW_AT_decl_column(0x02)
$C$DW$954	.dwtag  DW_TAG_member
	.dwattr $C$DW$954, DW_AT_type(*$C$DW$T$463)
	.dwattr $C$DW$954, DW_AT_name("$P$T138")
	.dwattr $C$DW$954, DW_AT_TI_symbol_name("$P$T138")
	.dwattr $C$DW$954, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$954, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$954, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$954, DW_AT_decl_line(0x38)
	.dwattr $C$DW$954, DW_AT_decl_column(0x02)
$C$DW$955	.dwtag  DW_TAG_member
	.dwattr $C$DW$955, DW_AT_type(*$C$DW$T$181)
	.dwattr $C$DW$955, DW_AT_name("rsvd14")
	.dwattr $C$DW$955, DW_AT_TI_symbol_name("rsvd14")
	.dwattr $C$DW$955, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$955, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$955, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$955, DW_AT_decl_line(0x41)
	.dwattr $C$DW$955, DW_AT_decl_column(0x0b)
$C$DW$956	.dwtag  DW_TAG_member
	.dwattr $C$DW$956, DW_AT_type(*$C$DW$T$465)
	.dwattr $C$DW$956, DW_AT_name("$P$T139")
	.dwattr $C$DW$956, DW_AT_TI_symbol_name("$P$T139")
	.dwattr $C$DW$956, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$956, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$956, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$956, DW_AT_decl_line(0x45)
	.dwattr $C$DW$956, DW_AT_decl_column(0x02)
$C$DW$957	.dwtag  DW_TAG_member
	.dwattr $C$DW$957, DW_AT_type(*$C$DW$T$467)
	.dwattr $C$DW$957, DW_AT_name("$P$T140")
	.dwattr $C$DW$957, DW_AT_TI_symbol_name("$P$T140")
	.dwattr $C$DW$957, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$957, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$957, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$957, DW_AT_decl_line(0x52)
	.dwattr $C$DW$957, DW_AT_decl_column(0x02)
$C$DW$958	.dwtag  DW_TAG_member
	.dwattr $C$DW$958, DW_AT_type(*$C$DW$T$453)
	.dwattr $C$DW$958, DW_AT_name("$P$T141")
	.dwattr $C$DW$958, DW_AT_TI_symbol_name("$P$T141")
	.dwattr $C$DW$958, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$958, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$958, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$958, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$958, DW_AT_decl_column(0x02)
$C$DW$959	.dwtag  DW_TAG_member
	.dwattr $C$DW$959, DW_AT_type(*$C$DW$T$469)
	.dwattr $C$DW$959, DW_AT_name("$P$T142")
	.dwattr $C$DW$959, DW_AT_TI_symbol_name("$P$T142")
	.dwattr $C$DW$959, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$959, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$959, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$959, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$959, DW_AT_decl_column(0x02)
	.dwendtag $C$DW$T$182

	.dwattr $C$DW$T$182, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$182, DW_AT_decl_line(0x04)
	.dwattr $C$DW$T$182, DW_AT_decl_column(0x0f)
$C$DW$T$491	.dwtag  DW_TAG_typedef, DW_AT_name("pruCtrl")
	.dwattr $C$DW$T$491, DW_AT_type(*$C$DW$T$182)
	.dwattr $C$DW$T$491, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$491, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$491, DW_AT_decl_line(0x73)
	.dwattr $C$DW$T$491, DW_AT_decl_column(0x03)

$C$DW$T$185	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$185, DW_AT_byte_size(0x04)
$C$DW$960	.dwtag  DW_TAG_member
	.dwattr $C$DW$960, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$960, DW_AT_name("REVID")
	.dwattr $C$DW$960, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$960, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$960, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$960, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$960, DW_AT_decl_line(0x07)
	.dwattr $C$DW$960, DW_AT_decl_column(0x15)
$C$DW$961	.dwtag  DW_TAG_member
	.dwattr $C$DW$961, DW_AT_type(*$C$DW$T$184)
	.dwattr $C$DW$961, DW_AT_name("REVID_bit")
	.dwattr $C$DW$961, DW_AT_TI_symbol_name("REVID_bit")
	.dwattr $C$DW$961, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$961, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$961, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$961, DW_AT_decl_line(0x11)
	.dwattr $C$DW$961, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$185

	.dwattr $C$DW$T$185, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$185, DW_AT_decl_line(0x06)
	.dwattr $C$DW$T$185, DW_AT_decl_column(0x08)

$C$DW$T$187	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$187, DW_AT_byte_size(0x04)
$C$DW$962	.dwtag  DW_TAG_member
	.dwattr $C$DW$962, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$962, DW_AT_name("CR")
	.dwattr $C$DW$962, DW_AT_TI_symbol_name("CR")
	.dwattr $C$DW$962, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$962, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$962, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$962, DW_AT_decl_line(0x17)
	.dwattr $C$DW$962, DW_AT_decl_column(0x15)
$C$DW$963	.dwtag  DW_TAG_member
	.dwattr $C$DW$963, DW_AT_type(*$C$DW$T$186)
	.dwattr $C$DW$963, DW_AT_name("CR_bit")
	.dwattr $C$DW$963, DW_AT_TI_symbol_name("CR_bit")
	.dwattr $C$DW$963, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$963, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$963, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$963, DW_AT_decl_line(0x1d)
	.dwattr $C$DW$963, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$187

	.dwattr $C$DW$T$187, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$187, DW_AT_decl_line(0x16)
	.dwattr $C$DW$T$187, DW_AT_decl_column(0x08)

$C$DW$T$189	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$189, DW_AT_byte_size(0x04)
$C$DW$964	.dwtag  DW_TAG_member
	.dwattr $C$DW$964, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$964, DW_AT_name("GER")
	.dwattr $C$DW$964, DW_AT_TI_symbol_name("GER")
	.dwattr $C$DW$964, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$964, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$964, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$964, DW_AT_decl_line(0x26)
	.dwattr $C$DW$964, DW_AT_decl_column(0x15)
$C$DW$965	.dwtag  DW_TAG_member
	.dwattr $C$DW$965, DW_AT_type(*$C$DW$T$188)
	.dwattr $C$DW$965, DW_AT_name("GER_bit")
	.dwattr $C$DW$965, DW_AT_TI_symbol_name("GER_bit")
	.dwattr $C$DW$965, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$965, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$965, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$965, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$965, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$189

	.dwattr $C$DW$T$189, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$189, DW_AT_decl_line(0x25)
	.dwattr $C$DW$T$189, DW_AT_decl_column(0x08)

$C$DW$T$191	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$191, DW_AT_byte_size(0x04)
$C$DW$966	.dwtag  DW_TAG_member
	.dwattr $C$DW$966, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$966, DW_AT_name("GNLR")
	.dwattr $C$DW$966, DW_AT_TI_symbol_name("GNLR")
	.dwattr $C$DW$966, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$966, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$966, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$966, DW_AT_decl_line(0x34)
	.dwattr $C$DW$966, DW_AT_decl_column(0x15)
$C$DW$967	.dwtag  DW_TAG_member
	.dwattr $C$DW$967, DW_AT_type(*$C$DW$T$190)
	.dwattr $C$DW$967, DW_AT_name("GNLR_bit")
	.dwattr $C$DW$967, DW_AT_TI_symbol_name("GNLR_bit")
	.dwattr $C$DW$967, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$967, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$967, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$967, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$967, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$191

	.dwattr $C$DW$T$191, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$191, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$191, DW_AT_decl_column(0x08)

$C$DW$T$193	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$193, DW_AT_byte_size(0x04)
$C$DW$968	.dwtag  DW_TAG_member
	.dwattr $C$DW$968, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$968, DW_AT_name("SISR")
	.dwattr $C$DW$968, DW_AT_TI_symbol_name("SISR")
	.dwattr $C$DW$968, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$968, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$968, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$968, DW_AT_decl_line(0x40)
	.dwattr $C$DW$968, DW_AT_decl_column(0x15)
$C$DW$969	.dwtag  DW_TAG_member
	.dwattr $C$DW$969, DW_AT_type(*$C$DW$T$192)
	.dwattr $C$DW$969, DW_AT_name("SISR_bit")
	.dwattr $C$DW$969, DW_AT_TI_symbol_name("SISR_bit")
	.dwattr $C$DW$969, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$969, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$969, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$969, DW_AT_decl_line(0x45)
	.dwattr $C$DW$969, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$193

	.dwattr $C$DW$T$193, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$193, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$T$193, DW_AT_decl_column(0x08)

$C$DW$T$195	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$195, DW_AT_byte_size(0x04)
$C$DW$970	.dwtag  DW_TAG_member
	.dwattr $C$DW$970, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$970, DW_AT_name("SICR")
	.dwattr $C$DW$970, DW_AT_TI_symbol_name("SICR")
	.dwattr $C$DW$970, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$970, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$970, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$970, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$970, DW_AT_decl_column(0x15)
$C$DW$971	.dwtag  DW_TAG_member
	.dwattr $C$DW$971, DW_AT_type(*$C$DW$T$194)
	.dwattr $C$DW$971, DW_AT_name("SICR_bit")
	.dwattr $C$DW$971, DW_AT_TI_symbol_name("SICR_bit")
	.dwattr $C$DW$971, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$971, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$971, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$971, DW_AT_decl_line(0x50)
	.dwattr $C$DW$971, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$195

	.dwattr $C$DW$T$195, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$195, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$T$195, DW_AT_decl_column(0x08)

$C$DW$T$197	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$197, DW_AT_byte_size(0x04)
$C$DW$972	.dwtag  DW_TAG_member
	.dwattr $C$DW$972, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$972, DW_AT_name("EISR")
	.dwattr $C$DW$972, DW_AT_TI_symbol_name("EISR")
	.dwattr $C$DW$972, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$972, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$972, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$972, DW_AT_decl_line(0x56)
	.dwattr $C$DW$972, DW_AT_decl_column(0x15)
$C$DW$973	.dwtag  DW_TAG_member
	.dwattr $C$DW$973, DW_AT_type(*$C$DW$T$196)
	.dwattr $C$DW$973, DW_AT_name("EISR_bit")
	.dwattr $C$DW$973, DW_AT_TI_symbol_name("EISR_bit")
	.dwattr $C$DW$973, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$973, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$973, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$973, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$973, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$197

	.dwattr $C$DW$T$197, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$197, DW_AT_decl_line(0x55)
	.dwattr $C$DW$T$197, DW_AT_decl_column(0x08)

$C$DW$T$199	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$199, DW_AT_byte_size(0x04)
$C$DW$974	.dwtag  DW_TAG_member
	.dwattr $C$DW$974, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$974, DW_AT_name("EICR")
	.dwattr $C$DW$974, DW_AT_TI_symbol_name("EICR")
	.dwattr $C$DW$974, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$974, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$974, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$974, DW_AT_decl_line(0x61)
	.dwattr $C$DW$974, DW_AT_decl_column(0x15)
$C$DW$975	.dwtag  DW_TAG_member
	.dwattr $C$DW$975, DW_AT_type(*$C$DW$T$198)
	.dwattr $C$DW$975, DW_AT_name("EICR_bit")
	.dwattr $C$DW$975, DW_AT_TI_symbol_name("EICR_bit")
	.dwattr $C$DW$975, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$975, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$975, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$975, DW_AT_decl_line(0x66)
	.dwattr $C$DW$975, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$199

	.dwattr $C$DW$T$199, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$199, DW_AT_decl_line(0x60)
	.dwattr $C$DW$T$199, DW_AT_decl_column(0x08)

$C$DW$T$201	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$201, DW_AT_byte_size(0x04)
$C$DW$976	.dwtag  DW_TAG_member
	.dwattr $C$DW$976, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$976, DW_AT_name("HIEISR")
	.dwattr $C$DW$976, DW_AT_TI_symbol_name("HIEISR")
	.dwattr $C$DW$976, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$976, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$976, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$976, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$976, DW_AT_decl_column(0x15)
$C$DW$977	.dwtag  DW_TAG_member
	.dwattr $C$DW$977, DW_AT_type(*$C$DW$T$200)
	.dwattr $C$DW$977, DW_AT_name("HIEISR_bit")
	.dwattr $C$DW$977, DW_AT_TI_symbol_name("HIEISR_bit")
	.dwattr $C$DW$977, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$977, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$977, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$977, DW_AT_decl_line(0x74)
	.dwattr $C$DW$977, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$201

	.dwattr $C$DW$T$201, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$201, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$T$201, DW_AT_decl_column(0x08)

$C$DW$T$203	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$203, DW_AT_byte_size(0x04)
$C$DW$978	.dwtag  DW_TAG_member
	.dwattr $C$DW$978, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$978, DW_AT_name("HIDISR")
	.dwattr $C$DW$978, DW_AT_TI_symbol_name("HIDISR")
	.dwattr $C$DW$978, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$978, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$978, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$978, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$978, DW_AT_decl_column(0x15)
$C$DW$979	.dwtag  DW_TAG_member
	.dwattr $C$DW$979, DW_AT_type(*$C$DW$T$202)
	.dwattr $C$DW$979, DW_AT_name("HIDISR_bit")
	.dwattr $C$DW$979, DW_AT_TI_symbol_name("HIDISR_bit")
	.dwattr $C$DW$979, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$979, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$979, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$979, DW_AT_decl_line(0x7f)
	.dwattr $C$DW$979, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$203

	.dwattr $C$DW$T$203, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$203, DW_AT_decl_line(0x79)
	.dwattr $C$DW$T$203, DW_AT_decl_column(0x08)

$C$DW$T$205	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$205, DW_AT_byte_size(0x04)
$C$DW$980	.dwtag  DW_TAG_member
	.dwattr $C$DW$980, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$980, DW_AT_name("GPIR")
	.dwattr $C$DW$980, DW_AT_TI_symbol_name("GPIR")
	.dwattr $C$DW$980, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$980, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$980, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$980, DW_AT_decl_line(0x88)
	.dwattr $C$DW$980, DW_AT_decl_column(0x15)
$C$DW$981	.dwtag  DW_TAG_member
	.dwattr $C$DW$981, DW_AT_type(*$C$DW$T$204)
	.dwattr $C$DW$981, DW_AT_name("GPIR_bit")
	.dwattr $C$DW$981, DW_AT_TI_symbol_name("GPIR_bit")
	.dwattr $C$DW$981, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$981, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$981, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$981, DW_AT_decl_line(0x8e)
	.dwattr $C$DW$981, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$205

	.dwattr $C$DW$T$205, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$205, DW_AT_decl_line(0x87)
	.dwattr $C$DW$T$205, DW_AT_decl_column(0x08)

$C$DW$T$207	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$207, DW_AT_byte_size(0x04)
$C$DW$982	.dwtag  DW_TAG_member
	.dwattr $C$DW$982, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$982, DW_AT_name("SRSR0")
	.dwattr $C$DW$982, DW_AT_TI_symbol_name("SRSR0")
	.dwattr $C$DW$982, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$982, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$982, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$982, DW_AT_decl_line(0x97)
	.dwattr $C$DW$982, DW_AT_decl_column(0x15)
$C$DW$983	.dwtag  DW_TAG_member
	.dwattr $C$DW$983, DW_AT_type(*$C$DW$T$206)
	.dwattr $C$DW$983, DW_AT_name("SRSR0_bit")
	.dwattr $C$DW$983, DW_AT_TI_symbol_name("SRSR0_bit")
	.dwattr $C$DW$983, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$983, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$983, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$983, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$983, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$207

	.dwattr $C$DW$T$207, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$207, DW_AT_decl_line(0x96)
	.dwattr $C$DW$T$207, DW_AT_decl_column(0x08)

$C$DW$T$209	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$209, DW_AT_byte_size(0x04)
$C$DW$984	.dwtag  DW_TAG_member
	.dwattr $C$DW$984, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$984, DW_AT_name("SRSR1")
	.dwattr $C$DW$984, DW_AT_TI_symbol_name("SRSR1")
	.dwattr $C$DW$984, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$984, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$984, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$984, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$984, DW_AT_decl_column(0x15)
$C$DW$985	.dwtag  DW_TAG_member
	.dwattr $C$DW$985, DW_AT_type(*$C$DW$T$208)
	.dwattr $C$DW$985, DW_AT_name("SRSR1_bit")
	.dwattr $C$DW$985, DW_AT_TI_symbol_name("SRSR1_bit")
	.dwattr $C$DW$985, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$985, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$985, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$985, DW_AT_decl_line(0xa5)
	.dwattr $C$DW$985, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$209

	.dwattr $C$DW$T$209, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$209, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$T$209, DW_AT_decl_column(0x08)

$C$DW$T$211	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$211, DW_AT_byte_size(0x04)
$C$DW$986	.dwtag  DW_TAG_member
	.dwattr $C$DW$986, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$986, DW_AT_name("SECR0")
	.dwattr $C$DW$986, DW_AT_TI_symbol_name("SECR0")
	.dwattr $C$DW$986, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$986, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$986, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$986, DW_AT_decl_line(0xae)
	.dwattr $C$DW$986, DW_AT_decl_column(0x15)
$C$DW$987	.dwtag  DW_TAG_member
	.dwattr $C$DW$987, DW_AT_type(*$C$DW$T$210)
	.dwattr $C$DW$987, DW_AT_name("SECR0_bit")
	.dwattr $C$DW$987, DW_AT_TI_symbol_name("SECR0_bit")
	.dwattr $C$DW$987, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$987, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$987, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$987, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$987, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$211

	.dwattr $C$DW$T$211, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$211, DW_AT_decl_line(0xad)
	.dwattr $C$DW$T$211, DW_AT_decl_column(0x08)

$C$DW$T$213	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$213, DW_AT_byte_size(0x04)
$C$DW$988	.dwtag  DW_TAG_member
	.dwattr $C$DW$988, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$988, DW_AT_name("SECR1")
	.dwattr $C$DW$988, DW_AT_TI_symbol_name("SECR1")
	.dwattr $C$DW$988, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$988, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$988, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$988, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$988, DW_AT_decl_column(0x15)
$C$DW$989	.dwtag  DW_TAG_member
	.dwattr $C$DW$989, DW_AT_type(*$C$DW$T$212)
	.dwattr $C$DW$989, DW_AT_name("SECR1_bit")
	.dwattr $C$DW$989, DW_AT_TI_symbol_name("SECR1_bit")
	.dwattr $C$DW$989, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$989, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$989, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$989, DW_AT_decl_line(0xbc)
	.dwattr $C$DW$989, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$213

	.dwattr $C$DW$T$213, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$213, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$T$213, DW_AT_decl_column(0x08)

$C$DW$T$215	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$215, DW_AT_byte_size(0x04)
$C$DW$990	.dwtag  DW_TAG_member
	.dwattr $C$DW$990, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$990, DW_AT_name("ESR0")
	.dwattr $C$DW$990, DW_AT_TI_symbol_name("ESR0")
	.dwattr $C$DW$990, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$990, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$990, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$990, DW_AT_decl_line(0xc5)
	.dwattr $C$DW$990, DW_AT_decl_column(0x15)
$C$DW$991	.dwtag  DW_TAG_member
	.dwattr $C$DW$991, DW_AT_type(*$C$DW$T$214)
	.dwattr $C$DW$991, DW_AT_name("ESR0_bit")
	.dwattr $C$DW$991, DW_AT_TI_symbol_name("ESR0_bit")
	.dwattr $C$DW$991, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$991, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$991, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$991, DW_AT_decl_line(0xc9)
	.dwattr $C$DW$991, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$215

	.dwattr $C$DW$T$215, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$215, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$T$215, DW_AT_decl_column(0x08)

$C$DW$T$217	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$217, DW_AT_byte_size(0x04)
$C$DW$992	.dwtag  DW_TAG_member
	.dwattr $C$DW$992, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$992, DW_AT_name("ESR1")
	.dwattr $C$DW$992, DW_AT_TI_symbol_name("ESR1")
	.dwattr $C$DW$992, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$992, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$992, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$992, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$992, DW_AT_decl_column(0x15)
$C$DW$993	.dwtag  DW_TAG_member
	.dwattr $C$DW$993, DW_AT_type(*$C$DW$T$216)
	.dwattr $C$DW$993, DW_AT_name("ESR1_bit")
	.dwattr $C$DW$993, DW_AT_TI_symbol_name("ESR1_bit")
	.dwattr $C$DW$993, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$993, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$993, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$993, DW_AT_decl_line(0xd3)
	.dwattr $C$DW$993, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$217

	.dwattr $C$DW$T$217, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$217, DW_AT_decl_line(0xce)
	.dwattr $C$DW$T$217, DW_AT_decl_column(0x08)

$C$DW$T$219	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$219, DW_AT_byte_size(0x04)
$C$DW$994	.dwtag  DW_TAG_member
	.dwattr $C$DW$994, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$994, DW_AT_name("ECR0")
	.dwattr $C$DW$994, DW_AT_TI_symbol_name("ECR0")
	.dwattr $C$DW$994, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$994, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$994, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$994, DW_AT_decl_line(0xdc)
	.dwattr $C$DW$994, DW_AT_decl_column(0x15)
$C$DW$995	.dwtag  DW_TAG_member
	.dwattr $C$DW$995, DW_AT_type(*$C$DW$T$218)
	.dwattr $C$DW$995, DW_AT_name("ECR0_bit")
	.dwattr $C$DW$995, DW_AT_TI_symbol_name("ECR0_bit")
	.dwattr $C$DW$995, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$995, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$995, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$995, DW_AT_decl_line(0xe0)
	.dwattr $C$DW$995, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$219

	.dwattr $C$DW$T$219, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$219, DW_AT_decl_line(0xdb)
	.dwattr $C$DW$T$219, DW_AT_decl_column(0x08)

$C$DW$T$221	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$221, DW_AT_byte_size(0x04)
$C$DW$996	.dwtag  DW_TAG_member
	.dwattr $C$DW$996, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$996, DW_AT_name("ECR1")
	.dwattr $C$DW$996, DW_AT_TI_symbol_name("ECR1")
	.dwattr $C$DW$996, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$996, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$996, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$996, DW_AT_decl_line(0xe6)
	.dwattr $C$DW$996, DW_AT_decl_column(0x15)
$C$DW$997	.dwtag  DW_TAG_member
	.dwattr $C$DW$997, DW_AT_type(*$C$DW$T$220)
	.dwattr $C$DW$997, DW_AT_name("ECR1_bit")
	.dwattr $C$DW$997, DW_AT_TI_symbol_name("ECR1_bit")
	.dwattr $C$DW$997, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$997, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$997, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$997, DW_AT_decl_line(0xea)
	.dwattr $C$DW$997, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$221

	.dwattr $C$DW$T$221, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$221, DW_AT_decl_line(0xe5)
	.dwattr $C$DW$T$221, DW_AT_decl_column(0x08)

$C$DW$T$223	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$223, DW_AT_byte_size(0x04)
$C$DW$998	.dwtag  DW_TAG_member
	.dwattr $C$DW$998, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$998, DW_AT_name("CMR0")
	.dwattr $C$DW$998, DW_AT_TI_symbol_name("CMR0")
	.dwattr $C$DW$998, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$998, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$998, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$998, DW_AT_decl_line(0xf3)
	.dwattr $C$DW$998, DW_AT_decl_column(0x15)
$C$DW$999	.dwtag  DW_TAG_member
	.dwattr $C$DW$999, DW_AT_type(*$C$DW$T$222)
	.dwattr $C$DW$999, DW_AT_name("CMR0_bit")
	.dwattr $C$DW$999, DW_AT_TI_symbol_name("CMR0_bit")
	.dwattr $C$DW$999, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$999, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$999, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$999, DW_AT_decl_line(0xfe)
	.dwattr $C$DW$999, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$223

	.dwattr $C$DW$T$223, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$223, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$T$223, DW_AT_decl_column(0x08)

$C$DW$T$225	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$225, DW_AT_byte_size(0x04)
$C$DW$1000	.dwtag  DW_TAG_member
	.dwattr $C$DW$1000, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1000, DW_AT_name("CMR1")
	.dwattr $C$DW$1000, DW_AT_TI_symbol_name("CMR1")
	.dwattr $C$DW$1000, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1000, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1000, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1000, DW_AT_decl_line(0x104)
	.dwattr $C$DW$1000, DW_AT_decl_column(0x15)
$C$DW$1001	.dwtag  DW_TAG_member
	.dwattr $C$DW$1001, DW_AT_type(*$C$DW$T$224)
	.dwattr $C$DW$1001, DW_AT_name("CMR1_bit")
	.dwattr $C$DW$1001, DW_AT_TI_symbol_name("CMR1_bit")
	.dwattr $C$DW$1001, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1001, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1001, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1001, DW_AT_decl_line(0x10f)
	.dwattr $C$DW$1001, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$225

	.dwattr $C$DW$T$225, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$225, DW_AT_decl_line(0x103)
	.dwattr $C$DW$T$225, DW_AT_decl_column(0x08)

$C$DW$T$227	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$227, DW_AT_byte_size(0x04)
$C$DW$1002	.dwtag  DW_TAG_member
	.dwattr $C$DW$1002, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1002, DW_AT_name("CMR2")
	.dwattr $C$DW$1002, DW_AT_TI_symbol_name("CMR2")
	.dwattr $C$DW$1002, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1002, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1002, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1002, DW_AT_decl_line(0x115)
	.dwattr $C$DW$1002, DW_AT_decl_column(0x15)
$C$DW$1003	.dwtag  DW_TAG_member
	.dwattr $C$DW$1003, DW_AT_type(*$C$DW$T$226)
	.dwattr $C$DW$1003, DW_AT_name("CMR2_bit")
	.dwattr $C$DW$1003, DW_AT_TI_symbol_name("CMR2_bit")
	.dwattr $C$DW$1003, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1003, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1003, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1003, DW_AT_decl_line(0x120)
	.dwattr $C$DW$1003, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$227

	.dwattr $C$DW$T$227, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$227, DW_AT_decl_line(0x114)
	.dwattr $C$DW$T$227, DW_AT_decl_column(0x08)

$C$DW$T$229	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$229, DW_AT_byte_size(0x04)
$C$DW$1004	.dwtag  DW_TAG_member
	.dwattr $C$DW$1004, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1004, DW_AT_name("CMR3")
	.dwattr $C$DW$1004, DW_AT_TI_symbol_name("CMR3")
	.dwattr $C$DW$1004, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1004, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1004, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1004, DW_AT_decl_line(0x126)
	.dwattr $C$DW$1004, DW_AT_decl_column(0x15)
$C$DW$1005	.dwtag  DW_TAG_member
	.dwattr $C$DW$1005, DW_AT_type(*$C$DW$T$228)
	.dwattr $C$DW$1005, DW_AT_name("CMR3_bit")
	.dwattr $C$DW$1005, DW_AT_TI_symbol_name("CMR3_bit")
	.dwattr $C$DW$1005, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1005, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1005, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1005, DW_AT_decl_line(0x131)
	.dwattr $C$DW$1005, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$229

	.dwattr $C$DW$T$229, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$229, DW_AT_decl_line(0x125)
	.dwattr $C$DW$T$229, DW_AT_decl_column(0x08)

$C$DW$T$231	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$231, DW_AT_byte_size(0x04)
$C$DW$1006	.dwtag  DW_TAG_member
	.dwattr $C$DW$1006, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1006, DW_AT_name("CMR4")
	.dwattr $C$DW$1006, DW_AT_TI_symbol_name("CMR4")
	.dwattr $C$DW$1006, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1006, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1006, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1006, DW_AT_decl_line(0x137)
	.dwattr $C$DW$1006, DW_AT_decl_column(0x15)
$C$DW$1007	.dwtag  DW_TAG_member
	.dwattr $C$DW$1007, DW_AT_type(*$C$DW$T$230)
	.dwattr $C$DW$1007, DW_AT_name("CMR4_bit")
	.dwattr $C$DW$1007, DW_AT_TI_symbol_name("CMR4_bit")
	.dwattr $C$DW$1007, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1007, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1007, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1007, DW_AT_decl_line(0x142)
	.dwattr $C$DW$1007, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$231

	.dwattr $C$DW$T$231, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$231, DW_AT_decl_line(0x136)
	.dwattr $C$DW$T$231, DW_AT_decl_column(0x08)

$C$DW$T$233	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$233, DW_AT_byte_size(0x04)
$C$DW$1008	.dwtag  DW_TAG_member
	.dwattr $C$DW$1008, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1008, DW_AT_name("CMR5")
	.dwattr $C$DW$1008, DW_AT_TI_symbol_name("CMR5")
	.dwattr $C$DW$1008, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1008, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1008, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1008, DW_AT_decl_line(0x148)
	.dwattr $C$DW$1008, DW_AT_decl_column(0x15)
$C$DW$1009	.dwtag  DW_TAG_member
	.dwattr $C$DW$1009, DW_AT_type(*$C$DW$T$232)
	.dwattr $C$DW$1009, DW_AT_name("CMR5_bit")
	.dwattr $C$DW$1009, DW_AT_TI_symbol_name("CMR5_bit")
	.dwattr $C$DW$1009, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1009, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1009, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1009, DW_AT_decl_line(0x153)
	.dwattr $C$DW$1009, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$233

	.dwattr $C$DW$T$233, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$233, DW_AT_decl_line(0x147)
	.dwattr $C$DW$T$233, DW_AT_decl_column(0x08)

$C$DW$T$235	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$235, DW_AT_byte_size(0x04)
$C$DW$1010	.dwtag  DW_TAG_member
	.dwattr $C$DW$1010, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1010, DW_AT_name("CMR6")
	.dwattr $C$DW$1010, DW_AT_TI_symbol_name("CMR6")
	.dwattr $C$DW$1010, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1010, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1010, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1010, DW_AT_decl_line(0x159)
	.dwattr $C$DW$1010, DW_AT_decl_column(0x15)
$C$DW$1011	.dwtag  DW_TAG_member
	.dwattr $C$DW$1011, DW_AT_type(*$C$DW$T$234)
	.dwattr $C$DW$1011, DW_AT_name("CMR6_bit")
	.dwattr $C$DW$1011, DW_AT_TI_symbol_name("CMR6_bit")
	.dwattr $C$DW$1011, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1011, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1011, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1011, DW_AT_decl_line(0x164)
	.dwattr $C$DW$1011, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$235

	.dwattr $C$DW$T$235, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$235, DW_AT_decl_line(0x158)
	.dwattr $C$DW$T$235, DW_AT_decl_column(0x08)

$C$DW$T$237	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$237, DW_AT_byte_size(0x04)
$C$DW$1012	.dwtag  DW_TAG_member
	.dwattr $C$DW$1012, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1012, DW_AT_name("CMR7")
	.dwattr $C$DW$1012, DW_AT_TI_symbol_name("CMR7")
	.dwattr $C$DW$1012, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1012, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1012, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1012, DW_AT_decl_line(0x16a)
	.dwattr $C$DW$1012, DW_AT_decl_column(0x15)
$C$DW$1013	.dwtag  DW_TAG_member
	.dwattr $C$DW$1013, DW_AT_type(*$C$DW$T$236)
	.dwattr $C$DW$1013, DW_AT_name("CMR7_bit")
	.dwattr $C$DW$1013, DW_AT_TI_symbol_name("CMR7_bit")
	.dwattr $C$DW$1013, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1013, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1013, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1013, DW_AT_decl_line(0x175)
	.dwattr $C$DW$1013, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$237

	.dwattr $C$DW$T$237, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$237, DW_AT_decl_line(0x169)
	.dwattr $C$DW$T$237, DW_AT_decl_column(0x08)

$C$DW$T$239	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$239, DW_AT_byte_size(0x04)
$C$DW$1014	.dwtag  DW_TAG_member
	.dwattr $C$DW$1014, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1014, DW_AT_name("CMR8")
	.dwattr $C$DW$1014, DW_AT_TI_symbol_name("CMR8")
	.dwattr $C$DW$1014, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1014, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1014, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1014, DW_AT_decl_line(0x17b)
	.dwattr $C$DW$1014, DW_AT_decl_column(0x15)
$C$DW$1015	.dwtag  DW_TAG_member
	.dwattr $C$DW$1015, DW_AT_type(*$C$DW$T$238)
	.dwattr $C$DW$1015, DW_AT_name("CMR8_bit")
	.dwattr $C$DW$1015, DW_AT_TI_symbol_name("CMR8_bit")
	.dwattr $C$DW$1015, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1015, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1015, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1015, DW_AT_decl_line(0x186)
	.dwattr $C$DW$1015, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$239

	.dwattr $C$DW$T$239, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$239, DW_AT_decl_line(0x17a)
	.dwattr $C$DW$T$239, DW_AT_decl_column(0x08)

$C$DW$T$241	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$241, DW_AT_byte_size(0x04)
$C$DW$1016	.dwtag  DW_TAG_member
	.dwattr $C$DW$1016, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1016, DW_AT_name("CMR9")
	.dwattr $C$DW$1016, DW_AT_TI_symbol_name("CMR9")
	.dwattr $C$DW$1016, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1016, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1016, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1016, DW_AT_decl_line(0x18c)
	.dwattr $C$DW$1016, DW_AT_decl_column(0x15)
$C$DW$1017	.dwtag  DW_TAG_member
	.dwattr $C$DW$1017, DW_AT_type(*$C$DW$T$240)
	.dwattr $C$DW$1017, DW_AT_name("CMR9_bit")
	.dwattr $C$DW$1017, DW_AT_TI_symbol_name("CMR9_bit")
	.dwattr $C$DW$1017, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1017, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1017, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1017, DW_AT_decl_line(0x197)
	.dwattr $C$DW$1017, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$241

	.dwattr $C$DW$T$241, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$241, DW_AT_decl_line(0x18b)
	.dwattr $C$DW$T$241, DW_AT_decl_column(0x08)

$C$DW$T$243	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$243, DW_AT_byte_size(0x04)
$C$DW$1018	.dwtag  DW_TAG_member
	.dwattr $C$DW$1018, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1018, DW_AT_name("CMR10")
	.dwattr $C$DW$1018, DW_AT_TI_symbol_name("CMR10")
	.dwattr $C$DW$1018, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1018, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1018, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1018, DW_AT_decl_line(0x19d)
	.dwattr $C$DW$1018, DW_AT_decl_column(0x15)
$C$DW$1019	.dwtag  DW_TAG_member
	.dwattr $C$DW$1019, DW_AT_type(*$C$DW$T$242)
	.dwattr $C$DW$1019, DW_AT_name("CMR10_bit")
	.dwattr $C$DW$1019, DW_AT_TI_symbol_name("CMR10_bit")
	.dwattr $C$DW$1019, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1019, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1019, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1019, DW_AT_decl_line(0x1a8)
	.dwattr $C$DW$1019, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$243

	.dwattr $C$DW$T$243, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$243, DW_AT_decl_line(0x19c)
	.dwattr $C$DW$T$243, DW_AT_decl_column(0x08)

$C$DW$T$245	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$245, DW_AT_byte_size(0x04)
$C$DW$1020	.dwtag  DW_TAG_member
	.dwattr $C$DW$1020, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1020, DW_AT_name("CMR11")
	.dwattr $C$DW$1020, DW_AT_TI_symbol_name("CMR11")
	.dwattr $C$DW$1020, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1020, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1020, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1020, DW_AT_decl_line(0x1ae)
	.dwattr $C$DW$1020, DW_AT_decl_column(0x15)
$C$DW$1021	.dwtag  DW_TAG_member
	.dwattr $C$DW$1021, DW_AT_type(*$C$DW$T$244)
	.dwattr $C$DW$1021, DW_AT_name("CMR11_bit")
	.dwattr $C$DW$1021, DW_AT_TI_symbol_name("CMR11_bit")
	.dwattr $C$DW$1021, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1021, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1021, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1021, DW_AT_decl_line(0x1b9)
	.dwattr $C$DW$1021, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$245

	.dwattr $C$DW$T$245, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$245, DW_AT_decl_line(0x1ad)
	.dwattr $C$DW$T$245, DW_AT_decl_column(0x08)

$C$DW$T$247	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$247, DW_AT_byte_size(0x04)
$C$DW$1022	.dwtag  DW_TAG_member
	.dwattr $C$DW$1022, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1022, DW_AT_name("CMR12")
	.dwattr $C$DW$1022, DW_AT_TI_symbol_name("CMR12")
	.dwattr $C$DW$1022, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1022, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1022, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1022, DW_AT_decl_line(0x1bf)
	.dwattr $C$DW$1022, DW_AT_decl_column(0x15)
$C$DW$1023	.dwtag  DW_TAG_member
	.dwattr $C$DW$1023, DW_AT_type(*$C$DW$T$246)
	.dwattr $C$DW$1023, DW_AT_name("CMR12_bit")
	.dwattr $C$DW$1023, DW_AT_TI_symbol_name("CMR12_bit")
	.dwattr $C$DW$1023, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1023, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1023, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1023, DW_AT_decl_line(0x1ca)
	.dwattr $C$DW$1023, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$247

	.dwattr $C$DW$T$247, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$247, DW_AT_decl_line(0x1be)
	.dwattr $C$DW$T$247, DW_AT_decl_column(0x08)

$C$DW$T$249	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$249, DW_AT_byte_size(0x04)
$C$DW$1024	.dwtag  DW_TAG_member
	.dwattr $C$DW$1024, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1024, DW_AT_name("CMR13")
	.dwattr $C$DW$1024, DW_AT_TI_symbol_name("CMR13")
	.dwattr $C$DW$1024, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1024, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1024, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1024, DW_AT_decl_line(0x1d0)
	.dwattr $C$DW$1024, DW_AT_decl_column(0x15)
$C$DW$1025	.dwtag  DW_TAG_member
	.dwattr $C$DW$1025, DW_AT_type(*$C$DW$T$248)
	.dwattr $C$DW$1025, DW_AT_name("CMR13_bit")
	.dwattr $C$DW$1025, DW_AT_TI_symbol_name("CMR13_bit")
	.dwattr $C$DW$1025, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1025, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1025, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1025, DW_AT_decl_line(0x1db)
	.dwattr $C$DW$1025, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$249

	.dwattr $C$DW$T$249, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$249, DW_AT_decl_line(0x1cf)
	.dwattr $C$DW$T$249, DW_AT_decl_column(0x08)

$C$DW$T$251	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$251, DW_AT_byte_size(0x04)
$C$DW$1026	.dwtag  DW_TAG_member
	.dwattr $C$DW$1026, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1026, DW_AT_name("CMR14")
	.dwattr $C$DW$1026, DW_AT_TI_symbol_name("CMR14")
	.dwattr $C$DW$1026, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1026, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1026, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1026, DW_AT_decl_line(0x1e1)
	.dwattr $C$DW$1026, DW_AT_decl_column(0x15)
$C$DW$1027	.dwtag  DW_TAG_member
	.dwattr $C$DW$1027, DW_AT_type(*$C$DW$T$250)
	.dwattr $C$DW$1027, DW_AT_name("CMR14_bit")
	.dwattr $C$DW$1027, DW_AT_TI_symbol_name("CMR14_bit")
	.dwattr $C$DW$1027, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1027, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1027, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1027, DW_AT_decl_line(0x1ec)
	.dwattr $C$DW$1027, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$251

	.dwattr $C$DW$T$251, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$251, DW_AT_decl_line(0x1e0)
	.dwattr $C$DW$T$251, DW_AT_decl_column(0x08)

$C$DW$T$253	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$253, DW_AT_byte_size(0x04)
$C$DW$1028	.dwtag  DW_TAG_member
	.dwattr $C$DW$1028, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1028, DW_AT_name("CMR15")
	.dwattr $C$DW$1028, DW_AT_TI_symbol_name("CMR15")
	.dwattr $C$DW$1028, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1028, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1028, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1028, DW_AT_decl_line(0x1f2)
	.dwattr $C$DW$1028, DW_AT_decl_column(0x15)
$C$DW$1029	.dwtag  DW_TAG_member
	.dwattr $C$DW$1029, DW_AT_type(*$C$DW$T$252)
	.dwattr $C$DW$1029, DW_AT_name("CMR15_bit")
	.dwattr $C$DW$1029, DW_AT_TI_symbol_name("CMR15_bit")
	.dwattr $C$DW$1029, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1029, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1029, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1029, DW_AT_decl_line(0x1fd)
	.dwattr $C$DW$1029, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$253

	.dwattr $C$DW$T$253, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$253, DW_AT_decl_line(0x1f1)
	.dwattr $C$DW$T$253, DW_AT_decl_column(0x08)

$C$DW$T$255	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$255, DW_AT_byte_size(0x04)
$C$DW$1030	.dwtag  DW_TAG_member
	.dwattr $C$DW$1030, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1030, DW_AT_name("HMR0")
	.dwattr $C$DW$1030, DW_AT_TI_symbol_name("HMR0")
	.dwattr $C$DW$1030, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1030, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1030, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1030, DW_AT_decl_line(0x206)
	.dwattr $C$DW$1030, DW_AT_decl_column(0x15)
$C$DW$1031	.dwtag  DW_TAG_member
	.dwattr $C$DW$1031, DW_AT_type(*$C$DW$T$254)
	.dwattr $C$DW$1031, DW_AT_name("HMR0_bit")
	.dwattr $C$DW$1031, DW_AT_TI_symbol_name("HMR0_bit")
	.dwattr $C$DW$1031, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1031, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1031, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1031, DW_AT_decl_line(0x211)
	.dwattr $C$DW$1031, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$255

	.dwattr $C$DW$T$255, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$255, DW_AT_decl_line(0x205)
	.dwattr $C$DW$T$255, DW_AT_decl_column(0x08)

$C$DW$T$257	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$257, DW_AT_byte_size(0x04)
$C$DW$1032	.dwtag  DW_TAG_member
	.dwattr $C$DW$1032, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1032, DW_AT_name("HMR1")
	.dwattr $C$DW$1032, DW_AT_TI_symbol_name("HMR1")
	.dwattr $C$DW$1032, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1032, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1032, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1032, DW_AT_decl_line(0x217)
	.dwattr $C$DW$1032, DW_AT_decl_column(0x15)
$C$DW$1033	.dwtag  DW_TAG_member
	.dwattr $C$DW$1033, DW_AT_type(*$C$DW$T$256)
	.dwattr $C$DW$1033, DW_AT_name("HMR1_bit")
	.dwattr $C$DW$1033, DW_AT_TI_symbol_name("HMR1_bit")
	.dwattr $C$DW$1033, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1033, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1033, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1033, DW_AT_decl_line(0x222)
	.dwattr $C$DW$1033, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$257

	.dwattr $C$DW$T$257, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$257, DW_AT_decl_line(0x216)
	.dwattr $C$DW$T$257, DW_AT_decl_column(0x08)

$C$DW$T$259	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$259, DW_AT_byte_size(0x04)
$C$DW$1034	.dwtag  DW_TAG_member
	.dwattr $C$DW$1034, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1034, DW_AT_name("HMR2")
	.dwattr $C$DW$1034, DW_AT_TI_symbol_name("HMR2")
	.dwattr $C$DW$1034, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1034, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1034, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1034, DW_AT_decl_line(0x228)
	.dwattr $C$DW$1034, DW_AT_decl_column(0x15)
$C$DW$1035	.dwtag  DW_TAG_member
	.dwattr $C$DW$1035, DW_AT_type(*$C$DW$T$258)
	.dwattr $C$DW$1035, DW_AT_name("HMR2_bit")
	.dwattr $C$DW$1035, DW_AT_TI_symbol_name("HMR2_bit")
	.dwattr $C$DW$1035, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1035, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1035, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1035, DW_AT_decl_line(0x22f)
	.dwattr $C$DW$1035, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$259

	.dwattr $C$DW$T$259, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$259, DW_AT_decl_line(0x227)
	.dwattr $C$DW$T$259, DW_AT_decl_column(0x08)

$C$DW$T$261	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$261, DW_AT_byte_size(0x04)
$C$DW$1036	.dwtag  DW_TAG_member
	.dwattr $C$DW$1036, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1036, DW_AT_name("HIPIR0")
	.dwattr $C$DW$1036, DW_AT_TI_symbol_name("HIPIR0")
	.dwattr $C$DW$1036, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1036, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1036, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1036, DW_AT_decl_line(0x238)
	.dwattr $C$DW$1036, DW_AT_decl_column(0x15)
$C$DW$1037	.dwtag  DW_TAG_member
	.dwattr $C$DW$1037, DW_AT_type(*$C$DW$T$260)
	.dwattr $C$DW$1037, DW_AT_name("HIPIR0_bit")
	.dwattr $C$DW$1037, DW_AT_TI_symbol_name("HIPIR0_bit")
	.dwattr $C$DW$1037, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1037, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1037, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1037, DW_AT_decl_line(0x23e)
	.dwattr $C$DW$1037, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$261

	.dwattr $C$DW$T$261, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$261, DW_AT_decl_line(0x237)
	.dwattr $C$DW$T$261, DW_AT_decl_column(0x08)

$C$DW$T$263	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$263, DW_AT_byte_size(0x04)
$C$DW$1038	.dwtag  DW_TAG_member
	.dwattr $C$DW$1038, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1038, DW_AT_name("HIPIR1")
	.dwattr $C$DW$1038, DW_AT_TI_symbol_name("HIPIR1")
	.dwattr $C$DW$1038, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1038, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1038, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1038, DW_AT_decl_line(0x244)
	.dwattr $C$DW$1038, DW_AT_decl_column(0x15)
$C$DW$1039	.dwtag  DW_TAG_member
	.dwattr $C$DW$1039, DW_AT_type(*$C$DW$T$262)
	.dwattr $C$DW$1039, DW_AT_name("HIPIR1_bit")
	.dwattr $C$DW$1039, DW_AT_TI_symbol_name("HIPIR1_bit")
	.dwattr $C$DW$1039, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1039, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1039, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1039, DW_AT_decl_line(0x24a)
	.dwattr $C$DW$1039, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$263

	.dwattr $C$DW$T$263, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$263, DW_AT_decl_line(0x243)
	.dwattr $C$DW$T$263, DW_AT_decl_column(0x08)

$C$DW$T$265	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$265, DW_AT_byte_size(0x04)
$C$DW$1040	.dwtag  DW_TAG_member
	.dwattr $C$DW$1040, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1040, DW_AT_name("HIPIR2")
	.dwattr $C$DW$1040, DW_AT_TI_symbol_name("HIPIR2")
	.dwattr $C$DW$1040, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1040, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1040, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1040, DW_AT_decl_line(0x250)
	.dwattr $C$DW$1040, DW_AT_decl_column(0x15)
$C$DW$1041	.dwtag  DW_TAG_member
	.dwattr $C$DW$1041, DW_AT_type(*$C$DW$T$264)
	.dwattr $C$DW$1041, DW_AT_name("HIPIR2_bit")
	.dwattr $C$DW$1041, DW_AT_TI_symbol_name("HIPIR2_bit")
	.dwattr $C$DW$1041, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1041, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1041, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1041, DW_AT_decl_line(0x256)
	.dwattr $C$DW$1041, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$265

	.dwattr $C$DW$T$265, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$265, DW_AT_decl_line(0x24f)
	.dwattr $C$DW$T$265, DW_AT_decl_column(0x08)

$C$DW$T$267	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$267, DW_AT_byte_size(0x04)
$C$DW$1042	.dwtag  DW_TAG_member
	.dwattr $C$DW$1042, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1042, DW_AT_name("HIPIR3")
	.dwattr $C$DW$1042, DW_AT_TI_symbol_name("HIPIR3")
	.dwattr $C$DW$1042, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1042, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1042, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1042, DW_AT_decl_line(0x25c)
	.dwattr $C$DW$1042, DW_AT_decl_column(0x15)
$C$DW$1043	.dwtag  DW_TAG_member
	.dwattr $C$DW$1043, DW_AT_type(*$C$DW$T$266)
	.dwattr $C$DW$1043, DW_AT_name("HIPIR3_bit")
	.dwattr $C$DW$1043, DW_AT_TI_symbol_name("HIPIR3_bit")
	.dwattr $C$DW$1043, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1043, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1043, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1043, DW_AT_decl_line(0x262)
	.dwattr $C$DW$1043, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$267

	.dwattr $C$DW$T$267, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$267, DW_AT_decl_line(0x25b)
	.dwattr $C$DW$T$267, DW_AT_decl_column(0x08)

$C$DW$T$269	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$269, DW_AT_byte_size(0x04)
$C$DW$1044	.dwtag  DW_TAG_member
	.dwattr $C$DW$1044, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1044, DW_AT_name("HIPIR4")
	.dwattr $C$DW$1044, DW_AT_TI_symbol_name("HIPIR4")
	.dwattr $C$DW$1044, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1044, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1044, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1044, DW_AT_decl_line(0x268)
	.dwattr $C$DW$1044, DW_AT_decl_column(0x15)
$C$DW$1045	.dwtag  DW_TAG_member
	.dwattr $C$DW$1045, DW_AT_type(*$C$DW$T$268)
	.dwattr $C$DW$1045, DW_AT_name("HIPIR4_bit")
	.dwattr $C$DW$1045, DW_AT_TI_symbol_name("HIPIR4_bit")
	.dwattr $C$DW$1045, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1045, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1045, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1045, DW_AT_decl_line(0x26e)
	.dwattr $C$DW$1045, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$269

	.dwattr $C$DW$T$269, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$269, DW_AT_decl_line(0x267)
	.dwattr $C$DW$T$269, DW_AT_decl_column(0x08)

$C$DW$T$271	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$271, DW_AT_byte_size(0x04)
$C$DW$1046	.dwtag  DW_TAG_member
	.dwattr $C$DW$1046, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1046, DW_AT_name("HIPIR5")
	.dwattr $C$DW$1046, DW_AT_TI_symbol_name("HIPIR5")
	.dwattr $C$DW$1046, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1046, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1046, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1046, DW_AT_decl_line(0x274)
	.dwattr $C$DW$1046, DW_AT_decl_column(0x15)
$C$DW$1047	.dwtag  DW_TAG_member
	.dwattr $C$DW$1047, DW_AT_type(*$C$DW$T$270)
	.dwattr $C$DW$1047, DW_AT_name("HIPIR5_bit")
	.dwattr $C$DW$1047, DW_AT_TI_symbol_name("HIPIR5_bit")
	.dwattr $C$DW$1047, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1047, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1047, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1047, DW_AT_decl_line(0x27a)
	.dwattr $C$DW$1047, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$271

	.dwattr $C$DW$T$271, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$271, DW_AT_decl_line(0x273)
	.dwattr $C$DW$T$271, DW_AT_decl_column(0x08)

$C$DW$T$273	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$273, DW_AT_byte_size(0x04)
$C$DW$1048	.dwtag  DW_TAG_member
	.dwattr $C$DW$1048, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1048, DW_AT_name("HIPIR6")
	.dwattr $C$DW$1048, DW_AT_TI_symbol_name("HIPIR6")
	.dwattr $C$DW$1048, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1048, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1048, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1048, DW_AT_decl_line(0x280)
	.dwattr $C$DW$1048, DW_AT_decl_column(0x15)
$C$DW$1049	.dwtag  DW_TAG_member
	.dwattr $C$DW$1049, DW_AT_type(*$C$DW$T$272)
	.dwattr $C$DW$1049, DW_AT_name("HIPIR6_bit")
	.dwattr $C$DW$1049, DW_AT_TI_symbol_name("HIPIR6_bit")
	.dwattr $C$DW$1049, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1049, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1049, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1049, DW_AT_decl_line(0x286)
	.dwattr $C$DW$1049, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$273

	.dwattr $C$DW$T$273, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$273, DW_AT_decl_line(0x27f)
	.dwattr $C$DW$T$273, DW_AT_decl_column(0x08)

$C$DW$T$275	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$275, DW_AT_byte_size(0x04)
$C$DW$1050	.dwtag  DW_TAG_member
	.dwattr $C$DW$1050, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1050, DW_AT_name("HIPIR7")
	.dwattr $C$DW$1050, DW_AT_TI_symbol_name("HIPIR7")
	.dwattr $C$DW$1050, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1050, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1050, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1050, DW_AT_decl_line(0x28c)
	.dwattr $C$DW$1050, DW_AT_decl_column(0x15)
$C$DW$1051	.dwtag  DW_TAG_member
	.dwattr $C$DW$1051, DW_AT_type(*$C$DW$T$274)
	.dwattr $C$DW$1051, DW_AT_name("HIPIR7_bit")
	.dwattr $C$DW$1051, DW_AT_TI_symbol_name("HIPIR7_bit")
	.dwattr $C$DW$1051, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1051, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1051, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1051, DW_AT_decl_line(0x292)
	.dwattr $C$DW$1051, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$275

	.dwattr $C$DW$T$275, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$275, DW_AT_decl_line(0x28b)
	.dwattr $C$DW$T$275, DW_AT_decl_column(0x08)

$C$DW$T$277	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$277, DW_AT_byte_size(0x04)
$C$DW$1052	.dwtag  DW_TAG_member
	.dwattr $C$DW$1052, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1052, DW_AT_name("HIPIR8")
	.dwattr $C$DW$1052, DW_AT_TI_symbol_name("HIPIR8")
	.dwattr $C$DW$1052, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1052, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1052, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1052, DW_AT_decl_line(0x298)
	.dwattr $C$DW$1052, DW_AT_decl_column(0x15)
$C$DW$1053	.dwtag  DW_TAG_member
	.dwattr $C$DW$1053, DW_AT_type(*$C$DW$T$276)
	.dwattr $C$DW$1053, DW_AT_name("HIPIR8_bit")
	.dwattr $C$DW$1053, DW_AT_TI_symbol_name("HIPIR8_bit")
	.dwattr $C$DW$1053, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1053, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1053, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1053, DW_AT_decl_line(0x29e)
	.dwattr $C$DW$1053, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$277

	.dwattr $C$DW$T$277, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$277, DW_AT_decl_line(0x297)
	.dwattr $C$DW$T$277, DW_AT_decl_column(0x08)

$C$DW$T$279	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$279, DW_AT_byte_size(0x04)
$C$DW$1054	.dwtag  DW_TAG_member
	.dwattr $C$DW$1054, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1054, DW_AT_name("HIPIR9")
	.dwattr $C$DW$1054, DW_AT_TI_symbol_name("HIPIR9")
	.dwattr $C$DW$1054, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1054, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1054, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1054, DW_AT_decl_line(0x2a4)
	.dwattr $C$DW$1054, DW_AT_decl_column(0x15)
$C$DW$1055	.dwtag  DW_TAG_member
	.dwattr $C$DW$1055, DW_AT_type(*$C$DW$T$278)
	.dwattr $C$DW$1055, DW_AT_name("HIPIR9_bit")
	.dwattr $C$DW$1055, DW_AT_TI_symbol_name("HIPIR9_bit")
	.dwattr $C$DW$1055, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1055, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1055, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1055, DW_AT_decl_line(0x2aa)
	.dwattr $C$DW$1055, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$279

	.dwattr $C$DW$T$279, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$279, DW_AT_decl_line(0x2a3)
	.dwattr $C$DW$T$279, DW_AT_decl_column(0x08)

$C$DW$T$281	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$281, DW_AT_byte_size(0x04)
$C$DW$1056	.dwtag  DW_TAG_member
	.dwattr $C$DW$1056, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1056, DW_AT_name("SIPR0")
	.dwattr $C$DW$1056, DW_AT_TI_symbol_name("SIPR0")
	.dwattr $C$DW$1056, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1056, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1056, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1056, DW_AT_decl_line(0x2b3)
	.dwattr $C$DW$1056, DW_AT_decl_column(0x15)
$C$DW$1057	.dwtag  DW_TAG_member
	.dwattr $C$DW$1057, DW_AT_type(*$C$DW$T$280)
	.dwattr $C$DW$1057, DW_AT_name("SIPR0_bit")
	.dwattr $C$DW$1057, DW_AT_TI_symbol_name("SIPR0_bit")
	.dwattr $C$DW$1057, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1057, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1057, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1057, DW_AT_decl_line(0x2b7)
	.dwattr $C$DW$1057, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$281

	.dwattr $C$DW$T$281, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$281, DW_AT_decl_line(0x2b2)
	.dwattr $C$DW$T$281, DW_AT_decl_column(0x08)

$C$DW$T$283	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$283, DW_AT_byte_size(0x04)
$C$DW$1058	.dwtag  DW_TAG_member
	.dwattr $C$DW$1058, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1058, DW_AT_name("SIPR1")
	.dwattr $C$DW$1058, DW_AT_TI_symbol_name("SIPR1")
	.dwattr $C$DW$1058, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1058, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1058, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1058, DW_AT_decl_line(0x2bd)
	.dwattr $C$DW$1058, DW_AT_decl_column(0x15)
$C$DW$1059	.dwtag  DW_TAG_member
	.dwattr $C$DW$1059, DW_AT_type(*$C$DW$T$282)
	.dwattr $C$DW$1059, DW_AT_name("SIPR1_bit")
	.dwattr $C$DW$1059, DW_AT_TI_symbol_name("SIPR1_bit")
	.dwattr $C$DW$1059, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1059, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1059, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1059, DW_AT_decl_line(0x2c1)
	.dwattr $C$DW$1059, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$283

	.dwattr $C$DW$T$283, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$283, DW_AT_decl_line(0x2bc)
	.dwattr $C$DW$T$283, DW_AT_decl_column(0x08)

$C$DW$T$285	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$285, DW_AT_byte_size(0x04)
$C$DW$1060	.dwtag  DW_TAG_member
	.dwattr $C$DW$1060, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1060, DW_AT_name("SITR0")
	.dwattr $C$DW$1060, DW_AT_TI_symbol_name("SITR0")
	.dwattr $C$DW$1060, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1060, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1060, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1060, DW_AT_decl_line(0x2ca)
	.dwattr $C$DW$1060, DW_AT_decl_column(0x15)
$C$DW$1061	.dwtag  DW_TAG_member
	.dwattr $C$DW$1061, DW_AT_type(*$C$DW$T$284)
	.dwattr $C$DW$1061, DW_AT_name("SITR0_bit")
	.dwattr $C$DW$1061, DW_AT_TI_symbol_name("SITR0_bit")
	.dwattr $C$DW$1061, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1061, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1061, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1061, DW_AT_decl_line(0x2ce)
	.dwattr $C$DW$1061, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$285

	.dwattr $C$DW$T$285, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$285, DW_AT_decl_line(0x2c9)
	.dwattr $C$DW$T$285, DW_AT_decl_column(0x08)

$C$DW$T$287	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$287, DW_AT_byte_size(0x04)
$C$DW$1062	.dwtag  DW_TAG_member
	.dwattr $C$DW$1062, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1062, DW_AT_name("SITR1")
	.dwattr $C$DW$1062, DW_AT_TI_symbol_name("SITR1")
	.dwattr $C$DW$1062, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1062, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1062, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1062, DW_AT_decl_line(0x2d4)
	.dwattr $C$DW$1062, DW_AT_decl_column(0x15)
$C$DW$1063	.dwtag  DW_TAG_member
	.dwattr $C$DW$1063, DW_AT_type(*$C$DW$T$286)
	.dwattr $C$DW$1063, DW_AT_name("SITR1_bit")
	.dwattr $C$DW$1063, DW_AT_TI_symbol_name("SITR1_bit")
	.dwattr $C$DW$1063, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1063, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1063, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1063, DW_AT_decl_line(0x2d8)
	.dwattr $C$DW$1063, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$287

	.dwattr $C$DW$T$287, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$287, DW_AT_decl_line(0x2d3)
	.dwattr $C$DW$T$287, DW_AT_decl_column(0x08)

$C$DW$T$289	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$289, DW_AT_byte_size(0x04)
$C$DW$1064	.dwtag  DW_TAG_member
	.dwattr $C$DW$1064, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1064, DW_AT_name("HINLR0")
	.dwattr $C$DW$1064, DW_AT_TI_symbol_name("HINLR0")
	.dwattr $C$DW$1064, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1064, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1064, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1064, DW_AT_decl_line(0x2e1)
	.dwattr $C$DW$1064, DW_AT_decl_column(0x15)
$C$DW$1065	.dwtag  DW_TAG_member
	.dwattr $C$DW$1065, DW_AT_type(*$C$DW$T$288)
	.dwattr $C$DW$1065, DW_AT_name("HINLR0_bit")
	.dwattr $C$DW$1065, DW_AT_TI_symbol_name("HINLR0_bit")
	.dwattr $C$DW$1065, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1065, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1065, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1065, DW_AT_decl_line(0x2e7)
	.dwattr $C$DW$1065, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$289

	.dwattr $C$DW$T$289, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$289, DW_AT_decl_line(0x2e0)
	.dwattr $C$DW$T$289, DW_AT_decl_column(0x08)

$C$DW$T$291	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$291, DW_AT_byte_size(0x04)
$C$DW$1066	.dwtag  DW_TAG_member
	.dwattr $C$DW$1066, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1066, DW_AT_name("HINLR1")
	.dwattr $C$DW$1066, DW_AT_TI_symbol_name("HINLR1")
	.dwattr $C$DW$1066, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1066, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1066, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1066, DW_AT_decl_line(0x2ed)
	.dwattr $C$DW$1066, DW_AT_decl_column(0x15)
$C$DW$1067	.dwtag  DW_TAG_member
	.dwattr $C$DW$1067, DW_AT_type(*$C$DW$T$290)
	.dwattr $C$DW$1067, DW_AT_name("HINLR1_bit")
	.dwattr $C$DW$1067, DW_AT_TI_symbol_name("HINLR1_bit")
	.dwattr $C$DW$1067, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1067, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1067, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1067, DW_AT_decl_line(0x2f3)
	.dwattr $C$DW$1067, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$291

	.dwattr $C$DW$T$291, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$291, DW_AT_decl_line(0x2ec)
	.dwattr $C$DW$T$291, DW_AT_decl_column(0x08)

$C$DW$T$293	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$293, DW_AT_byte_size(0x04)
$C$DW$1068	.dwtag  DW_TAG_member
	.dwattr $C$DW$1068, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1068, DW_AT_name("HINLR2")
	.dwattr $C$DW$1068, DW_AT_TI_symbol_name("HINLR2")
	.dwattr $C$DW$1068, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1068, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1068, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1068, DW_AT_decl_line(0x2f9)
	.dwattr $C$DW$1068, DW_AT_decl_column(0x15)
$C$DW$1069	.dwtag  DW_TAG_member
	.dwattr $C$DW$1069, DW_AT_type(*$C$DW$T$292)
	.dwattr $C$DW$1069, DW_AT_name("HINLR2_bit")
	.dwattr $C$DW$1069, DW_AT_TI_symbol_name("HINLR2_bit")
	.dwattr $C$DW$1069, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1069, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1069, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1069, DW_AT_decl_line(0x2ff)
	.dwattr $C$DW$1069, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$293

	.dwattr $C$DW$T$293, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$293, DW_AT_decl_line(0x2f8)
	.dwattr $C$DW$T$293, DW_AT_decl_column(0x08)

$C$DW$T$295	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$295, DW_AT_byte_size(0x04)
$C$DW$1070	.dwtag  DW_TAG_member
	.dwattr $C$DW$1070, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1070, DW_AT_name("HINLR3")
	.dwattr $C$DW$1070, DW_AT_TI_symbol_name("HINLR3")
	.dwattr $C$DW$1070, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1070, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1070, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1070, DW_AT_decl_line(0x305)
	.dwattr $C$DW$1070, DW_AT_decl_column(0x15)
$C$DW$1071	.dwtag  DW_TAG_member
	.dwattr $C$DW$1071, DW_AT_type(*$C$DW$T$294)
	.dwattr $C$DW$1071, DW_AT_name("HINLR3_bit")
	.dwattr $C$DW$1071, DW_AT_TI_symbol_name("HINLR3_bit")
	.dwattr $C$DW$1071, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1071, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1071, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1071, DW_AT_decl_line(0x30b)
	.dwattr $C$DW$1071, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$295

	.dwattr $C$DW$T$295, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$295, DW_AT_decl_line(0x304)
	.dwattr $C$DW$T$295, DW_AT_decl_column(0x08)

$C$DW$T$297	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$297, DW_AT_byte_size(0x04)
$C$DW$1072	.dwtag  DW_TAG_member
	.dwattr $C$DW$1072, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1072, DW_AT_name("HINLR4")
	.dwattr $C$DW$1072, DW_AT_TI_symbol_name("HINLR4")
	.dwattr $C$DW$1072, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1072, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1072, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1072, DW_AT_decl_line(0x311)
	.dwattr $C$DW$1072, DW_AT_decl_column(0x15)
$C$DW$1073	.dwtag  DW_TAG_member
	.dwattr $C$DW$1073, DW_AT_type(*$C$DW$T$296)
	.dwattr $C$DW$1073, DW_AT_name("HINLR4_bit")
	.dwattr $C$DW$1073, DW_AT_TI_symbol_name("HINLR4_bit")
	.dwattr $C$DW$1073, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1073, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1073, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1073, DW_AT_decl_line(0x317)
	.dwattr $C$DW$1073, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$297

	.dwattr $C$DW$T$297, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$297, DW_AT_decl_line(0x310)
	.dwattr $C$DW$T$297, DW_AT_decl_column(0x08)

$C$DW$T$299	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$299, DW_AT_byte_size(0x04)
$C$DW$1074	.dwtag  DW_TAG_member
	.dwattr $C$DW$1074, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1074, DW_AT_name("HINLR5")
	.dwattr $C$DW$1074, DW_AT_TI_symbol_name("HINLR5")
	.dwattr $C$DW$1074, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1074, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1074, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1074, DW_AT_decl_line(0x31d)
	.dwattr $C$DW$1074, DW_AT_decl_column(0x15)
$C$DW$1075	.dwtag  DW_TAG_member
	.dwattr $C$DW$1075, DW_AT_type(*$C$DW$T$298)
	.dwattr $C$DW$1075, DW_AT_name("HINLR5_bit")
	.dwattr $C$DW$1075, DW_AT_TI_symbol_name("HINLR5_bit")
	.dwattr $C$DW$1075, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1075, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1075, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1075, DW_AT_decl_line(0x323)
	.dwattr $C$DW$1075, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$299

	.dwattr $C$DW$T$299, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$299, DW_AT_decl_line(0x31c)
	.dwattr $C$DW$T$299, DW_AT_decl_column(0x08)

$C$DW$T$301	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$301, DW_AT_byte_size(0x04)
$C$DW$1076	.dwtag  DW_TAG_member
	.dwattr $C$DW$1076, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1076, DW_AT_name("HINLR6")
	.dwattr $C$DW$1076, DW_AT_TI_symbol_name("HINLR6")
	.dwattr $C$DW$1076, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1076, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1076, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1076, DW_AT_decl_line(0x329)
	.dwattr $C$DW$1076, DW_AT_decl_column(0x15)
$C$DW$1077	.dwtag  DW_TAG_member
	.dwattr $C$DW$1077, DW_AT_type(*$C$DW$T$300)
	.dwattr $C$DW$1077, DW_AT_name("HINLR6_bit")
	.dwattr $C$DW$1077, DW_AT_TI_symbol_name("HINLR6_bit")
	.dwattr $C$DW$1077, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1077, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1077, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1077, DW_AT_decl_line(0x32f)
	.dwattr $C$DW$1077, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$301

	.dwattr $C$DW$T$301, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$301, DW_AT_decl_line(0x328)
	.dwattr $C$DW$T$301, DW_AT_decl_column(0x08)

$C$DW$T$303	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$303, DW_AT_byte_size(0x04)
$C$DW$1078	.dwtag  DW_TAG_member
	.dwattr $C$DW$1078, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1078, DW_AT_name("HINLR7")
	.dwattr $C$DW$1078, DW_AT_TI_symbol_name("HINLR7")
	.dwattr $C$DW$1078, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1078, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1078, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1078, DW_AT_decl_line(0x335)
	.dwattr $C$DW$1078, DW_AT_decl_column(0x15)
$C$DW$1079	.dwtag  DW_TAG_member
	.dwattr $C$DW$1079, DW_AT_type(*$C$DW$T$302)
	.dwattr $C$DW$1079, DW_AT_name("HINLR7_bit")
	.dwattr $C$DW$1079, DW_AT_TI_symbol_name("HINLR7_bit")
	.dwattr $C$DW$1079, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1079, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1079, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1079, DW_AT_decl_line(0x33b)
	.dwattr $C$DW$1079, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$303

	.dwattr $C$DW$T$303, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$303, DW_AT_decl_line(0x334)
	.dwattr $C$DW$T$303, DW_AT_decl_column(0x08)

$C$DW$T$305	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$305, DW_AT_byte_size(0x04)
$C$DW$1080	.dwtag  DW_TAG_member
	.dwattr $C$DW$1080, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1080, DW_AT_name("HINLR8")
	.dwattr $C$DW$1080, DW_AT_TI_symbol_name("HINLR8")
	.dwattr $C$DW$1080, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1080, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1080, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1080, DW_AT_decl_line(0x341)
	.dwattr $C$DW$1080, DW_AT_decl_column(0x15)
$C$DW$1081	.dwtag  DW_TAG_member
	.dwattr $C$DW$1081, DW_AT_type(*$C$DW$T$304)
	.dwattr $C$DW$1081, DW_AT_name("HINLR8_bit")
	.dwattr $C$DW$1081, DW_AT_TI_symbol_name("HINLR8_bit")
	.dwattr $C$DW$1081, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1081, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1081, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1081, DW_AT_decl_line(0x347)
	.dwattr $C$DW$1081, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$305

	.dwattr $C$DW$T$305, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$305, DW_AT_decl_line(0x340)
	.dwattr $C$DW$T$305, DW_AT_decl_column(0x08)

$C$DW$T$307	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$307, DW_AT_byte_size(0x04)
$C$DW$1082	.dwtag  DW_TAG_member
	.dwattr $C$DW$1082, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1082, DW_AT_name("HINLR9")
	.dwattr $C$DW$1082, DW_AT_TI_symbol_name("HINLR9")
	.dwattr $C$DW$1082, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1082, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1082, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1082, DW_AT_decl_line(0x34d)
	.dwattr $C$DW$1082, DW_AT_decl_column(0x15)
$C$DW$1083	.dwtag  DW_TAG_member
	.dwattr $C$DW$1083, DW_AT_type(*$C$DW$T$306)
	.dwattr $C$DW$1083, DW_AT_name("HINLR9_bit")
	.dwattr $C$DW$1083, DW_AT_TI_symbol_name("HINLR9_bit")
	.dwattr $C$DW$1083, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1083, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1083, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1083, DW_AT_decl_line(0x353)
	.dwattr $C$DW$1083, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$307

	.dwattr $C$DW$T$307, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$307, DW_AT_decl_line(0x34c)
	.dwattr $C$DW$T$307, DW_AT_decl_column(0x08)

$C$DW$T$309	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$309, DW_AT_byte_size(0x04)
$C$DW$1084	.dwtag  DW_TAG_member
	.dwattr $C$DW$1084, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1084, DW_AT_name("HIER")
	.dwattr $C$DW$1084, DW_AT_TI_symbol_name("HIER")
	.dwattr $C$DW$1084, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1084, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1084, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1084, DW_AT_decl_line(0x35c)
	.dwattr $C$DW$1084, DW_AT_decl_column(0x15)
$C$DW$1085	.dwtag  DW_TAG_member
	.dwattr $C$DW$1085, DW_AT_type(*$C$DW$T$308)
	.dwattr $C$DW$1085, DW_AT_name("HIER_bit")
	.dwattr $C$DW$1085, DW_AT_TI_symbol_name("HIER_bit")
	.dwattr $C$DW$1085, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1085, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1085, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$1085, DW_AT_decl_line(0x361)
	.dwattr $C$DW$1085, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$309

	.dwattr $C$DW$T$309, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_intc.h")
	.dwattr $C$DW$T$309, DW_AT_decl_line(0x35b)
	.dwattr $C$DW$T$309, DW_AT_decl_column(0x08)

$C$DW$T$311	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$311, DW_AT_byte_size(0x04)
$C$DW$1086	.dwtag  DW_TAG_member
	.dwattr $C$DW$1086, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1086, DW_AT_name("REVID")
	.dwattr $C$DW$1086, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$1086, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1086, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1086, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1086, DW_AT_decl_line(0x07)
	.dwattr $C$DW$1086, DW_AT_decl_column(0x15)
$C$DW$1087	.dwtag  DW_TAG_member
	.dwattr $C$DW$1087, DW_AT_type(*$C$DW$T$310)
	.dwattr $C$DW$1087, DW_AT_name("REVID_bit")
	.dwattr $C$DW$1087, DW_AT_TI_symbol_name("REVID_bit")
	.dwattr $C$DW$1087, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1087, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1087, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1087, DW_AT_decl_line(0x0b)
	.dwattr $C$DW$1087, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$311

	.dwattr $C$DW$T$311, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$311, DW_AT_decl_line(0x06)
	.dwattr $C$DW$T$311, DW_AT_decl_column(0x08)

$C$DW$T$313	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$313, DW_AT_byte_size(0x04)
$C$DW$1088	.dwtag  DW_TAG_member
	.dwattr $C$DW$1088, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1088, DW_AT_name("SYSCFG")
	.dwattr $C$DW$1088, DW_AT_TI_symbol_name("SYSCFG")
	.dwattr $C$DW$1088, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1088, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1088, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1088, DW_AT_decl_line(0x11)
	.dwattr $C$DW$1088, DW_AT_decl_column(0x15)
$C$DW$1089	.dwtag  DW_TAG_member
	.dwattr $C$DW$1089, DW_AT_type(*$C$DW$T$312)
	.dwattr $C$DW$1089, DW_AT_name("SYSCFG_bit")
	.dwattr $C$DW$1089, DW_AT_TI_symbol_name("SYSCFG_bit")
	.dwattr $C$DW$1089, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1089, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1089, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1089, DW_AT_decl_line(0x19)
	.dwattr $C$DW$1089, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$313

	.dwattr $C$DW$T$313, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$313, DW_AT_decl_line(0x10)
	.dwattr $C$DW$T$313, DW_AT_decl_column(0x08)

$C$DW$T$315	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$315, DW_AT_byte_size(0x04)
$C$DW$1090	.dwtag  DW_TAG_member
	.dwattr $C$DW$1090, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1090, DW_AT_name("GPCFG0")
	.dwattr $C$DW$1090, DW_AT_TI_symbol_name("GPCFG0")
	.dwattr $C$DW$1090, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1090, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1090, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1090, DW_AT_decl_line(0x1f)
	.dwattr $C$DW$1090, DW_AT_decl_column(0x15)
$C$DW$1091	.dwtag  DW_TAG_member
	.dwattr $C$DW$1091, DW_AT_type(*$C$DW$T$314)
	.dwattr $C$DW$1091, DW_AT_name("GPCFG0_bit")
	.dwattr $C$DW$1091, DW_AT_TI_symbol_name("GPCFG0_bit")
	.dwattr $C$DW$1091, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1091, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1091, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1091, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$1091, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$315

	.dwattr $C$DW$T$315, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$315, DW_AT_decl_line(0x1e)
	.dwattr $C$DW$T$315, DW_AT_decl_column(0x08)

$C$DW$T$317	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$317, DW_AT_byte_size(0x04)
$C$DW$1092	.dwtag  DW_TAG_member
	.dwattr $C$DW$1092, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1092, DW_AT_name("GPCFG1")
	.dwattr $C$DW$1092, DW_AT_TI_symbol_name("GPCFG1")
	.dwattr $C$DW$1092, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1092, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1092, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1092, DW_AT_decl_line(0x32)
	.dwattr $C$DW$1092, DW_AT_decl_column(0x15)
$C$DW$1093	.dwtag  DW_TAG_member
	.dwattr $C$DW$1093, DW_AT_type(*$C$DW$T$316)
	.dwattr $C$DW$1093, DW_AT_name("GPCFG1_bit")
	.dwattr $C$DW$1093, DW_AT_TI_symbol_name("GPCFG1_bit")
	.dwattr $C$DW$1093, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1093, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1093, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1093, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$1093, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$317

	.dwattr $C$DW$T$317, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$317, DW_AT_decl_line(0x31)
	.dwattr $C$DW$T$317, DW_AT_decl_column(0x08)

$C$DW$T$319	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$319, DW_AT_byte_size(0x04)
$C$DW$1094	.dwtag  DW_TAG_member
	.dwattr $C$DW$1094, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1094, DW_AT_name("CGR")
	.dwattr $C$DW$1094, DW_AT_TI_symbol_name("CGR")
	.dwattr $C$DW$1094, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1094, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1094, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1094, DW_AT_decl_line(0x45)
	.dwattr $C$DW$1094, DW_AT_decl_column(0x15)
$C$DW$1095	.dwtag  DW_TAG_member
	.dwattr $C$DW$1095, DW_AT_type(*$C$DW$T$318)
	.dwattr $C$DW$1095, DW_AT_name("CGR_bit")
	.dwattr $C$DW$1095, DW_AT_TI_symbol_name("CGR_bit")
	.dwattr $C$DW$1095, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1095, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1095, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1095, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$1095, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$319

	.dwattr $C$DW$T$319, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$319, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$319, DW_AT_decl_column(0x08)

$C$DW$T$321	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$321, DW_AT_byte_size(0x04)
$C$DW$1096	.dwtag  DW_TAG_member
	.dwattr $C$DW$1096, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1096, DW_AT_name("ISRP")
	.dwattr $C$DW$1096, DW_AT_TI_symbol_name("ISRP")
	.dwattr $C$DW$1096, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1096, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1096, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1096, DW_AT_decl_line(0x61)
	.dwattr $C$DW$1096, DW_AT_decl_column(0x15)
$C$DW$1097	.dwtag  DW_TAG_member
	.dwattr $C$DW$1097, DW_AT_type(*$C$DW$T$320)
	.dwattr $C$DW$1097, DW_AT_name("ISRP_bit")
	.dwattr $C$DW$1097, DW_AT_TI_symbol_name("ISRP_bit")
	.dwattr $C$DW$1097, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1097, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1097, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1097, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$1097, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$321

	.dwattr $C$DW$T$321, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$321, DW_AT_decl_line(0x60)
	.dwattr $C$DW$T$321, DW_AT_decl_column(0x08)

$C$DW$T$323	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$323, DW_AT_byte_size(0x04)
$C$DW$1098	.dwtag  DW_TAG_member
	.dwattr $C$DW$1098, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1098, DW_AT_name("ISP")
	.dwattr $C$DW$1098, DW_AT_TI_symbol_name("ISP")
	.dwattr $C$DW$1098, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1098, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1098, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1098, DW_AT_decl_line(0x70)
	.dwattr $C$DW$1098, DW_AT_decl_column(0x15)
$C$DW$1099	.dwtag  DW_TAG_member
	.dwattr $C$DW$1099, DW_AT_type(*$C$DW$T$322)
	.dwattr $C$DW$1099, DW_AT_name("ISP_bit")
	.dwattr $C$DW$1099, DW_AT_TI_symbol_name("ISP_bit")
	.dwattr $C$DW$1099, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1099, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1099, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1099, DW_AT_decl_line(0x79)
	.dwattr $C$DW$1099, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$323

	.dwattr $C$DW$T$323, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$323, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$T$323, DW_AT_decl_column(0x08)

$C$DW$T$325	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$325, DW_AT_byte_size(0x04)
$C$DW$1100	.dwtag  DW_TAG_member
	.dwattr $C$DW$1100, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1100, DW_AT_name("IESP")
	.dwattr $C$DW$1100, DW_AT_TI_symbol_name("IESP")
	.dwattr $C$DW$1100, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1100, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1100, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1100, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$1100, DW_AT_decl_column(0x15)
$C$DW$1101	.dwtag  DW_TAG_member
	.dwattr $C$DW$1101, DW_AT_type(*$C$DW$T$324)
	.dwattr $C$DW$1101, DW_AT_name("IESP_bit")
	.dwattr $C$DW$1101, DW_AT_TI_symbol_name("IESP_bit")
	.dwattr $C$DW$1101, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1101, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1101, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1101, DW_AT_decl_line(0x87)
	.dwattr $C$DW$1101, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$325

	.dwattr $C$DW$T$325, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$325, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$T$325, DW_AT_decl_column(0x08)

$C$DW$T$327	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$327, DW_AT_byte_size(0x04)
$C$DW$1102	.dwtag  DW_TAG_member
	.dwattr $C$DW$1102, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1102, DW_AT_name("IECP")
	.dwattr $C$DW$1102, DW_AT_TI_symbol_name("IECP")
	.dwattr $C$DW$1102, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1102, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1102, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1102, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$1102, DW_AT_decl_column(0x15)
$C$DW$1103	.dwtag  DW_TAG_member
	.dwattr $C$DW$1103, DW_AT_type(*$C$DW$T$326)
	.dwattr $C$DW$1103, DW_AT_name("IECP_bit")
	.dwattr $C$DW$1103, DW_AT_TI_symbol_name("IECP_bit")
	.dwattr $C$DW$1103, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1103, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1103, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1103, DW_AT_decl_line(0x95)
	.dwattr $C$DW$1103, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$327

	.dwattr $C$DW$T$327, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$327, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$T$327, DW_AT_decl_column(0x08)

$C$DW$T$329	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$329, DW_AT_byte_size(0x04)
$C$DW$1104	.dwtag  DW_TAG_member
	.dwattr $C$DW$1104, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1104, DW_AT_name("PMAO")
	.dwattr $C$DW$1104, DW_AT_TI_symbol_name("PMAO")
	.dwattr $C$DW$1104, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1104, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1104, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1104, DW_AT_decl_line(0x9e)
	.dwattr $C$DW$1104, DW_AT_decl_column(0x15)
$C$DW$1105	.dwtag  DW_TAG_member
	.dwattr $C$DW$1105, DW_AT_type(*$C$DW$T$328)
	.dwattr $C$DW$1105, DW_AT_name("PMAO_bit")
	.dwattr $C$DW$1105, DW_AT_TI_symbol_name("PMAO_bit")
	.dwattr $C$DW$1105, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1105, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1105, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1105, DW_AT_decl_line(0xa4)
	.dwattr $C$DW$1105, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$329

	.dwattr $C$DW$T$329, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$329, DW_AT_decl_line(0x9d)
	.dwattr $C$DW$T$329, DW_AT_decl_column(0x08)

$C$DW$T$331	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$331, DW_AT_byte_size(0x04)
$C$DW$1106	.dwtag  DW_TAG_member
	.dwattr $C$DW$1106, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1106, DW_AT_name("IEPCLK")
	.dwattr $C$DW$1106, DW_AT_TI_symbol_name("IEPCLK")
	.dwattr $C$DW$1106, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1106, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1106, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1106, DW_AT_decl_line(0xad)
	.dwattr $C$DW$1106, DW_AT_decl_column(0x15)
$C$DW$1107	.dwtag  DW_TAG_member
	.dwattr $C$DW$1107, DW_AT_type(*$C$DW$T$330)
	.dwattr $C$DW$1107, DW_AT_name("IEPCLK_bit")
	.dwattr $C$DW$1107, DW_AT_TI_symbol_name("IEPCLK_bit")
	.dwattr $C$DW$1107, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1107, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1107, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1107, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$1107, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$331

	.dwattr $C$DW$T$331, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$331, DW_AT_decl_line(0xac)
	.dwattr $C$DW$T$331, DW_AT_decl_column(0x08)

$C$DW$T$333	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$333, DW_AT_byte_size(0x04)
$C$DW$1108	.dwtag  DW_TAG_member
	.dwattr $C$DW$1108, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1108, DW_AT_name("SPP")
	.dwattr $C$DW$1108, DW_AT_TI_symbol_name("SPP")
	.dwattr $C$DW$1108, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1108, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1108, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1108, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$1108, DW_AT_decl_column(0x15)
$C$DW$1109	.dwtag  DW_TAG_member
	.dwattr $C$DW$1109, DW_AT_type(*$C$DW$T$332)
	.dwattr $C$DW$1109, DW_AT_name("SPP_bit")
	.dwattr $C$DW$1109, DW_AT_TI_symbol_name("SPP_bit")
	.dwattr $C$DW$1109, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1109, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1109, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1109, DW_AT_decl_line(0xbe)
	.dwattr $C$DW$1109, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$333

	.dwattr $C$DW$T$333, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$333, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$T$333, DW_AT_decl_column(0x08)

$C$DW$T$335	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$335, DW_AT_byte_size(0x04)
$C$DW$1110	.dwtag  DW_TAG_member
	.dwattr $C$DW$1110, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1110, DW_AT_name("PIN_MX")
	.dwattr $C$DW$1110, DW_AT_TI_symbol_name("PIN_MX")
	.dwattr $C$DW$1110, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1110, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1110, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1110, DW_AT_decl_line(0xc6)
	.dwattr $C$DW$1110, DW_AT_decl_column(0x15)
$C$DW$1111	.dwtag  DW_TAG_member
	.dwattr $C$DW$1111, DW_AT_type(*$C$DW$T$334)
	.dwattr $C$DW$1111, DW_AT_name("PIN_MX_bit")
	.dwattr $C$DW$1111, DW_AT_TI_symbol_name("PIN_MX_bit")
	.dwattr $C$DW$1111, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1111, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1111, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$1111, DW_AT_decl_line(0xcb)
	.dwattr $C$DW$1111, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$335

	.dwattr $C$DW$T$335, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_cfg.h")
	.dwattr $C$DW$T$335, DW_AT_decl_line(0xc5)
	.dwattr $C$DW$T$335, DW_AT_decl_column(0x08)

$C$DW$T$337	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$337, DW_AT_byte_size(0x04)
$C$DW$1112	.dwtag  DW_TAG_member
	.dwattr $C$DW$1112, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1112, DW_AT_name("cm_per_l4ls_clkstctrl")
	.dwattr $C$DW$1112, DW_AT_TI_symbol_name("cm_per_l4ls_clkstctrl")
	.dwattr $C$DW$1112, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1112, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1112, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1112, DW_AT_decl_line(0x13)
	.dwattr $C$DW$1112, DW_AT_decl_column(0x15)
$C$DW$1113	.dwtag  DW_TAG_member
	.dwattr $C$DW$1113, DW_AT_type(*$C$DW$T$336)
	.dwattr $C$DW$1113, DW_AT_name("cm_per_l4ls_clkstctrl_bit")
	.dwattr $C$DW$1113, DW_AT_TI_symbol_name("cm_per_l4ls_clkstctrl_bit")
	.dwattr $C$DW$1113, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1113, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1113, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1113, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$1113, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$337

	.dwattr $C$DW$T$337, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$337, DW_AT_decl_line(0x10)
	.dwattr $C$DW$T$337, DW_AT_decl_column(0x08)

$C$DW$T$339	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$339, DW_AT_byte_size(0x04)
$C$DW$1114	.dwtag  DW_TAG_member
	.dwattr $C$DW$1114, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1114, DW_AT_name("cm_per_l3s_clkstctrl")
	.dwattr $C$DW$1114, DW_AT_TI_symbol_name("cm_per_l3s_clkstctrl")
	.dwattr $C$DW$1114, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1114, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1114, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1114, DW_AT_decl_line(0x32)
	.dwattr $C$DW$1114, DW_AT_decl_column(0x15)
$C$DW$1115	.dwtag  DW_TAG_member
	.dwattr $C$DW$1115, DW_AT_type(*$C$DW$T$338)
	.dwattr $C$DW$1115, DW_AT_name("cm_per_l3s_clkstctrl_bit")
	.dwattr $C$DW$1115, DW_AT_TI_symbol_name("cm_per_l3s_clkstctrl_bit")
	.dwattr $C$DW$1115, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1115, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1115, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1115, DW_AT_decl_line(0x38)
	.dwattr $C$DW$1115, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$339

	.dwattr $C$DW$T$339, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$339, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$T$339, DW_AT_decl_column(0x08)

$C$DW$T$341	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$341, DW_AT_byte_size(0x04)
$C$DW$1116	.dwtag  DW_TAG_member
	.dwattr $C$DW$1116, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1116, DW_AT_name("cm_per_l3_clkstctrl")
	.dwattr $C$DW$1116, DW_AT_TI_symbol_name("cm_per_l3_clkstctrl")
	.dwattr $C$DW$1116, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1116, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1116, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1116, DW_AT_decl_line(0x42)
	.dwattr $C$DW$1116, DW_AT_decl_column(0x15)
$C$DW$1117	.dwtag  DW_TAG_member
	.dwattr $C$DW$1117, DW_AT_type(*$C$DW$T$340)
	.dwattr $C$DW$1117, DW_AT_name("cm_per_l3_clkstctrl_bit")
	.dwattr $C$DW$1117, DW_AT_TI_symbol_name("cm_per_l3_clkstctrl_bit")
	.dwattr $C$DW$1117, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1117, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1117, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1117, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$1117, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$341

	.dwattr $C$DW$T$341, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$341, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$T$341, DW_AT_decl_column(0x0f)

$C$DW$T$343	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$343, DW_AT_byte_size(0x04)
$C$DW$1118	.dwtag  DW_TAG_member
	.dwattr $C$DW$1118, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1118, DW_AT_name("cm_per_cpgmac0_clkctrl")
	.dwattr $C$DW$1118, DW_AT_TI_symbol_name("cm_per_cpgmac0_clkctrl")
	.dwattr $C$DW$1118, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1118, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1118, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1118, DW_AT_decl_line(0x56)
	.dwattr $C$DW$1118, DW_AT_decl_column(0x15)
$C$DW$1119	.dwtag  DW_TAG_member
	.dwattr $C$DW$1119, DW_AT_type(*$C$DW$T$342)
	.dwattr $C$DW$1119, DW_AT_name("cm_per_cpgmac0_clkctrl_bit")
	.dwattr $C$DW$1119, DW_AT_TI_symbol_name("cm_per_cpgmac0_clkctrl_bit")
	.dwattr $C$DW$1119, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1119, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1119, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1119, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$1119, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$343

	.dwattr $C$DW$T$343, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$343, DW_AT_decl_line(0x53)
	.dwattr $C$DW$T$343, DW_AT_decl_column(0x08)

$C$DW$T$345	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$345, DW_AT_byte_size(0x04)
$C$DW$1120	.dwtag  DW_TAG_member
	.dwattr $C$DW$1120, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1120, DW_AT_name("cm_per_lcdc_clkctrl")
	.dwattr $C$DW$1120, DW_AT_TI_symbol_name("cm_per_lcdc_clkctrl")
	.dwattr $C$DW$1120, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1120, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1120, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1120, DW_AT_decl_line(0x63)
	.dwattr $C$DW$1120, DW_AT_decl_column(0x15)
$C$DW$1121	.dwtag  DW_TAG_member
	.dwattr $C$DW$1121, DW_AT_type(*$C$DW$T$344)
	.dwattr $C$DW$1121, DW_AT_name("cm_per_lcdc_clkctrl_bit")
	.dwattr $C$DW$1121, DW_AT_TI_symbol_name("cm_per_lcdc_clkctrl_bit")
	.dwattr $C$DW$1121, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1121, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1121, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1121, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$1121, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$345

	.dwattr $C$DW$T$345, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$345, DW_AT_decl_line(0x60)
	.dwattr $C$DW$T$345, DW_AT_decl_column(0x08)

$C$DW$T$347	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$347, DW_AT_byte_size(0x04)
$C$DW$1122	.dwtag  DW_TAG_member
	.dwattr $C$DW$1122, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1122, DW_AT_name("cm_per_usb0_clkctrl")
	.dwattr $C$DW$1122, DW_AT_TI_symbol_name("cm_per_usb0_clkctrl")
	.dwattr $C$DW$1122, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1122, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1122, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1122, DW_AT_decl_line(0x70)
	.dwattr $C$DW$1122, DW_AT_decl_column(0x15)
$C$DW$1123	.dwtag  DW_TAG_member
	.dwattr $C$DW$1123, DW_AT_type(*$C$DW$T$346)
	.dwattr $C$DW$1123, DW_AT_name("cm_per_usb0_clkctrl_bit")
	.dwattr $C$DW$1123, DW_AT_TI_symbol_name("cm_per_usb0_clkctrl_bit")
	.dwattr $C$DW$1123, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1123, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1123, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1123, DW_AT_decl_line(0x77)
	.dwattr $C$DW$1123, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$347

	.dwattr $C$DW$T$347, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$347, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$T$347, DW_AT_decl_column(0x08)

$C$DW$T$349	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$349, DW_AT_byte_size(0x04)
$C$DW$1124	.dwtag  DW_TAG_member
	.dwattr $C$DW$1124, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1124, DW_AT_name("cm_per_tptc0_clkctrl")
	.dwattr $C$DW$1124, DW_AT_TI_symbol_name("cm_per_tptc0_clkctrl")
	.dwattr $C$DW$1124, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1124, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1124, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1124, DW_AT_decl_line(0x81)
	.dwattr $C$DW$1124, DW_AT_decl_column(0x15)
$C$DW$1125	.dwtag  DW_TAG_member
	.dwattr $C$DW$1125, DW_AT_type(*$C$DW$T$348)
	.dwattr $C$DW$1125, DW_AT_name("cm_per_tptc0_clkctrl_bit")
	.dwattr $C$DW$1125, DW_AT_TI_symbol_name("cm_per_tptc0_clkctrl_bit")
	.dwattr $C$DW$1125, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1125, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1125, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1125, DW_AT_decl_line(0x88)
	.dwattr $C$DW$1125, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$349

	.dwattr $C$DW$T$349, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$349, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$T$349, DW_AT_decl_column(0x08)

$C$DW$T$351	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$351, DW_AT_byte_size(0x04)
$C$DW$1126	.dwtag  DW_TAG_member
	.dwattr $C$DW$1126, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1126, DW_AT_name("cm_per_emif_clkctrl")
	.dwattr $C$DW$1126, DW_AT_TI_symbol_name("cm_per_emif_clkctrl")
	.dwattr $C$DW$1126, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1126, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1126, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1126, DW_AT_decl_line(0x8e)
	.dwattr $C$DW$1126, DW_AT_decl_column(0x15)
$C$DW$1127	.dwtag  DW_TAG_member
	.dwattr $C$DW$1127, DW_AT_type(*$C$DW$T$350)
	.dwattr $C$DW$1127, DW_AT_name("cm_per_emif_clkctrl_bit")
	.dwattr $C$DW$1127, DW_AT_TI_symbol_name("cm_per_emif_clkctrl_bit")
	.dwattr $C$DW$1127, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1127, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1127, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1127, DW_AT_decl_line(0x94)
	.dwattr $C$DW$1127, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$351

	.dwattr $C$DW$T$351, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$351, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$T$351, DW_AT_decl_column(0x08)

$C$DW$T$353	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$353, DW_AT_byte_size(0x04)
$C$DW$1128	.dwtag  DW_TAG_member
	.dwattr $C$DW$1128, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1128, DW_AT_name("cm_per_ocmcram_clkctrl")
	.dwattr $C$DW$1128, DW_AT_TI_symbol_name("cm_per_ocmcram_clkctrl")
	.dwattr $C$DW$1128, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1128, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1128, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1128, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$1128, DW_AT_decl_column(0x15)
$C$DW$1129	.dwtag  DW_TAG_member
	.dwattr $C$DW$1129, DW_AT_type(*$C$DW$T$352)
	.dwattr $C$DW$1129, DW_AT_name("cm_per_ocmcram_clkctrl_bit")
	.dwattr $C$DW$1129, DW_AT_TI_symbol_name("cm_per_ocmcram_clkctrl_bit")
	.dwattr $C$DW$1129, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1129, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1129, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1129, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$1129, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$353

	.dwattr $C$DW$T$353, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$353, DW_AT_decl_line(0x97)
	.dwattr $C$DW$T$353, DW_AT_decl_column(0x08)

$C$DW$T$355	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$355, DW_AT_byte_size(0x04)
$C$DW$1130	.dwtag  DW_TAG_member
	.dwattr $C$DW$1130, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1130, DW_AT_name("cm_per_gpmc_clkctrl")
	.dwattr $C$DW$1130, DW_AT_TI_symbol_name("cm_per_gpmc_clkctrl")
	.dwattr $C$DW$1130, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1130, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1130, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1130, DW_AT_decl_line(0xa6)
	.dwattr $C$DW$1130, DW_AT_decl_column(0x15)
$C$DW$1131	.dwtag  DW_TAG_member
	.dwattr $C$DW$1131, DW_AT_type(*$C$DW$T$354)
	.dwattr $C$DW$1131, DW_AT_name("cm_per_gpmc_clkctrl_bit")
	.dwattr $C$DW$1131, DW_AT_TI_symbol_name("cm_per_gpmc_clkctrl_bit")
	.dwattr $C$DW$1131, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1131, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1131, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1131, DW_AT_decl_line(0xac)
	.dwattr $C$DW$1131, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$355

	.dwattr $C$DW$T$355, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$355, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$T$355, DW_AT_decl_column(0x08)

$C$DW$T$357	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$357, DW_AT_byte_size(0x04)
$C$DW$1132	.dwtag  DW_TAG_member
	.dwattr $C$DW$1132, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1132, DW_AT_name("cm_per_mcasp0_clkctrl")
	.dwattr $C$DW$1132, DW_AT_TI_symbol_name("cm_per_mcasp0_clkctrl")
	.dwattr $C$DW$1132, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1132, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1132, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1132, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$1132, DW_AT_decl_column(0x15)
$C$DW$1133	.dwtag  DW_TAG_member
	.dwattr $C$DW$1133, DW_AT_type(*$C$DW$T$356)
	.dwattr $C$DW$1133, DW_AT_name("cm_per_mcasp0_clkctrl_bit")
	.dwattr $C$DW$1133, DW_AT_TI_symbol_name("cm_per_mcasp0_clkctrl_bit")
	.dwattr $C$DW$1133, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1133, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1133, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1133, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$1133, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$357

	.dwattr $C$DW$T$357, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$357, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$T$357, DW_AT_decl_column(0x08)

$C$DW$T$359	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$359, DW_AT_byte_size(0x04)
$C$DW$1134	.dwtag  DW_TAG_member
	.dwattr $C$DW$1134, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1134, DW_AT_name("cm_per_uart5_clkctrl")
	.dwattr $C$DW$1134, DW_AT_TI_symbol_name("cm_per_uart5_clkctrl")
	.dwattr $C$DW$1134, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1134, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1134, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1134, DW_AT_decl_line(0xbe)
	.dwattr $C$DW$1134, DW_AT_decl_column(0x15)
$C$DW$1135	.dwtag  DW_TAG_member
	.dwattr $C$DW$1135, DW_AT_type(*$C$DW$T$358)
	.dwattr $C$DW$1135, DW_AT_name("cm_per_uart5_clkctrl_bit")
	.dwattr $C$DW$1135, DW_AT_TI_symbol_name("cm_per_uart5_clkctrl_bit")
	.dwattr $C$DW$1135, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1135, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1135, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1135, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$1135, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$359

	.dwattr $C$DW$T$359, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$359, DW_AT_decl_line(0xbb)
	.dwattr $C$DW$T$359, DW_AT_decl_column(0x08)

$C$DW$T$361	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$361, DW_AT_byte_size(0x04)
$C$DW$1136	.dwtag  DW_TAG_member
	.dwattr $C$DW$1136, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1136, DW_AT_name("cm_per_mmc0_clkctrl")
	.dwattr $C$DW$1136, DW_AT_TI_symbol_name("cm_per_mmc0_clkctrl")
	.dwattr $C$DW$1136, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1136, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1136, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1136, DW_AT_decl_line(0xca)
	.dwattr $C$DW$1136, DW_AT_decl_column(0x15)
$C$DW$1137	.dwtag  DW_TAG_member
	.dwattr $C$DW$1137, DW_AT_type(*$C$DW$T$360)
	.dwattr $C$DW$1137, DW_AT_name("cm_per_mmc0_clkctrl_bit")
	.dwattr $C$DW$1137, DW_AT_TI_symbol_name("cm_per_mmc0_clkctrl_bit")
	.dwattr $C$DW$1137, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1137, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1137, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1137, DW_AT_decl_line(0xd0)
	.dwattr $C$DW$1137, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$361

	.dwattr $C$DW$T$361, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$361, DW_AT_decl_line(0xc7)
	.dwattr $C$DW$T$361, DW_AT_decl_column(0x08)

$C$DW$T$363	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$363, DW_AT_byte_size(0x04)
$C$DW$1138	.dwtag  DW_TAG_member
	.dwattr $C$DW$1138, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1138, DW_AT_name("cm_per_elm_clkctrl")
	.dwattr $C$DW$1138, DW_AT_TI_symbol_name("cm_per_elm_clkctrl")
	.dwattr $C$DW$1138, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1138, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1138, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1138, DW_AT_decl_line(0xd6)
	.dwattr $C$DW$1138, DW_AT_decl_column(0x15)
$C$DW$1139	.dwtag  DW_TAG_member
	.dwattr $C$DW$1139, DW_AT_type(*$C$DW$T$362)
	.dwattr $C$DW$1139, DW_AT_name("cm_per_mmc0_elm_clkctrl_bit")
	.dwattr $C$DW$1139, DW_AT_TI_symbol_name("cm_per_mmc0_elm_clkctrl_bit")
	.dwattr $C$DW$1139, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1139, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1139, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1139, DW_AT_decl_line(0xdc)
	.dwattr $C$DW$1139, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$363

	.dwattr $C$DW$T$363, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$363, DW_AT_decl_line(0xd3)
	.dwattr $C$DW$T$363, DW_AT_decl_column(0x08)

$C$DW$T$365	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$365, DW_AT_byte_size(0x04)
$C$DW$1140	.dwtag  DW_TAG_member
	.dwattr $C$DW$1140, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1140, DW_AT_name("cm_per_i2c2_clkctrl")
	.dwattr $C$DW$1140, DW_AT_TI_symbol_name("cm_per_i2c2_clkctrl")
	.dwattr $C$DW$1140, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1140, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1140, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1140, DW_AT_decl_line(0xe2)
	.dwattr $C$DW$1140, DW_AT_decl_column(0x15)
$C$DW$1141	.dwtag  DW_TAG_member
	.dwattr $C$DW$1141, DW_AT_type(*$C$DW$T$364)
	.dwattr $C$DW$1141, DW_AT_name("cm_per_i2c2_clkctrl_bit")
	.dwattr $C$DW$1141, DW_AT_TI_symbol_name("cm_per_i2c2_clkctrl_bit")
	.dwattr $C$DW$1141, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1141, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1141, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1141, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$1141, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$365

	.dwattr $C$DW$T$365, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$365, DW_AT_decl_line(0xdf)
	.dwattr $C$DW$T$365, DW_AT_decl_column(0x08)

$C$DW$T$367	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$367, DW_AT_byte_size(0x04)
$C$DW$1142	.dwtag  DW_TAG_member
	.dwattr $C$DW$1142, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1142, DW_AT_name("cm_per_i2c1_clkctrl")
	.dwattr $C$DW$1142, DW_AT_TI_symbol_name("cm_per_i2c1_clkctrl")
	.dwattr $C$DW$1142, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1142, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1142, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1142, DW_AT_decl_line(0xee)
	.dwattr $C$DW$1142, DW_AT_decl_column(0x15)
$C$DW$1143	.dwtag  DW_TAG_member
	.dwattr $C$DW$1143, DW_AT_type(*$C$DW$T$366)
	.dwattr $C$DW$1143, DW_AT_name("cm_per_i2c1_clkctrl_bit")
	.dwattr $C$DW$1143, DW_AT_TI_symbol_name("cm_per_i2c1_clkctrl_bit")
	.dwattr $C$DW$1143, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1143, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1143, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1143, DW_AT_decl_line(0xf4)
	.dwattr $C$DW$1143, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$367

	.dwattr $C$DW$T$367, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$367, DW_AT_decl_line(0xeb)
	.dwattr $C$DW$T$367, DW_AT_decl_column(0x08)

$C$DW$T$369	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$369, DW_AT_byte_size(0x04)
$C$DW$1144	.dwtag  DW_TAG_member
	.dwattr $C$DW$1144, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1144, DW_AT_name("cm_per_spi0_clkctrl")
	.dwattr $C$DW$1144, DW_AT_TI_symbol_name("cm_per_spi0_clkctrl")
	.dwattr $C$DW$1144, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1144, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1144, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1144, DW_AT_decl_line(0xfa)
	.dwattr $C$DW$1144, DW_AT_decl_column(0x15)
$C$DW$1145	.dwtag  DW_TAG_member
	.dwattr $C$DW$1145, DW_AT_type(*$C$DW$T$368)
	.dwattr $C$DW$1145, DW_AT_name("cm_per_spi0_clkctrl_bit")
	.dwattr $C$DW$1145, DW_AT_TI_symbol_name("cm_per_spi0_clkctrl_bit")
	.dwattr $C$DW$1145, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1145, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1145, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1145, DW_AT_decl_line(0x100)
	.dwattr $C$DW$1145, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$369

	.dwattr $C$DW$T$369, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$369, DW_AT_decl_line(0xf7)
	.dwattr $C$DW$T$369, DW_AT_decl_column(0x08)

$C$DW$T$371	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$371, DW_AT_byte_size(0x04)
$C$DW$1146	.dwtag  DW_TAG_member
	.dwattr $C$DW$1146, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1146, DW_AT_name("cm_per_spi1_clkctrl")
	.dwattr $C$DW$1146, DW_AT_TI_symbol_name("cm_per_spi1_clkctrl")
	.dwattr $C$DW$1146, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1146, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1146, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1146, DW_AT_decl_line(0x106)
	.dwattr $C$DW$1146, DW_AT_decl_column(0x15)
$C$DW$1147	.dwtag  DW_TAG_member
	.dwattr $C$DW$1147, DW_AT_type(*$C$DW$T$370)
	.dwattr $C$DW$1147, DW_AT_name("cm_per_spi1_clkctrl_bit")
	.dwattr $C$DW$1147, DW_AT_TI_symbol_name("cm_per_spi1_clkctrl_bit")
	.dwattr $C$DW$1147, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1147, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1147, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1147, DW_AT_decl_line(0x10c)
	.dwattr $C$DW$1147, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$371

	.dwattr $C$DW$T$371, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$371, DW_AT_decl_line(0x103)
	.dwattr $C$DW$T$371, DW_AT_decl_column(0x08)

$C$DW$T$373	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$373, DW_AT_byte_size(0x04)
$C$DW$1148	.dwtag  DW_TAG_member
	.dwattr $C$DW$1148, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1148, DW_AT_name("cm_per_l4ls_clkctrl")
	.dwattr $C$DW$1148, DW_AT_TI_symbol_name("cm_per_l4ls_clkctrl")
	.dwattr $C$DW$1148, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1148, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1148, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1148, DW_AT_decl_line(0x11e)
	.dwattr $C$DW$1148, DW_AT_decl_column(0x15)
$C$DW$1149	.dwtag  DW_TAG_member
	.dwattr $C$DW$1149, DW_AT_type(*$C$DW$T$372)
	.dwattr $C$DW$1149, DW_AT_name("cm_per_l4ls_clkctrl_bit")
	.dwattr $C$DW$1149, DW_AT_TI_symbol_name("cm_per_l4ls_clkctrl_bit")
	.dwattr $C$DW$1149, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1149, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1149, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1149, DW_AT_decl_line(0x124)
	.dwattr $C$DW$1149, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$373

	.dwattr $C$DW$T$373, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$373, DW_AT_decl_line(0x11b)
	.dwattr $C$DW$T$373, DW_AT_decl_column(0x08)

$C$DW$T$375	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$375, DW_AT_byte_size(0x04)
$C$DW$1150	.dwtag  DW_TAG_member
	.dwattr $C$DW$1150, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1150, DW_AT_name("cm_per_mcasp1_clkctrl")
	.dwattr $C$DW$1150, DW_AT_TI_symbol_name("cm_per_mcasp1_clkctrl")
	.dwattr $C$DW$1150, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1150, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1150, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1150, DW_AT_decl_line(0x12e)
	.dwattr $C$DW$1150, DW_AT_decl_column(0x15)
$C$DW$1151	.dwtag  DW_TAG_member
	.dwattr $C$DW$1151, DW_AT_type(*$C$DW$T$374)
	.dwattr $C$DW$1151, DW_AT_name("cm_per_mcasp1_clkctrl__bit")
	.dwattr $C$DW$1151, DW_AT_TI_symbol_name("cm_per_mcasp1_clkctrl__bit")
	.dwattr $C$DW$1151, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1151, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1151, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1151, DW_AT_decl_line(0x134)
	.dwattr $C$DW$1151, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$375

	.dwattr $C$DW$T$375, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$375, DW_AT_decl_line(0x12b)
	.dwattr $C$DW$T$375, DW_AT_decl_column(0x08)

$C$DW$T$377	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$377, DW_AT_byte_size(0x04)
$C$DW$1152	.dwtag  DW_TAG_member
	.dwattr $C$DW$1152, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1152, DW_AT_name("cm_per_uart1_clkctrl")
	.dwattr $C$DW$1152, DW_AT_TI_symbol_name("cm_per_uart1_clkctrl")
	.dwattr $C$DW$1152, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1152, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1152, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1152, DW_AT_decl_line(0x13a)
	.dwattr $C$DW$1152, DW_AT_decl_column(0x15)
$C$DW$1153	.dwtag  DW_TAG_member
	.dwattr $C$DW$1153, DW_AT_type(*$C$DW$T$376)
	.dwattr $C$DW$1153, DW_AT_name("cm_per_uart1_clkctrl__bit")
	.dwattr $C$DW$1153, DW_AT_TI_symbol_name("cm_per_uart1_clkctrl__bit")
	.dwattr $C$DW$1153, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1153, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1153, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1153, DW_AT_decl_line(0x140)
	.dwattr $C$DW$1153, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$377

	.dwattr $C$DW$T$377, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$377, DW_AT_decl_line(0x137)
	.dwattr $C$DW$T$377, DW_AT_decl_column(0x08)

$C$DW$T$379	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$379, DW_AT_byte_size(0x04)
$C$DW$1154	.dwtag  DW_TAG_member
	.dwattr $C$DW$1154, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1154, DW_AT_name("cm_per_uart2_clkctrl")
	.dwattr $C$DW$1154, DW_AT_TI_symbol_name("cm_per_uart2_clkctrl")
	.dwattr $C$DW$1154, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1154, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1154, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1154, DW_AT_decl_line(0x146)
	.dwattr $C$DW$1154, DW_AT_decl_column(0x15)
$C$DW$1155	.dwtag  DW_TAG_member
	.dwattr $C$DW$1155, DW_AT_type(*$C$DW$T$378)
	.dwattr $C$DW$1155, DW_AT_name("cm_per_uart2_clkctrl__bit")
	.dwattr $C$DW$1155, DW_AT_TI_symbol_name("cm_per_uart2_clkctrl__bit")
	.dwattr $C$DW$1155, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1155, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1155, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1155, DW_AT_decl_line(0x14c)
	.dwattr $C$DW$1155, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$379

	.dwattr $C$DW$T$379, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$379, DW_AT_decl_line(0x143)
	.dwattr $C$DW$T$379, DW_AT_decl_column(0x08)

$C$DW$T$381	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$381, DW_AT_byte_size(0x04)
$C$DW$1156	.dwtag  DW_TAG_member
	.dwattr $C$DW$1156, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1156, DW_AT_name("cm_per_uart3_clkctrl")
	.dwattr $C$DW$1156, DW_AT_TI_symbol_name("cm_per_uart3_clkctrl")
	.dwattr $C$DW$1156, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1156, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1156, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1156, DW_AT_decl_line(0x152)
	.dwattr $C$DW$1156, DW_AT_decl_column(0x15)
$C$DW$1157	.dwtag  DW_TAG_member
	.dwattr $C$DW$1157, DW_AT_type(*$C$DW$T$380)
	.dwattr $C$DW$1157, DW_AT_name("cm_per_uart3_clkctrl__bit")
	.dwattr $C$DW$1157, DW_AT_TI_symbol_name("cm_per_uart3_clkctrl__bit")
	.dwattr $C$DW$1157, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1157, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1157, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1157, DW_AT_decl_line(0x158)
	.dwattr $C$DW$1157, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$381

	.dwattr $C$DW$T$381, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$381, DW_AT_decl_line(0x14f)
	.dwattr $C$DW$T$381, DW_AT_decl_column(0x08)

$C$DW$T$383	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$383, DW_AT_byte_size(0x04)
$C$DW$1158	.dwtag  DW_TAG_member
	.dwattr $C$DW$1158, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1158, DW_AT_name("cm_per_uart4_clkctrl")
	.dwattr $C$DW$1158, DW_AT_TI_symbol_name("cm_per_uart4_clkctrl")
	.dwattr $C$DW$1158, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1158, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1158, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1158, DW_AT_decl_line(0x15e)
	.dwattr $C$DW$1158, DW_AT_decl_column(0x15)
$C$DW$1159	.dwtag  DW_TAG_member
	.dwattr $C$DW$1159, DW_AT_type(*$C$DW$T$382)
	.dwattr $C$DW$1159, DW_AT_name("cm_per_uart4_clkctrl__bit")
	.dwattr $C$DW$1159, DW_AT_TI_symbol_name("cm_per_uart4_clkctrl__bit")
	.dwattr $C$DW$1159, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1159, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1159, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1159, DW_AT_decl_line(0x164)
	.dwattr $C$DW$1159, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$383

	.dwattr $C$DW$T$383, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$383, DW_AT_decl_line(0x15b)
	.dwattr $C$DW$T$383, DW_AT_decl_column(0x08)

$C$DW$T$385	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$385, DW_AT_byte_size(0x04)
$C$DW$1160	.dwtag  DW_TAG_member
	.dwattr $C$DW$1160, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1160, DW_AT_name("cm_per_timer7_clkctrl")
	.dwattr $C$DW$1160, DW_AT_TI_symbol_name("cm_per_timer7_clkctrl")
	.dwattr $C$DW$1160, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1160, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1160, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1160, DW_AT_decl_line(0x16a)
	.dwattr $C$DW$1160, DW_AT_decl_column(0x15)
$C$DW$1161	.dwtag  DW_TAG_member
	.dwattr $C$DW$1161, DW_AT_type(*$C$DW$T$384)
	.dwattr $C$DW$1161, DW_AT_name("cm_per_timer7_clkctrl__bit")
	.dwattr $C$DW$1161, DW_AT_TI_symbol_name("cm_per_timer7_clkctrl__bit")
	.dwattr $C$DW$1161, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1161, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1161, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1161, DW_AT_decl_line(0x170)
	.dwattr $C$DW$1161, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$385

	.dwattr $C$DW$T$385, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$385, DW_AT_decl_line(0x167)
	.dwattr $C$DW$T$385, DW_AT_decl_column(0x08)

$C$DW$T$387	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$387, DW_AT_byte_size(0x04)
$C$DW$1162	.dwtag  DW_TAG_member
	.dwattr $C$DW$1162, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1162, DW_AT_name("cm_per_timer2_clkctrl")
	.dwattr $C$DW$1162, DW_AT_TI_symbol_name("cm_per_timer2_clkctrl")
	.dwattr $C$DW$1162, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1162, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1162, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1162, DW_AT_decl_line(0x176)
	.dwattr $C$DW$1162, DW_AT_decl_column(0x15)
$C$DW$1163	.dwtag  DW_TAG_member
	.dwattr $C$DW$1163, DW_AT_type(*$C$DW$T$386)
	.dwattr $C$DW$1163, DW_AT_name("cm_per_timer2_clkctrl__bit")
	.dwattr $C$DW$1163, DW_AT_TI_symbol_name("cm_per_timer2_clkctrl__bit")
	.dwattr $C$DW$1163, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1163, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1163, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1163, DW_AT_decl_line(0x17c)
	.dwattr $C$DW$1163, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$387

	.dwattr $C$DW$T$387, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$387, DW_AT_decl_line(0x173)
	.dwattr $C$DW$T$387, DW_AT_decl_column(0x08)

$C$DW$T$389	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$389, DW_AT_byte_size(0x04)
$C$DW$1164	.dwtag  DW_TAG_member
	.dwattr $C$DW$1164, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1164, DW_AT_name("cm_per_timer3_clkctrl")
	.dwattr $C$DW$1164, DW_AT_TI_symbol_name("cm_per_timer3_clkctrl")
	.dwattr $C$DW$1164, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1164, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1164, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1164, DW_AT_decl_line(0x182)
	.dwattr $C$DW$1164, DW_AT_decl_column(0x15)
$C$DW$1165	.dwtag  DW_TAG_member
	.dwattr $C$DW$1165, DW_AT_type(*$C$DW$T$388)
	.dwattr $C$DW$1165, DW_AT_name("cm_per_timer3_clkctrl__bit")
	.dwattr $C$DW$1165, DW_AT_TI_symbol_name("cm_per_timer3_clkctrl__bit")
	.dwattr $C$DW$1165, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1165, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1165, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1165, DW_AT_decl_line(0x188)
	.dwattr $C$DW$1165, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$389

	.dwattr $C$DW$T$389, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$389, DW_AT_decl_line(0x17f)
	.dwattr $C$DW$T$389, DW_AT_decl_column(0x08)

$C$DW$T$391	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$391, DW_AT_byte_size(0x04)
$C$DW$1166	.dwtag  DW_TAG_member
	.dwattr $C$DW$1166, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1166, DW_AT_name("cm_per_timer4_clkctrl")
	.dwattr $C$DW$1166, DW_AT_TI_symbol_name("cm_per_timer4_clkctrl")
	.dwattr $C$DW$1166, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1166, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1166, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1166, DW_AT_decl_line(0x18e)
	.dwattr $C$DW$1166, DW_AT_decl_column(0x15)
$C$DW$1167	.dwtag  DW_TAG_member
	.dwattr $C$DW$1167, DW_AT_type(*$C$DW$T$390)
	.dwattr $C$DW$1167, DW_AT_name("cm_per_timer4_clkctrl__bit")
	.dwattr $C$DW$1167, DW_AT_TI_symbol_name("cm_per_timer4_clkctrl__bit")
	.dwattr $C$DW$1167, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1167, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1167, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1167, DW_AT_decl_line(0x194)
	.dwattr $C$DW$1167, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$391

	.dwattr $C$DW$T$391, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$391, DW_AT_decl_line(0x18b)
	.dwattr $C$DW$T$391, DW_AT_decl_column(0x08)

$C$DW$T$393	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$393, DW_AT_byte_size(0x04)
$C$DW$1168	.dwtag  DW_TAG_member
	.dwattr $C$DW$1168, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1168, DW_AT_name("cm_per_gpio1_clkctrl")
	.dwattr $C$DW$1168, DW_AT_TI_symbol_name("cm_per_gpio1_clkctrl")
	.dwattr $C$DW$1168, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1168, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1168, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1168, DW_AT_decl_line(0x19e)
	.dwattr $C$DW$1168, DW_AT_decl_column(0x15)
$C$DW$1169	.dwtag  DW_TAG_member
	.dwattr $C$DW$1169, DW_AT_type(*$C$DW$T$392)
	.dwattr $C$DW$1169, DW_AT_name("cm_per_gpio1_clkctrl__bit")
	.dwattr $C$DW$1169, DW_AT_TI_symbol_name("cm_per_gpio1_clkctrl__bit")
	.dwattr $C$DW$1169, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1169, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1169, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1169, DW_AT_decl_line(0x1a5)
	.dwattr $C$DW$1169, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$393

	.dwattr $C$DW$T$393, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$393, DW_AT_decl_line(0x19b)
	.dwattr $C$DW$T$393, DW_AT_decl_column(0x08)

$C$DW$T$395	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$395, DW_AT_byte_size(0x04)
$C$DW$1170	.dwtag  DW_TAG_member
	.dwattr $C$DW$1170, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1170, DW_AT_name("cm_per_gpio2_clkctrl")
	.dwattr $C$DW$1170, DW_AT_TI_symbol_name("cm_per_gpio2_clkctrl")
	.dwattr $C$DW$1170, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1170, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1170, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1170, DW_AT_decl_line(0x1ab)
	.dwattr $C$DW$1170, DW_AT_decl_column(0x15)
$C$DW$1171	.dwtag  DW_TAG_member
	.dwattr $C$DW$1171, DW_AT_type(*$C$DW$T$394)
	.dwattr $C$DW$1171, DW_AT_name("cm_per_gpio2_clkctrl__bit")
	.dwattr $C$DW$1171, DW_AT_TI_symbol_name("cm_per_gpio2_clkctrl__bit")
	.dwattr $C$DW$1171, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1171, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1171, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1171, DW_AT_decl_line(0x1b2)
	.dwattr $C$DW$1171, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$395

	.dwattr $C$DW$T$395, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$395, DW_AT_decl_line(0x1a8)
	.dwattr $C$DW$T$395, DW_AT_decl_column(0x08)

$C$DW$T$397	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$397, DW_AT_byte_size(0x04)
$C$DW$1172	.dwtag  DW_TAG_member
	.dwattr $C$DW$1172, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1172, DW_AT_name("cm_per_gpio3_clkctrl")
	.dwattr $C$DW$1172, DW_AT_TI_symbol_name("cm_per_gpio3_clkctrl")
	.dwattr $C$DW$1172, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1172, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1172, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1172, DW_AT_decl_line(0x1b8)
	.dwattr $C$DW$1172, DW_AT_decl_column(0x15)
$C$DW$1173	.dwtag  DW_TAG_member
	.dwattr $C$DW$1173, DW_AT_type(*$C$DW$T$396)
	.dwattr $C$DW$1173, DW_AT_name("cm_per_gpio3_clkctrl__bit")
	.dwattr $C$DW$1173, DW_AT_TI_symbol_name("cm_per_gpio3_clkctrl__bit")
	.dwattr $C$DW$1173, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1173, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1173, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1173, DW_AT_decl_line(0x1bf)
	.dwattr $C$DW$1173, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$397

	.dwattr $C$DW$T$397, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$397, DW_AT_decl_line(0x1b5)
	.dwattr $C$DW$T$397, DW_AT_decl_column(0x08)

$C$DW$T$399	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$399, DW_AT_byte_size(0x04)
$C$DW$1174	.dwtag  DW_TAG_member
	.dwattr $C$DW$1174, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1174, DW_AT_name("cm_per_tpcc_clkctrl")
	.dwattr $C$DW$1174, DW_AT_TI_symbol_name("cm_per_tpcc_clkctrl")
	.dwattr $C$DW$1174, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1174, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1174, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1174, DW_AT_decl_line(0x1c9)
	.dwattr $C$DW$1174, DW_AT_decl_column(0x15)
$C$DW$1175	.dwtag  DW_TAG_member
	.dwattr $C$DW$1175, DW_AT_type(*$C$DW$T$398)
	.dwattr $C$DW$1175, DW_AT_name("cm_per_tpcc_clkctrl__bit")
	.dwattr $C$DW$1175, DW_AT_TI_symbol_name("cm_per_tpcc_clkctrl__bit")
	.dwattr $C$DW$1175, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1175, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1175, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1175, DW_AT_decl_line(0x1cf)
	.dwattr $C$DW$1175, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$399

	.dwattr $C$DW$T$399, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$399, DW_AT_decl_line(0x1c6)
	.dwattr $C$DW$T$399, DW_AT_decl_column(0x08)

$C$DW$T$401	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$401, DW_AT_byte_size(0x04)
$C$DW$1176	.dwtag  DW_TAG_member
	.dwattr $C$DW$1176, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1176, DW_AT_name("cm_per_dcan0_clkctrl")
	.dwattr $C$DW$1176, DW_AT_TI_symbol_name("cm_per_dcan0_clkctrl")
	.dwattr $C$DW$1176, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1176, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1176, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1176, DW_AT_decl_line(0x1d5)
	.dwattr $C$DW$1176, DW_AT_decl_column(0x15)
$C$DW$1177	.dwtag  DW_TAG_member
	.dwattr $C$DW$1177, DW_AT_type(*$C$DW$T$400)
	.dwattr $C$DW$1177, DW_AT_name("cm_per_dcan0_clkctrl__bit")
	.dwattr $C$DW$1177, DW_AT_TI_symbol_name("cm_per_dcan0_clkctrl__bit")
	.dwattr $C$DW$1177, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1177, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1177, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1177, DW_AT_decl_line(0x1db)
	.dwattr $C$DW$1177, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$401

	.dwattr $C$DW$T$401, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$401, DW_AT_decl_line(0x1d2)
	.dwattr $C$DW$T$401, DW_AT_decl_column(0x08)

$C$DW$T$403	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$403, DW_AT_byte_size(0x04)
$C$DW$1178	.dwtag  DW_TAG_member
	.dwattr $C$DW$1178, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1178, DW_AT_name("cm_per_dcan1_clkctrl")
	.dwattr $C$DW$1178, DW_AT_TI_symbol_name("cm_per_dcan1_clkctrl")
	.dwattr $C$DW$1178, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1178, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1178, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1178, DW_AT_decl_line(0x1e1)
	.dwattr $C$DW$1178, DW_AT_decl_column(0x15)
$C$DW$1179	.dwtag  DW_TAG_member
	.dwattr $C$DW$1179, DW_AT_type(*$C$DW$T$402)
	.dwattr $C$DW$1179, DW_AT_name("cm_per_dcan1_clkctrl__bit")
	.dwattr $C$DW$1179, DW_AT_TI_symbol_name("cm_per_dcan1_clkctrl__bit")
	.dwattr $C$DW$1179, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1179, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1179, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1179, DW_AT_decl_line(0x1e7)
	.dwattr $C$DW$1179, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$403

	.dwattr $C$DW$T$403, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$403, DW_AT_decl_line(0x1de)
	.dwattr $C$DW$T$403, DW_AT_decl_column(0x08)

$C$DW$T$405	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$405, DW_AT_byte_size(0x04)
$C$DW$1180	.dwtag  DW_TAG_member
	.dwattr $C$DW$1180, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1180, DW_AT_name("cm_per_epwmss1_clkctrl")
	.dwattr $C$DW$1180, DW_AT_TI_symbol_name("cm_per_epwmss1_clkctrl")
	.dwattr $C$DW$1180, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1180, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1180, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1180, DW_AT_decl_line(0x1f1)
	.dwattr $C$DW$1180, DW_AT_decl_column(0x15)
$C$DW$1181	.dwtag  DW_TAG_member
	.dwattr $C$DW$1181, DW_AT_type(*$C$DW$T$404)
	.dwattr $C$DW$1181, DW_AT_name("cm_per_epwmss1_clkctrl__bit")
	.dwattr $C$DW$1181, DW_AT_TI_symbol_name("cm_per_epwmss1_clkctrl__bit")
	.dwattr $C$DW$1181, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1181, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1181, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1181, DW_AT_decl_line(0x1f7)
	.dwattr $C$DW$1181, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$405

	.dwattr $C$DW$T$405, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$405, DW_AT_decl_line(0x1ee)
	.dwattr $C$DW$T$405, DW_AT_decl_column(0x08)

$C$DW$T$407	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$407, DW_AT_byte_size(0x04)
$C$DW$1182	.dwtag  DW_TAG_member
	.dwattr $C$DW$1182, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1182, DW_AT_name("cm_per_epwmss0_clkctrl")
	.dwattr $C$DW$1182, DW_AT_TI_symbol_name("cm_per_epwmss0_clkctrl")
	.dwattr $C$DW$1182, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1182, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1182, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1182, DW_AT_decl_line(0x201)
	.dwattr $C$DW$1182, DW_AT_decl_column(0x15)
$C$DW$1183	.dwtag  DW_TAG_member
	.dwattr $C$DW$1183, DW_AT_type(*$C$DW$T$406)
	.dwattr $C$DW$1183, DW_AT_name("cm_per_epwmss0_clkctrl__bit")
	.dwattr $C$DW$1183, DW_AT_TI_symbol_name("cm_per_epwmss0_clkctrl__bit")
	.dwattr $C$DW$1183, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1183, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1183, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1183, DW_AT_decl_line(0x207)
	.dwattr $C$DW$1183, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$407

	.dwattr $C$DW$T$407, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$407, DW_AT_decl_line(0x1fe)
	.dwattr $C$DW$T$407, DW_AT_decl_column(0x08)

$C$DW$T$409	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$409, DW_AT_byte_size(0x04)
$C$DW$1184	.dwtag  DW_TAG_member
	.dwattr $C$DW$1184, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1184, DW_AT_name("cm_per_epwmss2_clkctrl")
	.dwattr $C$DW$1184, DW_AT_TI_symbol_name("cm_per_epwmss2_clkctrl")
	.dwattr $C$DW$1184, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1184, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1184, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1184, DW_AT_decl_line(0x20d)
	.dwattr $C$DW$1184, DW_AT_decl_column(0x15)
$C$DW$1185	.dwtag  DW_TAG_member
	.dwattr $C$DW$1185, DW_AT_type(*$C$DW$T$408)
	.dwattr $C$DW$1185, DW_AT_name("cm_per_epwmss2_clkctrl__bit")
	.dwattr $C$DW$1185, DW_AT_TI_symbol_name("cm_per_epwmss2_clkctrl__bit")
	.dwattr $C$DW$1185, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1185, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1185, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1185, DW_AT_decl_line(0x213)
	.dwattr $C$DW$1185, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$409

	.dwattr $C$DW$T$409, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$409, DW_AT_decl_line(0x20a)
	.dwattr $C$DW$T$409, DW_AT_decl_column(0x08)

$C$DW$T$411	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$411, DW_AT_byte_size(0x04)
$C$DW$1186	.dwtag  DW_TAG_member
	.dwattr $C$DW$1186, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1186, DW_AT_name("cm_per_l3_instr_clkctrl")
	.dwattr $C$DW$1186, DW_AT_TI_symbol_name("cm_per_l3_instr_clkctrl")
	.dwattr $C$DW$1186, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1186, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1186, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1186, DW_AT_decl_line(0x219)
	.dwattr $C$DW$1186, DW_AT_decl_column(0x15)
$C$DW$1187	.dwtag  DW_TAG_member
	.dwattr $C$DW$1187, DW_AT_type(*$C$DW$T$410)
	.dwattr $C$DW$1187, DW_AT_name("cm_per_l3_instr_clkctrl_bit")
	.dwattr $C$DW$1187, DW_AT_TI_symbol_name("cm_per_l3_instr_clkctrl_bit")
	.dwattr $C$DW$1187, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1187, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1187, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1187, DW_AT_decl_line(0x21f)
	.dwattr $C$DW$1187, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$411

	.dwattr $C$DW$T$411, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$411, DW_AT_decl_line(0x216)
	.dwattr $C$DW$T$411, DW_AT_decl_column(0x08)

$C$DW$T$413	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$413, DW_AT_byte_size(0x04)
$C$DW$1188	.dwtag  DW_TAG_member
	.dwattr $C$DW$1188, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1188, DW_AT_name("cm_per_l3_clkctrl")
	.dwattr $C$DW$1188, DW_AT_TI_symbol_name("cm_per_l3_clkctrl")
	.dwattr $C$DW$1188, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1188, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1188, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1188, DW_AT_decl_line(0x225)
	.dwattr $C$DW$1188, DW_AT_decl_column(0x15)
$C$DW$1189	.dwtag  DW_TAG_member
	.dwattr $C$DW$1189, DW_AT_type(*$C$DW$T$412)
	.dwattr $C$DW$1189, DW_AT_name("cm_per_l3_instr_bit")
	.dwattr $C$DW$1189, DW_AT_TI_symbol_name("cm_per_l3_instr_bit")
	.dwattr $C$DW$1189, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1189, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1189, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1189, DW_AT_decl_line(0x22b)
	.dwattr $C$DW$1189, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$413

	.dwattr $C$DW$T$413, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$413, DW_AT_decl_line(0x222)
	.dwattr $C$DW$T$413, DW_AT_decl_column(0x08)

$C$DW$T$415	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$415, DW_AT_byte_size(0x04)
$C$DW$1190	.dwtag  DW_TAG_member
	.dwattr $C$DW$1190, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1190, DW_AT_name("cm_per_ieee5000_clkctrl")
	.dwattr $C$DW$1190, DW_AT_TI_symbol_name("cm_per_ieee5000_clkctrl")
	.dwattr $C$DW$1190, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1190, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1190, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1190, DW_AT_decl_line(0x231)
	.dwattr $C$DW$1190, DW_AT_decl_column(0x15)
$C$DW$1191	.dwtag  DW_TAG_member
	.dwattr $C$DW$1191, DW_AT_type(*$C$DW$T$414)
	.dwattr $C$DW$1191, DW_AT_name("cm_per_ieee5000_clkctrl_bit")
	.dwattr $C$DW$1191, DW_AT_TI_symbol_name("cm_per_ieee5000_clkctrl_bit")
	.dwattr $C$DW$1191, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1191, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1191, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1191, DW_AT_decl_line(0x238)
	.dwattr $C$DW$1191, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$415

	.dwattr $C$DW$T$415, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$415, DW_AT_decl_line(0x22e)
	.dwattr $C$DW$T$415, DW_AT_decl_column(0x08)

$C$DW$T$417	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$417, DW_AT_byte_size(0x04)
$C$DW$1192	.dwtag  DW_TAG_member
	.dwattr $C$DW$1192, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1192, DW_AT_name("cm_per_pru_icss_clkctrl")
	.dwattr $C$DW$1192, DW_AT_TI_symbol_name("cm_per_pru_icss_clkctrl")
	.dwattr $C$DW$1192, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1192, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1192, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1192, DW_AT_decl_line(0x23e)
	.dwattr $C$DW$1192, DW_AT_decl_column(0x15)
$C$DW$1193	.dwtag  DW_TAG_member
	.dwattr $C$DW$1193, DW_AT_type(*$C$DW$T$416)
	.dwattr $C$DW$1193, DW_AT_name("cm_per_pru_icss_clkctrl_bit")
	.dwattr $C$DW$1193, DW_AT_TI_symbol_name("cm_per_pru_icss_clkctrl_bit")
	.dwattr $C$DW$1193, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1193, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1193, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1193, DW_AT_decl_line(0x245)
	.dwattr $C$DW$1193, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$417

	.dwattr $C$DW$T$417, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$417, DW_AT_decl_line(0x23b)
	.dwattr $C$DW$T$417, DW_AT_decl_column(0x08)

$C$DW$T$419	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$419, DW_AT_byte_size(0x04)
$C$DW$1194	.dwtag  DW_TAG_member
	.dwattr $C$DW$1194, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1194, DW_AT_name("cm_per_timer5_clkctrl")
	.dwattr $C$DW$1194, DW_AT_TI_symbol_name("cm_per_timer5_clkctrl")
	.dwattr $C$DW$1194, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1194, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1194, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1194, DW_AT_decl_line(0x24b)
	.dwattr $C$DW$1194, DW_AT_decl_column(0x15)
$C$DW$1195	.dwtag  DW_TAG_member
	.dwattr $C$DW$1195, DW_AT_type(*$C$DW$T$418)
	.dwattr $C$DW$1195, DW_AT_name("cm_per_timer5_clkctrl_bit")
	.dwattr $C$DW$1195, DW_AT_TI_symbol_name("cm_per_timer5_clkctrl_bit")
	.dwattr $C$DW$1195, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1195, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1195, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1195, DW_AT_decl_line(0x251)
	.dwattr $C$DW$1195, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$419

	.dwattr $C$DW$T$419, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$419, DW_AT_decl_line(0x248)
	.dwattr $C$DW$T$419, DW_AT_decl_column(0x08)

$C$DW$T$421	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$421, DW_AT_byte_size(0x04)
$C$DW$1196	.dwtag  DW_TAG_member
	.dwattr $C$DW$1196, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1196, DW_AT_name("cm_per_timer6_clkctrl")
	.dwattr $C$DW$1196, DW_AT_TI_symbol_name("cm_per_timer6_clkctrl")
	.dwattr $C$DW$1196, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1196, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1196, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1196, DW_AT_decl_line(0x257)
	.dwattr $C$DW$1196, DW_AT_decl_column(0x15)
$C$DW$1197	.dwtag  DW_TAG_member
	.dwattr $C$DW$1197, DW_AT_type(*$C$DW$T$420)
	.dwattr $C$DW$1197, DW_AT_name("cm_per_timer6_clkstrl_bit")
	.dwattr $C$DW$1197, DW_AT_TI_symbol_name("cm_per_timer6_clkstrl_bit")
	.dwattr $C$DW$1197, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1197, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1197, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1197, DW_AT_decl_line(0x25d)
	.dwattr $C$DW$1197, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$421

	.dwattr $C$DW$T$421, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$421, DW_AT_decl_line(0x254)
	.dwattr $C$DW$T$421, DW_AT_decl_column(0x08)

$C$DW$T$423	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$423, DW_AT_byte_size(0x04)
$C$DW$1198	.dwtag  DW_TAG_member
	.dwattr $C$DW$1198, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1198, DW_AT_name("cm_per_mmc1_clkctrl")
	.dwattr $C$DW$1198, DW_AT_TI_symbol_name("cm_per_mmc1_clkctrl")
	.dwattr $C$DW$1198, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1198, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1198, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1198, DW_AT_decl_line(0x263)
	.dwattr $C$DW$1198, DW_AT_decl_column(0x15)
$C$DW$1199	.dwtag  DW_TAG_member
	.dwattr $C$DW$1199, DW_AT_type(*$C$DW$T$422)
	.dwattr $C$DW$1199, DW_AT_name("cm_per_mmc1_clkstrl_bit")
	.dwattr $C$DW$1199, DW_AT_TI_symbol_name("cm_per_mmc1_clkstrl_bit")
	.dwattr $C$DW$1199, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1199, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1199, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1199, DW_AT_decl_line(0x269)
	.dwattr $C$DW$1199, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$423

	.dwattr $C$DW$T$423, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$423, DW_AT_decl_line(0x260)
	.dwattr $C$DW$T$423, DW_AT_decl_column(0x08)

$C$DW$T$425	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$425, DW_AT_byte_size(0x04)
$C$DW$1200	.dwtag  DW_TAG_member
	.dwattr $C$DW$1200, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1200, DW_AT_name("cm_per_mmc2_clkctrl")
	.dwattr $C$DW$1200, DW_AT_TI_symbol_name("cm_per_mmc2_clkctrl")
	.dwattr $C$DW$1200, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1200, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1200, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1200, DW_AT_decl_line(0x26f)
	.dwattr $C$DW$1200, DW_AT_decl_column(0x15)
$C$DW$1201	.dwtag  DW_TAG_member
	.dwattr $C$DW$1201, DW_AT_type(*$C$DW$T$424)
	.dwattr $C$DW$1201, DW_AT_name("cm_per_mmc2_clkstrl_bit")
	.dwattr $C$DW$1201, DW_AT_TI_symbol_name("cm_per_mmc2_clkstrl_bit")
	.dwattr $C$DW$1201, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1201, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1201, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1201, DW_AT_decl_line(0x275)
	.dwattr $C$DW$1201, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$425

	.dwattr $C$DW$T$425, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$425, DW_AT_decl_line(0x26c)
	.dwattr $C$DW$T$425, DW_AT_decl_column(0x08)

$C$DW$T$427	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$427, DW_AT_byte_size(0x04)
$C$DW$1202	.dwtag  DW_TAG_member
	.dwattr $C$DW$1202, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1202, DW_AT_name("cm_per_tptc1_clkctrl")
	.dwattr $C$DW$1202, DW_AT_TI_symbol_name("cm_per_tptc1_clkctrl")
	.dwattr $C$DW$1202, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1202, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1202, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1202, DW_AT_decl_line(0x27b)
	.dwattr $C$DW$1202, DW_AT_decl_column(0x15)
$C$DW$1203	.dwtag  DW_TAG_member
	.dwattr $C$DW$1203, DW_AT_type(*$C$DW$T$426)
	.dwattr $C$DW$1203, DW_AT_name("cm_per_tptc1_clkctrl_bit")
	.dwattr $C$DW$1203, DW_AT_TI_symbol_name("cm_per_tptc1_clkctrl_bit")
	.dwattr $C$DW$1203, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1203, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1203, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1203, DW_AT_decl_line(0x282)
	.dwattr $C$DW$1203, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$427

	.dwattr $C$DW$T$427, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$427, DW_AT_decl_line(0x278)
	.dwattr $C$DW$T$427, DW_AT_decl_column(0x08)

$C$DW$T$429	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$429, DW_AT_byte_size(0x04)
$C$DW$1204	.dwtag  DW_TAG_member
	.dwattr $C$DW$1204, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1204, DW_AT_name("cm_per_tptc2_clkctrl")
	.dwattr $C$DW$1204, DW_AT_TI_symbol_name("cm_per_tptc2_clkctrl")
	.dwattr $C$DW$1204, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1204, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1204, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1204, DW_AT_decl_line(0x288)
	.dwattr $C$DW$1204, DW_AT_decl_column(0x15)
$C$DW$1205	.dwtag  DW_TAG_member
	.dwattr $C$DW$1205, DW_AT_type(*$C$DW$T$428)
	.dwattr $C$DW$1205, DW_AT_name("cm_per_tptc2_clkctrl_bit")
	.dwattr $C$DW$1205, DW_AT_TI_symbol_name("cm_per_tptc2_clkctrl_bit")
	.dwattr $C$DW$1205, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1205, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1205, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1205, DW_AT_decl_line(0x28f)
	.dwattr $C$DW$1205, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$429

	.dwattr $C$DW$T$429, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$429, DW_AT_decl_line(0x285)
	.dwattr $C$DW$T$429, DW_AT_decl_column(0x08)

$C$DW$T$431	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$431, DW_AT_byte_size(0x04)
$C$DW$1206	.dwtag  DW_TAG_member
	.dwattr $C$DW$1206, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1206, DW_AT_name("cm_per_spinlock_clkctrl")
	.dwattr $C$DW$1206, DW_AT_TI_symbol_name("cm_per_spinlock_clkctrl")
	.dwattr $C$DW$1206, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1206, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1206, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1206, DW_AT_decl_line(0x29d)
	.dwattr $C$DW$1206, DW_AT_decl_column(0x15)
$C$DW$1207	.dwtag  DW_TAG_member
	.dwattr $C$DW$1207, DW_AT_type(*$C$DW$T$430)
	.dwattr $C$DW$1207, DW_AT_name("cm_per_spinlock_clkstrl_bit")
	.dwattr $C$DW$1207, DW_AT_TI_symbol_name("cm_per_spinlock_clkstrl_bit")
	.dwattr $C$DW$1207, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1207, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1207, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1207, DW_AT_decl_line(0x2a3)
	.dwattr $C$DW$1207, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$431

	.dwattr $C$DW$T$431, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$431, DW_AT_decl_line(0x29a)
	.dwattr $C$DW$T$431, DW_AT_decl_column(0x08)

$C$DW$T$433	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$433, DW_AT_byte_size(0x04)
$C$DW$1208	.dwtag  DW_TAG_member
	.dwattr $C$DW$1208, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1208, DW_AT_name("cm_per_mailbox0_clkctrl")
	.dwattr $C$DW$1208, DW_AT_TI_symbol_name("cm_per_mailbox0_clkctrl")
	.dwattr $C$DW$1208, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1208, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1208, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1208, DW_AT_decl_line(0x2a9)
	.dwattr $C$DW$1208, DW_AT_decl_column(0x15)
$C$DW$1209	.dwtag  DW_TAG_member
	.dwattr $C$DW$1209, DW_AT_type(*$C$DW$T$432)
	.dwattr $C$DW$1209, DW_AT_name("cm_per_mailbox0_clkctrl_bit")
	.dwattr $C$DW$1209, DW_AT_TI_symbol_name("cm_per_mailbox0_clkctrl_bit")
	.dwattr $C$DW$1209, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1209, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1209, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1209, DW_AT_decl_line(0x2af)
	.dwattr $C$DW$1209, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$433

	.dwattr $C$DW$T$433, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$433, DW_AT_decl_line(0x2a6)
	.dwattr $C$DW$T$433, DW_AT_decl_column(0x08)

$C$DW$T$435	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$435, DW_AT_byte_size(0x04)
$C$DW$1210	.dwtag  DW_TAG_member
	.dwattr $C$DW$1210, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1210, DW_AT_name("cm_per_l4hs_clkstctrl")
	.dwattr $C$DW$1210, DW_AT_TI_symbol_name("cm_per_l4hs_clkstctrl")
	.dwattr $C$DW$1210, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1210, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1210, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1210, DW_AT_decl_line(0x2bd)
	.dwattr $C$DW$1210, DW_AT_decl_column(0x15)
$C$DW$1211	.dwtag  DW_TAG_member
	.dwattr $C$DW$1211, DW_AT_type(*$C$DW$T$434)
	.dwattr $C$DW$1211, DW_AT_name("cm_per_l4hs_clkstctrl_bit")
	.dwattr $C$DW$1211, DW_AT_TI_symbol_name("cm_per_l4hs_clkstctrl_bit")
	.dwattr $C$DW$1211, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1211, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1211, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1211, DW_AT_decl_line(0x2c6)
	.dwattr $C$DW$1211, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$435

	.dwattr $C$DW$T$435, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$435, DW_AT_decl_line(0x2ba)
	.dwattr $C$DW$T$435, DW_AT_decl_column(0x08)

$C$DW$T$437	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$437, DW_AT_byte_size(0x04)
$C$DW$1212	.dwtag  DW_TAG_member
	.dwattr $C$DW$1212, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1212, DW_AT_name("cm_per_l4hs_clkctrl")
	.dwattr $C$DW$1212, DW_AT_TI_symbol_name("cm_per_l4hs_clkctrl")
	.dwattr $C$DW$1212, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1212, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1212, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1212, DW_AT_decl_line(0x2cc)
	.dwattr $C$DW$1212, DW_AT_decl_column(0x15)
$C$DW$1213	.dwtag  DW_TAG_member
	.dwattr $C$DW$1213, DW_AT_type(*$C$DW$T$436)
	.dwattr $C$DW$1213, DW_AT_name("cm_per_l4hs_clkctrl_bit")
	.dwattr $C$DW$1213, DW_AT_TI_symbol_name("cm_per_l4hs_clkctrl_bit")
	.dwattr $C$DW$1213, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1213, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1213, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1213, DW_AT_decl_line(0x2d2)
	.dwattr $C$DW$1213, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$437

	.dwattr $C$DW$T$437, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$437, DW_AT_decl_line(0x2c9)
	.dwattr $C$DW$T$437, DW_AT_decl_column(0x08)

$C$DW$T$439	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$439, DW_AT_byte_size(0x04)
$C$DW$1214	.dwtag  DW_TAG_member
	.dwattr $C$DW$1214, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1214, DW_AT_name("cm_per_ocpwp_l3_clkstctrl")
	.dwattr $C$DW$1214, DW_AT_TI_symbol_name("cm_per_ocpwp_l3_clkstctrl")
	.dwattr $C$DW$1214, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1214, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1214, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1214, DW_AT_decl_line(0x2e0)
	.dwattr $C$DW$1214, DW_AT_decl_column(0x15)
$C$DW$1215	.dwtag  DW_TAG_member
	.dwattr $C$DW$1215, DW_AT_type(*$C$DW$T$438)
	.dwattr $C$DW$1215, DW_AT_name("cm_per_ocpwp_l3_clkstctrl_bit")
	.dwattr $C$DW$1215, DW_AT_TI_symbol_name("cm_per_ocpwp_l3_clkstctrl_bit")
	.dwattr $C$DW$1215, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1215, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1215, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1215, DW_AT_decl_line(0x2e7)
	.dwattr $C$DW$1215, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$439

	.dwattr $C$DW$T$439, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$439, DW_AT_decl_line(0x2dd)
	.dwattr $C$DW$T$439, DW_AT_decl_column(0x08)

$C$DW$T$441	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$441, DW_AT_byte_size(0x04)
$C$DW$1216	.dwtag  DW_TAG_member
	.dwattr $C$DW$1216, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1216, DW_AT_name("cm_per_ocpwp_clkctrl")
	.dwattr $C$DW$1216, DW_AT_TI_symbol_name("cm_per_ocpwp_clkctrl")
	.dwattr $C$DW$1216, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1216, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1216, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1216, DW_AT_decl_line(0x2ed)
	.dwattr $C$DW$1216, DW_AT_decl_column(0x15)
$C$DW$1217	.dwtag  DW_TAG_member
	.dwattr $C$DW$1217, DW_AT_type(*$C$DW$T$440)
	.dwattr $C$DW$1217, DW_AT_name("cm_per_ocpwp_clkctrl_bit")
	.dwattr $C$DW$1217, DW_AT_TI_symbol_name("cm_per_ocpwp_clkctrl_bit")
	.dwattr $C$DW$1217, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1217, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1217, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1217, DW_AT_decl_line(0x2f4)
	.dwattr $C$DW$1217, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$441

	.dwattr $C$DW$T$441, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$441, DW_AT_decl_line(0x2ea)
	.dwattr $C$DW$T$441, DW_AT_decl_column(0x08)

$C$DW$T$443	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$443, DW_AT_byte_size(0x04)
$C$DW$1218	.dwtag  DW_TAG_member
	.dwattr $C$DW$1218, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1218, DW_AT_name("cm_per_pru_icss_clkstctrl")
	.dwattr $C$DW$1218, DW_AT_TI_symbol_name("cm_per_pru_icss_clkstctrl")
	.dwattr $C$DW$1218, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1218, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1218, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1218, DW_AT_decl_line(0x306)
	.dwattr $C$DW$1218, DW_AT_decl_column(0x15)
$C$DW$1219	.dwtag  DW_TAG_member
	.dwattr $C$DW$1219, DW_AT_type(*$C$DW$T$442)
	.dwattr $C$DW$1219, DW_AT_name("cm_per_pru_icss_clkstctrl_bit")
	.dwattr $C$DW$1219, DW_AT_TI_symbol_name("cm_per_pru_icss_clkstctrl_bit")
	.dwattr $C$DW$1219, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1219, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1219, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1219, DW_AT_decl_line(0x30e)
	.dwattr $C$DW$1219, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$443

	.dwattr $C$DW$T$443, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$443, DW_AT_decl_line(0x303)
	.dwattr $C$DW$T$443, DW_AT_decl_column(0x08)

$C$DW$T$445	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$445, DW_AT_byte_size(0x04)
$C$DW$1220	.dwtag  DW_TAG_member
	.dwattr $C$DW$1220, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1220, DW_AT_name("cm_per_cpsw_clkstctrl")
	.dwattr $C$DW$1220, DW_AT_TI_symbol_name("cm_per_cpsw_clkstctrl")
	.dwattr $C$DW$1220, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1220, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1220, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1220, DW_AT_decl_line(0x314)
	.dwattr $C$DW$1220, DW_AT_decl_column(0x15)
$C$DW$1221	.dwtag  DW_TAG_member
	.dwattr $C$DW$1221, DW_AT_type(*$C$DW$T$444)
	.dwattr $C$DW$1221, DW_AT_name("cm_per_cpsw_clkstctrl_bit")
	.dwattr $C$DW$1221, DW_AT_TI_symbol_name("cm_per_cpsw_clkstctrl_bit")
	.dwattr $C$DW$1221, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1221, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1221, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1221, DW_AT_decl_line(0x31a)
	.dwattr $C$DW$1221, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$445

	.dwattr $C$DW$T$445, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$445, DW_AT_decl_line(0x311)
	.dwattr $C$DW$T$445, DW_AT_decl_column(0x08)

$C$DW$T$447	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$447, DW_AT_byte_size(0x04)
$C$DW$1222	.dwtag  DW_TAG_member
	.dwattr $C$DW$1222, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1222, DW_AT_name("cm_per_lcdc_clkstctrl")
	.dwattr $C$DW$1222, DW_AT_TI_symbol_name("cm_per_lcdc_clkstctrl")
	.dwattr $C$DW$1222, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1222, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1222, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1222, DW_AT_decl_line(0x320)
	.dwattr $C$DW$1222, DW_AT_decl_column(0x15)
$C$DW$1223	.dwtag  DW_TAG_member
	.dwattr $C$DW$1223, DW_AT_type(*$C$DW$T$446)
	.dwattr $C$DW$1223, DW_AT_name("cm_per_lcdc_clkstctrl_bit")
	.dwattr $C$DW$1223, DW_AT_TI_symbol_name("cm_per_lcdc_clkstctrl_bit")
	.dwattr $C$DW$1223, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1223, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1223, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1223, DW_AT_decl_line(0x327)
	.dwattr $C$DW$1223, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$447

	.dwattr $C$DW$T$447, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$447, DW_AT_decl_line(0x31d)
	.dwattr $C$DW$T$447, DW_AT_decl_column(0x08)

$C$DW$T$449	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$449, DW_AT_byte_size(0x04)
$C$DW$1224	.dwtag  DW_TAG_member
	.dwattr $C$DW$1224, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1224, DW_AT_name("cm_per_clkdiv32k_clkctrl")
	.dwattr $C$DW$1224, DW_AT_TI_symbol_name("cm_per_clkdiv32k_clkctrl")
	.dwattr $C$DW$1224, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1224, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1224, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1224, DW_AT_decl_line(0x32d)
	.dwattr $C$DW$1224, DW_AT_decl_column(0x15)
$C$DW$1225	.dwtag  DW_TAG_member
	.dwattr $C$DW$1225, DW_AT_type(*$C$DW$T$448)
	.dwattr $C$DW$1225, DW_AT_name("cm_per_clkdiv32k_clkctrl_bit")
	.dwattr $C$DW$1225, DW_AT_TI_symbol_name("cm_per_clkdiv32k_clkctrl_bit")
	.dwattr $C$DW$1225, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1225, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1225, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1225, DW_AT_decl_line(0x333)
	.dwattr $C$DW$1225, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$449

	.dwattr $C$DW$T$449, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$449, DW_AT_decl_line(0x32a)
	.dwattr $C$DW$T$449, DW_AT_decl_column(0x08)

$C$DW$T$451	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$451, DW_AT_byte_size(0x04)
$C$DW$1226	.dwtag  DW_TAG_member
	.dwattr $C$DW$1226, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1226, DW_AT_name("cm_per_clk_24mhz_clkstctrl")
	.dwattr $C$DW$1226, DW_AT_TI_symbol_name("cm_per_clk_24mhz_clkstctrl")
	.dwattr $C$DW$1226, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1226, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1226, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1226, DW_AT_decl_line(0x339)
	.dwattr $C$DW$1226, DW_AT_decl_column(0x15)
$C$DW$1227	.dwtag  DW_TAG_member
	.dwattr $C$DW$1227, DW_AT_type(*$C$DW$T$450)
	.dwattr $C$DW$1227, DW_AT_name("cm_per_iclk_24mhz_clkstctrl_bit")
	.dwattr $C$DW$1227, DW_AT_TI_symbol_name("cm_per_iclk_24mhz_clkstctrl_bit")
	.dwattr $C$DW$1227, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1227, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1227, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$1227, DW_AT_decl_line(0x33f)
	.dwattr $C$DW$1227, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$451

	.dwattr $C$DW$T$451, DW_AT_decl_file("../cmperCfg.h")
	.dwattr $C$DW$T$451, DW_AT_decl_line(0x336)
	.dwattr $C$DW$T$451, DW_AT_decl_column(0x08)

$C$DW$T$453	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$453, DW_AT_byte_size(0x04)
$C$DW$1228	.dwtag  DW_TAG_member
	.dwattr $C$DW$1228, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1228, DW_AT_name("CTPPR0")
	.dwattr $C$DW$1228, DW_AT_TI_symbol_name("CTPPR0")
	.dwattr $C$DW$1228, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1228, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1228, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1228, DW_AT_decl_line(0x60)
	.dwattr $C$DW$1228, DW_AT_decl_column(0x15)
$C$DW$1229	.dwtag  DW_TAG_member
	.dwattr $C$DW$1229, DW_AT_type(*$C$DW$T$452)
	.dwattr $C$DW$1229, DW_AT_name("CTPPR0_bit")
	.dwattr $C$DW$1229, DW_AT_TI_symbol_name("CTPPR0_bit")
	.dwattr $C$DW$1229, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1229, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1229, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1229, DW_AT_decl_line(0x65)
	.dwattr $C$DW$1229, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$453

	.dwattr $C$DW$T$453, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$453, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$T$453, DW_AT_decl_column(0x08)

$C$DW$T$455	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$455, DW_AT_byte_size(0x04)
$C$DW$1230	.dwtag  DW_TAG_member
	.dwattr $C$DW$1230, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1230, DW_AT_name("CTRL")
	.dwattr $C$DW$1230, DW_AT_TI_symbol_name("CTRL")
	.dwattr $C$DW$1230, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1230, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1230, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1230, DW_AT_decl_line(0x08)
	.dwattr $C$DW$1230, DW_AT_decl_column(0x15)
$C$DW$1231	.dwtag  DW_TAG_member
	.dwattr $C$DW$1231, DW_AT_type(*$C$DW$T$454)
	.dwattr $C$DW$1231, DW_AT_name("CONTROL_bit")
	.dwattr $C$DW$1231, DW_AT_TI_symbol_name("CONTROL_bit")
	.dwattr $C$DW$1231, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1231, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1231, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1231, DW_AT_decl_line(0x14)
	.dwattr $C$DW$1231, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$455

	.dwattr $C$DW$T$455, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$455, DW_AT_decl_line(0x07)
	.dwattr $C$DW$T$455, DW_AT_decl_column(0x08)

$C$DW$T$457	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$457, DW_AT_byte_size(0x04)
$C$DW$1232	.dwtag  DW_TAG_member
	.dwattr $C$DW$1232, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1232, DW_AT_name("STS")
	.dwattr $C$DW$1232, DW_AT_TI_symbol_name("STS")
	.dwattr $C$DW$1232, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1232, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1232, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1232, DW_AT_decl_line(0x1a)
	.dwattr $C$DW$1232, DW_AT_decl_column(0x15)
$C$DW$1233	.dwtag  DW_TAG_member
	.dwattr $C$DW$1233, DW_AT_type(*$C$DW$T$456)
	.dwattr $C$DW$1233, DW_AT_name("STATUS_bit")
	.dwattr $C$DW$1233, DW_AT_TI_symbol_name("STATUS_bit")
	.dwattr $C$DW$1233, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1233, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1233, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1233, DW_AT_decl_line(0x1f)
	.dwattr $C$DW$1233, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$457

	.dwattr $C$DW$T$457, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$457, DW_AT_decl_line(0x19)
	.dwattr $C$DW$T$457, DW_AT_decl_column(0x08)

$C$DW$T$459	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$459, DW_AT_byte_size(0x04)
$C$DW$1234	.dwtag  DW_TAG_member
	.dwattr $C$DW$1234, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1234, DW_AT_name("WAKEUP_EN")
	.dwattr $C$DW$1234, DW_AT_TI_symbol_name("WAKEUP_EN")
	.dwattr $C$DW$1234, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1234, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1234, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1234, DW_AT_decl_line(0x25)
	.dwattr $C$DW$1234, DW_AT_decl_column(0x15)
$C$DW$1235	.dwtag  DW_TAG_member
	.dwattr $C$DW$1235, DW_AT_type(*$C$DW$T$458)
	.dwattr $C$DW$1235, DW_AT_name("WAKEUP_EN_bit")
	.dwattr $C$DW$1235, DW_AT_TI_symbol_name("WAKEUP_EN_bit")
	.dwattr $C$DW$1235, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1235, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1235, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1235, DW_AT_decl_line(0x29)
	.dwattr $C$DW$1235, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$459

	.dwattr $C$DW$T$459, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$459, DW_AT_decl_line(0x24)
	.dwattr $C$DW$T$459, DW_AT_decl_column(0x08)

$C$DW$T$461	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$461, DW_AT_byte_size(0x04)
$C$DW$1236	.dwtag  DW_TAG_member
	.dwattr $C$DW$1236, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1236, DW_AT_name("CYCLE")
	.dwattr $C$DW$1236, DW_AT_TI_symbol_name("CYCLE")
	.dwattr $C$DW$1236, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1236, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1236, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1236, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$1236, DW_AT_decl_column(0x15)
$C$DW$1237	.dwtag  DW_TAG_member
	.dwattr $C$DW$1237, DW_AT_type(*$C$DW$T$460)
	.dwattr $C$DW$1237, DW_AT_name("CYCLE_bit")
	.dwattr $C$DW$1237, DW_AT_TI_symbol_name("CYCLE_bit")
	.dwattr $C$DW$1237, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1237, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1237, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1237, DW_AT_decl_line(0x33)
	.dwattr $C$DW$1237, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$461

	.dwattr $C$DW$T$461, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$461, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$T$461, DW_AT_decl_column(0x08)

$C$DW$T$463	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$463, DW_AT_byte_size(0x04)
$C$DW$1238	.dwtag  DW_TAG_member
	.dwattr $C$DW$1238, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1238, DW_AT_name("STALL")
	.dwattr $C$DW$1238, DW_AT_TI_symbol_name("STALL")
	.dwattr $C$DW$1238, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1238, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1238, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1238, DW_AT_decl_line(0x39)
	.dwattr $C$DW$1238, DW_AT_decl_column(0x15)
$C$DW$1239	.dwtag  DW_TAG_member
	.dwattr $C$DW$1239, DW_AT_type(*$C$DW$T$462)
	.dwattr $C$DW$1239, DW_AT_name("STALL_bit")
	.dwattr $C$DW$1239, DW_AT_TI_symbol_name("STALL_bit")
	.dwattr $C$DW$1239, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1239, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1239, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1239, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$1239, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$463

	.dwattr $C$DW$T$463, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$463, DW_AT_decl_line(0x38)
	.dwattr $C$DW$T$463, DW_AT_decl_column(0x08)

$C$DW$T$465	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$465, DW_AT_byte_size(0x04)
$C$DW$1240	.dwtag  DW_TAG_member
	.dwattr $C$DW$1240, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1240, DW_AT_name("CTBIR0")
	.dwattr $C$DW$1240, DW_AT_TI_symbol_name("CTBIR0")
	.dwattr $C$DW$1240, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1240, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1240, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1240, DW_AT_decl_line(0x46)
	.dwattr $C$DW$1240, DW_AT_decl_column(0x15)
$C$DW$1241	.dwtag  DW_TAG_member
	.dwattr $C$DW$1241, DW_AT_type(*$C$DW$T$464)
	.dwattr $C$DW$1241, DW_AT_name("CTBIR0_bit")
	.dwattr $C$DW$1241, DW_AT_TI_symbol_name("CTBIR0_bit")
	.dwattr $C$DW$1241, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1241, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1241, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1241, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$1241, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$465

	.dwattr $C$DW$T$465, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$465, DW_AT_decl_line(0x45)
	.dwattr $C$DW$T$465, DW_AT_decl_column(0x08)

$C$DW$T$467	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$467, DW_AT_byte_size(0x04)
$C$DW$1242	.dwtag  DW_TAG_member
	.dwattr $C$DW$1242, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1242, DW_AT_name("CTBIR1")
	.dwattr $C$DW$1242, DW_AT_TI_symbol_name("CTBIR1")
	.dwattr $C$DW$1242, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1242, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1242, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1242, DW_AT_decl_line(0x53)
	.dwattr $C$DW$1242, DW_AT_decl_column(0x15)
$C$DW$1243	.dwtag  DW_TAG_member
	.dwattr $C$DW$1243, DW_AT_type(*$C$DW$T$466)
	.dwattr $C$DW$1243, DW_AT_name("CTBIR1_bit")
	.dwattr $C$DW$1243, DW_AT_TI_symbol_name("CTBIR1_bit")
	.dwattr $C$DW$1243, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1243, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1243, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1243, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$1243, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$467

	.dwattr $C$DW$T$467, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$467, DW_AT_decl_line(0x52)
	.dwattr $C$DW$T$467, DW_AT_decl_column(0x08)

$C$DW$T$469	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$469, DW_AT_byte_size(0x04)
$C$DW$1244	.dwtag  DW_TAG_member
	.dwattr $C$DW$1244, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$1244, DW_AT_name("CTPPR1")
	.dwattr $C$DW$1244, DW_AT_TI_symbol_name("CTPPR1")
	.dwattr $C$DW$1244, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1244, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1244, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1244, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$1244, DW_AT_decl_column(0x15)
$C$DW$1245	.dwtag  DW_TAG_member
	.dwattr $C$DW$1245, DW_AT_type(*$C$DW$T$468)
	.dwattr $C$DW$1245, DW_AT_name("CTPPR1_bit")
	.dwattr $C$DW$1245, DW_AT_TI_symbol_name("CTPPR1_bit")
	.dwattr $C$DW$1245, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1245, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1245, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$1245, DW_AT_decl_line(0x70)
	.dwattr $C$DW$1245, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$469

	.dwattr $C$DW$T$469, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_ctrl.h")
	.dwattr $C$DW$T$469, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$469, DW_AT_decl_column(0x08)
$C$DW$T$2	.dwtag  DW_TAG_unspecified_type
	.dwattr $C$DW$T$2, DW_AT_name("void")
$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)
$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)
$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)
$C$DW$T$470	.dwtag  DW_TAG_typedef, DW_AT_name("uint8_t")
	.dwattr $C$DW$T$470, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$470, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$470, DW_AT_decl_file("/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/include/stdint.h")
	.dwattr $C$DW$T$470, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$T$470, DW_AT_decl_column(0x1c)

$C$DW$T$474	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$474, DW_AT_type(*$C$DW$T$470)
	.dwattr $C$DW$T$474, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$474, DW_AT_byte_size(0x0a)
$C$DW$1246	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1246, DW_AT_upper_bound(0x09)
	.dwendtag $C$DW$T$474

$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x04)
$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)
$C$DW$T$169	.dwtag  DW_TAG_typedef, DW_AT_name("int16_t")
	.dwattr $C$DW$T$169, DW_AT_type(*$C$DW$T$8)
	.dwattr $C$DW$T$169, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$169, DW_AT_decl_file("/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/include/stdint.h")
	.dwattr $C$DW$T$169, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$169, DW_AT_decl_column(0x1d)
$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)
$C$DW$T$167	.dwtag  DW_TAG_typedef, DW_AT_name("uint16_t")
	.dwattr $C$DW$T$167, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$167, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$167, DW_AT_decl_file("/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/include/stdint.h")
	.dwattr $C$DW$T$167, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$T$167, DW_AT_decl_column(0x1c)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)
$C$DW$T$82	.dwtag  DW_TAG_typedef, DW_AT_name("uint32_t")
	.dwattr $C$DW$T$82, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$82, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$82, DW_AT_decl_file("/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/include/stdint.h")
	.dwattr $C$DW$T$82, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$T$82, DW_AT_decl_column(0x1c)

$C$DW$T$83	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$83, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$83, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$83, DW_AT_byte_size(0x08)
$C$DW$1247	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1247, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$83


$C$DW$T$84	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$84, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$84, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$84, DW_AT_byte_size(0x44)
$C$DW$1248	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1248, DW_AT_upper_bound(0x10)
	.dwendtag $C$DW$T$84


$C$DW$T$85	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$85, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$85, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$85, DW_AT_byte_size(0x17c)
$C$DW$1249	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1249, DW_AT_upper_bound(0x5e)
	.dwendtag $C$DW$T$85


$C$DW$T$86	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$86, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$86, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$86, DW_AT_byte_size(0x78)
$C$DW$1250	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1250, DW_AT_upper_bound(0x1d)
	.dwendtag $C$DW$T$86


$C$DW$T$87	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$87, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$87, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$87, DW_AT_byte_size(0x3c0)
$C$DW$1251	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1251, DW_AT_upper_bound(0xef)
	.dwendtag $C$DW$T$87


$C$DW$T$88	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$88, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$88, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$88, DW_AT_byte_size(0xf4)
$C$DW$1252	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1252, DW_AT_upper_bound(0x3c)
	.dwendtag $C$DW$T$88


$C$DW$T$89	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$89, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$89, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$89, DW_AT_byte_size(0x3d8)
$C$DW$1253	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1253, DW_AT_upper_bound(0xf5)
	.dwendtag $C$DW$T$89


$C$DW$T$90	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$90, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$90, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$90, DW_AT_byte_size(0x378)
$C$DW$1254	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1254, DW_AT_upper_bound(0xdd)
	.dwendtag $C$DW$T$90


$C$DW$T$105	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$105, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$105, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$105, DW_AT_byte_size(0x04)
$C$DW$1255	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1255, DW_AT_upper_bound(0x00)
	.dwendtag $C$DW$T$105


$C$DW$T$165	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$165, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$165, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$165, DW_AT_byte_size(0x20)
$C$DW$1256	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1256, DW_AT_upper_bound(0x07)
	.dwendtag $C$DW$T$165


$C$DW$T$181	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$181, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$181, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$181, DW_AT_byte_size(0x0c)
$C$DW$1257	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$1257, DW_AT_upper_bound(0x02)
	.dwendtag $C$DW$T$181

$C$DW$T$183	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$183, DW_AT_type(*$C$DW$T$82)
$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x04)
$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x04)
$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)
$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)
$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)
$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)
$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)

$C$DW$T$471	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$471, DW_AT_name("ch_map")
	.dwattr $C$DW$T$471, DW_AT_byte_size(0x02)
$C$DW$1258	.dwtag  DW_TAG_member
	.dwattr $C$DW$1258, DW_AT_type(*$C$DW$T$470)
	.dwattr $C$DW$1258, DW_AT_name("evt")
	.dwattr $C$DW$1258, DW_AT_TI_symbol_name("evt")
	.dwattr $C$DW$1258, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1258, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1258, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_types.h")
	.dwattr $C$DW$1258, DW_AT_decl_line(0x35)
	.dwattr $C$DW$1258, DW_AT_decl_column(0x0a)
$C$DW$1259	.dwtag  DW_TAG_member
	.dwattr $C$DW$1259, DW_AT_type(*$C$DW$T$470)
	.dwattr $C$DW$1259, DW_AT_name("ch")
	.dwattr $C$DW$1259, DW_AT_TI_symbol_name("ch")
	.dwattr $C$DW$1259, DW_AT_data_member_location[DW_OP_plus_uconst 0x1]
	.dwattr $C$DW$1259, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1259, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_types.h")
	.dwattr $C$DW$1259, DW_AT_decl_line(0x36)
	.dwattr $C$DW$1259, DW_AT_decl_column(0x0a)
	.dwendtag $C$DW$T$471

	.dwattr $C$DW$T$471, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_types.h")
	.dwattr $C$DW$T$471, DW_AT_decl_line(0x34)
	.dwattr $C$DW$T$471, DW_AT_decl_column(0x08)
$C$DW$T$475	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$475, DW_AT_type(*$C$DW$T$471)
	.dwattr $C$DW$T$475, DW_AT_address_class(0x20)

$C$DW$T$522	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$522, DW_AT_type(*$C$DW$T$471)
	.dwattr $C$DW$T$522, DW_AT_language(DW_LANG_C)
$C$DW$1260	.dwtag  DW_TAG_subrange_type
	.dwendtag $C$DW$T$522


$C$DW$T$472	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$472, DW_AT_name("fw_custom")
	.dwattr $C$DW$T$472, DW_AT_byte_size(0x14)
$C$DW$1261	.dwtag  DW_TAG_member
	.dwattr $C$DW$1261, DW_AT_type(*$C$DW$T$476)
	.dwattr $C$DW$1261, DW_AT_name("pru_ints")
	.dwattr $C$DW$1261, DW_AT_TI_symbol_name("pru_ints")
	.dwattr $C$DW$1261, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1261, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1261, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$1261, DW_AT_decl_line(0x35)
	.dwattr $C$DW$1261, DW_AT_decl_column(0x1c)
$C$DW$1262	.dwtag  DW_TAG_member
	.dwattr $C$DW$1262, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$1262, DW_AT_name("reserved")
	.dwattr $C$DW$1262, DW_AT_TI_symbol_name("reserved")
	.dwattr $C$DW$1262, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1262, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1262, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$1262, DW_AT_decl_line(0x37)
	.dwattr $C$DW$1262, DW_AT_decl_column(0x0b)
	.dwendtag $C$DW$T$472

	.dwattr $C$DW$T$472, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$T$472, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$472, DW_AT_decl_column(0x07)

$C$DW$T$473	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$473, DW_AT_name("fw_rsc_custom")
	.dwattr $C$DW$T$473, DW_AT_byte_size(0x20)
$C$DW$1263	.dwtag  DW_TAG_member
	.dwattr $C$DW$1263, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$1263, DW_AT_name("type")
	.dwattr $C$DW$1263, DW_AT_TI_symbol_name("type")
	.dwattr $C$DW$1263, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1263, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1263, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$1263, DW_AT_decl_line(0x155)
	.dwattr $C$DW$1263, DW_AT_decl_column(0x0b)
$C$DW$1264	.dwtag  DW_TAG_member
	.dwattr $C$DW$1264, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$1264, DW_AT_name("sub_type")
	.dwattr $C$DW$1264, DW_AT_TI_symbol_name("sub_type")
	.dwattr $C$DW$1264, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$1264, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1264, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$1264, DW_AT_decl_line(0x156)
	.dwattr $C$DW$1264, DW_AT_decl_column(0x0b)
$C$DW$1265	.dwtag  DW_TAG_member
	.dwattr $C$DW$1265, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$1265, DW_AT_name("rsc_size")
	.dwattr $C$DW$1265, DW_AT_TI_symbol_name("rsc_size")
	.dwattr $C$DW$1265, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$1265, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1265, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$1265, DW_AT_decl_line(0x157)
	.dwattr $C$DW$1265, DW_AT_decl_column(0x0b)
$C$DW$1266	.dwtag  DW_TAG_member
	.dwattr $C$DW$1266, DW_AT_type(*$C$DW$T$472)
	.dwattr $C$DW$1266, DW_AT_name("rsc")
	.dwattr $C$DW$1266, DW_AT_TI_symbol_name("rsc")
	.dwattr $C$DW$1266, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$1266, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1266, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$1266, DW_AT_decl_line(0x158)
	.dwattr $C$DW$1266, DW_AT_decl_column(0x12)
	.dwendtag $C$DW$T$473

	.dwattr $C$DW$T$473, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$T$473, DW_AT_decl_line(0x154)
	.dwattr $C$DW$T$473, DW_AT_decl_column(0x08)

$C$DW$T$476	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$476, DW_AT_name("fw_rsc_custom_ints")
	.dwattr $C$DW$T$476, DW_AT_byte_size(0x14)
$C$DW$1267	.dwtag  DW_TAG_member
	.dwattr $C$DW$1267, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$1267, DW_AT_name("version")
	.dwattr $C$DW$1267, DW_AT_TI_symbol_name("version")
	.dwattr $C$DW$1267, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1267, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1267, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_types.h")
	.dwattr $C$DW$1267, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$1267, DW_AT_decl_column(0x0b)
$C$DW$1268	.dwtag  DW_TAG_member
	.dwattr $C$DW$1268, DW_AT_type(*$C$DW$T$474)
	.dwattr $C$DW$1268, DW_AT_name("channel_host")
	.dwattr $C$DW$1268, DW_AT_TI_symbol_name("channel_host")
	.dwattr $C$DW$1268, DW_AT_data_member_location[DW_OP_plus_uconst 0x2]
	.dwattr $C$DW$1268, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1268, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_types.h")
	.dwattr $C$DW$1268, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$1268, DW_AT_decl_column(0x0a)
$C$DW$1269	.dwtag  DW_TAG_member
	.dwattr $C$DW$1269, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$1269, DW_AT_name("num_evts")
	.dwattr $C$DW$1269, DW_AT_TI_symbol_name("num_evts")
	.dwattr $C$DW$1269, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$1269, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1269, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_types.h")
	.dwattr $C$DW$1269, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$1269, DW_AT_decl_column(0x0b)
$C$DW$1270	.dwtag  DW_TAG_member
	.dwattr $C$DW$1270, DW_AT_type(*$C$DW$T$475)
	.dwattr $C$DW$1270, DW_AT_name("event_channel")
	.dwattr $C$DW$1270, DW_AT_TI_symbol_name("event_channel")
	.dwattr $C$DW$1270, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$1270, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1270, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_types.h")
	.dwattr $C$DW$1270, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$1270, DW_AT_decl_column(0x11)
	.dwendtag $C$DW$T$476

	.dwattr $C$DW$T$476, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/pru_types.h")
	.dwattr $C$DW$T$476, DW_AT_decl_line(0x49)
	.dwattr $C$DW$T$476, DW_AT_decl_column(0x08)

$C$DW$T$477	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$477, DW_AT_name("my_resource_table")
	.dwattr $C$DW$T$477, DW_AT_byte_size(0x34)
$C$DW$1271	.dwtag  DW_TAG_member
	.dwattr $C$DW$1271, DW_AT_type(*$C$DW$T$478)
	.dwattr $C$DW$1271, DW_AT_name("base")
	.dwattr $C$DW$1271, DW_AT_TI_symbol_name("base")
	.dwattr $C$DW$1271, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1271, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1271, DW_AT_decl_file("../resource_table.h")
	.dwattr $C$DW$1271, DW_AT_decl_line(0x48)
	.dwattr $C$DW$1271, DW_AT_decl_column(0x18)
$C$DW$1272	.dwtag  DW_TAG_member
	.dwattr $C$DW$1272, DW_AT_type(*$C$DW$T$105)
	.dwattr $C$DW$1272, DW_AT_name("offset")
	.dwattr $C$DW$1272, DW_AT_TI_symbol_name("offset")
	.dwattr $C$DW$1272, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$1272, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1272, DW_AT_decl_file("../resource_table.h")
	.dwattr $C$DW$1272, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$1272, DW_AT_decl_column(0x0b)
$C$DW$1273	.dwtag  DW_TAG_member
	.dwattr $C$DW$1273, DW_AT_type(*$C$DW$T$473)
	.dwattr $C$DW$1273, DW_AT_name("pru_ints")
	.dwattr $C$DW$1273, DW_AT_TI_symbol_name("pru_ints")
	.dwattr $C$DW$1273, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$1273, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1273, DW_AT_decl_file("../resource_table.h")
	.dwattr $C$DW$1273, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$1273, DW_AT_decl_column(0x17)
	.dwendtag $C$DW$T$477

	.dwattr $C$DW$T$477, DW_AT_decl_file("../resource_table.h")
	.dwattr $C$DW$T$477, DW_AT_decl_line(0x47)
	.dwattr $C$DW$T$477, DW_AT_decl_column(0x08)

$C$DW$T$478	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$478, DW_AT_name("resource_table")
	.dwattr $C$DW$T$478, DW_AT_byte_size(0x10)
$C$DW$1274	.dwtag  DW_TAG_member
	.dwattr $C$DW$1274, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$1274, DW_AT_name("ver")
	.dwattr $C$DW$1274, DW_AT_TI_symbol_name("ver")
	.dwattr $C$DW$1274, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$1274, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1274, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$1274, DW_AT_decl_line(0x57)
	.dwattr $C$DW$1274, DW_AT_decl_column(0x0b)
$C$DW$1275	.dwtag  DW_TAG_member
	.dwattr $C$DW$1275, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$1275, DW_AT_name("num")
	.dwattr $C$DW$1275, DW_AT_TI_symbol_name("num")
	.dwattr $C$DW$1275, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$1275, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1275, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$1275, DW_AT_decl_line(0x58)
	.dwattr $C$DW$1275, DW_AT_decl_column(0x0b)
$C$DW$1276	.dwtag  DW_TAG_member
	.dwattr $C$DW$1276, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$1276, DW_AT_name("reserved")
	.dwattr $C$DW$1276, DW_AT_TI_symbol_name("reserved")
	.dwattr $C$DW$1276, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$1276, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$1276, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$1276, DW_AT_decl_line(0x59)
	.dwattr $C$DW$1276, DW_AT_decl_column(0x0b)
	.dwendtag $C$DW$T$478

	.dwattr $C$DW$T$478, DW_AT_decl_file("/opt/ti/ccsv6/ccs_base/pru/include/rsc_types.h")
	.dwattr $C$DW$T$478, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$478, DW_AT_decl_column(0x08)
	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF CIE ENTRIES                                           *
;***************************************************************

$C$DW$CIE	.dwcie 14
	.dwcfi	cfa_register, 8
	.dwcfi	cfa_offset, 0
	.dwcfi	undefined, 0
	.dwcfi	undefined, 1
	.dwcfi	undefined, 2
	.dwcfi	undefined, 3
	.dwcfi	undefined, 4
	.dwcfi	undefined, 5
	.dwcfi	undefined, 6
	.dwcfi	undefined, 7
	.dwcfi	same_value, 8
	.dwcfi	same_value, 9
	.dwcfi	same_value, 10
	.dwcfi	same_value, 11
	.dwcfi	undefined, 12
	.dwcfi	undefined, 13
	.dwcfi	undefined, 14
	.dwcfi	undefined, 15
	.dwcfi	same_value, 16
	.dwcfi	same_value, 17
	.dwcfi	same_value, 18
	.dwcfi	same_value, 19
	.dwcfi	same_value, 20
	.dwcfi	same_value, 21
	.dwcfi	same_value, 22
	.dwcfi	same_value, 23
	.dwcfi	same_value, 24
	.dwcfi	same_value, 25
	.dwcfi	same_value, 26
	.dwcfi	same_value, 27
	.dwcfi	same_value, 28
	.dwcfi	same_value, 29
	.dwcfi	same_value, 30
	.dwcfi	same_value, 31
	.dwcfi	same_value, 32
	.dwcfi	same_value, 33
	.dwcfi	same_value, 34
	.dwcfi	same_value, 35
	.dwcfi	same_value, 36
	.dwcfi	same_value, 37
	.dwcfi	same_value, 38
	.dwcfi	same_value, 39
	.dwcfi	same_value, 40
	.dwcfi	same_value, 41
	.dwcfi	same_value, 42
	.dwcfi	same_value, 43
	.dwcfi	same_value, 44
	.dwcfi	same_value, 45
	.dwcfi	same_value, 46
	.dwcfi	same_value, 47
	.dwcfi	same_value, 48
	.dwcfi	same_value, 49
	.dwcfi	same_value, 50
	.dwcfi	same_value, 51
	.dwcfi	same_value, 52
	.dwcfi	same_value, 53
	.dwcfi	same_value, 54
	.dwcfi	same_value, 55
	.dwcfi	undefined, 56
	.dwcfi	undefined, 57
	.dwcfi	undefined, 58
	.dwcfi	undefined, 59
	.dwcfi	undefined, 60
	.dwcfi	undefined, 61
	.dwcfi	undefined, 62
	.dwcfi	undefined, 63
	.dwcfi	undefined, 64
	.dwcfi	undefined, 65
	.dwcfi	undefined, 66
	.dwcfi	undefined, 67
	.dwcfi	undefined, 68
	.dwcfi	undefined, 69
	.dwcfi	undefined, 70
	.dwcfi	undefined, 71
	.dwcfi	undefined, 72
	.dwcfi	undefined, 73
	.dwcfi	undefined, 74
	.dwcfi	undefined, 75
	.dwcfi	undefined, 76
	.dwcfi	undefined, 77
	.dwcfi	undefined, 78
	.dwcfi	undefined, 79
	.dwcfi	undefined, 80
	.dwcfi	undefined, 81
	.dwcfi	undefined, 82
	.dwcfi	undefined, 83
	.dwcfi	undefined, 84
	.dwcfi	undefined, 85
	.dwcfi	undefined, 86
	.dwcfi	undefined, 87
	.dwcfi	undefined, 88
	.dwcfi	undefined, 89
	.dwcfi	undefined, 90
	.dwcfi	undefined, 91
	.dwcfi	undefined, 92
	.dwcfi	undefined, 93
	.dwcfi	undefined, 94
	.dwcfi	undefined, 95
	.dwcfi	undefined, 96
	.dwcfi	undefined, 97
	.dwcfi	undefined, 98
	.dwcfi	undefined, 99
	.dwcfi	undefined, 100
	.dwcfi	undefined, 101
	.dwcfi	undefined, 102
	.dwcfi	undefined, 103
	.dwcfi	undefined, 104
	.dwcfi	undefined, 105
	.dwcfi	undefined, 106
	.dwcfi	undefined, 107
	.dwcfi	undefined, 108
	.dwcfi	undefined, 109
	.dwcfi	undefined, 110
	.dwcfi	undefined, 111
	.dwcfi	undefined, 112
	.dwcfi	undefined, 113
	.dwcfi	undefined, 114
	.dwcfi	undefined, 115
	.dwcfi	undefined, 116
	.dwcfi	undefined, 117
	.dwcfi	undefined, 118
	.dwcfi	undefined, 119
	.dwcfi	undefined, 120
	.dwcfi	undefined, 121
	.dwcfi	undefined, 122
	.dwcfi	undefined, 123
	.dwcfi	undefined, 124
	.dwcfi	undefined, 125
	.dwcfi	undefined, 126
	.dwcfi	undefined, 127
	.dwcfi	undefined, 128
	.dwcfi	undefined, 129
	.dwcfi	undefined, 130
	.dwcfi	undefined, 131
	.dwcfi	undefined, 132
	.dwcfi	undefined, 133
	.dwcfi	undefined, 134
	.dwendentry

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$1277	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b0")
	.dwattr $C$DW$1277, DW_AT_location[DW_OP_reg0]
$C$DW$1278	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b1")
	.dwattr $C$DW$1278, DW_AT_location[DW_OP_reg1]
$C$DW$1279	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b2")
	.dwattr $C$DW$1279, DW_AT_location[DW_OP_reg2]
$C$DW$1280	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b3")
	.dwattr $C$DW$1280, DW_AT_location[DW_OP_reg3]
$C$DW$1281	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b0")
	.dwattr $C$DW$1281, DW_AT_location[DW_OP_reg4]
$C$DW$1282	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b1")
	.dwattr $C$DW$1282, DW_AT_location[DW_OP_reg5]
$C$DW$1283	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b2")
	.dwattr $C$DW$1283, DW_AT_location[DW_OP_reg6]
$C$DW$1284	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b3")
	.dwattr $C$DW$1284, DW_AT_location[DW_OP_reg7]
$C$DW$1285	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b0")
	.dwattr $C$DW$1285, DW_AT_location[DW_OP_reg8]
$C$DW$1286	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b1")
	.dwattr $C$DW$1286, DW_AT_location[DW_OP_reg9]
$C$DW$1287	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b2")
	.dwattr $C$DW$1287, DW_AT_location[DW_OP_reg10]
$C$DW$1288	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b3")
	.dwattr $C$DW$1288, DW_AT_location[DW_OP_reg11]
$C$DW$1289	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b0")
	.dwattr $C$DW$1289, DW_AT_location[DW_OP_reg12]
$C$DW$1290	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b1")
	.dwattr $C$DW$1290, DW_AT_location[DW_OP_reg13]
$C$DW$1291	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b2")
	.dwattr $C$DW$1291, DW_AT_location[DW_OP_reg14]
$C$DW$1292	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b3")
	.dwattr $C$DW$1292, DW_AT_location[DW_OP_reg15]
$C$DW$1293	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b0")
	.dwattr $C$DW$1293, DW_AT_location[DW_OP_reg16]
$C$DW$1294	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b1")
	.dwattr $C$DW$1294, DW_AT_location[DW_OP_reg17]
$C$DW$1295	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b2")
	.dwattr $C$DW$1295, DW_AT_location[DW_OP_reg18]
$C$DW$1296	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b3")
	.dwattr $C$DW$1296, DW_AT_location[DW_OP_reg19]
$C$DW$1297	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b0")
	.dwattr $C$DW$1297, DW_AT_location[DW_OP_reg20]
$C$DW$1298	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b1")
	.dwattr $C$DW$1298, DW_AT_location[DW_OP_reg21]
$C$DW$1299	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b2")
	.dwattr $C$DW$1299, DW_AT_location[DW_OP_reg22]
$C$DW$1300	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b3")
	.dwattr $C$DW$1300, DW_AT_location[DW_OP_reg23]
$C$DW$1301	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b0")
	.dwattr $C$DW$1301, DW_AT_location[DW_OP_reg24]
$C$DW$1302	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b1")
	.dwattr $C$DW$1302, DW_AT_location[DW_OP_reg25]
$C$DW$1303	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b2")
	.dwattr $C$DW$1303, DW_AT_location[DW_OP_reg26]
$C$DW$1304	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b3")
	.dwattr $C$DW$1304, DW_AT_location[DW_OP_reg27]
$C$DW$1305	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b0")
	.dwattr $C$DW$1305, DW_AT_location[DW_OP_reg28]
$C$DW$1306	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b1")
	.dwattr $C$DW$1306, DW_AT_location[DW_OP_reg29]
$C$DW$1307	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b2")
	.dwattr $C$DW$1307, DW_AT_location[DW_OP_reg30]
$C$DW$1308	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b3")
	.dwattr $C$DW$1308, DW_AT_location[DW_OP_reg31]
$C$DW$1309	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b0")
	.dwattr $C$DW$1309, DW_AT_location[DW_OP_regx 0x20]
$C$DW$1310	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b1")
	.dwattr $C$DW$1310, DW_AT_location[DW_OP_regx 0x21]
$C$DW$1311	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b2")
	.dwattr $C$DW$1311, DW_AT_location[DW_OP_regx 0x22]
$C$DW$1312	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b3")
	.dwattr $C$DW$1312, DW_AT_location[DW_OP_regx 0x23]
$C$DW$1313	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b0")
	.dwattr $C$DW$1313, DW_AT_location[DW_OP_regx 0x24]
$C$DW$1314	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b1")
	.dwattr $C$DW$1314, DW_AT_location[DW_OP_regx 0x25]
$C$DW$1315	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b2")
	.dwattr $C$DW$1315, DW_AT_location[DW_OP_regx 0x26]
$C$DW$1316	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b3")
	.dwattr $C$DW$1316, DW_AT_location[DW_OP_regx 0x27]
$C$DW$1317	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b0")
	.dwattr $C$DW$1317, DW_AT_location[DW_OP_regx 0x28]
$C$DW$1318	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b1")
	.dwattr $C$DW$1318, DW_AT_location[DW_OP_regx 0x29]
$C$DW$1319	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b2")
	.dwattr $C$DW$1319, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$1320	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b3")
	.dwattr $C$DW$1320, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$1321	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b0")
	.dwattr $C$DW$1321, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$1322	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b1")
	.dwattr $C$DW$1322, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$1323	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b2")
	.dwattr $C$DW$1323, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$1324	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b3")
	.dwattr $C$DW$1324, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$1325	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b0")
	.dwattr $C$DW$1325, DW_AT_location[DW_OP_regx 0x30]
$C$DW$1326	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b1")
	.dwattr $C$DW$1326, DW_AT_location[DW_OP_regx 0x31]
$C$DW$1327	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b2")
	.dwattr $C$DW$1327, DW_AT_location[DW_OP_regx 0x32]
$C$DW$1328	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b3")
	.dwattr $C$DW$1328, DW_AT_location[DW_OP_regx 0x33]
$C$DW$1329	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b0")
	.dwattr $C$DW$1329, DW_AT_location[DW_OP_regx 0x34]
$C$DW$1330	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b1")
	.dwattr $C$DW$1330, DW_AT_location[DW_OP_regx 0x35]
$C$DW$1331	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b2")
	.dwattr $C$DW$1331, DW_AT_location[DW_OP_regx 0x36]
$C$DW$1332	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b3")
	.dwattr $C$DW$1332, DW_AT_location[DW_OP_regx 0x37]
$C$DW$1333	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b0")
	.dwattr $C$DW$1333, DW_AT_location[DW_OP_regx 0x38]
$C$DW$1334	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b1")
	.dwattr $C$DW$1334, DW_AT_location[DW_OP_regx 0x39]
$C$DW$1335	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b2")
	.dwattr $C$DW$1335, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$1336	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b3")
	.dwattr $C$DW$1336, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$1337	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b0")
	.dwattr $C$DW$1337, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$1338	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b1")
	.dwattr $C$DW$1338, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$1339	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b2")
	.dwattr $C$DW$1339, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$1340	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b3")
	.dwattr $C$DW$1340, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$1341	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b0")
	.dwattr $C$DW$1341, DW_AT_location[DW_OP_regx 0x40]
$C$DW$1342	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b1")
	.dwattr $C$DW$1342, DW_AT_location[DW_OP_regx 0x41]
$C$DW$1343	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b2")
	.dwattr $C$DW$1343, DW_AT_location[DW_OP_regx 0x42]
$C$DW$1344	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b3")
	.dwattr $C$DW$1344, DW_AT_location[DW_OP_regx 0x43]
$C$DW$1345	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b0")
	.dwattr $C$DW$1345, DW_AT_location[DW_OP_regx 0x44]
$C$DW$1346	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b1")
	.dwattr $C$DW$1346, DW_AT_location[DW_OP_regx 0x45]
$C$DW$1347	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b2")
	.dwattr $C$DW$1347, DW_AT_location[DW_OP_regx 0x46]
$C$DW$1348	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b3")
	.dwattr $C$DW$1348, DW_AT_location[DW_OP_regx 0x47]
$C$DW$1349	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b0")
	.dwattr $C$DW$1349, DW_AT_location[DW_OP_regx 0x48]
$C$DW$1350	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b1")
	.dwattr $C$DW$1350, DW_AT_location[DW_OP_regx 0x49]
$C$DW$1351	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b2")
	.dwattr $C$DW$1351, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$1352	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b3")
	.dwattr $C$DW$1352, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$1353	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b0")
	.dwattr $C$DW$1353, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$1354	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b1")
	.dwattr $C$DW$1354, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$1355	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b2")
	.dwattr $C$DW$1355, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$1356	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b3")
	.dwattr $C$DW$1356, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$1357	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b0")
	.dwattr $C$DW$1357, DW_AT_location[DW_OP_regx 0x50]
$C$DW$1358	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b1")
	.dwattr $C$DW$1358, DW_AT_location[DW_OP_regx 0x51]
$C$DW$1359	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b2")
	.dwattr $C$DW$1359, DW_AT_location[DW_OP_regx 0x52]
$C$DW$1360	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b3")
	.dwattr $C$DW$1360, DW_AT_location[DW_OP_regx 0x53]
$C$DW$1361	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b0")
	.dwattr $C$DW$1361, DW_AT_location[DW_OP_regx 0x54]
$C$DW$1362	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b1")
	.dwattr $C$DW$1362, DW_AT_location[DW_OP_regx 0x55]
$C$DW$1363	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b2")
	.dwattr $C$DW$1363, DW_AT_location[DW_OP_regx 0x56]
$C$DW$1364	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b3")
	.dwattr $C$DW$1364, DW_AT_location[DW_OP_regx 0x57]
$C$DW$1365	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b0")
	.dwattr $C$DW$1365, DW_AT_location[DW_OP_regx 0x58]
$C$DW$1366	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b1")
	.dwattr $C$DW$1366, DW_AT_location[DW_OP_regx 0x59]
$C$DW$1367	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b2")
	.dwattr $C$DW$1367, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$1368	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b3")
	.dwattr $C$DW$1368, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$1369	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b0")
	.dwattr $C$DW$1369, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$1370	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b1")
	.dwattr $C$DW$1370, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$1371	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b2")
	.dwattr $C$DW$1371, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$1372	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b3")
	.dwattr $C$DW$1372, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$1373	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b0")
	.dwattr $C$DW$1373, DW_AT_location[DW_OP_regx 0x60]
$C$DW$1374	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b1")
	.dwattr $C$DW$1374, DW_AT_location[DW_OP_regx 0x61]
$C$DW$1375	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b2")
	.dwattr $C$DW$1375, DW_AT_location[DW_OP_regx 0x62]
$C$DW$1376	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b3")
	.dwattr $C$DW$1376, DW_AT_location[DW_OP_regx 0x63]
$C$DW$1377	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b0")
	.dwattr $C$DW$1377, DW_AT_location[DW_OP_regx 0x64]
$C$DW$1378	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b1")
	.dwattr $C$DW$1378, DW_AT_location[DW_OP_regx 0x65]
$C$DW$1379	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b2")
	.dwattr $C$DW$1379, DW_AT_location[DW_OP_regx 0x66]
$C$DW$1380	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b3")
	.dwattr $C$DW$1380, DW_AT_location[DW_OP_regx 0x67]
$C$DW$1381	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b0")
	.dwattr $C$DW$1381, DW_AT_location[DW_OP_regx 0x68]
$C$DW$1382	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b1")
	.dwattr $C$DW$1382, DW_AT_location[DW_OP_regx 0x69]
$C$DW$1383	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b2")
	.dwattr $C$DW$1383, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$1384	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b3")
	.dwattr $C$DW$1384, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$1385	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b0")
	.dwattr $C$DW$1385, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$1386	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b1")
	.dwattr $C$DW$1386, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$1387	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b2")
	.dwattr $C$DW$1387, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$1388	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b3")
	.dwattr $C$DW$1388, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$1389	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b0")
	.dwattr $C$DW$1389, DW_AT_location[DW_OP_regx 0x70]
$C$DW$1390	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b1")
	.dwattr $C$DW$1390, DW_AT_location[DW_OP_regx 0x71]
$C$DW$1391	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b2")
	.dwattr $C$DW$1391, DW_AT_location[DW_OP_regx 0x72]
$C$DW$1392	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b3")
	.dwattr $C$DW$1392, DW_AT_location[DW_OP_regx 0x73]
$C$DW$1393	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b0")
	.dwattr $C$DW$1393, DW_AT_location[DW_OP_regx 0x74]
$C$DW$1394	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b1")
	.dwattr $C$DW$1394, DW_AT_location[DW_OP_regx 0x75]
$C$DW$1395	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b2")
	.dwattr $C$DW$1395, DW_AT_location[DW_OP_regx 0x76]
$C$DW$1396	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b3")
	.dwattr $C$DW$1396, DW_AT_location[DW_OP_regx 0x77]
$C$DW$1397	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b0")
	.dwattr $C$DW$1397, DW_AT_location[DW_OP_regx 0x78]
$C$DW$1398	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b1")
	.dwattr $C$DW$1398, DW_AT_location[DW_OP_regx 0x79]
$C$DW$1399	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b2")
	.dwattr $C$DW$1399, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$1400	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b3")
	.dwattr $C$DW$1400, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$1401	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b0")
	.dwattr $C$DW$1401, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$1402	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b1")
	.dwattr $C$DW$1402, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$1403	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b2")
	.dwattr $C$DW$1403, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$1404	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b3")
	.dwattr $C$DW$1404, DW_AT_location[DW_OP_regx 0x7f]
	.dwendtag $C$DW$CU

