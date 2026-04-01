;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.1.2 *
;* Date/Time created: Thu Jan 28 12:38:40 2016                                *
;******************************************************************************
	.compiler_opts --abi=eabi --diag_wrap=off --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../spi.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI PRU C/C++ Codegen Unix v2.1.2 Copyright (c) 2012-2015 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/home/bwilcutt2/workspace_v6_1/PRU_SPIMCP/Debug")
;	/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/bin/acpiapru -@/tmp/08344hrIkgY 
	.sect	".text:SPI_WordLengthSet"
	.clink
	.global	||SPI_WordLengthSet||

$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_WordLengthSet")
	.dwattr $C$DW$1, DW_AT_low_pc(||SPI_WordLengthSet||)
	.dwattr $C$DW$1, DW_AT_high_pc(0x00)
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("SPI_WordLengthSet")
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$1, DW_AT_TI_begin_line(0x98)
	.dwattr $C$DW$1, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$1, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$1, DW_AT_decl_line(0x98)
	.dwattr $C$DW$1, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$1, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 153,column 1,is_stmt,address ||SPI_WordLengthSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_WordLengthSet||
$C$DW$2	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$2, DW_AT_location[DW_OP_regx 0x38]
$C$DW$3	.dwtag  DW_TAG_formal_parameter, DW_AT_name("wordLength")
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("wordLength")
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$3, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$4	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$4, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_WordLengthSet             FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_WordLengthSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$5	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$5, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$6	.dwtag  DW_TAG_variable, DW_AT_name("wordLength")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("wordLength")
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$6, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$7	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$7, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |153| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |153| wordLength
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |153| spiAddr
	.dwpsn	file "../spi.c",line 154,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |154| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |154| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |154| 
        ADD       r0, r0, r1            ; [ALU_PRU] |154| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |154| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |154| 
        LDI       r0, 0x012c            ; [ALU_PRU] |154| 
        ADD       r0, r1, r0            ; [ALU_PRU] |154| 
        LDI32     r1, 0xfffff07f        ; [ALU_PRU] |154| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |154| 
        AND       r1, r14, r1           ; [ALU_PRU] |154| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |154| 
	.dwpsn	file "../spi.c",line 155,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |155| chNum
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |155| wordLength
        LSL       r1, r0, 0x02          ; [ALU_PRU] |155| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |155| 
        ADD       r0, r0, r1            ; [ALU_PRU] |155| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |155| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |155| 
        LDI       r0, 0x012c            ; [ALU_PRU] |155| 
        ADD       r0, r1, r0            ; [ALU_PRU] |155| 
        LDI       r1, 0x0f80            ; [ALU_PRU] |155| 
        AND       r1, r14, r1           ; [ALU_PRU] |155| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |155| 
        OR        r1, r14, r1           ; [ALU_PRU] |155| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |155| 
	.dwpsn	file "../spi.c",line 156,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$8	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$8, DW_AT_low_pc(0x00)
	.dwattr $C$DW$8, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$1, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$1, DW_AT_TI_end_line(0x9c)
	.dwattr $C$DW$1, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$1

	.sect	".text:SPI_CSPolarityConfig"
	.clink
	.global	||SPI_CSPolarityConfig||

$C$DW$9	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSPolarityConfig")
	.dwattr $C$DW$9, DW_AT_low_pc(||SPI_CSPolarityConfig||)
	.dwattr $C$DW$9, DW_AT_high_pc(0x00)
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("SPI_CSPolarityConfig")
	.dwattr $C$DW$9, DW_AT_external
	.dwattr $C$DW$9, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$9, DW_AT_TI_begin_line(0xbe)
	.dwattr $C$DW$9, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$9, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$9, DW_AT_decl_line(0xbe)
	.dwattr $C$DW$9, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$9, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 191,column 1,is_stmt,address ||SPI_CSPolarityConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSPolarityConfig||
$C$DW$10	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$10, DW_AT_location[DW_OP_regx 0x38]
$C$DW$11	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnPol")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("spiEnPol")
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$11, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$12	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$12, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_CSPolarityConfig          FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_CSPolarityConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$13	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$13, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$14	.dwtag  DW_TAG_variable, DW_AT_name("spiEnPol")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("spiEnPol")
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$14, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$15	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$15, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |191| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |191| spiEnPol
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |191| spiAddr
	.dwpsn	file "../spi.c",line 192,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |192| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |192| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |192| 
        ADD       r0, r0, r1            ; [ALU_PRU] |192| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |192| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |192| 
        LDI       r0, 0x012c            ; [ALU_PRU] |192| 
        ADD       r0, r1, r0            ; [ALU_PRU] |192| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |192| 
        CLR       r1, r1, 0x00000006    ; [ALU_PRU] |192| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |192| 
	.dwpsn	file "../spi.c",line 193,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |193| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |193| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |193| 
        ADD       r0, r0, r1            ; [ALU_PRU] |193| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |193| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |193| 
        LDI       r0, 0x012c            ; [ALU_PRU] |193| 
        ADD       r0, r1, r0            ; [ALU_PRU] |193| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |193| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |193| spiEnPol
        AND       r1, r1, 0x40          ; [ALU_PRU] |193| 
        OR        r1, r14, r1           ; [ALU_PRU] |193| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |193| 
	.dwpsn	file "../spi.c",line 194,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$16	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$16, DW_AT_low_pc(0x00)
	.dwattr $C$DW$16, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$9, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$9, DW_AT_TI_end_line(0xc2)
	.dwattr $C$DW$9, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$9

	.sect	".text:SPI_CSTimeControlSet"
	.clink
	.global	||SPI_CSTimeControlSet||

$C$DW$17	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSTimeControlSet")
	.dwattr $C$DW$17, DW_AT_low_pc(||SPI_CSTimeControlSet||)
	.dwattr $C$DW$17, DW_AT_high_pc(0x00)
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("SPI_CSTimeControlSet")
	.dwattr $C$DW$17, DW_AT_external
	.dwattr $C$DW$17, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$17, DW_AT_TI_begin_line(0xcf)
	.dwattr $C$DW$17, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$17, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$17, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$17, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$17, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 208,column 1,is_stmt,address ||SPI_CSTimeControlSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSTimeControlSet||
$C$DW$18	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$18, DW_AT_location[DW_OP_regx 0x38]
$C$DW$19	.dwtag  DW_TAG_formal_parameter, DW_AT_name("csTimeControl")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("csTimeControl")
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$19, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$20	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$20, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$20, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_CSTimeControlSet          FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_CSTimeControlSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$21	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$21, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$22	.dwtag  DW_TAG_variable, DW_AT_name("csTimeControl")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("csTimeControl")
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$22, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$23	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$23, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |208| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |208| csTimeControl
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |208| spiAddr
	.dwpsn	file "../spi.c",line 209,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |209| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |209| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |209| 
        ADD       r0, r0, r1            ; [ALU_PRU] |209| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |209| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |209| 
        LDI       r0, 0x012c            ; [ALU_PRU] |209| 
        ADD       r0, r1, r0            ; [ALU_PRU] |209| 
        LDI32     r1, 0xf9ffffff        ; [ALU_PRU] |209| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |209| 
        AND       r1, r14, r1           ; [ALU_PRU] |209| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |209| 
	.dwpsn	file "../spi.c",line 210,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |210| chNum
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |210| csTimeControl
        LSL       r1, r0, 0x02          ; [ALU_PRU] |210| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |210| 
        ADD       r0, r0, r1            ; [ALU_PRU] |210| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |210| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |210| 
        LDI       r0, 0x012c            ; [ALU_PRU] |210| 
        ADD       r0, r1, r0            ; [ALU_PRU] |210| 
        LDI32     r1, 0x06000000        ; [ALU_PRU] |210| 
        AND       r1, r14, r1           ; [ALU_PRU] |210| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |210| 
        OR        r1, r14, r1           ; [ALU_PRU] |210| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |210| 
	.dwpsn	file "../spi.c",line 211,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$24	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$24, DW_AT_low_pc(0x00)
	.dwattr $C$DW$24, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$17, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$17, DW_AT_TI_end_line(0xd3)
	.dwattr $C$DW$17, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$17

	.sect	".text:SPI_CSAssert"
	.clink
	.global	||SPI_CSAssert||

$C$DW$25	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSAssert")
	.dwattr $C$DW$25, DW_AT_low_pc(||SPI_CSAssert||)
	.dwattr $C$DW$25, DW_AT_high_pc(0x00)
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("SPI_CSAssert")
	.dwattr $C$DW$25, DW_AT_external
	.dwattr $C$DW$25, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$25, DW_AT_TI_begin_line(0xde)
	.dwattr $C$DW$25, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$25, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$25, DW_AT_decl_line(0xde)
	.dwattr $C$DW$25, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$25, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 223,column 1,is_stmt,address ||SPI_CSAssert||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSAssert||
$C$DW$26	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$26, DW_AT_location[DW_OP_regx 0x38]
$C$DW$27	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$27, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_CSAssert                  FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_CSAssert||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$28	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$28, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$29	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$29, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |223| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |223| spiAddr
	.dwpsn	file "../spi.c",line 224,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |224| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |224| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |224| 
        ADD       r0, r0, r1            ; [ALU_PRU] |224| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |224| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |224| 
        LDI       r0, 0x012c            ; [ALU_PRU] |224| 
        ADD       r0, r1, r0            ; [ALU_PRU] |224| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |224| 
        SET       r1, r1, 0x00000014    ; [ALU_PRU] |224| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |224| 
	.dwpsn	file "../spi.c",line 225,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$30	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$30, DW_AT_low_pc(0x00)
	.dwattr $C$DW$30, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$25, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$25, DW_AT_TI_end_line(0xe1)
	.dwattr $C$DW$25, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$25

	.sect	".text:SPI_CSDeAssert"
	.clink
	.global	||SPI_CSDeAssert||

$C$DW$31	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSDeAssert")
	.dwattr $C$DW$31, DW_AT_low_pc(||SPI_CSDeAssert||)
	.dwattr $C$DW$31, DW_AT_high_pc(0x00)
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("SPI_CSDeAssert")
	.dwattr $C$DW$31, DW_AT_external
	.dwattr $C$DW$31, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$31, DW_AT_TI_begin_line(0xeb)
	.dwattr $C$DW$31, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$31, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$31, DW_AT_decl_line(0xeb)
	.dwattr $C$DW$31, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$31, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 236,column 1,is_stmt,address ||SPI_CSDeAssert||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSDeAssert||
$C$DW$32	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$32, DW_AT_location[DW_OP_regx 0x38]
$C$DW$33	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$33, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_CSDeAssert                FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_CSDeAssert||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$34	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$34, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$35	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$35, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |236| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |236| spiAddr
	.dwpsn	file "../spi.c",line 237,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |237| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |237| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |237| 
        ADD       r0, r0, r1            ; [ALU_PRU] |237| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |237| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |237| 
        LDI       r0, 0x012c            ; [ALU_PRU] |237| 
        ADD       r0, r1, r0            ; [ALU_PRU] |237| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |237| 
        CLR       r1, r1, 0x00000014    ; [ALU_PRU] |237| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |237| 
	.dwpsn	file "../spi.c",line 238,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$36	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$36, DW_AT_low_pc(0x00)
	.dwattr $C$DW$36, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$31, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$31, DW_AT_TI_end_line(0xee)
	.dwattr $C$DW$31, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$31

	.sect	".text:SPI_StartBitEnable"
	.clink
	.global	||SPI_StartBitEnable||

$C$DW$37	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_StartBitEnable")
	.dwattr $C$DW$37, DW_AT_low_pc(||SPI_StartBitEnable||)
	.dwattr $C$DW$37, DW_AT_high_pc(0x00)
	.dwattr $C$DW$37, DW_AT_TI_symbol_name("SPI_StartBitEnable")
	.dwattr $C$DW$37, DW_AT_external
	.dwattr $C$DW$37, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$37, DW_AT_TI_begin_line(0xf9)
	.dwattr $C$DW$37, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$37, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$37, DW_AT_decl_line(0xf9)
	.dwattr $C$DW$37, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$37, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 250,column 1,is_stmt,address ||SPI_StartBitEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_StartBitEnable||
$C$DW$38	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$38, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$38, DW_AT_location[DW_OP_regx 0x38]
$C$DW$39	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$39, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_StartBitEnable            FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_StartBitEnable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$40	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$40, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$40, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$41	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$41, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |250| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |250| spiAddr
	.dwpsn	file "../spi.c",line 251,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |251| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |251| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |251| 
        ADD       r0, r0, r1            ; [ALU_PRU] |251| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |251| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |251| 
        LDI       r0, 0x012c            ; [ALU_PRU] |251| 
        ADD       r0, r1, r0            ; [ALU_PRU] |251| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |251| 
        SET       r1, r1, 0x00000017    ; [ALU_PRU] |251| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |251| 
	.dwpsn	file "../spi.c",line 252,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$42	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$42, DW_AT_low_pc(0x00)
	.dwattr $C$DW$42, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$37, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$37, DW_AT_TI_end_line(0xfc)
	.dwattr $C$DW$37, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$37

	.sect	".text:SPI_StartBitPolarityConfig"
	.clink
	.global	||SPI_StartBitPolarityConfig||

$C$DW$43	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_StartBitPolarityConfig")
	.dwattr $C$DW$43, DW_AT_low_pc(||SPI_StartBitPolarityConfig||)
	.dwattr $C$DW$43, DW_AT_high_pc(0x00)
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("SPI_StartBitPolarityConfig")
	.dwattr $C$DW$43, DW_AT_external
	.dwattr $C$DW$43, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$43, DW_AT_TI_begin_line(0x109)
	.dwattr $C$DW$43, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$43, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$43, DW_AT_decl_line(0x109)
	.dwattr $C$DW$43, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$43, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 266,column 1,is_stmt,address ||SPI_StartBitPolarityConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_StartBitPolarityConfig||
$C$DW$44	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$44, DW_AT_location[DW_OP_regx 0x38]
$C$DW$45	.dwtag  DW_TAG_formal_parameter, DW_AT_name("startBitPol")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("startBitPol")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$45, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$46	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$46, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_StartBitPolarityConfig    FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_StartBitPolarityConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$47	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$47, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$48	.dwtag  DW_TAG_variable, DW_AT_name("startBitPol")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("startBitPol")
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$48, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$49	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$49, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |266| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |266| startBitPol
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |266| spiAddr
	.dwpsn	file "../spi.c",line 267,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |267| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |267| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |267| 
        ADD       r0, r0, r1            ; [ALU_PRU] |267| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |267| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |267| 
        LDI       r0, 0x012c            ; [ALU_PRU] |267| 
        ADD       r0, r1, r0            ; [ALU_PRU] |267| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |267| 
        CLR       r1, r1, 0x00000018    ; [ALU_PRU] |267| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |267| 
	.dwpsn	file "../spi.c",line 268,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |268| startBitPol
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |268| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |268| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |268| 
        ADD       r0, r0, r1            ; [ALU_PRU] |268| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |268| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |268| 
        LDI       r0, 0x012c            ; [ALU_PRU] |268| 
        ADD       r0, r1, r0            ; [ALU_PRU] |268| 
        LDI32     r1, 0x01000000        ; [ALU_PRU] |268| 
        AND       r1, r14, r1           ; [ALU_PRU] |268| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |268| 
        OR        r1, r14, r1           ; [ALU_PRU] |268| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |268| 
	.dwpsn	file "../spi.c",line 269,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$50	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$50, DW_AT_low_pc(0x00)
	.dwattr $C$DW$50, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$43, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$43, DW_AT_TI_end_line(0x10d)
	.dwattr $C$DW$43, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$43

	.sect	".text:SPI_StartBitDisable"
	.clink
	.global	||SPI_StartBitDisable||

$C$DW$51	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_StartBitDisable")
	.dwattr $C$DW$51, DW_AT_low_pc(||SPI_StartBitDisable||)
	.dwattr $C$DW$51, DW_AT_high_pc(0x00)
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("SPI_StartBitDisable")
	.dwattr $C$DW$51, DW_AT_external
	.dwattr $C$DW$51, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$51, DW_AT_TI_begin_line(0x118)
	.dwattr $C$DW$51, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$51, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$51, DW_AT_decl_line(0x118)
	.dwattr $C$DW$51, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$51, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 281,column 1,is_stmt,address ||SPI_StartBitDisable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_StartBitDisable||
$C$DW$52	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$52, DW_AT_location[DW_OP_regx 0x38]
$C$DW$53	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$53, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_StartBitDisable           FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_StartBitDisable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$54	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$54, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$55	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$55, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |281| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |281| spiAddr
	.dwpsn	file "../spi.c",line 282,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |282| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |282| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |282| 
        ADD       r0, r0, r1            ; [ALU_PRU] |282| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |282| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |282| 
        LDI       r0, 0x012c            ; [ALU_PRU] |282| 
        ADD       r0, r1, r0            ; [ALU_PRU] |282| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |282| 
        CLR       r1, r1, 0x00000017    ; [ALU_PRU] |282| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |282| 
	.dwpsn	file "../spi.c",line 283,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$56	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$56, DW_AT_low_pc(0x00)
	.dwattr $C$DW$56, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$51, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$51, DW_AT_TI_end_line(0x11b)
	.dwattr $C$DW$51, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$51

	.sect	".text:SPI_MasterModeEnable"
	.clink
	.global	||SPI_MasterModeEnable||

$C$DW$57	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_MasterModeEnable")
	.dwattr $C$DW$57, DW_AT_low_pc(||SPI_MasterModeEnable||)
	.dwattr $C$DW$57, DW_AT_high_pc(0x00)
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("SPI_MasterModeEnable")
	.dwattr $C$DW$57, DW_AT_external
	.dwattr $C$DW$57, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$57, DW_AT_TI_begin_line(0x125)
	.dwattr $C$DW$57, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$57, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$57, DW_AT_decl_line(0x125)
	.dwattr $C$DW$57, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$57, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../spi.c",line 294,column 1,is_stmt,address ||SPI_MasterModeEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_MasterModeEnable||
$C$DW$58	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$58, DW_AT_location[DW_OP_regx 0x38]

;***************************************************************
;* FNAME: SPI_MasterModeEnable          FR SIZE:   4           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            4 Auto,  0 SOE     *
;***************************************************************

||SPI_MasterModeEnable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 4
$C$DW$59	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$59, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |294| spiAddr
	.dwpsn	file "../spi.c",line 295,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |295| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |295| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |295| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |295| 
        CLR       r1, r1, 0x00000002    ; [ALU_PRU] |295| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |295| 
	.dwpsn	file "../spi.c",line 296,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$60	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$60, DW_AT_low_pc(0x00)
	.dwattr $C$DW$60, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$57, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$57, DW_AT_TI_end_line(0x128)
	.dwattr $C$DW$57, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$57

	.sect	".text:SPI_SlaveModeEnable"
	.clink
	.global	||SPI_SlaveModeEnable||

$C$DW$61	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SlaveModeEnable")
	.dwattr $C$DW$61, DW_AT_low_pc(||SPI_SlaveModeEnable||)
	.dwattr $C$DW$61, DW_AT_high_pc(0x00)
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("SPI_SlaveModeEnable")
	.dwattr $C$DW$61, DW_AT_external
	.dwattr $C$DW$61, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$61, DW_AT_TI_begin_line(0x132)
	.dwattr $C$DW$61, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$61, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$61, DW_AT_decl_line(0x132)
	.dwattr $C$DW$61, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$61, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../spi.c",line 307,column 1,is_stmt,address ||SPI_SlaveModeEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SlaveModeEnable||
$C$DW$62	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$62, DW_AT_location[DW_OP_regx 0x38]

;***************************************************************
;* FNAME: SPI_SlaveModeEnable           FR SIZE:   4           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            4 Auto,  0 SOE     *
;***************************************************************

||SPI_SlaveModeEnable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 4
$C$DW$63	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$63, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |307| spiAddr
	.dwpsn	file "../spi.c",line 308,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |308| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |308| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |308| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |308| 
        SET       r1, r1, 0x00000002    ; [ALU_PRU] |308| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |308| 
	.dwpsn	file "../spi.c",line 309,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$64	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$64, DW_AT_low_pc(0x00)
	.dwattr $C$DW$64, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$61, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$61, DW_AT_TI_end_line(0x135)
	.dwattr $C$DW$61, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$61

	.sect	".text:SPI_ChannelSet"
	.clink
	.global	||SPI_ChannelSet||

$C$DW$65	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ChannelSet")
	.dwattr $C$DW$65, DW_AT_low_pc(||SPI_ChannelSet||)
	.dwattr $C$DW$65, DW_AT_high_pc(0x00)
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("SPI_ChannelSet")
	.dwattr $C$DW$65, DW_AT_external
	.dwattr $C$DW$65, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$65, DW_AT_TI_begin_line(0x1a4)
	.dwattr $C$DW$65, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$65, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$65, DW_AT_decl_line(0x1a4)
	.dwattr $C$DW$65, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$65, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 421,column 1,is_stmt,address ||SPI_ChannelSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ChannelSet||
$C$DW$66	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$66, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$66, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$66, DW_AT_location[DW_OP_regx 0x38]
$C$DW$67	.dwtag  DW_TAG_formal_parameter, DW_AT_name("mode")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$67, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$68	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$68, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_ChannelSet                FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_ChannelSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$69	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$69, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$69, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$70	.dwtag  DW_TAG_variable, DW_AT_name("mode")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$70, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$71	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$71, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |421| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |421| mode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |421| spiAddr
	.dwpsn	file "../spi.c",line 422,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |422| mode
        QBNE      ||$C$L1||, r0, 0x01   ; [ALU_PRU] |422| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 424,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |424| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |424| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |424| 
        ADD       r0, r0, r1            ; [ALU_PRU] |424| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |424| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |424| 
        LDI       r0, 0x0134            ; [ALU_PRU] |424| 
        ADD       r0, r1, r0            ; [ALU_PRU] |424| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |424| 
        SET       r1, r1, 0x00000000    ; [ALU_PRU] |424| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |424| 
	.dwpsn	file "../spi.c",line 425,column 2,is_stmt,isa 0
        JMP       ||$C$L2||             ; [ALU_PRU] |425| 
;* --------------------------------------------------------------------------*
||$C$L1||:    
	.dwpsn	file "../spi.c",line 425,column 9,is_stmt,isa 0
        QBNE      ||$C$L2||, r0, 0x00   ; [ALU_PRU] |425| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 426,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |426| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |426| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |426| 
        ADD       r0, r0, r1            ; [ALU_PRU] |426| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |426| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |426| 
        LDI       r0, 0x0134            ; [ALU_PRU] |426| 
        ADD       r0, r1, r0            ; [ALU_PRU] |426| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |426| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |426| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |426| 
	.dwpsn	file "../spi.c",line 428,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L2||:    
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$72	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$72, DW_AT_low_pc(0x00)
	.dwattr $C$DW$72, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$65, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$65, DW_AT_TI_end_line(0x1ac)
	.dwattr $C$DW$65, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$65

	.sect	".text:SPI_Reset"
	.clink
	.global	||SPI_Reset||

$C$DW$73	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_Reset")
	.dwattr $C$DW$73, DW_AT_low_pc(||SPI_Reset||)
	.dwattr $C$DW$73, DW_AT_high_pc(0x00)
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("SPI_Reset")
	.dwattr $C$DW$73, DW_AT_external
	.dwattr $C$DW$73, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$73, DW_AT_TI_begin_line(0x1b8)
	.dwattr $C$DW$73, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$73, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$73, DW_AT_decl_line(0x1b8)
	.dwattr $C$DW$73, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$73, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../spi.c",line 441,column 1,is_stmt,address ||SPI_Reset||,isa 0

	.dwfde $C$DW$CIE, ||SPI_Reset||
$C$DW$74	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$74, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$74, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$74, DW_AT_location[DW_OP_regx 0x38]

;***************************************************************
;* FNAME: SPI_Reset                     FR SIZE:   4           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            4 Auto,  0 SOE     *
;***************************************************************

||SPI_Reset||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 4
$C$DW$75	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$75, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$75, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$75, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |441| spiAddr
	.dwpsn	file "../spi.c",line 442,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |442| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |442| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |442| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |442| 
        SET       r1, r1, 0x00000001    ; [ALU_PRU] |442| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |442| 
	.dwpsn	file "../spi.c",line 443,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0114         ; [ALU_PRU] |443| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L3||
;*
;*   Loop source line                : 443
;*   Loop closing brace source line  : 443
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L3||:    
	.dwpsn	file "../spi.c",line 443,column 8,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |443| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |443| 
        QBBC      ||$C$L3||, r0, 0x00   ; [ALU_PRU] |443| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 444,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$76	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$76, DW_AT_low_pc(0x00)
	.dwattr $C$DW$76, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$73, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$73, DW_AT_TI_end_line(0x1bc)
	.dwattr $C$DW$73, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$73

	.sect	".text:SPI_TurboModeSet"
	.clink
	.global	||SPI_TurboModeSet||

$C$DW$77	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TurboModeSet")
	.dwattr $C$DW$77, DW_AT_low_pc(||SPI_TurboModeSet||)
	.dwattr $C$DW$77, DW_AT_high_pc(0x00)
	.dwattr $C$DW$77, DW_AT_TI_symbol_name("SPI_TurboModeSet")
	.dwattr $C$DW$77, DW_AT_external
	.dwattr $C$DW$77, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$77, DW_AT_TI_begin_line(0x1c9)
	.dwattr $C$DW$77, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$77, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$77, DW_AT_decl_line(0x1c9)
	.dwattr $C$DW$77, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$77, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 458,column 1,is_stmt,address ||SPI_TurboModeSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_TurboModeSet||
$C$DW$78	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$78, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$78, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$78, DW_AT_location[DW_OP_regx 0x38]
$C$DW$79	.dwtag  DW_TAG_formal_parameter, DW_AT_name("mode")
	.dwattr $C$DW$79, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$79, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$79, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$80	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$80, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$80, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$80, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_TurboModeSet              FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_TurboModeSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$81	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$81, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$81, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$81, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$82	.dwtag  DW_TAG_variable, DW_AT_name("mode")
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$82, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$82, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$83	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$83, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$83, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |458| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |458| mode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |458| spiAddr
	.dwpsn	file "../spi.c",line 459,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |459| mode
        QBNE      ||$C$L4||, r0, 0x01   ; [ALU_PRU] |459| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 461,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |461| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |461| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |461| 
        ADD       r0, r0, r1            ; [ALU_PRU] |461| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |461| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |461| 
        LDI       r0, 0x012c            ; [ALU_PRU] |461| 
        ADD       r0, r1, r0            ; [ALU_PRU] |461| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |461| 
        SET       r1, r1, 0x00000013    ; [ALU_PRU] |461| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |461| 
	.dwpsn	file "../spi.c",line 462,column 2,is_stmt,isa 0
        JMP       ||$C$L5||             ; [ALU_PRU] |462| 
;* --------------------------------------------------------------------------*
||$C$L4||:    
	.dwpsn	file "../spi.c",line 462,column 9,is_stmt,isa 0
        QBNE      ||$C$L5||, r0, 0x00   ; [ALU_PRU] |462| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 463,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |463| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |463| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |463| 
        ADD       r0, r0, r1            ; [ALU_PRU] |463| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |463| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |463| 
        LDI       r0, 0x012c            ; [ALU_PRU] |463| 
        ADD       r0, r1, r0            ; [ALU_PRU] |463| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |463| 
        CLR       r1, r1, 0x00000013    ; [ALU_PRU] |463| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |463| 
	.dwpsn	file "../spi.c",line 465,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L5||:    
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$84	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$84, DW_AT_low_pc(0x00)
	.dwattr $C$DW$84, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$77, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$77, DW_AT_TI_end_line(0x1d1)
	.dwattr $C$DW$77, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$77

	.sect	".text:SPI_DataPinDirectionConfig"
	.clink
	.global	||SPI_DataPinDirectionConfig||

$C$DW$85	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DataPinDirectionConfig")
	.dwattr $C$DW$85, DW_AT_low_pc(||SPI_DataPinDirectionConfig||)
	.dwattr $C$DW$85, DW_AT_high_pc(0x00)
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("SPI_DataPinDirectionConfig")
	.dwattr $C$DW$85, DW_AT_external
	.dwattr $C$DW$85, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$85, DW_AT_TI_begin_line(0x1dd)
	.dwattr $C$DW$85, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$85, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$85, DW_AT_decl_line(0x1dd)
	.dwattr $C$DW$85, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$85, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 478,column 1,is_stmt,address ||SPI_DataPinDirectionConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DataPinDirectionConfig||
$C$DW$86	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$86, DW_AT_location[DW_OP_regx 0x38]
$C$DW$87	.dwtag  DW_TAG_formal_parameter, DW_AT_name("datDirection")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("datDirection")
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$87, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_DataPinDirectionConfig    FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_DataPinDirectionConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$88	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$88, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$88, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$89	.dwtag  DW_TAG_variable, DW_AT_name("datDirection")
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("datDirection")
	.dwattr $C$DW$89, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$89, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |478| datDirection
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |478| spiAddr
	.dwpsn	file "../spi.c",line 479,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |479| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |479| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |479| 
        LDI32     r1, 0xfffffcff        ; [ALU_PRU] |479| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |479| 
        AND       r1, r14, r1           ; [ALU_PRU] |479| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |479| 
	.dwpsn	file "../spi.c",line 480,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |480| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |480| spiAddr
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |480| datDirection
        ADD       r0, r1, r0            ; [ALU_PRU] |480| 
        LDI       r1, 0x0300            ; [ALU_PRU] |480| 
        AND       r1, r14, r1           ; [ALU_PRU] |480| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |480| 
        OR        r1, r14, r1           ; [ALU_PRU] |480| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |480| 
	.dwpsn	file "../spi.c",line 481,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$90	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$90, DW_AT_low_pc(0x00)
	.dwattr $C$DW$90, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$85, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$85, DW_AT_TI_end_line(0x1e1)
	.dwattr $C$DW$85, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$85

	.sect	".text:SPI_TxFIFOConfig"
	.clink
	.global	||SPI_TxFIFOConfig||

$C$DW$91	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TxFIFOConfig")
	.dwattr $C$DW$91, DW_AT_low_pc(||SPI_TxFIFOConfig||)
	.dwattr $C$DW$91, DW_AT_high_pc(0x00)
	.dwattr $C$DW$91, DW_AT_TI_symbol_name("SPI_TxFIFOConfig")
	.dwattr $C$DW$91, DW_AT_external
	.dwattr $C$DW$91, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$91, DW_AT_TI_begin_line(0x1ee)
	.dwattr $C$DW$91, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$91, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$91, DW_AT_decl_line(0x1ee)
	.dwattr $C$DW$91, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$91, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 495,column 1,is_stmt,address ||SPI_TxFIFOConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_TxFIFOConfig||
$C$DW$92	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$92, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$92, DW_AT_location[DW_OP_regx 0x38]
$C$DW$93	.dwtag  DW_TAG_formal_parameter, DW_AT_name("txFifo")
	.dwattr $C$DW$93, DW_AT_TI_symbol_name("txFifo")
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$93, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$94	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$94, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$94, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$94, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_TxFIFOConfig              FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_TxFIFOConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$95	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$95, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$96	.dwtag  DW_TAG_variable, DW_AT_name("txFifo")
	.dwattr $C$DW$96, DW_AT_TI_symbol_name("txFifo")
	.dwattr $C$DW$96, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$96, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$97	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$97, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$97, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$97, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |495| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |495| txFifo
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |495| spiAddr
	.dwpsn	file "../spi.c",line 496,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |496| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |496| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |496| 
        ADD       r0, r0, r1            ; [ALU_PRU] |496| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |496| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |496| 
        LDI       r0, 0x012c            ; [ALU_PRU] |496| 
        ADD       r0, r1, r0            ; [ALU_PRU] |496| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |496| 
        CLR       r1, r1, 0x0000001b    ; [ALU_PRU] |496| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |496| 
	.dwpsn	file "../spi.c",line 497,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |497| txFifo
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |497| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |497| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |497| 
        ADD       r0, r0, r1            ; [ALU_PRU] |497| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |497| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |497| 
        LDI       r0, 0x012c            ; [ALU_PRU] |497| 
        ADD       r0, r1, r0            ; [ALU_PRU] |497| 
        LDI32     r1, 0x08000000        ; [ALU_PRU] |497| 
        AND       r1, r14, r1           ; [ALU_PRU] |497| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |497| 
        OR        r1, r14, r1           ; [ALU_PRU] |497| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |497| 
	.dwpsn	file "../spi.c",line 498,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$98	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$98, DW_AT_low_pc(0x00)
	.dwattr $C$DW$98, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$91, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$91, DW_AT_TI_end_line(0x1f2)
	.dwattr $C$DW$91, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$91

	.sect	".text:SPI_RxFIFOConfig"
	.clink
	.global	||SPI_RxFIFOConfig||

$C$DW$99	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_RxFIFOConfig")
	.dwattr $C$DW$99, DW_AT_low_pc(||SPI_RxFIFOConfig||)
	.dwattr $C$DW$99, DW_AT_high_pc(0x00)
	.dwattr $C$DW$99, DW_AT_TI_symbol_name("SPI_RxFIFOConfig")
	.dwattr $C$DW$99, DW_AT_external
	.dwattr $C$DW$99, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$99, DW_AT_TI_begin_line(0x1ff)
	.dwattr $C$DW$99, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$99, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$99, DW_AT_decl_line(0x1ff)
	.dwattr $C$DW$99, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$99, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 512,column 1,is_stmt,address ||SPI_RxFIFOConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_RxFIFOConfig||
$C$DW$100	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$100, DW_AT_location[DW_OP_regx 0x38]
$C$DW$101	.dwtag  DW_TAG_formal_parameter, DW_AT_name("rxFifo")
	.dwattr $C$DW$101, DW_AT_TI_symbol_name("rxFifo")
	.dwattr $C$DW$101, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$101, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$102	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$102, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$102, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$102, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_RxFIFOConfig              FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_RxFIFOConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$103	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$103, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$103, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$104	.dwtag  DW_TAG_variable, DW_AT_name("rxFifo")
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("rxFifo")
	.dwattr $C$DW$104, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$104, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$105	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$105, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |512| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |512| rxFifo
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |512| spiAddr
	.dwpsn	file "../spi.c",line 513,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |513| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |513| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |513| 
        ADD       r0, r0, r1            ; [ALU_PRU] |513| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |513| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |513| 
        LDI       r0, 0x012c            ; [ALU_PRU] |513| 
        ADD       r0, r1, r0            ; [ALU_PRU] |513| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |513| 
        CLR       r1, r1, 0x0000001c    ; [ALU_PRU] |513| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |513| 
	.dwpsn	file "../spi.c",line 514,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |514| rxFifo
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |514| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |514| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |514| 
        ADD       r0, r0, r1            ; [ALU_PRU] |514| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |514| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |514| 
        LDI       r0, 0x012c            ; [ALU_PRU] |514| 
        ADD       r0, r1, r0            ; [ALU_PRU] |514| 
        LDI32     r1, 0x10000000        ; [ALU_PRU] |514| 
        AND       r1, r14, r1           ; [ALU_PRU] |514| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |514| 
        OR        r1, r14, r1           ; [ALU_PRU] |514| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |514| 
	.dwpsn	file "../spi.c",line 515,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$106	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$106, DW_AT_low_pc(0x00)
	.dwattr $C$DW$106, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$99, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$99, DW_AT_TI_end_line(0x203)
	.dwattr $C$DW$99, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$99

	.sect	".text:SPI_WordCountSet"
	.clink
	.global	||SPI_WordCountSet||

$C$DW$107	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_WordCountSet")
	.dwattr $C$DW$107, DW_AT_low_pc(||SPI_WordCountSet||)
	.dwattr $C$DW$107, DW_AT_high_pc(0x00)
	.dwattr $C$DW$107, DW_AT_TI_symbol_name("SPI_WordCountSet")
	.dwattr $C$DW$107, DW_AT_external
	.dwattr $C$DW$107, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$107, DW_AT_TI_begin_line(0x242)
	.dwattr $C$DW$107, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$107, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$107, DW_AT_decl_line(0x242)
	.dwattr $C$DW$107, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$107, DW_AT_TI_max_frame_size(0x06)
	.dwpsn	file "../spi.c",line 579,column 1,is_stmt,address ||SPI_WordCountSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_WordCountSet||
$C$DW$108	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$108, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$108, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$108, DW_AT_location[DW_OP_regx 0x38]
$C$DW$109	.dwtag  DW_TAG_formal_parameter, DW_AT_name("wCnt")
	.dwattr $C$DW$109, DW_AT_TI_symbol_name("wCnt")
	.dwattr $C$DW$109, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$109, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_WordCountSet              FR SIZE:   6           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            6 Auto,  0 SOE     *
;***************************************************************

||SPI_WordCountSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x06          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 6
$C$DW$110	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$110, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$110, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$110, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$111	.dwtag  DW_TAG_variable, DW_AT_name("wCnt")
	.dwattr $C$DW$111, DW_AT_TI_symbol_name("wCnt")
	.dwattr $C$DW$111, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$111, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15.w0, r2, 4, 2     ; [ALU_PRU] |579| wCnt
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |579| spiAddr
	.dwpsn	file "../spi.c",line 580,column 2,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |580| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |580| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |580| 
        LDI       r1, 0xffff            ; [ALU_PRU] |580| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |580| 
        AND       r1, r14, r1           ; [ALU_PRU] |580| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |580| 
	.dwpsn	file "../spi.c",line 581,column 2,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |581| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |581| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |581| 
        LBBO      &r1.w0, r2, 4, 2      ; [ALU_PRU] |581| wCnt
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |581| 
        LSL       r1, r1.w0, 0x10       ; [ALU_PRU] |581| 
        OR        r1, r14, r1           ; [ALU_PRU] |581| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |581| 
	.dwpsn	file "../spi.c",line 582,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x06          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$112	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$112, DW_AT_low_pc(0x00)
	.dwattr $C$DW$112, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$107, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$107, DW_AT_TI_end_line(0x246)
	.dwattr $C$DW$107, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$107

	.sect	".text:SPI_DMASet"
	.clink
	.global	||SPI_DMASet||

$C$DW$113	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DMASet")
	.dwattr $C$DW$113, DW_AT_low_pc(||SPI_DMASet||)
	.dwattr $C$DW$113, DW_AT_high_pc(0x00)
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("SPI_DMASet")
	.dwattr $C$DW$113, DW_AT_external
	.dwattr $C$DW$113, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$113, DW_AT_TI_begin_line(0x255)
	.dwattr $C$DW$113, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$113, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$113, DW_AT_decl_line(0x255)
	.dwattr $C$DW$113, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$113, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spi.c",line 598,column 1,is_stmt,address ||SPI_DMASet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DMASet||
$C$DW$114	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$114, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$114, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$114, DW_AT_location[DW_OP_regx 0x38]
$C$DW$115	.dwtag  DW_TAG_formal_parameter, DW_AT_name("mode")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$115, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$116	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dmaFlags")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("dmaFlags")
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$116, DW_AT_location[DW_OP_regx 0x40]
$C$DW$117	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$117, DW_AT_location[DW_OP_regx 0x44]

;***************************************************************
;* FNAME: SPI_DMASet                    FR SIZE:  16           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           16 Auto,  0 SOE     *
;***************************************************************

||SPI_DMASet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 16
$C$DW$118	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$118, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$118, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$118, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$119	.dwtag  DW_TAG_variable, DW_AT_name("mode")
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$119, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$119, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$120	.dwtag  DW_TAG_variable, DW_AT_name("dmaFlags")
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("dmaFlags")
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$120, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$121	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$121, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r17, r2, 12, 4       ; [ALU_PRU] |598| chNum
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |598| dmaFlags
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |598| mode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |598| spiAddr
	.dwpsn	file "../spi.c",line 599,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |599| mode
        QBNE      ||$C$L6||, r0, 0x01   ; [ALU_PRU] |599| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 601,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |601| chNum
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |601| dmaFlags
        LSL       r1, r0, 0x02          ; [ALU_PRU] |601| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |601| 
        ADD       r0, r0, r1            ; [ALU_PRU] |601| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |601| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |601| 
        LDI       r0, 0x012c            ; [ALU_PRU] |601| 
        ADD       r0, r1, r0            ; [ALU_PRU] |601| 
        LDI       r1, 0xc000            ; [ALU_PRU] |601| 
        AND       r1, r14, r1           ; [ALU_PRU] |601| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |601| 
        OR        r1, r14, r1           ; [ALU_PRU] |601| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |601| 
	.dwpsn	file "../spi.c",line 602,column 2,is_stmt,isa 0
        JMP       ||$C$L7||             ; [ALU_PRU] |602| 
;* --------------------------------------------------------------------------*
||$C$L6||:    
	.dwpsn	file "../spi.c",line 602,column 9,is_stmt,isa 0
        QBNE      ||$C$L7||, r0, 0x00   ; [ALU_PRU] |602| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 603,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |603| chNum
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |603| dmaFlags
        LSL       r1, r0, 0x02          ; [ALU_PRU] |603| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |603| 
        ADD       r0, r0, r1            ; [ALU_PRU] |603| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |603| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |603| 
        LDI       r0, 0x012c            ; [ALU_PRU] |603| 
        ADD       r0, r1, r0            ; [ALU_PRU] |603| 
        LDI       r1, 0xc000            ; [ALU_PRU] |603| 
        AND       r1, r14, r1           ; [ALU_PRU] |603| 
        NOT       r1, r1                ; [ALU_PRU] |603| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |603| 
        AND       r1, r14, r1           ; [ALU_PRU] |603| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |603| 
	.dwpsn	file "../spi.c",line 605,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L7||:    
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$122	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$122, DW_AT_low_pc(0x00)
	.dwattr $C$DW$122, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$113, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$113, DW_AT_TI_end_line(0x25d)
	.dwattr $C$DW$113, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$113

	.sect	".text:SPI_IntSet"
	.clink
	.global	||SPI_IntSet||

$C$DW$123	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_IntSet")
	.dwattr $C$DW$123, DW_AT_low_pc(||SPI_IntSet||)
	.dwattr $C$DW$123, DW_AT_high_pc(0x00)
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("SPI_IntSet")
	.dwattr $C$DW$123, DW_AT_external
	.dwattr $C$DW$123, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$123, DW_AT_TI_begin_line(0x26d)
	.dwattr $C$DW$123, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$123, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$123, DW_AT_decl_line(0x26d)
	.dwattr $C$DW$123, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$123, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 622,column 1,is_stmt,address ||SPI_IntSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_IntSet||
$C$DW$124	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$124, DW_AT_location[DW_OP_regx 0x38]
$C$DW$125	.dwtag  DW_TAG_formal_parameter, DW_AT_name("mode")
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$125, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$126	.dwtag  DW_TAG_formal_parameter, DW_AT_name("intFlags")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$126, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_IntSet                    FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_IntSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$127	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$127, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$127, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$127, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$128	.dwtag  DW_TAG_variable, DW_AT_name("mode")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$128, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$129	.dwtag  DW_TAG_variable, DW_AT_name("intFlags")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$129, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |622| intFlags
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |622| mode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |622| spiAddr
	.dwpsn	file "../spi.c",line 623,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |623| mode
        QBNE      ||$C$L8||, r0, 0x01   ; [ALU_PRU] |623| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 625,column 3,is_stmt,isa 0
        LDI       r0, 0x011c            ; [ALU_PRU] |625| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |625| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |625| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |625| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |625| intFlags
        OR        r1, r14, r1           ; [ALU_PRU] |625| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |625| 
	.dwpsn	file "../spi.c",line 626,column 2,is_stmt,isa 0
        JMP       ||$C$L9||             ; [ALU_PRU] |626| 
;* --------------------------------------------------------------------------*
||$C$L8||:    
	.dwpsn	file "../spi.c",line 626,column 9,is_stmt,isa 0
        QBNE      ||$C$L9||, r0, 0x00   ; [ALU_PRU] |626| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 627,column 3,is_stmt,isa 0
        LDI       r0, 0x011c            ; [ALU_PRU] |627| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |627| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |627| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |627| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |627| intFlags
        NOT       r1, r1                ; [ALU_PRU] |627| 
        AND       r1, r14, r1           ; [ALU_PRU] |627| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |627| 
	.dwpsn	file "../spi.c",line 629,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L9||:    
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$130	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$130, DW_AT_low_pc(0x00)
	.dwattr $C$DW$130, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$123, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$123, DW_AT_TI_end_line(0x275)
	.dwattr $C$DW$123, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$123

	.sect	".text:SPI_InitDelayConfig"
	.clink
	.global	||SPI_InitDelayConfig||

$C$DW$131	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_InitDelayConfig")
	.dwattr $C$DW$131, DW_AT_low_pc(||SPI_InitDelayConfig||)
	.dwattr $C$DW$131, DW_AT_high_pc(0x00)
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("SPI_InitDelayConfig")
	.dwattr $C$DW$131, DW_AT_external
	.dwattr $C$DW$131, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$131, DW_AT_TI_begin_line(0x283)
	.dwattr $C$DW$131, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$131, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$131, DW_AT_decl_line(0x283)
	.dwattr $C$DW$131, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$131, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 644,column 1,is_stmt,address ||SPI_InitDelayConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_InitDelayConfig||
$C$DW$132	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$132, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$132, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$132, DW_AT_location[DW_OP_regx 0x38]
$C$DW$133	.dwtag  DW_TAG_formal_parameter, DW_AT_name("initDelay")
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("initDelay")
	.dwattr $C$DW$133, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$133, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_InitDelayConfig           FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_InitDelayConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$134	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$134, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$135	.dwtag  DW_TAG_variable, DW_AT_name("initDelay")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("initDelay")
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$135, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |644| initDelay
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |644| spiAddr
	.dwpsn	file "../spi.c",line 645,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |645| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |645| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |645| 
        LDI32     r1, 0xffffff8f        ; [ALU_PRU] |645| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |645| 
        AND       r1, r14, r1           ; [ALU_PRU] |645| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |645| 
	.dwpsn	file "../spi.c",line 646,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |646| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |646| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |646| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |646| initDelay
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |646| 
        AND       r1, r1, 0x70          ; [ALU_PRU] |646| 
        OR        r1, r14, r1           ; [ALU_PRU] |646| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |646| 
	.dwpsn	file "../spi.c",line 647,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$136	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$136, DW_AT_low_pc(0x00)
	.dwattr $C$DW$136, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$131, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$131, DW_AT_TI_end_line(0x287)
	.dwattr $C$DW$131, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$131

	.sect	".text:SPI_SysTestModeConfig"
	.clink
	.global	||SPI_SysTestModeConfig||

$C$DW$137	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SysTestModeConfig")
	.dwattr $C$DW$137, DW_AT_low_pc(||SPI_SysTestModeConfig||)
	.dwattr $C$DW$137, DW_AT_high_pc(0x00)
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("SPI_SysTestModeConfig")
	.dwattr $C$DW$137, DW_AT_external
	.dwattr $C$DW$137, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$137, DW_AT_TI_begin_line(0x293)
	.dwattr $C$DW$137, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$137, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$137, DW_AT_decl_line(0x293)
	.dwattr $C$DW$137, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$137, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 660,column 1,is_stmt,address ||SPI_SysTestModeConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SysTestModeConfig||
$C$DW$138	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$138, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$138, DW_AT_location[DW_OP_regx 0x38]
$C$DW$139	.dwtag  DW_TAG_formal_parameter, DW_AT_name("sysTest")
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("sysTest")
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$139, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_SysTestModeConfig         FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_SysTestModeConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$140	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$140, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$141	.dwtag  DW_TAG_variable, DW_AT_name("sysTest")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("sysTest")
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$141, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |660| sysTest
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |660| spiAddr
	.dwpsn	file "../spi.c",line 661,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |661| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |661| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |661| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |661| 
        CLR       r1, r1, 0x00000003    ; [ALU_PRU] |661| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |661| 
	.dwpsn	file "../spi.c",line 662,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |662| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |662| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |662| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |662| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |662| sysTest
        AND       r1, r1, 0x08          ; [ALU_PRU] |662| 
        OR        r1, r14, r1           ; [ALU_PRU] |662| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |662| 
	.dwpsn	file "../spi.c",line 663,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$142	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$142, DW_AT_low_pc(0x00)
	.dwattr $C$DW$142, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$137, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$137, DW_AT_TI_end_line(0x297)
	.dwattr $C$DW$137, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$137

	.sect	".text:SPI_SlaveSelect"
	.clink
	.global	||SPI_SlaveSelect||

$C$DW$143	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SlaveSelect")
	.dwattr $C$DW$143, DW_AT_low_pc(||SPI_SlaveSelect||)
	.dwattr $C$DW$143, DW_AT_high_pc(0x00)
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("SPI_SlaveSelect")
	.dwattr $C$DW$143, DW_AT_external
	.dwattr $C$DW$143, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$143, DW_AT_TI_begin_line(0x2a3)
	.dwattr $C$DW$143, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$143, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$143, DW_AT_decl_line(0x2a3)
	.dwattr $C$DW$143, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$143, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 676,column 1,is_stmt,address ||SPI_SlaveSelect||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SlaveSelect||
$C$DW$144	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$144, DW_AT_location[DW_OP_regx 0x38]
$C$DW$145	.dwtag  DW_TAG_formal_parameter, DW_AT_name("slaveSelect")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("slaveSelect")
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$145, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_SlaveSelect               FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_SlaveSelect||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$146	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$146, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$147	.dwtag  DW_TAG_variable, DW_AT_name("slaveSelect")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("slaveSelect")
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$147, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |676| slaveSelect
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |676| spiAddr
	.dwpsn	file "../spi.c",line 677,column 2,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |677| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |677| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |677| 
        LDI32     r1, 0xff9fffff        ; [ALU_PRU] |677| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |677| 
        AND       r1, r14, r1           ; [ALU_PRU] |677| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |677| 
	.dwpsn	file "../spi.c",line 678,column 2,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |678| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |678| spiAddr
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |678| slaveSelect
        ADD       r0, r1, r0            ; [ALU_PRU] |678| 
        LDI32     r1, 0x00600000        ; [ALU_PRU] |678| 
        AND       r1, r14, r1           ; [ALU_PRU] |678| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |678| 
        OR        r1, r14, r1           ; [ALU_PRU] |678| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |678| 
	.dwpsn	file "../spi.c",line 679,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$148	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$148, DW_AT_low_pc(0x00)
	.dwattr $C$DW$148, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$143, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$143, DW_AT_TI_end_line(0x2a7)
	.dwattr $C$DW$143, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$143

	.sect	".text:SPI_TransmitData"
	.clink
	.global	||SPI_TransmitData||

$C$DW$149	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TransmitData")
	.dwattr $C$DW$149, DW_AT_low_pc(||SPI_TransmitData||)
	.dwattr $C$DW$149, DW_AT_high_pc(0x00)
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("SPI_TransmitData")
	.dwattr $C$DW$149, DW_AT_external
	.dwattr $C$DW$149, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$149, DW_AT_TI_begin_line(0x2b2)
	.dwattr $C$DW$149, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$149, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$149, DW_AT_decl_line(0x2b2)
	.dwattr $C$DW$149, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$149, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 691,column 1,is_stmt,address ||SPI_TransmitData||,isa 0

	.dwfde $C$DW$CIE, ||SPI_TransmitData||
$C$DW$150	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$150, DW_AT_location[DW_OP_regx 0x38]
$C$DW$151	.dwtag  DW_TAG_formal_parameter, DW_AT_name("txData")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("txData")
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$151, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$152	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$152, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_TransmitData              FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_TransmitData||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$153	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$153, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$154	.dwtag  DW_TAG_variable, DW_AT_name("txData")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("txData")
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$154, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$155	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$155, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |691| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |691| txData
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |691| spiAddr
	.dwpsn	file "../spi.c",line 692,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0138        ; [ALU_PRU] |692| 
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |692| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |692| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |692| 
        ADD       r0, r0, r1            ; [ALU_PRU] |692| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |692| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |692| 
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |692| txData
        SBBO      &r0, r1, r14.w0, 4    ; [ALU_PRU] |692| 
	.dwpsn	file "../spi.c",line 693,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$156	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$156, DW_AT_low_pc(0x00)
	.dwattr $C$DW$156, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$149, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$149, DW_AT_TI_end_line(0x2b5)
	.dwattr $C$DW$149, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$149

	.sect	".text:SPI_ReceiveData"
	.clink
	.global	||SPI_ReceiveData||

$C$DW$157	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ReceiveData")
	.dwattr $C$DW$157, DW_AT_low_pc(||SPI_ReceiveData||)
	.dwattr $C$DW$157, DW_AT_high_pc(0x00)
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("SPI_ReceiveData")
	.dwattr $C$DW$157, DW_AT_external
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$157, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$157, DW_AT_TI_begin_line(0x2c0)
	.dwattr $C$DW$157, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$157, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$157, DW_AT_decl_line(0x2c0)
	.dwattr $C$DW$157, DW_AT_decl_column(0x11)
	.dwattr $C$DW$157, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 705,column 1,is_stmt,address ||SPI_ReceiveData||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ReceiveData||
$C$DW$158	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$158, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$158, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$158, DW_AT_location[DW_OP_regx 0x38]
$C$DW$159	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$159, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$159, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$159, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_ReceiveData               FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_ReceiveData||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$160	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$160, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$160, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$160, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$161	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$161, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$161, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$161, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |705| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |705| spiAddr
	.dwpsn	file "../spi.c",line 706,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |706| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |706| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |706| 
        ADD       r0, r0, r1            ; [ALU_PRU] |706| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |706| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |706| 
        LDI       r1.w0, 0x013c         ; [ALU_PRU] |706| 
        LBBO      &r14, r0, r1.w0, 4    ; [ALU_PRU] |706| 
	.dwpsn	file "../spi.c",line 707,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$162	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$162, DW_AT_low_pc(0x00)
	.dwattr $C$DW$162, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$157, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$157, DW_AT_TI_end_line(0x2c3)
	.dwattr $C$DW$157, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$157

	.sect	".text:SPI_IntStatusGet"
	.clink
	.global	||SPI_IntStatusGet||

$C$DW$163	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_IntStatusGet")
	.dwattr $C$DW$163, DW_AT_low_pc(||SPI_IntStatusGet||)
	.dwattr $C$DW$163, DW_AT_high_pc(0x00)
	.dwattr $C$DW$163, DW_AT_TI_symbol_name("SPI_IntStatusGet")
	.dwattr $C$DW$163, DW_AT_external
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$163, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$163, DW_AT_TI_begin_line(0x2d0)
	.dwattr $C$DW$163, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$163, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$163, DW_AT_decl_line(0x2d0)
	.dwattr $C$DW$163, DW_AT_decl_column(0x11)
	.dwattr $C$DW$163, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../spi.c",line 721,column 1,is_stmt,address ||SPI_IntStatusGet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_IntStatusGet||
$C$DW$164	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$164, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$164, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$164, DW_AT_location[DW_OP_regx 0x38]

;***************************************************************
;* FNAME: SPI_IntStatusGet              FR SIZE:   4           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            4 Auto,  0 SOE     *
;***************************************************************

||SPI_IntStatusGet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 4
$C$DW$165	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$165, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$165, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$165, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |721| spiAddr
	.dwpsn	file "../spi.c",line 722,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0118         ; [ALU_PRU] |722| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |722| spiAddr
        LBBO      &r14, r0, r1.w0, 4    ; [ALU_PRU] |722| 
	.dwpsn	file "../spi.c",line 723,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$166	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$166, DW_AT_low_pc(0x00)
	.dwattr $C$DW$166, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$163, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$163, DW_AT_TI_end_line(0x2d3)
	.dwattr $C$DW$163, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$163

	.sect	".text:SPI_IntStatusClear"
	.clink
	.global	||SPI_IntStatusClear||

$C$DW$167	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_IntStatusClear")
	.dwattr $C$DW$167, DW_AT_low_pc(||SPI_IntStatusClear||)
	.dwattr $C$DW$167, DW_AT_high_pc(0x00)
	.dwattr $C$DW$167, DW_AT_TI_symbol_name("SPI_IntStatusClear")
	.dwattr $C$DW$167, DW_AT_external
	.dwattr $C$DW$167, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$167, DW_AT_TI_begin_line(0x2e0)
	.dwattr $C$DW$167, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$167, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$167, DW_AT_decl_line(0x2e0)
	.dwattr $C$DW$167, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$167, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 737,column 1,is_stmt,address ||SPI_IntStatusClear||,isa 0

	.dwfde $C$DW$CIE, ||SPI_IntStatusClear||
$C$DW$168	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$168, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$168, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$168, DW_AT_location[DW_OP_regx 0x38]
$C$DW$169	.dwtag  DW_TAG_formal_parameter, DW_AT_name("intFlags")
	.dwattr $C$DW$169, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$169, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$169, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_IntStatusClear            FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_IntStatusClear||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$170	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$170, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$170, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$170, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$171	.dwtag  DW_TAG_variable, DW_AT_name("intFlags")
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$171, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$171, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |737| intFlags
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |737| spiAddr
	.dwpsn	file "../spi.c",line 738,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |738| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |738| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |738| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |738| 
        CLR       r1, r1, 0x0000000b    ; [ALU_PRU] |738| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |738| 
	.dwpsn	file "../spi.c",line 739,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0118        ; [ALU_PRU] |739| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |739| spiAddr
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |739| intFlags
        SBBO      &r0, r1, r14.w0, 4    ; [ALU_PRU] |739| 
	.dwpsn	file "../spi.c",line 740,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$172	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$172, DW_AT_low_pc(0x00)
	.dwattr $C$DW$172, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$167, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$167, DW_AT_TI_end_line(0x2e4)
	.dwattr $C$DW$167, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$167

	.sect	".text:SPI_ChannelStatusGet"
	.clink
	.global	||SPI_ChannelStatusGet||

$C$DW$173	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ChannelStatusGet")
	.dwattr $C$DW$173, DW_AT_low_pc(||SPI_ChannelStatusGet||)
	.dwattr $C$DW$173, DW_AT_high_pc(0x00)
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("SPI_ChannelStatusGet")
	.dwattr $C$DW$173, DW_AT_external
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$173, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$173, DW_AT_TI_begin_line(0x3b4)
	.dwattr $C$DW$173, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$173, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$173, DW_AT_decl_line(0x3b4)
	.dwattr $C$DW$173, DW_AT_decl_column(0x11)
	.dwattr $C$DW$173, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 949,column 1,is_stmt,address ||SPI_ChannelStatusGet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ChannelStatusGet||
$C$DW$174	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$174, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$174, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$174, DW_AT_location[DW_OP_regx 0x38]
$C$DW$175	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$175, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$175, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_ChannelStatusGet          FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_ChannelStatusGet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$176	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$176, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$177	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$177, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |949| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |949| spiAddr
	.dwpsn	file "../spi.c",line 950,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |950| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |950| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |950| 
        ADD       r0, r0, r1            ; [ALU_PRU] |950| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |950| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |950| 
        LDI       r1.w0, 0x0130         ; [ALU_PRU] |950| 
        LBBO      &r14, r0, r1.w0, 4    ; [ALU_PRU] |950| 
	.dwpsn	file "../spi.c",line 951,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$178	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$178, DW_AT_low_pc(0x00)
	.dwattr $C$DW$178, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$173, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$173, DW_AT_TI_end_line(0x3b7)
	.dwattr $C$DW$173, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$173

	.sect	".text:SPI_MultiWordAccessConfig"
	.clink
	.global	||SPI_MultiWordAccessConfig||

$C$DW$179	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_MultiWordAccessConfig")
	.dwattr $C$DW$179, DW_AT_low_pc(||SPI_MultiWordAccessConfig||)
	.dwattr $C$DW$179, DW_AT_high_pc(0x00)
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("SPI_MultiWordAccessConfig")
	.dwattr $C$DW$179, DW_AT_external
	.dwattr $C$DW$179, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$179, DW_AT_TI_begin_line(0x3c3)
	.dwattr $C$DW$179, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$179, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$179, DW_AT_decl_line(0x3c3)
	.dwattr $C$DW$179, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$179, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 964,column 1,is_stmt,address ||SPI_MultiWordAccessConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_MultiWordAccessConfig||
$C$DW$180	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$180, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$180, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$180, DW_AT_location[DW_OP_regx 0x38]
$C$DW$181	.dwtag  DW_TAG_formal_parameter, DW_AT_name("moa")
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("moa")
	.dwattr $C$DW$181, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$181, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_MultiWordAccessConfig     FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_MultiWordAccessConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$182	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$182, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$183	.dwtag  DW_TAG_variable, DW_AT_name("moa")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("moa")
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$183, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |964| moa
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |964| spiAddr
	.dwpsn	file "../spi.c",line 965,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |965| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |965| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |965| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |965| 
        CLR       r1, r1, 0x00000007    ; [ALU_PRU] |965| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |965| 
	.dwpsn	file "../spi.c",line 966,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |966| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |966| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |966| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |966| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |966| moa
        AND       r1, r1, 0x80          ; [ALU_PRU] |966| 
        OR        r1, r14, r1           ; [ALU_PRU] |966| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |966| 
	.dwpsn	file "../spi.c",line 967,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$184	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$184, DW_AT_low_pc(0x00)
	.dwattr $C$DW$184, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$179, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$179, DW_AT_TI_end_line(0x3c7)
	.dwattr $C$DW$179, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$179

	.sect	".text:SPI_FIFODatSet"
	.clink
	.global	||SPI_FIFODatSet||

$C$DW$185	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_FIFODatSet")
	.dwattr $C$DW$185, DW_AT_low_pc(||SPI_FIFODatSet||)
	.dwattr $C$DW$185, DW_AT_high_pc(0x00)
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("SPI_FIFODatSet")
	.dwattr $C$DW$185, DW_AT_external
	.dwattr $C$DW$185, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$185, DW_AT_TI_begin_line(0x3d3)
	.dwattr $C$DW$185, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$185, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$185, DW_AT_decl_line(0x3d3)
	.dwattr $C$DW$185, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$185, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 980,column 1,is_stmt,address ||SPI_FIFODatSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_FIFODatSet||
$C$DW$186	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$186, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$186, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$186, DW_AT_location[DW_OP_regx 0x38]
$C$DW$187	.dwtag  DW_TAG_formal_parameter, DW_AT_name("fdaa")
	.dwattr $C$DW$187, DW_AT_TI_symbol_name("fdaa")
	.dwattr $C$DW$187, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$187, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_FIFODatSet                FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_FIFODatSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$188	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$188, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$188, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$188, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$189	.dwtag  DW_TAG_variable, DW_AT_name("fdaa")
	.dwattr $C$DW$189, DW_AT_TI_symbol_name("fdaa")
	.dwattr $C$DW$189, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$189, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |980| fdaa
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |980| spiAddr
	.dwpsn	file "../spi.c",line 981,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |981| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |981| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |981| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |981| 
        CLR       r1, r1, 0x00000008    ; [ALU_PRU] |981| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |981| 
	.dwpsn	file "../spi.c",line 982,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |982| 
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |982| fdaa
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |982| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |982| 
        LDI       r1, 0x0100            ; [ALU_PRU] |982| 
        AND       r1, r14, r1           ; [ALU_PRU] |982| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |982| 
        OR        r1, r14, r1           ; [ALU_PRU] |982| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |982| 
	.dwpsn	file "../spi.c",line 983,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$190	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$190, DW_AT_low_pc(0x00)
	.dwattr $C$DW$190, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$185, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$185, DW_AT_TI_end_line(0x3d7)
	.dwattr $C$DW$185, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$185

	.sect	".text:SPI_AutoIdleConfig"
	.clink
	.global	||SPI_AutoIdleConfig||

$C$DW$191	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_AutoIdleConfig")
	.dwattr $C$DW$191, DW_AT_low_pc(||SPI_AutoIdleConfig||)
	.dwattr $C$DW$191, DW_AT_high_pc(0x00)
	.dwattr $C$DW$191, DW_AT_TI_symbol_name("SPI_AutoIdleConfig")
	.dwattr $C$DW$191, DW_AT_external
	.dwattr $C$DW$191, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$191, DW_AT_TI_begin_line(0x3e3)
	.dwattr $C$DW$191, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$191, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$191, DW_AT_decl_line(0x3e3)
	.dwattr $C$DW$191, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$191, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 996,column 1,is_stmt,address ||SPI_AutoIdleConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_AutoIdleConfig||
$C$DW$192	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$192, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$192, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$192, DW_AT_location[DW_OP_regx 0x38]
$C$DW$193	.dwtag  DW_TAG_formal_parameter, DW_AT_name("autoIdle")
	.dwattr $C$DW$193, DW_AT_TI_symbol_name("autoIdle")
	.dwattr $C$DW$193, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$193, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_AutoIdleConfig            FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_AutoIdleConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$194	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$194, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$194, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$194, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$195	.dwtag  DW_TAG_variable, DW_AT_name("autoIdle")
	.dwattr $C$DW$195, DW_AT_TI_symbol_name("autoIdle")
	.dwattr $C$DW$195, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$195, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |996| autoIdle
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |996| spiAddr
	.dwpsn	file "../spi.c",line 997,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |997| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |997| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |997| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |997| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |997| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |997| 
	.dwpsn	file "../spi.c",line 998,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |998| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |998| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |998| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |998| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |998| autoIdle
        AND       r1, r1, 0x01          ; [ALU_PRU] |998| 
        OR        r1, r14, r1           ; [ALU_PRU] |998| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |998| 
	.dwpsn	file "../spi.c",line 999,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$196	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$196, DW_AT_low_pc(0x00)
	.dwattr $C$DW$196, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$191, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$191, DW_AT_TI_end_line(0x3e7)
	.dwattr $C$DW$191, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$191

	.sect	".text:SPI_SmartIdleConfig"
	.clink
	.global	||SPI_SmartIdleConfig||

$C$DW$197	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SmartIdleConfig")
	.dwattr $C$DW$197, DW_AT_low_pc(||SPI_SmartIdleConfig||)
	.dwattr $C$DW$197, DW_AT_high_pc(0x00)
	.dwattr $C$DW$197, DW_AT_TI_symbol_name("SPI_SmartIdleConfig")
	.dwattr $C$DW$197, DW_AT_external
	.dwattr $C$DW$197, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$197, DW_AT_TI_begin_line(0x3f4)
	.dwattr $C$DW$197, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$197, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$197, DW_AT_decl_line(0x3f4)
	.dwattr $C$DW$197, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$197, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 1013,column 1,is_stmt,address ||SPI_SmartIdleConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SmartIdleConfig||
$C$DW$198	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$198, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$198, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$198, DW_AT_location[DW_OP_regx 0x38]
$C$DW$199	.dwtag  DW_TAG_formal_parameter, DW_AT_name("smartIdle")
	.dwattr $C$DW$199, DW_AT_TI_symbol_name("smartIdle")
	.dwattr $C$DW$199, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$199, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_SmartIdleConfig           FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_SmartIdleConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$200	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$200, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$200, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$200, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$201	.dwtag  DW_TAG_variable, DW_AT_name("smartIdle")
	.dwattr $C$DW$201, DW_AT_TI_symbol_name("smartIdle")
	.dwattr $C$DW$201, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$201, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1013| smartIdle
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1013| spiAddr
	.dwpsn	file "../spi.c",line 1014,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1014| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1014| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1014| 
        LDI32     r1, 0xffffffe7        ; [ALU_PRU] |1014| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1014| 
        AND       r1, r14, r1           ; [ALU_PRU] |1014| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1014| 
	.dwpsn	file "../spi.c",line 1015,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1015| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1015| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1015| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1015| smartIdle
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1015| 
        AND       r1, r1, 0x18          ; [ALU_PRU] |1015| 
        OR        r1, r14, r1           ; [ALU_PRU] |1015| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1015| 
	.dwpsn	file "../spi.c",line 1016,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$202	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$202, DW_AT_low_pc(0x00)
	.dwattr $C$DW$202, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$197, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$197, DW_AT_TI_end_line(0x3f8)
	.dwattr $C$DW$197, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$197

	.sect	".text:SPI_ClkActivityConfig"
	.clink
	.global	||SPI_ClkActivityConfig||

$C$DW$203	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkActivityConfig")
	.dwattr $C$DW$203, DW_AT_low_pc(||SPI_ClkActivityConfig||)
	.dwattr $C$DW$203, DW_AT_high_pc(0x00)
	.dwattr $C$DW$203, DW_AT_TI_symbol_name("SPI_ClkActivityConfig")
	.dwattr $C$DW$203, DW_AT_external
	.dwattr $C$DW$203, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$203, DW_AT_TI_begin_line(0x405)
	.dwattr $C$DW$203, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$203, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$203, DW_AT_decl_line(0x405)
	.dwattr $C$DW$203, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$203, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 1030,column 1,is_stmt,address ||SPI_ClkActivityConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkActivityConfig||
$C$DW$204	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$204, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$204, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$204, DW_AT_location[DW_OP_regx 0x38]
$C$DW$205	.dwtag  DW_TAG_formal_parameter, DW_AT_name("clkAct")
	.dwattr $C$DW$205, DW_AT_TI_symbol_name("clkAct")
	.dwattr $C$DW$205, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$205, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_ClkActivityConfig         FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_ClkActivityConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$206	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$206, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$206, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$206, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$207	.dwtag  DW_TAG_variable, DW_AT_name("clkAct")
	.dwattr $C$DW$207, DW_AT_TI_symbol_name("clkAct")
	.dwattr $C$DW$207, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$207, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1030| clkAct
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1030| spiAddr
	.dwpsn	file "../spi.c",line 1031,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1031| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1031| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1031| 
        LDI32     r1, 0xfffffcff        ; [ALU_PRU] |1031| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1031| 
        AND       r1, r14, r1           ; [ALU_PRU] |1031| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1031| 
	.dwpsn	file "../spi.c",line 1032,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1032| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1032| spiAddr
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |1032| clkAct
        ADD       r0, r1, r0            ; [ALU_PRU] |1032| 
        LDI       r1, 0x0300            ; [ALU_PRU] |1032| 
        AND       r1, r14, r1           ; [ALU_PRU] |1032| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1032| 
        OR        r1, r14, r1           ; [ALU_PRU] |1032| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1032| 
	.dwpsn	file "../spi.c",line 1033,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$208	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$208, DW_AT_low_pc(0x00)
	.dwattr $C$DW$208, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$203, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$203, DW_AT_TI_end_line(0x409)
	.dwattr $C$DW$203, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$203

	.sect	".text:SPI_ClkConfig"
	.clink
	.global	||SPI_ClkConfig||

$C$DW$209	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkConfig")
	.dwattr $C$DW$209, DW_AT_low_pc(||SPI_ClkConfig||)
	.dwattr $C$DW$209, DW_AT_high_pc(0x00)
	.dwattr $C$DW$209, DW_AT_TI_symbol_name("SPI_ClkConfig")
	.dwattr $C$DW$209, DW_AT_external
	.dwattr $C$DW$209, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$209, DW_AT_TI_begin_line(0x5c)
	.dwattr $C$DW$209, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$209, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$209, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$209, DW_AT_decl_column(0x06)
	.dwattr $C$DW$209, DW_AT_TI_max_frame_size(0x22)
	.dwpsn	file "../spi.c",line 93,column 1,is_stmt,address ||SPI_ClkConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkConfig||
$C$DW$210	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$210, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$210, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$210, DW_AT_location[DW_OP_regx 0x38]
$C$DW$211	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiInClk")
	.dwattr $C$DW$211, DW_AT_TI_symbol_name("spiInClk")
	.dwattr $C$DW$211, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$211, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$212	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiOutClk")
	.dwattr $C$DW$212, DW_AT_TI_symbol_name("spiOutClk")
	.dwattr $C$DW$212, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$212, DW_AT_location[DW_OP_regx 0x40]
$C$DW$213	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$213, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$213, DW_AT_location[DW_OP_regx 0x44]
$C$DW$214	.dwtag  DW_TAG_formal_parameter, DW_AT_name("clkMode")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("clkMode")
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$214, DW_AT_location[DW_OP_regx 0x48]

;***************************************************************
;* FNAME: SPI_ClkConfig                 FR SIZE:  34           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           32 Auto,  2 SOE     *
;***************************************************************

||SPI_ClkConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x22          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 34
        SBBO      &r3.b2, r2, 32, 2     ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -2
	.dwcfi	save_reg_to_mem, 15, -1
$C$DW$215	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$215, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$215, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$215, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$216	.dwtag  DW_TAG_variable, DW_AT_name("spiInClk")
	.dwattr $C$DW$216, DW_AT_TI_symbol_name("spiInClk")
	.dwattr $C$DW$216, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$216, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$217	.dwtag  DW_TAG_variable, DW_AT_name("spiOutClk")
	.dwattr $C$DW$217, DW_AT_TI_symbol_name("spiOutClk")
	.dwattr $C$DW$217, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$217, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$218	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$218, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$218, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$218, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
$C$DW$219	.dwtag  DW_TAG_variable, DW_AT_name("clkMode")
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("clkMode")
	.dwattr $C$DW$219, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$219, DW_AT_location[DW_OP_breg8 16]
        NOP                             ; [ALU_PRU] 
$C$DW$220	.dwtag  DW_TAG_variable, DW_AT_name("fRatio")
	.dwattr $C$DW$220, DW_AT_TI_symbol_name("fRatio")
	.dwattr $C$DW$220, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$220, DW_AT_location[DW_OP_breg8 20]
        NOP                             ; [ALU_PRU] 
$C$DW$221	.dwtag  DW_TAG_variable, DW_AT_name("extClk")
	.dwattr $C$DW$221, DW_AT_TI_symbol_name("extClk")
	.dwattr $C$DW$221, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$221, DW_AT_location[DW_OP_breg8 24]
        NOP                             ; [ALU_PRU] 
$C$DW$222	.dwtag  DW_TAG_variable, DW_AT_name("clkD")
	.dwattr $C$DW$222, DW_AT_TI_symbol_name("clkD")
	.dwattr $C$DW$222, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$222, DW_AT_location[DW_OP_breg8 28]
        NOP                             ; [ALU_PRU] 
        SBBO      &r18, r2, 16, 4       ; [ALU_PRU] |93| clkMode
        SBBO      &r17, r2, 12, 4       ; [ALU_PRU] |93| chNum
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |93| spiOutClk
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |93| spiInClk
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |93| spiAddr
	.dwpsn	file "../spi.c",line 94,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |94| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |94| fRatio
	.dwpsn	file "../spi.c",line 95,column 18,is_stmt,isa 0
        SBBO      &r0, r2, 24, 4        ; [ALU_PRU] |95| extClk
	.dwpsn	file "../spi.c",line 96,column 17,is_stmt,isa 0
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |96| clkD
	.dwpsn	file "../spi.c",line 99,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |99| spiInClk
        LBBO      &r15, r2, 8, 4        ; [ALU_PRU] |99| spiOutClk
$C$DW$223	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$223, DW_AT_low_pc(0x00)
	.dwattr $C$DW$223, DW_AT_name("__pruabi_divu")
	.dwattr $C$DW$223, DW_AT_TI_call
        JAL       r3.w2, ||__pruabi_divu|| ; [ALU_PRU] |99| __pruabi_divu
        SBBO      &r14, r2, 20, 4       ; [ALU_PRU] |99| fRatio
	.dwpsn	file "../spi.c",line 102,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |102| fRatio
        LBBO      &r1, r2, 20, 4        ; [ALU_PRU] |102| fRatio
        SUB       r0, r0, 0x01          ; [ALU_PRU] |102| 
        AND       r0, r1, r0            ; [ALU_PRU] |102| 
        QBEQ      ||$C$L10||, r0, 0x00  ; [ALU_PRU] |102| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 105,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |105| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |105| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |105| 
        ADD       r0, r0, r1            ; [ALU_PRU] |105| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |105| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |105| 
        LDI       r0, 0x012c            ; [ALU_PRU] |105| 
        ADD       r0, r1, r0            ; [ALU_PRU] |105| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |105| 
        SET       r1, r1, 0x0000001d    ; [ALU_PRU] |105| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |105| 
	.dwpsn	file "../spi.c",line 108,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |108| fRatio
        SUB       r0, r0, 0x01          ; [ALU_PRU] |108| 
        LSR       r0, r0, 0x04          ; [ALU_PRU] |108| 
        SBBO      &r0, r2, 24, 4        ; [ALU_PRU] |108| extClk
	.dwpsn	file "../spi.c",line 109,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |109| fRatio
        SUB       r0, r0, 0x01          ; [ALU_PRU] |109| 
        AND       r0, r0, 0x0f          ; [ALU_PRU] |109| 
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |109| clkD
	.dwpsn	file "../spi.c",line 112,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |112| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |112| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |112| 
        ADD       r0, r0, r1            ; [ALU_PRU] |112| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |112| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |112| 
        LDI       r0, 0x0134            ; [ALU_PRU] |112| 
        ADD       r0, r1, r0            ; [ALU_PRU] |112| 
        LDI32     r1, 0xffff00ff        ; [ALU_PRU] |112| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |112| 
        AND       r1, r14, r1           ; [ALU_PRU] |112| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |112| 
	.dwpsn	file "../spi.c",line 115,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |115| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |115| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |115| 
        ADD       r0, r0, r1            ; [ALU_PRU] |115| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |115| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |115| 
        LDI       r0, 0x0134            ; [ALU_PRU] |115| 
        ADD       r0, r1, r0            ; [ALU_PRU] |115| 
        LBBO      &r1, r2, 24, 4        ; [ALU_PRU] |115| extClk
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |115| 
        LSL       r1, r1, 0x08          ; [ALU_PRU] |115| 
        OR        r1, r14, r1           ; [ALU_PRU] |115| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |115| 
	.dwpsn	file "../spi.c",line 116,column 2,is_stmt,isa 0
        JMP       ||$C$L12||            ; [ALU_PRU] |116| 
;* --------------------------------------------------------------------------*
||$C$L10||:    
	.dwpsn	file "../spi.c",line 118,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |118| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |118| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |118| 
        ADD       r0, r0, r1            ; [ALU_PRU] |118| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |118| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |118| 
        LDI       r0, 0x012c            ; [ALU_PRU] |118| 
        ADD       r0, r1, r0            ; [ALU_PRU] |118| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |118| 
        CLR       r1, r1, 0x0000001d    ; [ALU_PRU] |118| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |118| 
	.dwpsn	file "../spi.c",line 120,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |120| fRatio
        QBEQ      ||$C$L12||, r0, 0x01  ; [ALU_PRU] |120| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L11||
;*
;*   Loop source line                : 120
;*   Loop closing brace source line  : 124
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L11||:    
	.dwpsn	file "../spi.c",line 122,column 4,is_stmt,isa 0
        LSR       r0, r0, 0x01          ; [ALU_PRU] |122| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |122| fRatio
	.dwpsn	file "../spi.c",line 123,column 4,is_stmt,isa 0
        LBBO      &r0, r2, 28, 4        ; [ALU_PRU] |123| clkD
        ADD       r0, r0, 0x01          ; [ALU_PRU] |123| 
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |123| clkD
	.dwpsn	file "../spi.c",line 120,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |120| fRatio
        QBNE      ||$C$L11||, r0, 0x01  ; [ALU_PRU] |120| 
;* --------------------------------------------------------------------------*
||$C$L12||:    
	.dwpsn	file "../spi.c",line 128,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |128| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |128| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |128| 
        ADD       r0, r0, r1            ; [ALU_PRU] |128| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |128| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |128| 
        LDI       r0, 0x012c            ; [ALU_PRU] |128| 
        ADD       r0, r1, r0            ; [ALU_PRU] |128| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |128| 
        LDI32     r1, 0xffffffc3        ; [ALU_PRU] |128| 
        AND       r1, r14, r1           ; [ALU_PRU] |128| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |128| 
	.dwpsn	file "../spi.c",line 131,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |131| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |131| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |131| 
        ADD       r0, r0, r1            ; [ALU_PRU] |131| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |131| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |131| 
        LDI       r0, 0x012c            ; [ALU_PRU] |131| 
        ADD       r0, r1, r0            ; [ALU_PRU] |131| 
        LBBO      &r1, r2, 28, 4        ; [ALU_PRU] |131| clkD
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |131| 
        LSL       r1, r1, 0x02          ; [ALU_PRU] |131| 
        OR        r1, r14, r1           ; [ALU_PRU] |131| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |131| 
	.dwpsn	file "../spi.c",line 134,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |134| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |134| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |134| 
        ADD       r0, r0, r1            ; [ALU_PRU] |134| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |134| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |134| 
        LDI       r0, 0x012c            ; [ALU_PRU] |134| 
        ADD       r0, r1, r0            ; [ALU_PRU] |134| 
        LDI32     r1, 0xfffffffc        ; [ALU_PRU] |134| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |134| 
        AND       r1, r14, r1           ; [ALU_PRU] |134| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |134| 
	.dwpsn	file "../spi.c",line 137,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |137| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |137| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |137| 
        ADD       r0, r0, r1            ; [ALU_PRU] |137| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |137| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |137| 
        LDI       r0, 0x012c            ; [ALU_PRU] |137| 
        ADD       r0, r1, r0            ; [ALU_PRU] |137| 
        LBBO      &r1, r2, 16, 4        ; [ALU_PRU] |137| clkMode
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |137| 
        AND       r1, r1, 0x03          ; [ALU_PRU] |137| 
        OR        r1, r14, r1           ; [ALU_PRU] |137| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |137| 
	.dwpsn	file "../spi.c",line 138,column 1,is_stmt,isa 0
        LBBO      &r3.b2, r2, 32, 2     ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
        ADD       r2, r2, 0x22          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$224	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$224, DW_AT_low_pc(0x00)
	.dwattr $C$DW$224, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$209, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$209, DW_AT_TI_end_line(0x8a)
	.dwattr $C$DW$209, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$209

	.sect	".text:SPI_CSSet"
	.clink
	.global	||SPI_CSSet||

$C$DW$225	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSSet")
	.dwattr $C$DW$225, DW_AT_low_pc(||SPI_CSSet||)
	.dwattr $C$DW$225, DW_AT_high_pc(0x00)
	.dwattr $C$DW$225, DW_AT_TI_symbol_name("SPI_CSSet")
	.dwattr $C$DW$225, DW_AT_external
	.dwattr $C$DW$225, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$225, DW_AT_TI_begin_line(0xa9)
	.dwattr $C$DW$225, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$225, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$225, DW_AT_decl_line(0xa9)
	.dwattr $C$DW$225, DW_AT_decl_column(0x06)
	.dwattr $C$DW$225, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spi.c",line 170,column 1,is_stmt,address ||SPI_CSSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSSet||
$C$DW$226	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$226, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$226, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$226, DW_AT_location[DW_OP_regx 0x38]
$C$DW$227	.dwtag  DW_TAG_formal_parameter, DW_AT_name("mode")
	.dwattr $C$DW$227, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$227, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$227, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_CSSet                     FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_CSSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$228	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$228, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$228, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$228, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$229	.dwtag  DW_TAG_variable, DW_AT_name("mode")
	.dwattr $C$DW$229, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$229, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$229, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |170| mode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |170| spiAddr
	.dwpsn	file "../spi.c",line 171,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |171| mode
        QBNE      ||$C$L13||, r0, 0x01  ; [ALU_PRU] |171| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 173,column 3,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |173| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |173| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |173| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |173| 
        CLR       r1, r1, 0x00000001    ; [ALU_PRU] |173| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |173| 
	.dwpsn	file "../spi.c",line 174,column 2,is_stmt,isa 0
        JMP       ||$C$L14||            ; [ALU_PRU] |174| 
;* --------------------------------------------------------------------------*
||$C$L13||:    
	.dwpsn	file "../spi.c",line 174,column 9,is_stmt,isa 0
        QBNE      ||$C$L14||, r0, 0x00  ; [ALU_PRU] |174| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 175,column 3,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |175| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |175| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |175| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |175| 
        SET       r1, r1, 0x00000001    ; [ALU_PRU] |175| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |175| 
	.dwpsn	file "../spi.c",line 177,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L14||:    
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$230	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$230, DW_AT_low_pc(0x00)
	.dwattr $C$DW$230, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$225, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$225, DW_AT_TI_end_line(0xb1)
	.dwattr $C$DW$225, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$225

	.sect	".text:SPI_MasterModeSet"
	.clink
	.global	||SPI_MasterModeSet||

$C$DW$231	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_MasterModeSet")
	.dwattr $C$DW$231, DW_AT_low_pc(||SPI_MasterModeSet||)
	.dwattr $C$DW$231, DW_AT_high_pc(0x00)
	.dwattr $C$DW$231, DW_AT_TI_symbol_name("SPI_MasterModeSet")
	.dwattr $C$DW$231, DW_AT_external
	.dwattr $C$DW$231, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$231, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$231, DW_AT_TI_begin_line(0x148)
	.dwattr $C$DW$231, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$231, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$231, DW_AT_decl_line(0x148)
	.dwattr $C$DW$231, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$231, DW_AT_TI_max_frame_size(0x18)
	.dwpsn	file "../spi.c",line 329,column 1,is_stmt,address ||SPI_MasterModeSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_MasterModeSet||
$C$DW$232	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$232, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$232, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$232, DW_AT_location[DW_OP_regx 0x38]
$C$DW$233	.dwtag  DW_TAG_formal_parameter, DW_AT_name("channelMode")
	.dwattr $C$DW$233, DW_AT_TI_symbol_name("channelMode")
	.dwattr $C$DW$233, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$233, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$234	.dwtag  DW_TAG_formal_parameter, DW_AT_name("trMode")
	.dwattr $C$DW$234, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$234, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$234, DW_AT_location[DW_OP_regx 0x40]
$C$DW$235	.dwtag  DW_TAG_formal_parameter, DW_AT_name("pinMode")
	.dwattr $C$DW$235, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$235, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$235, DW_AT_location[DW_OP_regx 0x44]
$C$DW$236	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$236, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$236, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$236, DW_AT_location[DW_OP_regx 0x48]

;***************************************************************
;* FNAME: SPI_MasterModeSet             FR SIZE:  24           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           24 Auto,  0 SOE     *
;***************************************************************

||SPI_MasterModeSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x18          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 24
$C$DW$237	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$237, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$237, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$237, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$238	.dwtag  DW_TAG_variable, DW_AT_name("channelMode")
	.dwattr $C$DW$238, DW_AT_TI_symbol_name("channelMode")
	.dwattr $C$DW$238, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$238, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$239	.dwtag  DW_TAG_variable, DW_AT_name("trMode")
	.dwattr $C$DW$239, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$239, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$239, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$240	.dwtag  DW_TAG_variable, DW_AT_name("pinMode")
	.dwattr $C$DW$240, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$240, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$240, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
$C$DW$241	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$241, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$241, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$241, DW_AT_location[DW_OP_breg8 16]
        NOP                             ; [ALU_PRU] 
$C$DW$242	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$242, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$242, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$242, DW_AT_location[DW_OP_breg8 20]
        NOP                             ; [ALU_PRU] 
        SBBO      &r18, r2, 16, 4       ; [ALU_PRU] |329| chNum
        SBBO      &r17, r2, 12, 4       ; [ALU_PRU] |329| pinMode
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |329| trMode
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |329| channelMode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |329| spiAddr
	.dwpsn	file "../spi.c",line 330,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |330| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |330| retVal
	.dwpsn	file "../spi.c",line 333,column 2,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |333| spiAddr
        LDI       r0, 0x0128            ; [ALU_PRU] |333| 
        ADD       r0, r1, r0            ; [ALU_PRU] |333| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |333| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |333| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |333| 
	.dwpsn	file "../spi.c",line 336,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |336| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |336| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |336| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |336| channelMode
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |336| 
        AND       r1, r1, 0x01          ; [ALU_PRU] |336| 
        OR        r1, r14, r1           ; [ALU_PRU] |336| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |336| 
	.dwpsn	file "../spi.c",line 339,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |339| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |339| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |339| 
        ADD       r0, r0, r1            ; [ALU_PRU] |339| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |339| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |339| 
        LDI       r0, 0x012c            ; [ALU_PRU] |339| 
        ADD       r0, r1, r0            ; [ALU_PRU] |339| 
        LDI32     r1, 0xffffcfff        ; [ALU_PRU] |339| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |339| 
        AND       r1, r14, r1           ; [ALU_PRU] |339| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |339| 
	.dwpsn	file "../spi.c",line 342,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |342| chNum
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |342| trMode
        LSL       r1, r0, 0x02          ; [ALU_PRU] |342| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |342| 
        ADD       r0, r0, r1            ; [ALU_PRU] |342| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |342| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |342| 
        LDI       r0, 0x012c            ; [ALU_PRU] |342| 
        ADD       r0, r1, r0            ; [ALU_PRU] |342| 
        LDI       r1, 0x3000            ; [ALU_PRU] |342| 
        AND       r1, r14, r1           ; [ALU_PRU] |342| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |342| 
        OR        r1, r14, r1           ; [ALU_PRU] |342| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |342| 
	.dwpsn	file "../spi.c",line 344,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |344| trMode
        QBNE      ||$C$L15||, r0, 0x00  ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |344| pinMode
        LDI32     r1, 0x00030000        ; [ALU_PRU] |344| 
        QBNE      ||$C$L15||, r0, r1    ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L18||            ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
||$C$L15||:    
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |344| trMode
        LDI       r1, 0x2000            ; [ALU_PRU] |344| 
        QBNE      ||$C$L16||, r0, r1    ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |344| pinMode
        LDI32     r1, 0x00030000        ; [ALU_PRU] |344| 
        QBNE      ||$C$L16||, r0, r1    ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L18||            ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
||$C$L16||:    
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |344| trMode
        QBNE      ||$C$L17||, r0, 0x00  ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |344| pinMode
        LDI32     r1, 0x00070000        ; [ALU_PRU] |344| 
        QBNE      ||$C$L17||, r0, r1    ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L18||            ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
||$C$L17||:    
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |344| trMode
        LDI       r1, 0x2000            ; [ALU_PRU] |344| 
        QBNE      ||$C$L19||, r0, r1    ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |344| pinMode
        LDI32     r1, 0x00070000        ; [ALU_PRU] |344| 
        QBNE      ||$C$L19||, r0, r1    ; [ALU_PRU] |344| 
;* --------------------------------------------------------------------------*
||$C$L18||:    
	.dwpsn	file "../spi.c",line 349,column 3,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |349| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |349| retVal
	.dwpsn	file "../spi.c",line 350,column 2,is_stmt,isa 0
        JMP       ||$C$L20||            ; [ALU_PRU] |350| 
;* --------------------------------------------------------------------------*
||$C$L19||:    
	.dwpsn	file "../spi.c",line 352,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |352| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |352| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |352| 
        ADD       r0, r0, r1            ; [ALU_PRU] |352| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |352| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |352| 
        LDI       r0, 0x012c            ; [ALU_PRU] |352| 
        ADD       r0, r1, r0            ; [ALU_PRU] |352| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |352| 
        LDI32     r1, 0xfff8ffff        ; [ALU_PRU] |352| 
        AND       r1, r14, r1           ; [ALU_PRU] |352| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |352| 
	.dwpsn	file "../spi.c",line 355,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |355| chNum
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |355| pinMode
        LSL       r1, r0, 0x02          ; [ALU_PRU] |355| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |355| 
        ADD       r0, r0, r1            ; [ALU_PRU] |355| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |355| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |355| 
        LDI       r0, 0x012c            ; [ALU_PRU] |355| 
        ADD       r0, r1, r0            ; [ALU_PRU] |355| 
        LDI32     r1, 0x00070000        ; [ALU_PRU] |355| 
        AND       r1, r14, r1           ; [ALU_PRU] |355| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |355| 
        OR        r1, r14, r1           ; [ALU_PRU] |355| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |355| 
	.dwpsn	file "../spi.c",line 357,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |357| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |357| retVal
;* --------------------------------------------------------------------------*
||$C$L20||:    
	.dwpsn	file "../spi.c",line 360,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 20, 4       ; [ALU_PRU] |360| retVal
	.dwpsn	file "../spi.c",line 361,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x18          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$243	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$243, DW_AT_low_pc(0x00)
	.dwattr $C$DW$243, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$231, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$231, DW_AT_TI_end_line(0x169)
	.dwattr $C$DW$231, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$231

	.sect	".text:SPI_SlaveModeSet"
	.clink
	.global	||SPI_SlaveModeSet||

$C$DW$244	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SlaveModeSet")
	.dwattr $C$DW$244, DW_AT_low_pc(||SPI_SlaveModeSet||)
	.dwattr $C$DW$244, DW_AT_high_pc(0x00)
	.dwattr $C$DW$244, DW_AT_TI_symbol_name("SPI_SlaveModeSet")
	.dwattr $C$DW$244, DW_AT_external
	.dwattr $C$DW$244, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$244, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$244, DW_AT_TI_begin_line(0x17d)
	.dwattr $C$DW$244, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$244, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$244, DW_AT_decl_line(0x17d)
	.dwattr $C$DW$244, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$244, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spi.c",line 382,column 1,is_stmt,address ||SPI_SlaveModeSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SlaveModeSet||
$C$DW$245	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$245, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$245, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$245, DW_AT_location[DW_OP_regx 0x38]
$C$DW$246	.dwtag  DW_TAG_formal_parameter, DW_AT_name("trMode")
	.dwattr $C$DW$246, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$246, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$246, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$247	.dwtag  DW_TAG_formal_parameter, DW_AT_name("pinMode")
	.dwattr $C$DW$247, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$247, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$247, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_SlaveModeSet              FR SIZE:  16           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           16 Auto,  0 SOE     *
;***************************************************************

||SPI_SlaveModeSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 16
$C$DW$248	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$248, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$248, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$248, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$249	.dwtag  DW_TAG_variable, DW_AT_name("trMode")
	.dwattr $C$DW$249, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$249, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$249, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$250	.dwtag  DW_TAG_variable, DW_AT_name("pinMode")
	.dwattr $C$DW$250, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$250, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$250, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$251	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$251, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$251, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$251, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |382| pinMode
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |382| trMode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |382| spiAddr
	.dwpsn	file "../spi.c",line 383,column 18,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |383| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |383| retVal
	.dwpsn	file "../spi.c",line 386,column 2,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |386| spiAddr
        LDI       r0, 0x012c            ; [ALU_PRU] |386| 
        ADD       r0, r1, r0            ; [ALU_PRU] |386| 
        LDI32     r1, 0xffffcfff        ; [ALU_PRU] |386| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |386| 
        AND       r1, r14, r1           ; [ALU_PRU] |386| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |386| 
	.dwpsn	file "../spi.c",line 389,column 2,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |389| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |389| spiAddr
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |389| trMode
        ADD       r0, r1, r0            ; [ALU_PRU] |389| 
        LDI       r1, 0x3000            ; [ALU_PRU] |389| 
        AND       r1, r14, r1           ; [ALU_PRU] |389| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |389| 
        OR        r1, r14, r1           ; [ALU_PRU] |389| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |389| 
	.dwpsn	file "../spi.c",line 391,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |391| trMode
        QBNE      ||$C$L21||, r0, 0x00  ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |391| pinMode
        LDI32     r1, 0x00030000        ; [ALU_PRU] |391| 
        QBNE      ||$C$L21||, r0, r1    ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L24||            ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
||$C$L21||:    
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |391| trMode
        LDI       r1, 0x2000            ; [ALU_PRU] |391| 
        QBNE      ||$C$L22||, r0, r1    ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |391| pinMode
        LDI32     r1, 0x00030000        ; [ALU_PRU] |391| 
        QBNE      ||$C$L22||, r0, r1    ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L24||            ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
||$C$L22||:    
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |391| trMode
        QBNE      ||$C$L23||, r0, 0x00  ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |391| pinMode
        LDI32     r1, 0x00070000        ; [ALU_PRU] |391| 
        QBNE      ||$C$L23||, r0, r1    ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L24||            ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
||$C$L23||:    
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |391| trMode
        LDI       r1, 0x2000            ; [ALU_PRU] |391| 
        QBNE      ||$C$L25||, r0, r1    ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |391| pinMode
        LDI32     r1, 0x00070000        ; [ALU_PRU] |391| 
        QBNE      ||$C$L25||, r0, r1    ; [ALU_PRU] |391| 
;* --------------------------------------------------------------------------*
||$C$L24||:    
	.dwpsn	file "../spi.c",line 396,column 3,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |396| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |396| retVal
	.dwpsn	file "../spi.c",line 397,column 2,is_stmt,isa 0
        JMP       ||$C$L26||            ; [ALU_PRU] |397| 
;* --------------------------------------------------------------------------*
||$C$L25||:    
	.dwpsn	file "../spi.c",line 399,column 3,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |399| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |399| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |399| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |399| 
        LDI32     r1, 0xfff8ffff        ; [ALU_PRU] |399| 
        AND       r1, r14, r1           ; [ALU_PRU] |399| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |399| 
	.dwpsn	file "../spi.c",line 402,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |402| spiAddr
        LDI       r0, 0x012c            ; [ALU_PRU] |402| 
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |402| pinMode
        ADD       r0, r1, r0            ; [ALU_PRU] |402| 
        LDI32     r1, 0x00070000        ; [ALU_PRU] |402| 
        AND       r1, r14, r1           ; [ALU_PRU] |402| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |402| 
        OR        r1, r14, r1           ; [ALU_PRU] |402| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |402| 
;* --------------------------------------------------------------------------*
||$C$L26||:    
	.dwpsn	file "../spi.c",line 405,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |405| retVal
	.dwpsn	file "../spi.c",line 406,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$252	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$252, DW_AT_low_pc(0x00)
	.dwattr $C$DW$252, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$244, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$244, DW_AT_TI_end_line(0x196)
	.dwattr $C$DW$244, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$244

	.sect	".text:SPI_FIFOTrigLvlSet"
	.clink
	.global	||SPI_FIFOTrigLvlSet||

$C$DW$253	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_FIFOTrigLvlSet")
	.dwattr $C$DW$253, DW_AT_low_pc(||SPI_FIFOTrigLvlSet||)
	.dwattr $C$DW$253, DW_AT_high_pc(0x00)
	.dwattr $C$DW$253, DW_AT_TI_symbol_name("SPI_FIFOTrigLvlSet")
	.dwattr $C$DW$253, DW_AT_external
	.dwattr $C$DW$253, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$253, DW_AT_TI_begin_line(0x220)
	.dwattr $C$DW$253, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$253, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$253, DW_AT_decl_line(0x220)
	.dwattr $C$DW$253, DW_AT_decl_column(0x06)
	.dwattr $C$DW$253, DW_AT_TI_max_frame_size(0x0a)
	.dwpsn	file "../spi.c",line 545,column 1,is_stmt,address ||SPI_FIFOTrigLvlSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_FIFOTrigLvlSet||
$C$DW$254	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$254, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$254, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$254, DW_AT_location[DW_OP_regx 0x38]
$C$DW$255	.dwtag  DW_TAG_formal_parameter, DW_AT_name("afl")
	.dwattr $C$DW$255, DW_AT_TI_symbol_name("afl")
	.dwattr $C$DW$255, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$255, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$256	.dwtag  DW_TAG_formal_parameter, DW_AT_name("ael")
	.dwattr $C$DW$256, DW_AT_TI_symbol_name("ael")
	.dwattr $C$DW$256, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$256, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$257	.dwtag  DW_TAG_formal_parameter, DW_AT_name("trMode")
	.dwattr $C$DW$257, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$257, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$257, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_FIFOTrigLvlSet            FR SIZE:  10           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           10 Auto,  0 SOE     *
;***************************************************************

||SPI_FIFOTrigLvlSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0a          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 10
$C$DW$258	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$258, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$258, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$258, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$259	.dwtag  DW_TAG_variable, DW_AT_name("afl")
	.dwattr $C$DW$259, DW_AT_TI_symbol_name("afl")
	.dwattr $C$DW$259, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$259, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$260	.dwtag  DW_TAG_variable, DW_AT_name("ael")
	.dwattr $C$DW$260, DW_AT_TI_symbol_name("ael")
	.dwattr $C$DW$260, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$260, DW_AT_location[DW_OP_breg8 5]
        NOP                             ; [ALU_PRU] 
$C$DW$261	.dwtag  DW_TAG_variable, DW_AT_name("trMode")
	.dwattr $C$DW$261, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$261, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$261, DW_AT_location[DW_OP_breg8 6]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 6, 4        ; [ALU_PRU] |545| trMode
        SBBO      &r15.b1, r2, 5, 1     ; [ALU_PRU] |545| ael
        SBBO      &r15.b0, r2, 4, 1     ; [ALU_PRU] |545| afl
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |545| spiAddr
	.dwpsn	file "../spi.c",line 546,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 6, 4         ; [ALU_PRU] |546| trMode
        QBNE      ||$C$L27||, r0, 0x00  ; [ALU_PRU] |546| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 549,column 3,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |549| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |549| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |549| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |549| 
        LDI32     r1, 0xffff0000        ; [ALU_PRU] |549| 
        AND       r1, r14, r1           ; [ALU_PRU] |549| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |549| 
	.dwpsn	file "../spi.c",line 552,column 3,is_stmt,isa 0
        LBBO      &r14.b0, r2, 4, 1     ; [ALU_PRU] |552| afl
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |552| spiAddr
        LDI       r0, 0x017c            ; [ALU_PRU] |552| 
        ADD       r0, r1, r0            ; [ALU_PRU] |552| 
        LDI       r1, 0xff00            ; [ALU_PRU] |552| 
        SUB       r14, r14.b0, 0x01     ; [ALU_PRU] |552| 
        LSL       r14, r14, 0x08        ; [ALU_PRU] |552| 
        AND       r1, r14, r1           ; [ALU_PRU] |552| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |552| 
        OR        r14, r14, r1          ; [ALU_PRU] |552| 
        LBBO      &r1.b0, r2, 5, 1      ; [ALU_PRU] |552| ael
        SUB       r1, r1.b0, 0x01       ; [ALU_PRU] |552| 
        AND       r1, r1, 0xff          ; [ALU_PRU] |552| 
        OR        r1, r14, r1           ; [ALU_PRU] |552| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |552| 
	.dwpsn	file "../spi.c",line 554,column 2,is_stmt,isa 0
        JMP       ||$C$L29||            ; [ALU_PRU] |554| 
;* --------------------------------------------------------------------------*
||$C$L27||:    
	.dwpsn	file "../spi.c",line 554,column 9,is_stmt,isa 0
        LDI       r1, 0x2000            ; [ALU_PRU] |554| 
        QBNE      ||$C$L28||, r0, r1    ; [ALU_PRU] |554| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 556,column 3,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |556| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |556| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |556| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |556| 
        LDI32     r1, 0xffffff00        ; [ALU_PRU] |556| 
        AND       r1, r14, r1           ; [ALU_PRU] |556| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |556| 
	.dwpsn	file "../spi.c",line 559,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |559| spiAddr
        LDI       r0, 0x017c            ; [ALU_PRU] |559| 
        ADD       r0, r1, r0            ; [ALU_PRU] |559| 
        LBBO      &r1.b0, r2, 5, 1      ; [ALU_PRU] |559| ael
        SUB       r1, r1.b0, 0x01       ; [ALU_PRU] |559| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |559| 
        AND       r1, r1, 0xff          ; [ALU_PRU] |559| 
        OR        r1, r14, r1           ; [ALU_PRU] |559| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |559| 
	.dwpsn	file "../spi.c",line 560,column 2,is_stmt,isa 0
        JMP       ||$C$L29||            ; [ALU_PRU] |560| 
;* --------------------------------------------------------------------------*
||$C$L28||:    
	.dwpsn	file "../spi.c",line 560,column 9,is_stmt,isa 0
        LDI       r1, 0x1000            ; [ALU_PRU] |560| 
        QBNE      ||$C$L29||, r0, r1    ; [ALU_PRU] |560| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 562,column 3,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |562| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |562| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |562| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |562| 
        LDI32     r1, 0xffff00ff        ; [ALU_PRU] |562| 
        AND       r1, r14, r1           ; [ALU_PRU] |562| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |562| 
	.dwpsn	file "../spi.c",line 565,column 3,is_stmt,isa 0
        LBBO      &r14.b0, r2, 4, 1     ; [ALU_PRU] |565| afl
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |565| spiAddr
        LDI       r0, 0x017c            ; [ALU_PRU] |565| 
        ADD       r0, r1, r0            ; [ALU_PRU] |565| 
        LDI       r1, 0xff00            ; [ALU_PRU] |565| 
        SUB       r14, r14.b0, 0x01     ; [ALU_PRU] |565| 
        LSL       r14, r14, 0x08        ; [ALU_PRU] |565| 
        AND       r1, r14, r1           ; [ALU_PRU] |565| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |565| 
        OR        r1, r14, r1           ; [ALU_PRU] |565| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |565| 
	.dwpsn	file "../spi.c",line 567,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L29||:    
        ADD       r2, r2, 0x0a          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$262	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$262, DW_AT_low_pc(0x00)
	.dwattr $C$DW$262, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$253, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$253, DW_AT_TI_end_line(0x237)
	.dwattr $C$DW$253, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$253

	.sect	".text:SPI_ClkRead"
	.clink
	.global	||SPI_ClkRead||

$C$DW$263	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkRead")
	.dwattr $C$DW$263, DW_AT_low_pc(||SPI_ClkRead||)
	.dwattr $C$DW$263, DW_AT_high_pc(0x00)
	.dwattr $C$DW$263, DW_AT_TI_symbol_name("SPI_ClkRead")
	.dwattr $C$DW$263, DW_AT_external
	.dwattr $C$DW$263, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$263, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$263, DW_AT_TI_begin_line(0x2ef)
	.dwattr $C$DW$263, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$263, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$263, DW_AT_decl_line(0x2ef)
	.dwattr $C$DW$263, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$263, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 752,column 1,is_stmt,address ||SPI_ClkRead||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkRead||
$C$DW$264	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$264, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$264, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$264, DW_AT_location[DW_OP_regx 0x38]
$C$DW$265	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiClk")
	.dwattr $C$DW$265, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$265, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$265, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_ClkRead                   FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_ClkRead||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$266	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$266, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$266, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$266, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$267	.dwtag  DW_TAG_variable, DW_AT_name("spiClk")
	.dwattr $C$DW$267, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$267, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$267, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$268	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$268, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$268, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$268, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |752| spiClk
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |752| spiAddr
	.dwpsn	file "../spi.c",line 753,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |753| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |753| retVal
	.dwpsn	file "../spi.c",line 756,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |756| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |756| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |756| 
        QBBC      ||$C$L30||, r0, 0x0a  ; [ALU_PRU] |756| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 758,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |758| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |758| retVal
	.dwpsn	file "../spi.c",line 759,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |759| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |759| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |759| spiClk
        AND       r0, r0, 0x40          ; [ALU_PRU] |759| 
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |759| 
;* --------------------------------------------------------------------------*
||$C$L30||:    
	.dwpsn	file "../spi.c",line 762,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |762| retVal
	.dwpsn	file "../spi.c",line 763,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$269	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$269, DW_AT_low_pc(0x00)
	.dwattr $C$DW$269, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$263, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$263, DW_AT_TI_end_line(0x2fb)
	.dwattr $C$DW$263, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$263

	.sect	".text:SPI_ClkWrite"
	.clink
	.global	||SPI_ClkWrite||

$C$DW$270	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkWrite")
	.dwattr $C$DW$270, DW_AT_low_pc(||SPI_ClkWrite||)
	.dwattr $C$DW$270, DW_AT_high_pc(0x00)
	.dwattr $C$DW$270, DW_AT_TI_symbol_name("SPI_ClkWrite")
	.dwattr $C$DW$270, DW_AT_external
	.dwattr $C$DW$270, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$270, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$270, DW_AT_TI_begin_line(0x307)
	.dwattr $C$DW$270, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$270, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$270, DW_AT_decl_line(0x307)
	.dwattr $C$DW$270, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$270, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spi.c",line 776,column 1,is_stmt,address ||SPI_ClkWrite||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkWrite||
$C$DW$271	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$271, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$271, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$271, DW_AT_location[DW_OP_regx 0x38]
$C$DW$272	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiClk")
	.dwattr $C$DW$272, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$272, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$272, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_ClkWrite                  FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_ClkWrite||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$273	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$273, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$273, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$273, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$274	.dwtag  DW_TAG_variable, DW_AT_name("spiClk")
	.dwattr $C$DW$274, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$274, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$274, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$275	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$275, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$275, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$275, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |776| spiClk
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |776| spiAddr
	.dwpsn	file "../spi.c",line 777,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |777| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |777| retVal
	.dwpsn	file "../spi.c",line 779,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |779| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |779| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |779| 
        QBBS      ||$C$L31||, r0, 0x0a  ; [ALU_PRU] |779| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 781,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |781| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |781| retVal
	.dwpsn	file "../spi.c",line 784,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |784| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |784| 
        ADD       r0, r1, r0            ; [ALU_PRU] |784| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |784| 
        CLR       r1, r1, 0x00000006    ; [ALU_PRU] |784| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |784| 
	.dwpsn	file "../spi.c",line 787,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |787| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |787| 
        ADD       r0, r1, r0            ; [ALU_PRU] |787| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |787| spiClk
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |787| 
        AND       r1, r1, 0x40          ; [ALU_PRU] |787| 
        OR        r1, r14, r1           ; [ALU_PRU] |787| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |787| 
;* --------------------------------------------------------------------------*
||$C$L31||:    
	.dwpsn	file "../spi.c",line 790,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |790| retVal
	.dwpsn	file "../spi.c",line 791,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$276	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$276, DW_AT_low_pc(0x00)
	.dwattr $C$DW$276, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$270, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$270, DW_AT_TI_end_line(0x317)
	.dwattr $C$DW$270, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$270

	.sect	".text:SPI_DataPinRead"
	.clink
	.global	||SPI_DataPinRead||

$C$DW$277	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DataPinRead")
	.dwattr $C$DW$277, DW_AT_low_pc(||SPI_DataPinRead||)
	.dwattr $C$DW$277, DW_AT_high_pc(0x00)
	.dwattr $C$DW$277, DW_AT_TI_symbol_name("SPI_DataPinRead")
	.dwattr $C$DW$277, DW_AT_external
	.dwattr $C$DW$277, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$277, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$277, DW_AT_TI_begin_line(0x325)
	.dwattr $C$DW$277, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$277, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$277, DW_AT_decl_line(0x325)
	.dwattr $C$DW$277, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$277, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spi.c",line 806,column 1,is_stmt,address ||SPI_DataPinRead||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DataPinRead||
$C$DW$278	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$278, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$278, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$278, DW_AT_location[DW_OP_regx 0x38]
$C$DW$279	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dataPinDir")
	.dwattr $C$DW$279, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$279, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$279, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$280	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiDat")
	.dwattr $C$DW$280, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$280, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$280, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_DataPinRead               FR SIZE:  16           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           16 Auto,  0 SOE     *
;***************************************************************

||SPI_DataPinRead||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 16
$C$DW$281	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$281, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$281, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$281, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$282	.dwtag  DW_TAG_variable, DW_AT_name("dataPinDir")
	.dwattr $C$DW$282, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$282, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$282, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$283	.dwtag  DW_TAG_variable, DW_AT_name("spiDat")
	.dwattr $C$DW$283, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$283, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$283, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$284	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$284, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$284, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$284, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |806| spiDat
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |806| dataPinDir
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |806| spiAddr
	.dwpsn	file "../spi.c",line 807,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |807| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |807| retVal
	.dwpsn	file "../spi.c",line 809,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |809| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |809| spiAddr
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |809| 
        LDI       r0, 0x0200            ; [ALU_PRU] |809| 
        AND       r0, r1, r0            ; [ALU_PRU] |809| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |809| dataPinDir
        QBNE      ||$C$L32||, r0, r1    ; [ALU_PRU] |809| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 811,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |811| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |811| retVal
	.dwpsn	file "../spi.c",line 814,column 3,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |814| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |814| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |814| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |814| spiDat
        AND       r0, r0, 0x20          ; [ALU_PRU] |814| 
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |814| 
	.dwpsn	file "../spi.c",line 815,column 2,is_stmt,isa 0
        JMP       ||$C$L33||            ; [ALU_PRU] |815| 
;* --------------------------------------------------------------------------*
||$C$L32||:    
	.dwpsn	file "../spi.c",line 815,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |815| spiAddr
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |815| 
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |815| 
        LDI       r0, 0x0100            ; [ALU_PRU] |815| 
        AND       r0, r1, r0            ; [ALU_PRU] |815| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |815| dataPinDir
        QBNE      ||$C$L33||, r0, r1    ; [ALU_PRU] |815| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 816,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |816| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |816| retVal
	.dwpsn	file "../spi.c",line 819,column 3,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |819| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |819| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |819| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |819| spiDat
        AND       r0, r0, 0x10          ; [ALU_PRU] |819| 
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |819| 
;* --------------------------------------------------------------------------*
||$C$L33||:    
	.dwpsn	file "../spi.c",line 822,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |822| retVal
	.dwpsn	file "../spi.c",line 823,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$285	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$285, DW_AT_low_pc(0x00)
	.dwattr $C$DW$285, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$277, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$277, DW_AT_TI_end_line(0x337)
	.dwattr $C$DW$277, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$277

	.sect	".text:SPI_DataPinWrite"
	.clink
	.global	||SPI_DataPinWrite||

$C$DW$286	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DataPinWrite")
	.dwattr $C$DW$286, DW_AT_low_pc(||SPI_DataPinWrite||)
	.dwattr $C$DW$286, DW_AT_high_pc(0x00)
	.dwattr $C$DW$286, DW_AT_TI_symbol_name("SPI_DataPinWrite")
	.dwattr $C$DW$286, DW_AT_external
	.dwattr $C$DW$286, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$286, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$286, DW_AT_TI_begin_line(0x345)
	.dwattr $C$DW$286, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$286, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$286, DW_AT_decl_line(0x345)
	.dwattr $C$DW$286, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$286, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spi.c",line 838,column 1,is_stmt,address ||SPI_DataPinWrite||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DataPinWrite||
$C$DW$287	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$287, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$287, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$287, DW_AT_location[DW_OP_regx 0x38]
$C$DW$288	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dataPinDir")
	.dwattr $C$DW$288, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$288, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$288, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$289	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiDat")
	.dwattr $C$DW$289, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$289, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$289, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_DataPinWrite              FR SIZE:  16           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           16 Auto,  0 SOE     *
;***************************************************************

||SPI_DataPinWrite||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 16
$C$DW$290	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$290, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$290, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$290, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$291	.dwtag  DW_TAG_variable, DW_AT_name("dataPinDir")
	.dwattr $C$DW$291, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$291, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$291, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$292	.dwtag  DW_TAG_variable, DW_AT_name("spiDat")
	.dwattr $C$DW$292, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$292, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$292, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$293	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$293, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$293, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$293, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |838| spiDat
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |838| dataPinDir
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |838| spiAddr
	.dwpsn	file "../spi.c",line 839,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |839| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |839| retVal
	.dwpsn	file "../spi.c",line 841,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |841| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |841| spiAddr
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |841| 
        LDI       r0, 0x0200            ; [ALU_PRU] |841| 
        AND       r0, r1, r0            ; [ALU_PRU] |841| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |841| dataPinDir
        QBNE      ||$C$L34||, r0, r1    ; [ALU_PRU] |841| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 843,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |843| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |843| retVal
	.dwpsn	file "../spi.c",line 846,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |846| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |846| 
        ADD       r0, r1, r0            ; [ALU_PRU] |846| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |846| 
        CLR       r1, r1, 0x00000005    ; [ALU_PRU] |846| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |846| 
	.dwpsn	file "../spi.c",line 849,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |849| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |849| 
        ADD       r0, r1, r0            ; [ALU_PRU] |849| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |849| spiDat
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |849| 
        LSL       r1, r1, 0x05          ; [ALU_PRU] |849| 
        OR        r1, r14, r1           ; [ALU_PRU] |849| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |849| 
	.dwpsn	file "../spi.c",line 850,column 2,is_stmt,isa 0
        JMP       ||$C$L35||            ; [ALU_PRU] |850| 
;* --------------------------------------------------------------------------*
||$C$L34||:    
	.dwpsn	file "../spi.c",line 850,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |850| spiAddr
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |850| 
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |850| 
        LDI       r0, 0x0100            ; [ALU_PRU] |850| 
        AND       r0, r1, r0            ; [ALU_PRU] |850| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |850| dataPinDir
        QBNE      ||$C$L35||, r0, r1    ; [ALU_PRU] |850| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 851,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |851| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |851| retVal
	.dwpsn	file "../spi.c",line 854,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |854| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |854| 
        ADD       r0, r1, r0            ; [ALU_PRU] |854| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |854| 
        CLR       r1, r1, 0x00000004    ; [ALU_PRU] |854| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |854| 
	.dwpsn	file "../spi.c",line 857,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |857| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |857| 
        ADD       r0, r1, r0            ; [ALU_PRU] |857| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |857| spiDat
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |857| 
        LSL       r1, r1, 0x04          ; [ALU_PRU] |857| 
        OR        r1, r14, r1           ; [ALU_PRU] |857| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |857| 
;* --------------------------------------------------------------------------*
||$C$L35||:    
	.dwpsn	file "../spi.c",line 860,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |860| retVal
	.dwpsn	file "../spi.c",line 861,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$294	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$294, DW_AT_low_pc(0x00)
	.dwattr $C$DW$294, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$286, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$286, DW_AT_TI_end_line(0x35d)
	.dwattr $C$DW$286, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$286

	.sect	".text:SPI_CSRead"
	.clink
	.global	||SPI_CSRead||

$C$DW$295	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSRead")
	.dwattr $C$DW$295, DW_AT_low_pc(||SPI_CSRead||)
	.dwattr $C$DW$295, DW_AT_high_pc(0x00)
	.dwattr $C$DW$295, DW_AT_TI_symbol_name("SPI_CSRead")
	.dwattr $C$DW$295, DW_AT_external
	.dwattr $C$DW$295, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$295, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$295, DW_AT_TI_begin_line(0x369)
	.dwattr $C$DW$295, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$295, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$295, DW_AT_decl_line(0x369)
	.dwattr $C$DW$295, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$295, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spi.c",line 874,column 1,is_stmt,address ||SPI_CSRead||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSRead||
$C$DW$296	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$296, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$296, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$296, DW_AT_location[DW_OP_regx 0x38]
$C$DW$297	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEn")
	.dwattr $C$DW$297, DW_AT_TI_symbol_name("spiEn")
	.dwattr $C$DW$297, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$297, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$298	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnNum")
	.dwattr $C$DW$298, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$298, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$298, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_CSRead                    FR SIZE:  16           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           16 Auto,  0 SOE     *
;***************************************************************

||SPI_CSRead||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 16
$C$DW$299	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$299, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$299, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$299, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$300	.dwtag  DW_TAG_variable, DW_AT_name("spiEn")
	.dwattr $C$DW$300, DW_AT_TI_symbol_name("spiEn")
	.dwattr $C$DW$300, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$300, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$301	.dwtag  DW_TAG_variable, DW_AT_name("spiEnNum")
	.dwattr $C$DW$301, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$301, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$301, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$302	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$302, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$302, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$302, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |874| spiEnNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |874| spiEn
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |874| spiAddr
	.dwpsn	file "../spi.c",line 875,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |875| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |875| retVal
	.dwpsn	file "../spi.c",line 877,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |877| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |877| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |877| 
        QBBC      ||$C$L36||, r0, 0x0a  ; [ALU_PRU] |877| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 879,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |879| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |879| retVal
	.dwpsn	file "../spi.c",line 882,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |882| spiAddr
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |882| 
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |882| spiEnNum
        AND       r0, r1, r0            ; [ALU_PRU] |882| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |882| spiEn
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |882| 
;* --------------------------------------------------------------------------*
||$C$L36||:    
	.dwpsn	file "../spi.c",line 885,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |885| retVal
	.dwpsn	file "../spi.c",line 886,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$303	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$303, DW_AT_low_pc(0x00)
	.dwattr $C$DW$303, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$295, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$295, DW_AT_TI_end_line(0x376)
	.dwattr $C$DW$295, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$295

	.sect	".text:SPI_CSWrite"
	.clink
	.global	||SPI_CSWrite||

$C$DW$304	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSWrite")
	.dwattr $C$DW$304, DW_AT_low_pc(||SPI_CSWrite||)
	.dwattr $C$DW$304, DW_AT_high_pc(0x00)
	.dwattr $C$DW$304, DW_AT_TI_symbol_name("SPI_CSWrite")
	.dwattr $C$DW$304, DW_AT_external
	.dwattr $C$DW$304, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$304, DW_AT_TI_begin_file("../spi.c")
	.dwattr $C$DW$304, DW_AT_TI_begin_line(0x384)
	.dwattr $C$DW$304, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$304, DW_AT_decl_file("../spi.c")
	.dwattr $C$DW$304, DW_AT_decl_line(0x384)
	.dwattr $C$DW$304, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$304, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spi.c",line 901,column 1,is_stmt,address ||SPI_CSWrite||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSWrite||
$C$DW$305	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$305, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$305, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$305, DW_AT_location[DW_OP_regx 0x38]
$C$DW$306	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnLvl")
	.dwattr $C$DW$306, DW_AT_TI_symbol_name("spiEnLvl")
	.dwattr $C$DW$306, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$306, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$307	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnNum")
	.dwattr $C$DW$307, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$307, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$307, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_CSWrite                   FR SIZE:  16           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           16 Auto,  0 SOE     *
;***************************************************************

||SPI_CSWrite||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 16
$C$DW$308	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$308, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$308, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$308, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$309	.dwtag  DW_TAG_variable, DW_AT_name("spiEnLvl")
	.dwattr $C$DW$309, DW_AT_TI_symbol_name("spiEnLvl")
	.dwattr $C$DW$309, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$309, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$310	.dwtag  DW_TAG_variable, DW_AT_name("spiEnNum")
	.dwattr $C$DW$310, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$310, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$310, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$311	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$311, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$311, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$311, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |901| spiEnNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |901| spiEnLvl
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |901| spiAddr
	.dwpsn	file "../spi.c",line 902,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |902| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |902| retVal
	.dwpsn	file "../spi.c",line 904,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |904| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |904| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |904| 
        QBBS      ||$C$L40||, r0, 0x0a  ; [ALU_PRU] |904| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 906,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |906| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |906| retVal
	.dwpsn	file "../spi.c",line 908,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |908| spiEnNum
        QBNE      ||$C$L37||, r0, 0x01  ; [ALU_PRU] |908| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 911,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |911| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |911| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |911| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |911| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |911| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |911| 
	.dwpsn	file "../spi.c",line 914,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |914| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |914| 
        ADD       r0, r1, r0            ; [ALU_PRU] |914| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |914| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |914| spiEnLvl
        AND       r1, r1, 0x01          ; [ALU_PRU] |914| 
        OR        r1, r14, r1           ; [ALU_PRU] |914| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |914| 
	.dwpsn	file "../spi.c",line 915,column 3,is_stmt,isa 0
        JMP       ||$C$L40||            ; [ALU_PRU] |915| 
;* --------------------------------------------------------------------------*
||$C$L37||:    
	.dwpsn	file "../spi.c",line 915,column 10,is_stmt,isa 0
        QBNE      ||$C$L38||, r0, 0x02  ; [ALU_PRU] |915| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 917,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |917| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |917| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |917| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |917| 
        CLR       r1, r1, 0x00000001    ; [ALU_PRU] |917| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |917| 
	.dwpsn	file "../spi.c",line 920,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |920| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |920| 
        ADD       r0, r1, r0            ; [ALU_PRU] |920| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |920| spiEnLvl
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |920| 
        LSL       r1, r1, 0x01          ; [ALU_PRU] |920| 
        AND       r1, r1, 0x02          ; [ALU_PRU] |920| 
        OR        r1, r14, r1           ; [ALU_PRU] |920| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |920| 
	.dwpsn	file "../spi.c",line 921,column 3,is_stmt,isa 0
        JMP       ||$C$L40||            ; [ALU_PRU] |921| 
;* --------------------------------------------------------------------------*
||$C$L38||:    
	.dwpsn	file "../spi.c",line 921,column 10,is_stmt,isa 0
        QBNE      ||$C$L39||, r0, 0x04  ; [ALU_PRU] |921| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 923,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |923| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |923| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |923| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |923| 
        CLR       r1, r1, 0x00000002    ; [ALU_PRU] |923| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |923| 
	.dwpsn	file "../spi.c",line 926,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |926| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |926| 
        ADD       r0, r1, r0            ; [ALU_PRU] |926| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |926| spiEnLvl
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |926| 
        LSL       r1, r1, 0x02          ; [ALU_PRU] |926| 
        AND       r1, r1, 0x04          ; [ALU_PRU] |926| 
        OR        r1, r14, r1           ; [ALU_PRU] |926| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |926| 
	.dwpsn	file "../spi.c",line 927,column 3,is_stmt,isa 0
        JMP       ||$C$L40||            ; [ALU_PRU] |927| 
;* --------------------------------------------------------------------------*
||$C$L39||:    
	.dwpsn	file "../spi.c",line 927,column 10,is_stmt,isa 0
        QBNE      ||$C$L40||, r0, 0x08  ; [ALU_PRU] |927| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spi.c",line 929,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |929| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |929| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |929| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |929| 
        CLR       r1, r1, 0x00000003    ; [ALU_PRU] |929| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |929| 
	.dwpsn	file "../spi.c",line 932,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |932| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |932| 
        ADD       r0, r1, r0            ; [ALU_PRU] |932| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |932| spiEnLvl
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |932| 
        LSL       r1, r1, 0x03          ; [ALU_PRU] |932| 
        AND       r1, r1, 0x08          ; [ALU_PRU] |932| 
        OR        r1, r14, r1           ; [ALU_PRU] |932| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |932| 
;* --------------------------------------------------------------------------*
||$C$L40||:    
	.dwpsn	file "../spi.c",line 936,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |936| retVal
	.dwpsn	file "../spi.c",line 937,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$312	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$312, DW_AT_low_pc(0x00)
	.dwattr $C$DW$312, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$304, DW_AT_TI_end_file("../spi.c")
	.dwattr $C$DW$304, DW_AT_TI_end_line(0x3a9)
	.dwattr $C$DW$304, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$304

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	||__pruabi_divu||
;*****************************************************************************
;* SECTION GROUPS                                                            *
;*****************************************************************************
	.group    "SPI_AutoIdleConfig", 1
	.gmember  ".text:SPI_AutoIdleConfig"
	.endgroup
	.group    "SPI_CSAssert", 1
	.gmember  ".text:SPI_CSAssert"
	.endgroup
	.group    "SPI_CSDeAssert", 1
	.gmember  ".text:SPI_CSDeAssert"
	.endgroup
	.group    "SPI_CSPolarityConfig", 1
	.gmember  ".text:SPI_CSPolarityConfig"
	.endgroup
	.group    "SPI_CSTimeControlSet", 1
	.gmember  ".text:SPI_CSTimeControlSet"
	.endgroup
	.group    "SPI_ChannelSet", 1
	.gmember  ".text:SPI_ChannelSet"
	.endgroup
	.group    "SPI_ChannelStatusGet", 1
	.gmember  ".text:SPI_ChannelStatusGet"
	.endgroup
	.group    "SPI_ClkActivityConfig", 1
	.gmember  ".text:SPI_ClkActivityConfig"
	.endgroup
	.group    "SPI_DMASet", 1
	.gmember  ".text:SPI_DMASet"
	.endgroup
	.group    "SPI_DataPinDirectionConfig", 1
	.gmember  ".text:SPI_DataPinDirectionConfig"
	.endgroup
	.group    "SPI_FIFODatSet", 1
	.gmember  ".text:SPI_FIFODatSet"
	.endgroup
	.group    "SPI_InitDelayConfig", 1
	.gmember  ".text:SPI_InitDelayConfig"
	.endgroup
	.group    "SPI_IntSet", 1
	.gmember  ".text:SPI_IntSet"
	.endgroup
	.group    "SPI_IntStatusClear", 1
	.gmember  ".text:SPI_IntStatusClear"
	.endgroup
	.group    "SPI_IntStatusGet", 1
	.gmember  ".text:SPI_IntStatusGet"
	.endgroup
	.group    "SPI_MasterModeEnable", 1
	.gmember  ".text:SPI_MasterModeEnable"
	.endgroup
	.group    "SPI_MultiWordAccessConfig", 1
	.gmember  ".text:SPI_MultiWordAccessConfig"
	.endgroup
	.group    "SPI_ReceiveData", 1
	.gmember  ".text:SPI_ReceiveData"
	.endgroup
	.group    "SPI_Reset", 1
	.gmember  ".text:SPI_Reset"
	.endgroup
	.group    "SPI_RxFIFOConfig", 1
	.gmember  ".text:SPI_RxFIFOConfig"
	.endgroup
	.group    "SPI_SlaveModeEnable", 1
	.gmember  ".text:SPI_SlaveModeEnable"
	.endgroup
	.group    "SPI_SlaveSelect", 1
	.gmember  ".text:SPI_SlaveSelect"
	.endgroup
	.group    "SPI_SmartIdleConfig", 1
	.gmember  ".text:SPI_SmartIdleConfig"
	.endgroup
	.group    "SPI_StartBitDisable", 1
	.gmember  ".text:SPI_StartBitDisable"
	.endgroup
	.group    "SPI_StartBitEnable", 1
	.gmember  ".text:SPI_StartBitEnable"
	.endgroup
	.group    "SPI_StartBitPolarityConfig", 1
	.gmember  ".text:SPI_StartBitPolarityConfig"
	.endgroup
	.group    "SPI_SysTestModeConfig", 1
	.gmember  ".text:SPI_SysTestModeConfig"
	.endgroup
	.group    "SPI_TransmitData", 1
	.gmember  ".text:SPI_TransmitData"
	.endgroup
	.group    "SPI_TurboModeSet", 1
	.gmember  ".text:SPI_TurboModeSet"
	.endgroup
	.group    "SPI_TxFIFOConfig", 1
	.gmember  ".text:SPI_TxFIFOConfig"
	.endgroup
	.group    "SPI_WordCountSet", 1
	.gmember  ".text:SPI_WordCountSet"
	.endgroup
	.group    "SPI_WordLengthSet", 1
	.gmember  ".text:SPI_WordLengthSet"
	.endgroup


;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************
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
$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x04)
$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)
$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)
$C$DW$T$19	.dwtag  DW_TAG_typedef, DW_AT_name("uint32_t")
	.dwattr $C$DW$T$19, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$19, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$19, DW_AT_decl_file("/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/include/stdint.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x1c)
$C$DW$T$31	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$31, DW_AT_address_class(0x20)
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

$C$DW$313	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b0")
	.dwattr $C$DW$313, DW_AT_location[DW_OP_reg0]
$C$DW$314	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b1")
	.dwattr $C$DW$314, DW_AT_location[DW_OP_reg1]
$C$DW$315	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b2")
	.dwattr $C$DW$315, DW_AT_location[DW_OP_reg2]
$C$DW$316	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b3")
	.dwattr $C$DW$316, DW_AT_location[DW_OP_reg3]
$C$DW$317	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b0")
	.dwattr $C$DW$317, DW_AT_location[DW_OP_reg4]
$C$DW$318	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b1")
	.dwattr $C$DW$318, DW_AT_location[DW_OP_reg5]
$C$DW$319	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b2")
	.dwattr $C$DW$319, DW_AT_location[DW_OP_reg6]
$C$DW$320	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b3")
	.dwattr $C$DW$320, DW_AT_location[DW_OP_reg7]
$C$DW$321	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b0")
	.dwattr $C$DW$321, DW_AT_location[DW_OP_reg8]
$C$DW$322	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b1")
	.dwattr $C$DW$322, DW_AT_location[DW_OP_reg9]
$C$DW$323	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b2")
	.dwattr $C$DW$323, DW_AT_location[DW_OP_reg10]
$C$DW$324	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b3")
	.dwattr $C$DW$324, DW_AT_location[DW_OP_reg11]
$C$DW$325	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b0")
	.dwattr $C$DW$325, DW_AT_location[DW_OP_reg12]
$C$DW$326	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b1")
	.dwattr $C$DW$326, DW_AT_location[DW_OP_reg13]
$C$DW$327	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b2")
	.dwattr $C$DW$327, DW_AT_location[DW_OP_reg14]
$C$DW$328	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b3")
	.dwattr $C$DW$328, DW_AT_location[DW_OP_reg15]
$C$DW$329	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b0")
	.dwattr $C$DW$329, DW_AT_location[DW_OP_reg16]
$C$DW$330	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b1")
	.dwattr $C$DW$330, DW_AT_location[DW_OP_reg17]
$C$DW$331	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b2")
	.dwattr $C$DW$331, DW_AT_location[DW_OP_reg18]
$C$DW$332	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b3")
	.dwattr $C$DW$332, DW_AT_location[DW_OP_reg19]
$C$DW$333	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b0")
	.dwattr $C$DW$333, DW_AT_location[DW_OP_reg20]
$C$DW$334	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b1")
	.dwattr $C$DW$334, DW_AT_location[DW_OP_reg21]
$C$DW$335	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b2")
	.dwattr $C$DW$335, DW_AT_location[DW_OP_reg22]
$C$DW$336	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b3")
	.dwattr $C$DW$336, DW_AT_location[DW_OP_reg23]
$C$DW$337	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b0")
	.dwattr $C$DW$337, DW_AT_location[DW_OP_reg24]
$C$DW$338	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b1")
	.dwattr $C$DW$338, DW_AT_location[DW_OP_reg25]
$C$DW$339	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b2")
	.dwattr $C$DW$339, DW_AT_location[DW_OP_reg26]
$C$DW$340	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b3")
	.dwattr $C$DW$340, DW_AT_location[DW_OP_reg27]
$C$DW$341	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b0")
	.dwattr $C$DW$341, DW_AT_location[DW_OP_reg28]
$C$DW$342	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b1")
	.dwattr $C$DW$342, DW_AT_location[DW_OP_reg29]
$C$DW$343	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b2")
	.dwattr $C$DW$343, DW_AT_location[DW_OP_reg30]
$C$DW$344	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b3")
	.dwattr $C$DW$344, DW_AT_location[DW_OP_reg31]
$C$DW$345	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b0")
	.dwattr $C$DW$345, DW_AT_location[DW_OP_regx 0x20]
$C$DW$346	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b1")
	.dwattr $C$DW$346, DW_AT_location[DW_OP_regx 0x21]
$C$DW$347	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b2")
	.dwattr $C$DW$347, DW_AT_location[DW_OP_regx 0x22]
$C$DW$348	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b3")
	.dwattr $C$DW$348, DW_AT_location[DW_OP_regx 0x23]
$C$DW$349	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b0")
	.dwattr $C$DW$349, DW_AT_location[DW_OP_regx 0x24]
$C$DW$350	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b1")
	.dwattr $C$DW$350, DW_AT_location[DW_OP_regx 0x25]
$C$DW$351	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b2")
	.dwattr $C$DW$351, DW_AT_location[DW_OP_regx 0x26]
$C$DW$352	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b3")
	.dwattr $C$DW$352, DW_AT_location[DW_OP_regx 0x27]
$C$DW$353	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b0")
	.dwattr $C$DW$353, DW_AT_location[DW_OP_regx 0x28]
$C$DW$354	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b1")
	.dwattr $C$DW$354, DW_AT_location[DW_OP_regx 0x29]
$C$DW$355	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b2")
	.dwattr $C$DW$355, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$356	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b3")
	.dwattr $C$DW$356, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$357	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b0")
	.dwattr $C$DW$357, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$358	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b1")
	.dwattr $C$DW$358, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$359	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b2")
	.dwattr $C$DW$359, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$360	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b3")
	.dwattr $C$DW$360, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$361	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b0")
	.dwattr $C$DW$361, DW_AT_location[DW_OP_regx 0x30]
$C$DW$362	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b1")
	.dwattr $C$DW$362, DW_AT_location[DW_OP_regx 0x31]
$C$DW$363	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b2")
	.dwattr $C$DW$363, DW_AT_location[DW_OP_regx 0x32]
$C$DW$364	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b3")
	.dwattr $C$DW$364, DW_AT_location[DW_OP_regx 0x33]
$C$DW$365	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b0")
	.dwattr $C$DW$365, DW_AT_location[DW_OP_regx 0x34]
$C$DW$366	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b1")
	.dwattr $C$DW$366, DW_AT_location[DW_OP_regx 0x35]
$C$DW$367	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b2")
	.dwattr $C$DW$367, DW_AT_location[DW_OP_regx 0x36]
$C$DW$368	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b3")
	.dwattr $C$DW$368, DW_AT_location[DW_OP_regx 0x37]
$C$DW$369	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b0")
	.dwattr $C$DW$369, DW_AT_location[DW_OP_regx 0x38]
$C$DW$370	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b1")
	.dwattr $C$DW$370, DW_AT_location[DW_OP_regx 0x39]
$C$DW$371	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b2")
	.dwattr $C$DW$371, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$372	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b3")
	.dwattr $C$DW$372, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$373	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b0")
	.dwattr $C$DW$373, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$374	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b1")
	.dwattr $C$DW$374, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$375	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b2")
	.dwattr $C$DW$375, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$376	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b3")
	.dwattr $C$DW$376, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$377	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b0")
	.dwattr $C$DW$377, DW_AT_location[DW_OP_regx 0x40]
$C$DW$378	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b1")
	.dwattr $C$DW$378, DW_AT_location[DW_OP_regx 0x41]
$C$DW$379	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b2")
	.dwattr $C$DW$379, DW_AT_location[DW_OP_regx 0x42]
$C$DW$380	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b3")
	.dwattr $C$DW$380, DW_AT_location[DW_OP_regx 0x43]
$C$DW$381	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b0")
	.dwattr $C$DW$381, DW_AT_location[DW_OP_regx 0x44]
$C$DW$382	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b1")
	.dwattr $C$DW$382, DW_AT_location[DW_OP_regx 0x45]
$C$DW$383	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b2")
	.dwattr $C$DW$383, DW_AT_location[DW_OP_regx 0x46]
$C$DW$384	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b3")
	.dwattr $C$DW$384, DW_AT_location[DW_OP_regx 0x47]
$C$DW$385	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b0")
	.dwattr $C$DW$385, DW_AT_location[DW_OP_regx 0x48]
$C$DW$386	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b1")
	.dwattr $C$DW$386, DW_AT_location[DW_OP_regx 0x49]
$C$DW$387	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b2")
	.dwattr $C$DW$387, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$388	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b3")
	.dwattr $C$DW$388, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$389	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b0")
	.dwattr $C$DW$389, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$390	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b1")
	.dwattr $C$DW$390, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$391	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b2")
	.dwattr $C$DW$391, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$392	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b3")
	.dwattr $C$DW$392, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$393	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b0")
	.dwattr $C$DW$393, DW_AT_location[DW_OP_regx 0x50]
$C$DW$394	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b1")
	.dwattr $C$DW$394, DW_AT_location[DW_OP_regx 0x51]
$C$DW$395	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b2")
	.dwattr $C$DW$395, DW_AT_location[DW_OP_regx 0x52]
$C$DW$396	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b3")
	.dwattr $C$DW$396, DW_AT_location[DW_OP_regx 0x53]
$C$DW$397	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b0")
	.dwattr $C$DW$397, DW_AT_location[DW_OP_regx 0x54]
$C$DW$398	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b1")
	.dwattr $C$DW$398, DW_AT_location[DW_OP_regx 0x55]
$C$DW$399	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b2")
	.dwattr $C$DW$399, DW_AT_location[DW_OP_regx 0x56]
$C$DW$400	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b3")
	.dwattr $C$DW$400, DW_AT_location[DW_OP_regx 0x57]
$C$DW$401	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b0")
	.dwattr $C$DW$401, DW_AT_location[DW_OP_regx 0x58]
$C$DW$402	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b1")
	.dwattr $C$DW$402, DW_AT_location[DW_OP_regx 0x59]
$C$DW$403	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b2")
	.dwattr $C$DW$403, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$404	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b3")
	.dwattr $C$DW$404, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$405	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b0")
	.dwattr $C$DW$405, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$406	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b1")
	.dwattr $C$DW$406, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$407	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b2")
	.dwattr $C$DW$407, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$408	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b3")
	.dwattr $C$DW$408, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$409	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b0")
	.dwattr $C$DW$409, DW_AT_location[DW_OP_regx 0x60]
$C$DW$410	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b1")
	.dwattr $C$DW$410, DW_AT_location[DW_OP_regx 0x61]
$C$DW$411	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b2")
	.dwattr $C$DW$411, DW_AT_location[DW_OP_regx 0x62]
$C$DW$412	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b3")
	.dwattr $C$DW$412, DW_AT_location[DW_OP_regx 0x63]
$C$DW$413	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b0")
	.dwattr $C$DW$413, DW_AT_location[DW_OP_regx 0x64]
$C$DW$414	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b1")
	.dwattr $C$DW$414, DW_AT_location[DW_OP_regx 0x65]
$C$DW$415	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b2")
	.dwattr $C$DW$415, DW_AT_location[DW_OP_regx 0x66]
$C$DW$416	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b3")
	.dwattr $C$DW$416, DW_AT_location[DW_OP_regx 0x67]
$C$DW$417	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b0")
	.dwattr $C$DW$417, DW_AT_location[DW_OP_regx 0x68]
$C$DW$418	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b1")
	.dwattr $C$DW$418, DW_AT_location[DW_OP_regx 0x69]
$C$DW$419	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b2")
	.dwattr $C$DW$419, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$420	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b3")
	.dwattr $C$DW$420, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$421	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b0")
	.dwattr $C$DW$421, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$422	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b1")
	.dwattr $C$DW$422, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$423	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b2")
	.dwattr $C$DW$423, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$424	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b3")
	.dwattr $C$DW$424, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$425	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b0")
	.dwattr $C$DW$425, DW_AT_location[DW_OP_regx 0x70]
$C$DW$426	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b1")
	.dwattr $C$DW$426, DW_AT_location[DW_OP_regx 0x71]
$C$DW$427	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b2")
	.dwattr $C$DW$427, DW_AT_location[DW_OP_regx 0x72]
$C$DW$428	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b3")
	.dwattr $C$DW$428, DW_AT_location[DW_OP_regx 0x73]
$C$DW$429	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b0")
	.dwattr $C$DW$429, DW_AT_location[DW_OP_regx 0x74]
$C$DW$430	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b1")
	.dwattr $C$DW$430, DW_AT_location[DW_OP_regx 0x75]
$C$DW$431	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b2")
	.dwattr $C$DW$431, DW_AT_location[DW_OP_regx 0x76]
$C$DW$432	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b3")
	.dwattr $C$DW$432, DW_AT_location[DW_OP_regx 0x77]
$C$DW$433	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b0")
	.dwattr $C$DW$433, DW_AT_location[DW_OP_regx 0x78]
$C$DW$434	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b1")
	.dwattr $C$DW$434, DW_AT_location[DW_OP_regx 0x79]
$C$DW$435	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b2")
	.dwattr $C$DW$435, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$436	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b3")
	.dwattr $C$DW$436, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$437	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b0")
	.dwattr $C$DW$437, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$438	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b1")
	.dwattr $C$DW$438, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$439	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b2")
	.dwattr $C$DW$439, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$440	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b3")
	.dwattr $C$DW$440, DW_AT_location[DW_OP_regx 0x7f]
	.dwendtag $C$DW$CU

