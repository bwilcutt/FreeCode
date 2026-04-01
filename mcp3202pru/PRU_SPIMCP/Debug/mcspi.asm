;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.1.2 *
;* Date/Time created: Thu Jan 28 09:48:04 2016                                *
;******************************************************************************
	.compiler_opts --abi=eabi --diag_wrap=off --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../mcspi.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI PRU C/C++ Codegen Unix v2.1.2 Copyright (c) 2012-2015 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/home/bwilcutt2/workspace_v6_1/PRU_SPIMCP/Debug")
;	/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/bin/acpiapru -@/tmp/29080O7d4HO 
	.sect	".text:SPI_WordLengthSet"
	.clink
	.global	||SPI_WordLengthSet||

$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_WordLengthSet")
	.dwattr $C$DW$1, DW_AT_low_pc(||SPI_WordLengthSet||)
	.dwattr $C$DW$1, DW_AT_high_pc(0x00)
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("SPI_WordLengthSet")
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$1, DW_AT_TI_begin_line(0x6c)
	.dwattr $C$DW$1, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$1, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$1, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$1, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$1, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 109,column 1,is_stmt,address ||SPI_WordLengthSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_WordLengthSet||
$C$DW$2	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("baseAdd")
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
$C$DW$5	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("baseAdd")
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
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |109| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |109| wordLength
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |109| baseAdd
	.dwpsn	file "../mcspi.c",line 110,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |110| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |110| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |110| 
        ADD       r0, r0, r1            ; [ALU_PRU] |110| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |110| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |110| 
        LDI       r0, 0x012c            ; [ALU_PRU] |110| 
        ADD       r0, r1, r0            ; [ALU_PRU] |110| 
        LDI32     r1, 0xfffff07f        ; [ALU_PRU] |110| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |110| 
        AND       r1, r14, r1           ; [ALU_PRU] |110| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |110| 
	.dwpsn	file "../mcspi.c",line 111,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |111| chNum
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |111| wordLength
        LSL       r1, r0, 0x02          ; [ALU_PRU] |111| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |111| 
        ADD       r0, r0, r1            ; [ALU_PRU] |111| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |111| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |111| 
        LDI       r0, 0x012c            ; [ALU_PRU] |111| 
        ADD       r0, r1, r0            ; [ALU_PRU] |111| 
        LDI       r1, 0x0f80            ; [ALU_PRU] |111| 
        AND       r1, r14, r1           ; [ALU_PRU] |111| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |111| 
        OR        r1, r14, r1           ; [ALU_PRU] |111| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |111| 
	.dwpsn	file "../mcspi.c",line 112,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$8	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$8, DW_AT_low_pc(0x00)
	.dwattr $C$DW$8, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$1, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$1, DW_AT_TI_end_line(0x70)
	.dwattr $C$DW$1, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$1

	.sect	".text:SPI_CSDisable"
	.clink
	.global	||SPI_CSDisable||

$C$DW$9	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSDisable")
	.dwattr $C$DW$9, DW_AT_low_pc(||SPI_CSDisable||)
	.dwattr $C$DW$9, DW_AT_high_pc(0x00)
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("SPI_CSDisable")
	.dwattr $C$DW$9, DW_AT_external
	.dwattr $C$DW$9, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$9, DW_AT_TI_begin_line(0x88)
	.dwattr $C$DW$9, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$9, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$9, DW_AT_decl_line(0x88)
	.dwattr $C$DW$9, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$9, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../mcspi.c",line 137,column 1,is_stmt,address ||SPI_CSDisable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSDisable||
$C$DW$10	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$10, DW_AT_location[DW_OP_regx 0x38]

;***************************************************************
;* FNAME: SPI_CSDisable                 FR SIZE:   4           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            4 Auto,  0 SOE     *
;***************************************************************

||SPI_CSDisable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 4
$C$DW$11	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$11, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |137| baseAdd
	.dwpsn	file "../mcspi.c",line 138,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |138| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |138| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |138| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |138| 
        SET       r1, r1, 0x00000001    ; [ALU_PRU] |138| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |138| 
	.dwpsn	file "../mcspi.c",line 139,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$12	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$12, DW_AT_low_pc(0x00)
	.dwattr $C$DW$12, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$9, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$9, DW_AT_TI_end_line(0x8b)
	.dwattr $C$DW$9, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$9

	.sect	".text:SPI_CSPolarityConfig"
	.clink
	.global	||SPI_CSPolarityConfig||

$C$DW$13	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSPolarityConfig")
	.dwattr $C$DW$13, DW_AT_low_pc(||SPI_CSPolarityConfig||)
	.dwattr $C$DW$13, DW_AT_high_pc(0x00)
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("SPI_CSPolarityConfig")
	.dwattr $C$DW$13, DW_AT_external
	.dwattr $C$DW$13, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$13, DW_AT_TI_begin_line(0x9f)
	.dwattr $C$DW$13, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$13, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$13, DW_AT_decl_line(0x9f)
	.dwattr $C$DW$13, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$13, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 160,column 1,is_stmt,address ||SPI_CSPolarityConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSPolarityConfig||
$C$DW$14	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$14, DW_AT_location[DW_OP_regx 0x38]
$C$DW$15	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnPol")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("spiEnPol")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$15, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$16	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$16, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$17	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$17, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$18	.dwtag  DW_TAG_variable, DW_AT_name("spiEnPol")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("spiEnPol")
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$18, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$19	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$19, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |160| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |160| spiEnPol
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |160| baseAdd
	.dwpsn	file "../mcspi.c",line 161,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |161| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |161| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |161| 
        ADD       r0, r0, r1            ; [ALU_PRU] |161| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |161| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |161| 
        LDI       r0, 0x012c            ; [ALU_PRU] |161| 
        ADD       r0, r1, r0            ; [ALU_PRU] |161| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |161| 
        CLR       r1, r1, 0x00000006    ; [ALU_PRU] |161| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |161| 
	.dwpsn	file "../mcspi.c",line 162,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |162| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |162| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |162| 
        ADD       r0, r0, r1            ; [ALU_PRU] |162| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |162| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |162| 
        LDI       r0, 0x012c            ; [ALU_PRU] |162| 
        ADD       r0, r1, r0            ; [ALU_PRU] |162| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |162| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |162| spiEnPol
        AND       r1, r1, 0x40          ; [ALU_PRU] |162| 
        OR        r1, r14, r1           ; [ALU_PRU] |162| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |162| 
	.dwpsn	file "../mcspi.c",line 163,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$20	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$20, DW_AT_low_pc(0x00)
	.dwattr $C$DW$20, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$13, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$13, DW_AT_TI_end_line(0xa3)
	.dwattr $C$DW$13, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$13

	.sect	".text:SPI_CSTimeControlSet"
	.clink
	.global	||SPI_CSTimeControlSet||

$C$DW$21	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSTimeControlSet")
	.dwattr $C$DW$21, DW_AT_low_pc(||SPI_CSTimeControlSet||)
	.dwattr $C$DW$21, DW_AT_high_pc(0x00)
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("SPI_CSTimeControlSet")
	.dwattr $C$DW$21, DW_AT_external
	.dwattr $C$DW$21, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$21, DW_AT_TI_begin_line(0xb8)
	.dwattr $C$DW$21, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$21, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$21, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$21, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$21, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 185,column 1,is_stmt,address ||SPI_CSTimeControlSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSTimeControlSet||
$C$DW$22	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$22, DW_AT_location[DW_OP_regx 0x38]
$C$DW$23	.dwtag  DW_TAG_formal_parameter, DW_AT_name("csTimeControl")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("csTimeControl")
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$23, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$24	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$24, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$25	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$25, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$26	.dwtag  DW_TAG_variable, DW_AT_name("csTimeControl")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("csTimeControl")
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$26, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$27	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$27, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |185| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |185| csTimeControl
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |185| baseAdd
	.dwpsn	file "../mcspi.c",line 186,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |186| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |186| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |186| 
        ADD       r0, r0, r1            ; [ALU_PRU] |186| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |186| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |186| 
        LDI       r0, 0x012c            ; [ALU_PRU] |186| 
        ADD       r0, r1, r0            ; [ALU_PRU] |186| 
        LDI32     r1, 0xf9ffffff        ; [ALU_PRU] |186| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |186| 
        AND       r1, r14, r1           ; [ALU_PRU] |186| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |186| 
	.dwpsn	file "../mcspi.c",line 187,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |187| chNum
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |187| csTimeControl
        LSL       r1, r0, 0x02          ; [ALU_PRU] |187| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |187| 
        ADD       r0, r0, r1            ; [ALU_PRU] |187| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |187| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |187| 
        LDI       r0, 0x012c            ; [ALU_PRU] |187| 
        ADD       r0, r1, r0            ; [ALU_PRU] |187| 
        LDI32     r1, 0x06000000        ; [ALU_PRU] |187| 
        AND       r1, r14, r1           ; [ALU_PRU] |187| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |187| 
        OR        r1, r14, r1           ; [ALU_PRU] |187| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |187| 
	.dwpsn	file "../mcspi.c",line 188,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$28	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$28, DW_AT_low_pc(0x00)
	.dwattr $C$DW$28, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$21, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$21, DW_AT_TI_end_line(0xbc)
	.dwattr $C$DW$21, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$21

	.sect	".text:SPI_CSAssert"
	.clink
	.global	||SPI_CSAssert||

$C$DW$29	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSAssert")
	.dwattr $C$DW$29, DW_AT_low_pc(||SPI_CSAssert||)
	.dwattr $C$DW$29, DW_AT_high_pc(0x00)
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("SPI_CSAssert")
	.dwattr $C$DW$29, DW_AT_external
	.dwattr $C$DW$29, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$29, DW_AT_TI_begin_line(0xcb)
	.dwattr $C$DW$29, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$29, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$29, DW_AT_decl_line(0xcb)
	.dwattr $C$DW$29, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$29, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 204,column 1,is_stmt,address ||SPI_CSAssert||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSAssert||
$C$DW$30	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$30, DW_AT_location[DW_OP_regx 0x38]
$C$DW$31	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$31, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$32	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$32, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$33	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$33, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |204| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |204| baseAdd
	.dwpsn	file "../mcspi.c",line 205,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |205| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |205| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |205| 
        ADD       r0, r0, r1            ; [ALU_PRU] |205| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |205| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |205| 
        LDI       r0, 0x012c            ; [ALU_PRU] |205| 
        ADD       r0, r1, r0            ; [ALU_PRU] |205| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |205| 
        SET       r1, r1, 0x00000014    ; [ALU_PRU] |205| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |205| 
	.dwpsn	file "../mcspi.c",line 206,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$34	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$34, DW_AT_low_pc(0x00)
	.dwattr $C$DW$34, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$29, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$29, DW_AT_TI_end_line(0xce)
	.dwattr $C$DW$29, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$29

	.sect	".text:SPI_CSDeAssert"
	.clink
	.global	||SPI_CSDeAssert||

$C$DW$35	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSDeAssert")
	.dwattr $C$DW$35, DW_AT_low_pc(||SPI_CSDeAssert||)
	.dwattr $C$DW$35, DW_AT_high_pc(0x00)
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("SPI_CSDeAssert")
	.dwattr $C$DW$35, DW_AT_external
	.dwattr $C$DW$35, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$35, DW_AT_TI_begin_line(0xdd)
	.dwattr $C$DW$35, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$35, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$35, DW_AT_decl_line(0xdd)
	.dwattr $C$DW$35, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$35, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 222,column 1,is_stmt,address ||SPI_CSDeAssert||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSDeAssert||
$C$DW$36	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$36, DW_AT_location[DW_OP_regx 0x38]
$C$DW$37	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$37, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$37, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$38	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$38, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$38, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$39	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$39, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |222| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |222| baseAdd
	.dwpsn	file "../mcspi.c",line 223,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |223| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |223| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |223| 
        ADD       r0, r0, r1            ; [ALU_PRU] |223| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |223| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |223| 
        LDI       r0, 0x012c            ; [ALU_PRU] |223| 
        ADD       r0, r1, r0            ; [ALU_PRU] |223| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |223| 
        CLR       r1, r1, 0x00000014    ; [ALU_PRU] |223| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |223| 
	.dwpsn	file "../mcspi.c",line 224,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$40	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$40, DW_AT_low_pc(0x00)
	.dwattr $C$DW$40, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$35, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$35, DW_AT_TI_end_line(0xe0)
	.dwattr $C$DW$35, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$35

	.sect	".text:SPI_StartBitEnable"
	.clink
	.global	||SPI_StartBitEnable||

$C$DW$41	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_StartBitEnable")
	.dwattr $C$DW$41, DW_AT_low_pc(||SPI_StartBitEnable||)
	.dwattr $C$DW$41, DW_AT_high_pc(0x00)
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("SPI_StartBitEnable")
	.dwattr $C$DW$41, DW_AT_external
	.dwattr $C$DW$41, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$41, DW_AT_TI_begin_line(0xef)
	.dwattr $C$DW$41, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$41, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$41, DW_AT_decl_line(0xef)
	.dwattr $C$DW$41, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$41, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 240,column 1,is_stmt,address ||SPI_StartBitEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_StartBitEnable||
$C$DW$42	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$42, DW_AT_location[DW_OP_regx 0x38]
$C$DW$43	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$43, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$44	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$44, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$45	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$45, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |240| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |240| baseAdd
	.dwpsn	file "../mcspi.c",line 241,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |241| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |241| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |241| 
        ADD       r0, r0, r1            ; [ALU_PRU] |241| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |241| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |241| 
        LDI       r0, 0x012c            ; [ALU_PRU] |241| 
        ADD       r0, r1, r0            ; [ALU_PRU] |241| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |241| 
        SET       r1, r1, 0x00000017    ; [ALU_PRU] |241| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |241| 
	.dwpsn	file "../mcspi.c",line 242,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$46	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$46, DW_AT_low_pc(0x00)
	.dwattr $C$DW$46, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$41, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$41, DW_AT_TI_end_line(0xf2)
	.dwattr $C$DW$41, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$41

	.sect	".text:SPI_StartBitPolarityConfig"
	.clink
	.global	||SPI_StartBitPolarityConfig||

$C$DW$47	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_StartBitPolarityConfig")
	.dwattr $C$DW$47, DW_AT_low_pc(||SPI_StartBitPolarityConfig||)
	.dwattr $C$DW$47, DW_AT_high_pc(0x00)
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("SPI_StartBitPolarityConfig")
	.dwattr $C$DW$47, DW_AT_external
	.dwattr $C$DW$47, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$47, DW_AT_TI_begin_line(0x108)
	.dwattr $C$DW$47, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$47, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$47, DW_AT_decl_line(0x108)
	.dwattr $C$DW$47, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$47, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 265,column 1,is_stmt,address ||SPI_StartBitPolarityConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_StartBitPolarityConfig||
$C$DW$48	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$48, DW_AT_location[DW_OP_regx 0x38]
$C$DW$49	.dwtag  DW_TAG_formal_parameter, DW_AT_name("startBitPol")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("startBitPol")
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$49, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$50	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$50, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$51	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$51, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$52	.dwtag  DW_TAG_variable, DW_AT_name("startBitPol")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("startBitPol")
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$52, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$53	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$53, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |265| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |265| startBitPol
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |265| baseAdd
	.dwpsn	file "../mcspi.c",line 266,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |266| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |266| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |266| 
        ADD       r0, r0, r1            ; [ALU_PRU] |266| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |266| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |266| 
        LDI       r0, 0x012c            ; [ALU_PRU] |266| 
        ADD       r0, r1, r0            ; [ALU_PRU] |266| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |266| 
        CLR       r1, r1, 0x00000018    ; [ALU_PRU] |266| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |266| 
	.dwpsn	file "../mcspi.c",line 267,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |267| startBitPol
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |267| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |267| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |267| 
        ADD       r0, r0, r1            ; [ALU_PRU] |267| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |267| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |267| 
        LDI       r0, 0x012c            ; [ALU_PRU] |267| 
        ADD       r0, r1, r0            ; [ALU_PRU] |267| 
        LDI32     r1, 0x01000000        ; [ALU_PRU] |267| 
        AND       r1, r14, r1           ; [ALU_PRU] |267| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |267| 
        OR        r1, r14, r1           ; [ALU_PRU] |267| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |267| 
	.dwpsn	file "../mcspi.c",line 268,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$54	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$54, DW_AT_low_pc(0x00)
	.dwattr $C$DW$54, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$47, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$47, DW_AT_TI_end_line(0x10c)
	.dwattr $C$DW$47, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$47

	.sect	".text:SPI_StartBitDisable"
	.clink
	.global	||SPI_StartBitDisable||

$C$DW$55	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_StartBitDisable")
	.dwattr $C$DW$55, DW_AT_low_pc(||SPI_StartBitDisable||)
	.dwattr $C$DW$55, DW_AT_high_pc(0x00)
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("SPI_StartBitDisable")
	.dwattr $C$DW$55, DW_AT_external
	.dwattr $C$DW$55, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$55, DW_AT_TI_begin_line(0x11b)
	.dwattr $C$DW$55, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$55, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$55, DW_AT_decl_line(0x11b)
	.dwattr $C$DW$55, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$55, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 284,column 1,is_stmt,address ||SPI_StartBitDisable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_StartBitDisable||
$C$DW$56	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$56, DW_AT_location[DW_OP_regx 0x38]
$C$DW$57	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$57, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$58	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$58, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$59	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$59, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |284| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |284| baseAdd
	.dwpsn	file "../mcspi.c",line 285,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |285| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |285| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |285| 
        ADD       r0, r0, r1            ; [ALU_PRU] |285| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |285| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |285| 
        LDI       r0, 0x012c            ; [ALU_PRU] |285| 
        ADD       r0, r1, r0            ; [ALU_PRU] |285| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |285| 
        CLR       r1, r1, 0x00000017    ; [ALU_PRU] |285| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |285| 
	.dwpsn	file "../mcspi.c",line 286,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$60	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$60, DW_AT_low_pc(0x00)
	.dwattr $C$DW$60, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$55, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$55, DW_AT_TI_end_line(0x11e)
	.dwattr $C$DW$55, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$55

	.sect	".text:SPI_MasterModeEnable"
	.clink
	.global	||SPI_MasterModeEnable||

$C$DW$61	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_MasterModeEnable")
	.dwattr $C$DW$61, DW_AT_low_pc(||SPI_MasterModeEnable||)
	.dwattr $C$DW$61, DW_AT_high_pc(0x00)
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("SPI_MasterModeEnable")
	.dwattr $C$DW$61, DW_AT_external
	.dwattr $C$DW$61, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$61, DW_AT_TI_begin_line(0x127)
	.dwattr $C$DW$61, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$61, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$61, DW_AT_decl_line(0x127)
	.dwattr $C$DW$61, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$61, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../mcspi.c",line 296,column 1,is_stmt,address ||SPI_MasterModeEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_MasterModeEnable||
$C$DW$62	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$62, DW_AT_location[DW_OP_regx 0x38]

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
$C$DW$63	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$63, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |296| baseAdd
	.dwpsn	file "../mcspi.c",line 297,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |297| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |297| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |297| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |297| 
        CLR       r1, r1, 0x00000002    ; [ALU_PRU] |297| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |297| 
	.dwpsn	file "../mcspi.c",line 298,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$64	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$64, DW_AT_low_pc(0x00)
	.dwattr $C$DW$64, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$61, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$61, DW_AT_TI_end_line(0x12a)
	.dwattr $C$DW$61, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$61

	.sect	".text:SPI_SlaveModeEnable"
	.clink
	.global	||SPI_SlaveModeEnable||

$C$DW$65	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SlaveModeEnable")
	.dwattr $C$DW$65, DW_AT_low_pc(||SPI_SlaveModeEnable||)
	.dwattr $C$DW$65, DW_AT_high_pc(0x00)
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("SPI_SlaveModeEnable")
	.dwattr $C$DW$65, DW_AT_external
	.dwattr $C$DW$65, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$65, DW_AT_TI_begin_line(0x133)
	.dwattr $C$DW$65, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$65, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$65, DW_AT_decl_line(0x133)
	.dwattr $C$DW$65, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$65, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../mcspi.c",line 308,column 1,is_stmt,address ||SPI_SlaveModeEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SlaveModeEnable||
$C$DW$66	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$66, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$66, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$66, DW_AT_location[DW_OP_regx 0x38]

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
$C$DW$67	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$67, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |308| baseAdd
	.dwpsn	file "../mcspi.c",line 309,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |309| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |309| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |309| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |309| 
        SET       r1, r1, 0x00000002    ; [ALU_PRU] |309| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |309| 
	.dwpsn	file "../mcspi.c",line 310,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$68	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$68, DW_AT_low_pc(0x00)
	.dwattr $C$DW$68, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$65, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$65, DW_AT_TI_end_line(0x136)
	.dwattr $C$DW$65, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$65

	.sect	".text:SPI_ChannelEnable"
	.clink
	.global	||SPI_ChannelEnable||

$C$DW$69	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ChannelEnable")
	.dwattr $C$DW$69, DW_AT_low_pc(||SPI_ChannelEnable||)
	.dwattr $C$DW$69, DW_AT_high_pc(0x00)
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("SPI_ChannelEnable")
	.dwattr $C$DW$69, DW_AT_external
	.dwattr $C$DW$69, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$69, DW_AT_TI_begin_line(0x1c8)
	.dwattr $C$DW$69, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$69, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$69, DW_AT_decl_line(0x1c8)
	.dwattr $C$DW$69, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$69, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 457,column 1,is_stmt,address ||SPI_ChannelEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ChannelEnable||
$C$DW$70	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$70, DW_AT_location[DW_OP_regx 0x38]
$C$DW$71	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$71, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_ChannelEnable             FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_ChannelEnable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$72	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$72, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$72, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$73	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$73, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |457| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |457| baseAdd
	.dwpsn	file "../mcspi.c",line 458,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |458| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |458| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |458| 
        ADD       r0, r0, r1            ; [ALU_PRU] |458| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |458| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |458| 
        LDI       r0, 0x0134            ; [ALU_PRU] |458| 
        ADD       r0, r1, r0            ; [ALU_PRU] |458| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |458| 
        SET       r1, r1, 0x00000000    ; [ALU_PRU] |458| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |458| 
	.dwpsn	file "../mcspi.c",line 459,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$74	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$74, DW_AT_low_pc(0x00)
	.dwattr $C$DW$74, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$69, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$69, DW_AT_TI_end_line(0x1cb)
	.dwattr $C$DW$69, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$69

	.sect	".text:SPI_ChannelDisable"
	.clink
	.global	||SPI_ChannelDisable||

$C$DW$75	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ChannelDisable")
	.dwattr $C$DW$75, DW_AT_low_pc(||SPI_ChannelDisable||)
	.dwattr $C$DW$75, DW_AT_high_pc(0x00)
	.dwattr $C$DW$75, DW_AT_TI_symbol_name("SPI_ChannelDisable")
	.dwattr $C$DW$75, DW_AT_external
	.dwattr $C$DW$75, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$75, DW_AT_TI_begin_line(0x1da)
	.dwattr $C$DW$75, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$75, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$75, DW_AT_decl_line(0x1da)
	.dwattr $C$DW$75, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$75, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 475,column 1,is_stmt,address ||SPI_ChannelDisable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ChannelDisable||
$C$DW$76	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$76, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$76, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$76, DW_AT_location[DW_OP_regx 0x38]
$C$DW$77	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$77, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$77, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$77, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_ChannelDisable            FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_ChannelDisable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$78	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$78, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$78, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$78, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$79	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$79, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$79, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$79, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |475| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |475| baseAdd
	.dwpsn	file "../mcspi.c",line 476,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |476| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |476| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |476| 
        ADD       r0, r0, r1            ; [ALU_PRU] |476| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |476| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |476| 
        LDI       r0, 0x0134            ; [ALU_PRU] |476| 
        ADD       r0, r1, r0            ; [ALU_PRU] |476| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |476| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |476| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |476| 
	.dwpsn	file "../mcspi.c",line 477,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$80	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$80, DW_AT_low_pc(0x00)
	.dwattr $C$DW$80, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$75, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$75, DW_AT_TI_end_line(0x1dd)
	.dwattr $C$DW$75, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$75

	.sect	".text:SPI_Reset"
	.clink
	.global	||SPI_Reset||

$C$DW$81	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_Reset")
	.dwattr $C$DW$81, DW_AT_low_pc(||SPI_Reset||)
	.dwattr $C$DW$81, DW_AT_high_pc(0x00)
	.dwattr $C$DW$81, DW_AT_TI_symbol_name("SPI_Reset")
	.dwattr $C$DW$81, DW_AT_external
	.dwattr $C$DW$81, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$81, DW_AT_TI_begin_line(0x1e6)
	.dwattr $C$DW$81, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$81, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$81, DW_AT_decl_line(0x1e6)
	.dwattr $C$DW$81, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$81, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../mcspi.c",line 487,column 1,is_stmt,address ||SPI_Reset||,isa 0

	.dwfde $C$DW$CIE, ||SPI_Reset||
$C$DW$82	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$82, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$82, DW_AT_location[DW_OP_regx 0x38]

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
$C$DW$83	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$83, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$83, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |487| baseAdd
	.dwpsn	file "../mcspi.c",line 488,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |488| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |488| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |488| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |488| 
        SET       r1, r1, 0x00000001    ; [ALU_PRU] |488| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |488| 
	.dwpsn	file "../mcspi.c",line 489,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0114         ; [ALU_PRU] |489| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L1||
;*
;*   Loop source line                : 489
;*   Loop closing brace source line  : 489
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L1||:    
	.dwpsn	file "../mcspi.c",line 489,column 8,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |489| baseAdd
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |489| 
        QBBC      ||$C$L1||, r0, 0x00   ; [ALU_PRU] |489| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 490,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$84	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$84, DW_AT_low_pc(0x00)
	.dwattr $C$DW$84, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$81, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$81, DW_AT_TI_end_line(0x1ea)
	.dwattr $C$DW$81, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$81

	.sect	".text:SPI_TurboModeEnable"
	.clink
	.global	||SPI_TurboModeEnable||

$C$DW$85	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TurboModeEnable")
	.dwattr $C$DW$85, DW_AT_low_pc(||SPI_TurboModeEnable||)
	.dwattr $C$DW$85, DW_AT_high_pc(0x00)
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("SPI_TurboModeEnable")
	.dwattr $C$DW$85, DW_AT_external
	.dwattr $C$DW$85, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$85, DW_AT_TI_begin_line(0x1f9)
	.dwattr $C$DW$85, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$85, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$85, DW_AT_decl_line(0x1f9)
	.dwattr $C$DW$85, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$85, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 506,column 1,is_stmt,address ||SPI_TurboModeEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_TurboModeEnable||
$C$DW$86	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$86, DW_AT_location[DW_OP_regx 0x38]
$C$DW$87	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$87, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_TurboModeEnable           FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_TurboModeEnable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$88	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$88, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$88, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$89	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$89, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$89, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |506| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |506| baseAdd
	.dwpsn	file "../mcspi.c",line 507,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |507| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |507| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |507| 
        ADD       r0, r0, r1            ; [ALU_PRU] |507| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |507| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |507| 
        LDI       r0, 0x012c            ; [ALU_PRU] |507| 
        ADD       r0, r1, r0            ; [ALU_PRU] |507| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |507| 
        SET       r1, r1, 0x00000013    ; [ALU_PRU] |507| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |507| 
	.dwpsn	file "../mcspi.c",line 508,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$90	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$90, DW_AT_low_pc(0x00)
	.dwattr $C$DW$90, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$85, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$85, DW_AT_TI_end_line(0x1fc)
	.dwattr $C$DW$85, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$85

	.sect	".text:SPI_TurboModeDisable"
	.clink
	.global	||SPI_TurboModeDisable||

$C$DW$91	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TurboModeDisable")
	.dwattr $C$DW$91, DW_AT_low_pc(||SPI_TurboModeDisable||)
	.dwattr $C$DW$91, DW_AT_high_pc(0x00)
	.dwattr $C$DW$91, DW_AT_TI_symbol_name("SPI_TurboModeDisable")
	.dwattr $C$DW$91, DW_AT_external
	.dwattr $C$DW$91, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$91, DW_AT_TI_begin_line(0x20b)
	.dwattr $C$DW$91, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$91, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$91, DW_AT_decl_line(0x20b)
	.dwattr $C$DW$91, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$91, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 524,column 1,is_stmt,address ||SPI_TurboModeDisable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_TurboModeDisable||
$C$DW$92	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$92, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$92, DW_AT_location[DW_OP_regx 0x38]
$C$DW$93	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$93, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$93, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_TurboModeDisable          FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_TurboModeDisable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$94	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$94, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$94, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$94, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$95	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$95, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |524| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |524| baseAdd
	.dwpsn	file "../mcspi.c",line 525,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |525| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |525| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |525| 
        ADD       r0, r0, r1            ; [ALU_PRU] |525| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |525| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |525| 
        LDI       r0, 0x012c            ; [ALU_PRU] |525| 
        ADD       r0, r1, r0            ; [ALU_PRU] |525| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |525| 
        CLR       r1, r1, 0x00000013    ; [ALU_PRU] |525| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |525| 
	.dwpsn	file "../mcspi.c",line 526,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$96	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$96, DW_AT_low_pc(0x00)
	.dwattr $C$DW$96, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$91, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$91, DW_AT_TI_end_line(0x20e)
	.dwattr $C$DW$91, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$91

	.sect	".text:SPI_DataPinDirectionConfig"
	.clink
	.global	||SPI_DataPinDirectionConfig||

$C$DW$97	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DataPinDirectionConfig")
	.dwattr $C$DW$97, DW_AT_low_pc(||SPI_DataPinDirectionConfig||)
	.dwattr $C$DW$97, DW_AT_high_pc(0x00)
	.dwattr $C$DW$97, DW_AT_TI_symbol_name("SPI_DataPinDirectionConfig")
	.dwattr $C$DW$97, DW_AT_external
	.dwattr $C$DW$97, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$97, DW_AT_TI_begin_line(0x21f)
	.dwattr $C$DW$97, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$97, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$97, DW_AT_decl_line(0x21f)
	.dwattr $C$DW$97, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$97, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 544,column 1,is_stmt,address ||SPI_DataPinDirectionConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DataPinDirectionConfig||
$C$DW$98	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$98, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$98, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$98, DW_AT_location[DW_OP_regx 0x38]
$C$DW$99	.dwtag  DW_TAG_formal_parameter, DW_AT_name("datDirection")
	.dwattr $C$DW$99, DW_AT_TI_symbol_name("datDirection")
	.dwattr $C$DW$99, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$99, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$100	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$100, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$101	.dwtag  DW_TAG_variable, DW_AT_name("datDirection")
	.dwattr $C$DW$101, DW_AT_TI_symbol_name("datDirection")
	.dwattr $C$DW$101, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$101, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |544| datDirection
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |544| baseAdd
	.dwpsn	file "../mcspi.c",line 545,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |545| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |545| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |545| 
        LDI32     r1, 0xfffffcff        ; [ALU_PRU] |545| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |545| 
        AND       r1, r14, r1           ; [ALU_PRU] |545| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |545| 
	.dwpsn	file "../mcspi.c",line 546,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |546| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |546| baseAdd
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |546| datDirection
        ADD       r0, r1, r0            ; [ALU_PRU] |546| 
        LDI       r1, 0x0300            ; [ALU_PRU] |546| 
        AND       r1, r14, r1           ; [ALU_PRU] |546| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |546| 
        OR        r1, r14, r1           ; [ALU_PRU] |546| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |546| 
	.dwpsn	file "../mcspi.c",line 547,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$102	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$102, DW_AT_low_pc(0x00)
	.dwattr $C$DW$102, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$97, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$97, DW_AT_TI_end_line(0x223)
	.dwattr $C$DW$97, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$97

	.sect	".text:SPI_TxFIFOConfig"
	.clink
	.global	||SPI_TxFIFOConfig||

$C$DW$103	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TxFIFOConfig")
	.dwattr $C$DW$103, DW_AT_low_pc(||SPI_TxFIFOConfig||)
	.dwattr $C$DW$103, DW_AT_high_pc(0x00)
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("SPI_TxFIFOConfig")
	.dwattr $C$DW$103, DW_AT_external
	.dwattr $C$DW$103, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$103, DW_AT_TI_begin_line(0x239)
	.dwattr $C$DW$103, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$103, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$103, DW_AT_decl_line(0x239)
	.dwattr $C$DW$103, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$103, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 570,column 1,is_stmt,address ||SPI_TxFIFOConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_TxFIFOConfig||
$C$DW$104	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$104, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$104, DW_AT_location[DW_OP_regx 0x38]
$C$DW$105	.dwtag  DW_TAG_formal_parameter, DW_AT_name("txFifo")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("txFifo")
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$105, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$106	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$106, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$106, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$106, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$107	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$107, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$107, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$107, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$108	.dwtag  DW_TAG_variable, DW_AT_name("txFifo")
	.dwattr $C$DW$108, DW_AT_TI_symbol_name("txFifo")
	.dwattr $C$DW$108, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$108, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$109	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$109, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$109, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$109, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |570| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |570| txFifo
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |570| baseAdd
	.dwpsn	file "../mcspi.c",line 571,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |571| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |571| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |571| 
        ADD       r0, r0, r1            ; [ALU_PRU] |571| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |571| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |571| 
        LDI       r0, 0x012c            ; [ALU_PRU] |571| 
        ADD       r0, r1, r0            ; [ALU_PRU] |571| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |571| 
        CLR       r1, r1, 0x0000001b    ; [ALU_PRU] |571| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |571| 
	.dwpsn	file "../mcspi.c",line 572,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |572| txFifo
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |572| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |572| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |572| 
        ADD       r0, r0, r1            ; [ALU_PRU] |572| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |572| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |572| 
        LDI       r0, 0x012c            ; [ALU_PRU] |572| 
        ADD       r0, r1, r0            ; [ALU_PRU] |572| 
        LDI32     r1, 0x08000000        ; [ALU_PRU] |572| 
        AND       r1, r14, r1           ; [ALU_PRU] |572| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |572| 
        OR        r1, r14, r1           ; [ALU_PRU] |572| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |572| 
	.dwpsn	file "../mcspi.c",line 573,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$110	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$110, DW_AT_low_pc(0x00)
	.dwattr $C$DW$110, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$103, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$103, DW_AT_TI_end_line(0x23d)
	.dwattr $C$DW$103, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$103

	.sect	".text:SPI_RxFIFOConfig"
	.clink
	.global	||SPI_RxFIFOConfig||

$C$DW$111	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_RxFIFOConfig")
	.dwattr $C$DW$111, DW_AT_low_pc(||SPI_RxFIFOConfig||)
	.dwattr $C$DW$111, DW_AT_high_pc(0x00)
	.dwattr $C$DW$111, DW_AT_TI_symbol_name("SPI_RxFIFOConfig")
	.dwattr $C$DW$111, DW_AT_external
	.dwattr $C$DW$111, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$111, DW_AT_TI_begin_line(0x253)
	.dwattr $C$DW$111, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$111, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$111, DW_AT_decl_line(0x253)
	.dwattr $C$DW$111, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$111, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 596,column 1,is_stmt,address ||SPI_RxFIFOConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_RxFIFOConfig||
$C$DW$112	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$112, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$112, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$112, DW_AT_location[DW_OP_regx 0x38]
$C$DW$113	.dwtag  DW_TAG_formal_parameter, DW_AT_name("rxFifo")
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("rxFifo")
	.dwattr $C$DW$113, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$113, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$114	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$114, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$114, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$114, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$115	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$115, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$116	.dwtag  DW_TAG_variable, DW_AT_name("rxFifo")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("rxFifo")
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$116, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$117	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$117, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |596| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |596| rxFifo
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |596| baseAdd
	.dwpsn	file "../mcspi.c",line 597,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |597| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |597| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |597| 
        ADD       r0, r0, r1            ; [ALU_PRU] |597| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |597| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |597| 
        LDI       r0, 0x012c            ; [ALU_PRU] |597| 
        ADD       r0, r1, r0            ; [ALU_PRU] |597| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |597| 
        CLR       r1, r1, 0x0000001c    ; [ALU_PRU] |597| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |597| 
	.dwpsn	file "../mcspi.c",line 598,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |598| rxFifo
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |598| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |598| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |598| 
        ADD       r0, r0, r1            ; [ALU_PRU] |598| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |598| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |598| 
        LDI       r0, 0x012c            ; [ALU_PRU] |598| 
        ADD       r0, r1, r0            ; [ALU_PRU] |598| 
        LDI32     r1, 0x10000000        ; [ALU_PRU] |598| 
        AND       r1, r14, r1           ; [ALU_PRU] |598| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |598| 
        OR        r1, r14, r1           ; [ALU_PRU] |598| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |598| 
	.dwpsn	file "../mcspi.c",line 599,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$118	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$118, DW_AT_low_pc(0x00)
	.dwattr $C$DW$118, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$111, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$111, DW_AT_TI_end_line(0x257)
	.dwattr $C$DW$111, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$111

	.sect	".text:SPI_WordCountSet"
	.clink
	.global	||SPI_WordCountSet||

$C$DW$119	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_WordCountSet")
	.dwattr $C$DW$119, DW_AT_low_pc(||SPI_WordCountSet||)
	.dwattr $C$DW$119, DW_AT_high_pc(0x00)
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("SPI_WordCountSet")
	.dwattr $C$DW$119, DW_AT_external
	.dwattr $C$DW$119, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$119, DW_AT_TI_begin_line(0x29b)
	.dwattr $C$DW$119, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$119, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$119, DW_AT_decl_line(0x29b)
	.dwattr $C$DW$119, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$119, DW_AT_TI_max_frame_size(0x06)
	.dwpsn	file "../mcspi.c",line 668,column 1,is_stmt,address ||SPI_WordCountSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_WordCountSet||
$C$DW$120	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$120, DW_AT_location[DW_OP_regx 0x38]
$C$DW$121	.dwtag  DW_TAG_formal_parameter, DW_AT_name("wCnt")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("wCnt")
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$121, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$122	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$122, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$123	.dwtag  DW_TAG_variable, DW_AT_name("wCnt")
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("wCnt")
	.dwattr $C$DW$123, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$123, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15.w0, r2, 4, 2     ; [ALU_PRU] |668| wCnt
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |668| baseAdd
	.dwpsn	file "../mcspi.c",line 669,column 2,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |669| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |669| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |669| 
        LDI       r1, 0xffff            ; [ALU_PRU] |669| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |669| 
        AND       r1, r14, r1           ; [ALU_PRU] |669| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |669| 
	.dwpsn	file "../mcspi.c",line 670,column 2,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |670| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |670| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |670| 
        LBBO      &r1.w0, r2, 4, 2      ; [ALU_PRU] |670| wCnt
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |670| 
        LSL       r1, r1.w0, 0x10       ; [ALU_PRU] |670| 
        OR        r1, r14, r1           ; [ALU_PRU] |670| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |670| 
	.dwpsn	file "../mcspi.c",line 671,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x06          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$124	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$124, DW_AT_low_pc(0x00)
	.dwattr $C$DW$124, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$119, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$119, DW_AT_TI_end_line(0x29f)
	.dwattr $C$DW$119, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$119

	.sect	".text:SPI_DMAEnable"
	.clink
	.global	||SPI_DMAEnable||

$C$DW$125	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DMAEnable")
	.dwattr $C$DW$125, DW_AT_low_pc(||SPI_DMAEnable||)
	.dwattr $C$DW$125, DW_AT_high_pc(0x00)
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("SPI_DMAEnable")
	.dwattr $C$DW$125, DW_AT_external
	.dwattr $C$DW$125, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$125, DW_AT_TI_begin_line(0x2b4)
	.dwattr $C$DW$125, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$125, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$125, DW_AT_decl_line(0x2b4)
	.dwattr $C$DW$125, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$125, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 693,column 1,is_stmt,address ||SPI_DMAEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DMAEnable||
$C$DW$126	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$126, DW_AT_location[DW_OP_regx 0x38]
$C$DW$127	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dmaFlags")
	.dwattr $C$DW$127, DW_AT_TI_symbol_name("dmaFlags")
	.dwattr $C$DW$127, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$127, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$128	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$128, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_DMAEnable                 FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_DMAEnable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$129	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$129, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$130	.dwtag  DW_TAG_variable, DW_AT_name("dmaFlags")
	.dwattr $C$DW$130, DW_AT_TI_symbol_name("dmaFlags")
	.dwattr $C$DW$130, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$130, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$131	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$131, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$131, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |693| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |693| dmaFlags
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |693| baseAdd
	.dwpsn	file "../mcspi.c",line 694,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |694| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |694| 
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |694| dmaFlags
        LSL       r0, r0, 0x04          ; [ALU_PRU] |694| 
        ADD       r0, r0, r1            ; [ALU_PRU] |694| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |694| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |694| 
        LDI       r0, 0x012c            ; [ALU_PRU] |694| 
        ADD       r0, r1, r0            ; [ALU_PRU] |694| 
        LDI       r1, 0xc000            ; [ALU_PRU] |694| 
        AND       r1, r14, r1           ; [ALU_PRU] |694| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |694| 
        OR        r1, r14, r1           ; [ALU_PRU] |694| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |694| 
	.dwpsn	file "../mcspi.c",line 695,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$132	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$132, DW_AT_low_pc(0x00)
	.dwattr $C$DW$132, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$125, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$125, DW_AT_TI_end_line(0x2b7)
	.dwattr $C$DW$125, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$125

	.sect	".text:SPI_DMADisable"
	.clink
	.global	||SPI_DMADisable||

$C$DW$133	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DMADisable")
	.dwattr $C$DW$133, DW_AT_low_pc(||SPI_DMADisable||)
	.dwattr $C$DW$133, DW_AT_high_pc(0x00)
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("SPI_DMADisable")
	.dwattr $C$DW$133, DW_AT_external
	.dwattr $C$DW$133, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$133, DW_AT_TI_begin_line(0x2cc)
	.dwattr $C$DW$133, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$133, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$133, DW_AT_decl_line(0x2cc)
	.dwattr $C$DW$133, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$133, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 717,column 1,is_stmt,address ||SPI_DMADisable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DMADisable||
$C$DW$134	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$134, DW_AT_location[DW_OP_regx 0x38]
$C$DW$135	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dmaFlags")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("dmaFlags")
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$135, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$136	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$136, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$136, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_DMADisable                FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_DMADisable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 12
$C$DW$137	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$137, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$138	.dwtag  DW_TAG_variable, DW_AT_name("dmaFlags")
	.dwattr $C$DW$138, DW_AT_TI_symbol_name("dmaFlags")
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$138, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$139	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$139, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |717| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |717| dmaFlags
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |717| baseAdd
	.dwpsn	file "../mcspi.c",line 718,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |718| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |718| 
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |718| dmaFlags
        LSL       r0, r0, 0x04          ; [ALU_PRU] |718| 
        ADD       r0, r0, r1            ; [ALU_PRU] |718| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |718| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |718| 
        LDI       r0, 0x012c            ; [ALU_PRU] |718| 
        ADD       r0, r1, r0            ; [ALU_PRU] |718| 
        LDI       r1, 0xc000            ; [ALU_PRU] |718| 
        AND       r1, r14, r1           ; [ALU_PRU] |718| 
        NOT       r1, r1                ; [ALU_PRU] |718| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |718| 
        AND       r1, r14, r1           ; [ALU_PRU] |718| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |718| 
	.dwpsn	file "../mcspi.c",line 719,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$140	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$140, DW_AT_low_pc(0x00)
	.dwattr $C$DW$140, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$133, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$133, DW_AT_TI_end_line(0x2cf)
	.dwattr $C$DW$133, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$133

	.sect	".text:SPI_IntEnable"
	.clink
	.global	||SPI_IntEnable||

$C$DW$141	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_IntEnable")
	.dwattr $C$DW$141, DW_AT_low_pc(||SPI_IntEnable||)
	.dwattr $C$DW$141, DW_AT_high_pc(0x00)
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("SPI_IntEnable")
	.dwattr $C$DW$141, DW_AT_external
	.dwattr $C$DW$141, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$141, DW_AT_TI_begin_line(0x2ee)
	.dwattr $C$DW$141, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$141, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$141, DW_AT_decl_line(0x2ee)
	.dwattr $C$DW$141, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$141, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 751,column 1,is_stmt,address ||SPI_IntEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_IntEnable||
$C$DW$142	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$142, DW_AT_location[DW_OP_regx 0x38]
$C$DW$143	.dwtag  DW_TAG_formal_parameter, DW_AT_name("intFlags")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$143, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_IntEnable                 FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_IntEnable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$144	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$144, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$145	.dwtag  DW_TAG_variable, DW_AT_name("intFlags")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$145, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |751| intFlags
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |751| baseAdd
	.dwpsn	file "../mcspi.c",line 752,column 2,is_stmt,isa 0
        LDI       r0, 0x011c            ; [ALU_PRU] |752| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |752| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |752| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |752| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |752| intFlags
        OR        r1, r14, r1           ; [ALU_PRU] |752| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |752| 
	.dwpsn	file "../mcspi.c",line 753,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$146	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$146, DW_AT_low_pc(0x00)
	.dwattr $C$DW$146, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$141, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$141, DW_AT_TI_end_line(0x2f1)
	.dwattr $C$DW$141, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$141

	.sect	".text:SPI_IntDisable"
	.clink
	.global	||SPI_IntDisable||

$C$DW$147	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_IntDisable")
	.dwattr $C$DW$147, DW_AT_low_pc(||SPI_IntDisable||)
	.dwattr $C$DW$147, DW_AT_high_pc(0x00)
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("SPI_IntDisable")
	.dwattr $C$DW$147, DW_AT_external
	.dwattr $C$DW$147, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$147, DW_AT_TI_begin_line(0x30e)
	.dwattr $C$DW$147, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$147, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$147, DW_AT_decl_line(0x30e)
	.dwattr $C$DW$147, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$147, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 783,column 1,is_stmt,address ||SPI_IntDisable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_IntDisable||
$C$DW$148	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$148, DW_AT_location[DW_OP_regx 0x38]
$C$DW$149	.dwtag  DW_TAG_formal_parameter, DW_AT_name("intFlags")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$149, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_IntDisable                FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_IntDisable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$150	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$150, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$151	.dwtag  DW_TAG_variable, DW_AT_name("intFlags")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$151, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |783| intFlags
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |783| baseAdd
	.dwpsn	file "../mcspi.c",line 784,column 2,is_stmt,isa 0
        LDI       r0, 0x011c            ; [ALU_PRU] |784| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |784| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |784| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |784| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |784| intFlags
        NOT       r1, r1                ; [ALU_PRU] |784| 
        AND       r1, r14, r1           ; [ALU_PRU] |784| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |784| 
	.dwpsn	file "../mcspi.c",line 785,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$152	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$152, DW_AT_low_pc(0x00)
	.dwattr $C$DW$152, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$147, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$147, DW_AT_TI_end_line(0x311)
	.dwattr $C$DW$147, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$147

	.sect	".text:SPI_InitDelayConfig"
	.clink
	.global	||SPI_InitDelayConfig||

$C$DW$153	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_InitDelayConfig")
	.dwattr $C$DW$153, DW_AT_low_pc(||SPI_InitDelayConfig||)
	.dwattr $C$DW$153, DW_AT_high_pc(0x00)
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("SPI_InitDelayConfig")
	.dwattr $C$DW$153, DW_AT_external
	.dwattr $C$DW$153, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$153, DW_AT_TI_begin_line(0x325)
	.dwattr $C$DW$153, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$153, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$153, DW_AT_decl_line(0x325)
	.dwattr $C$DW$153, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$153, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 806,column 1,is_stmt,address ||SPI_InitDelayConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_InitDelayConfig||
$C$DW$154	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$154, DW_AT_location[DW_OP_regx 0x38]
$C$DW$155	.dwtag  DW_TAG_formal_parameter, DW_AT_name("initDelay")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("initDelay")
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$155, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$156	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$156, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$156, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$156, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$157	.dwtag  DW_TAG_variable, DW_AT_name("initDelay")
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("initDelay")
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$157, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |806| initDelay
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |806| baseAdd
	.dwpsn	file "../mcspi.c",line 807,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |807| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |807| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |807| 
        LDI32     r1, 0xffffff8f        ; [ALU_PRU] |807| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |807| 
        AND       r1, r14, r1           ; [ALU_PRU] |807| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |807| 
	.dwpsn	file "../mcspi.c",line 808,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |808| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |808| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |808| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |808| initDelay
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |808| 
        AND       r1, r1, 0x70          ; [ALU_PRU] |808| 
        OR        r1, r14, r1           ; [ALU_PRU] |808| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |808| 
	.dwpsn	file "../mcspi.c",line 809,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$158	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$158, DW_AT_low_pc(0x00)
	.dwattr $C$DW$158, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$153, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$153, DW_AT_TI_end_line(0x329)
	.dwattr $C$DW$153, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$153

	.sect	".text:SPI_SysTestModeConfig"
	.clink
	.global	||SPI_SysTestModeConfig||

$C$DW$159	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SysTestModeConfig")
	.dwattr $C$DW$159, DW_AT_low_pc(||SPI_SysTestModeConfig||)
	.dwattr $C$DW$159, DW_AT_high_pc(0x00)
	.dwattr $C$DW$159, DW_AT_TI_symbol_name("SPI_SysTestModeConfig")
	.dwattr $C$DW$159, DW_AT_external
	.dwattr $C$DW$159, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$159, DW_AT_TI_begin_line(0x338)
	.dwattr $C$DW$159, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$159, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$159, DW_AT_decl_line(0x338)
	.dwattr $C$DW$159, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$159, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 825,column 1,is_stmt,address ||SPI_SysTestModeConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SysTestModeConfig||
$C$DW$160	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$160, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$160, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$160, DW_AT_location[DW_OP_regx 0x38]
$C$DW$161	.dwtag  DW_TAG_formal_parameter, DW_AT_name("sysTest")
	.dwattr $C$DW$161, DW_AT_TI_symbol_name("sysTest")
	.dwattr $C$DW$161, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$161, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$162	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$162, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$162, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$162, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$163	.dwtag  DW_TAG_variable, DW_AT_name("sysTest")
	.dwattr $C$DW$163, DW_AT_TI_symbol_name("sysTest")
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$163, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |825| sysTest
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |825| baseAdd
	.dwpsn	file "../mcspi.c",line 826,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |826| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |826| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |826| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |826| 
        CLR       r1, r1, 0x00000003    ; [ALU_PRU] |826| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |826| 
	.dwpsn	file "../mcspi.c",line 828,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |828| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |828| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |828| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |828| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |828| sysTest
        AND       r1, r1, 0x08          ; [ALU_PRU] |828| 
        OR        r1, r14, r1           ; [ALU_PRU] |828| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |828| 
	.dwpsn	file "../mcspi.c",line 829,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$164	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$164, DW_AT_low_pc(0x00)
	.dwattr $C$DW$164, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$159, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$159, DW_AT_TI_end_line(0x33d)
	.dwattr $C$DW$159, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$159

	.sect	".text:SPI_SlaveSelect"
	.clink
	.global	||SPI_SlaveSelect||

$C$DW$165	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SlaveSelect")
	.dwattr $C$DW$165, DW_AT_low_pc(||SPI_SlaveSelect||)
	.dwattr $C$DW$165, DW_AT_high_pc(0x00)
	.dwattr $C$DW$165, DW_AT_TI_symbol_name("SPI_SlaveSelect")
	.dwattr $C$DW$165, DW_AT_external
	.dwattr $C$DW$165, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$165, DW_AT_TI_begin_line(0x351)
	.dwattr $C$DW$165, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$165, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$165, DW_AT_decl_line(0x351)
	.dwattr $C$DW$165, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$165, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 850,column 1,is_stmt,address ||SPI_SlaveSelect||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SlaveSelect||
$C$DW$166	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$166, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$166, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$166, DW_AT_location[DW_OP_regx 0x38]
$C$DW$167	.dwtag  DW_TAG_formal_parameter, DW_AT_name("slaveSelect")
	.dwattr $C$DW$167, DW_AT_TI_symbol_name("slaveSelect")
	.dwattr $C$DW$167, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$167, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$168	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$168, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$168, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$168, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$169	.dwtag  DW_TAG_variable, DW_AT_name("slaveSelect")
	.dwattr $C$DW$169, DW_AT_TI_symbol_name("slaveSelect")
	.dwattr $C$DW$169, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$169, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |850| slaveSelect
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |850| baseAdd
	.dwpsn	file "../mcspi.c",line 851,column 2,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |851| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |851| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |851| 
        LDI32     r1, 0xff9fffff        ; [ALU_PRU] |851| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |851| 
        AND       r1, r14, r1           ; [ALU_PRU] |851| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |851| 
	.dwpsn	file "../mcspi.c",line 852,column 2,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |852| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |852| baseAdd
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |852| slaveSelect
        ADD       r0, r1, r0            ; [ALU_PRU] |852| 
        LDI32     r1, 0x00600000        ; [ALU_PRU] |852| 
        AND       r1, r14, r1           ; [ALU_PRU] |852| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |852| 
        OR        r1, r14, r1           ; [ALU_PRU] |852| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |852| 
	.dwpsn	file "../mcspi.c",line 853,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$170	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$170, DW_AT_low_pc(0x00)
	.dwattr $C$DW$170, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$165, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$165, DW_AT_TI_end_line(0x355)
	.dwattr $C$DW$165, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$165

	.sect	".text:SPI_TransmitData"
	.clink
	.global	||SPI_TransmitData||

$C$DW$171	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TransmitData")
	.dwattr $C$DW$171, DW_AT_low_pc(||SPI_TransmitData||)
	.dwattr $C$DW$171, DW_AT_high_pc(0x00)
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("SPI_TransmitData")
	.dwattr $C$DW$171, DW_AT_external
	.dwattr $C$DW$171, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$171, DW_AT_TI_begin_line(0x367)
	.dwattr $C$DW$171, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$171, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$171, DW_AT_decl_line(0x367)
	.dwattr $C$DW$171, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$171, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 872,column 1,is_stmt,address ||SPI_TransmitData||,isa 0

	.dwfde $C$DW$CIE, ||SPI_TransmitData||
$C$DW$172	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$172, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$172, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$172, DW_AT_location[DW_OP_regx 0x38]
$C$DW$173	.dwtag  DW_TAG_formal_parameter, DW_AT_name("txData")
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("txData")
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$173, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$174	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$174, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$174, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$174, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$175	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$175, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$175, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$176	.dwtag  DW_TAG_variable, DW_AT_name("txData")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("txData")
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$176, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$177	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$177, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |872| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |872| txData
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |872| baseAdd
	.dwpsn	file "../mcspi.c",line 873,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0138        ; [ALU_PRU] |873| 
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |873| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |873| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |873| 
        ADD       r0, r0, r1            ; [ALU_PRU] |873| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |873| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |873| 
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |873| txData
        SBBO      &r0, r1, r14.w0, 4    ; [ALU_PRU] |873| 
	.dwpsn	file "../mcspi.c",line 874,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$178	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$178, DW_AT_low_pc(0x00)
	.dwattr $C$DW$178, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$171, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$171, DW_AT_TI_end_line(0x36a)
	.dwattr $C$DW$171, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$171

	.sect	".text:SPI_ReceiveData"
	.clink
	.global	||SPI_ReceiveData||

$C$DW$179	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ReceiveData")
	.dwattr $C$DW$179, DW_AT_low_pc(||SPI_ReceiveData||)
	.dwattr $C$DW$179, DW_AT_high_pc(0x00)
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("SPI_ReceiveData")
	.dwattr $C$DW$179, DW_AT_external
	.dwattr $C$DW$179, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$179, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$179, DW_AT_TI_begin_line(0x379)
	.dwattr $C$DW$179, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$179, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$179, DW_AT_decl_line(0x379)
	.dwattr $C$DW$179, DW_AT_decl_column(0x11)
	.dwattr $C$DW$179, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 890,column 1,is_stmt,address ||SPI_ReceiveData||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ReceiveData||
$C$DW$180	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$180, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$180, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$180, DW_AT_location[DW_OP_regx 0x38]
$C$DW$181	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$181, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$181, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$182	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$182, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$183	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$183, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |890| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |890| baseAdd
	.dwpsn	file "../mcspi.c",line 891,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |891| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |891| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |891| 
        ADD       r0, r0, r1            ; [ALU_PRU] |891| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |891| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |891| 
        LDI       r1.w0, 0x013c         ; [ALU_PRU] |891| 
        LBBO      &r14, r0, r1.w0, 4    ; [ALU_PRU] |891| 
	.dwpsn	file "../mcspi.c",line 892,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$184	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$184, DW_AT_low_pc(0x00)
	.dwattr $C$DW$184, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$179, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$179, DW_AT_TI_end_line(0x37c)
	.dwattr $C$DW$179, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$179

	.sect	".text:SPI_IntStatusGet"
	.clink
	.global	||SPI_IntStatusGet||

$C$DW$185	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_IntStatusGet")
	.dwattr $C$DW$185, DW_AT_low_pc(||SPI_IntStatusGet||)
	.dwattr $C$DW$185, DW_AT_high_pc(0x00)
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("SPI_IntStatusGet")
	.dwattr $C$DW$185, DW_AT_external
	.dwattr $C$DW$185, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$185, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$185, DW_AT_TI_begin_line(0x38e)
	.dwattr $C$DW$185, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$185, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$185, DW_AT_decl_line(0x38e)
	.dwattr $C$DW$185, DW_AT_decl_column(0x11)
	.dwattr $C$DW$185, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../mcspi.c",line 911,column 1,is_stmt,address ||SPI_IntStatusGet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_IntStatusGet||
$C$DW$186	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$186, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$186, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$186, DW_AT_location[DW_OP_regx 0x38]

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
$C$DW$187	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$187, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$187, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$187, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |911| baseAdd
	.dwpsn	file "../mcspi.c",line 912,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0118         ; [ALU_PRU] |912| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |912| baseAdd
        LBBO      &r14, r0, r1.w0, 4    ; [ALU_PRU] |912| 
	.dwpsn	file "../mcspi.c",line 913,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$188	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$188, DW_AT_low_pc(0x00)
	.dwattr $C$DW$188, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$185, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$185, DW_AT_TI_end_line(0x391)
	.dwattr $C$DW$185, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$185

	.sect	".text:SPI_IntStatusClear"
	.clink
	.global	||SPI_IntStatusClear||

$C$DW$189	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_IntStatusClear")
	.dwattr $C$DW$189, DW_AT_low_pc(||SPI_IntStatusClear||)
	.dwattr $C$DW$189, DW_AT_high_pc(0x00)
	.dwattr $C$DW$189, DW_AT_TI_symbol_name("SPI_IntStatusClear")
	.dwattr $C$DW$189, DW_AT_external
	.dwattr $C$DW$189, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$189, DW_AT_TI_begin_line(0x3b0)
	.dwattr $C$DW$189, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$189, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$189, DW_AT_decl_line(0x3b0)
	.dwattr $C$DW$189, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$189, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 945,column 1,is_stmt,address ||SPI_IntStatusClear||,isa 0

	.dwfde $C$DW$CIE, ||SPI_IntStatusClear||
$C$DW$190	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$190, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$190, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$190, DW_AT_location[DW_OP_regx 0x38]
$C$DW$191	.dwtag  DW_TAG_formal_parameter, DW_AT_name("intFlags")
	.dwattr $C$DW$191, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$191, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$191, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$192	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$192, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$192, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$192, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$193	.dwtag  DW_TAG_variable, DW_AT_name("intFlags")
	.dwattr $C$DW$193, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$193, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$193, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |945| intFlags
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |945| baseAdd
	.dwpsn	file "../mcspi.c",line 946,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |946| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |946| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |946| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |946| 
        CLR       r1, r1, 0x0000000b    ; [ALU_PRU] |946| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |946| 
	.dwpsn	file "../mcspi.c",line 947,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0118        ; [ALU_PRU] |947| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |947| baseAdd
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |947| intFlags
        SBBO      &r0, r1, r14.w0, 4    ; [ALU_PRU] |947| 
	.dwpsn	file "../mcspi.c",line 948,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$194	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$194, DW_AT_low_pc(0x00)
	.dwattr $C$DW$194, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$189, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$189, DW_AT_TI_end_line(0x3b4)
	.dwattr $C$DW$189, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$189

	.sect	".text:SPI_ChannelStatusGet"
	.clink
	.global	||SPI_ChannelStatusGet||

$C$DW$195	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ChannelStatusGet")
	.dwattr $C$DW$195, DW_AT_low_pc(||SPI_ChannelStatusGet||)
	.dwattr $C$DW$195, DW_AT_high_pc(0x00)
	.dwattr $C$DW$195, DW_AT_TI_symbol_name("SPI_ChannelStatusGet")
	.dwattr $C$DW$195, DW_AT_external
	.dwattr $C$DW$195, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$195, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$195, DW_AT_TI_begin_line(0x4c6)
	.dwattr $C$DW$195, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$195, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$195, DW_AT_decl_line(0x4c6)
	.dwattr $C$DW$195, DW_AT_decl_column(0x11)
	.dwattr $C$DW$195, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 1223,column 1,is_stmt,address ||SPI_ChannelStatusGet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ChannelStatusGet||
$C$DW$196	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$196, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$196, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$196, DW_AT_location[DW_OP_regx 0x38]
$C$DW$197	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$197, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$197, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$197, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$198	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$198, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$198, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$198, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$199	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$199, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$199, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$199, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1223| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1223| baseAdd
	.dwpsn	file "../mcspi.c",line 1224,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |1224| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |1224| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |1224| 
        ADD       r0, r0, r1            ; [ALU_PRU] |1224| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1224| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1224| 
        LDI       r1.w0, 0x0130         ; [ALU_PRU] |1224| 
        LBBO      &r14, r0, r1.w0, 4    ; [ALU_PRU] |1224| 
	.dwpsn	file "../mcspi.c",line 1225,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$200	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$200, DW_AT_low_pc(0x00)
	.dwattr $C$DW$200, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$195, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$195, DW_AT_TI_end_line(0x4c9)
	.dwattr $C$DW$195, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$195

	.sect	".text:SPI_MultipleWordAccessConfig"
	.clink
	.global	||SPI_MultipleWordAccessConfig||

$C$DW$201	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_MultipleWordAccessConfig")
	.dwattr $C$DW$201, DW_AT_low_pc(||SPI_MultipleWordAccessConfig||)
	.dwattr $C$DW$201, DW_AT_high_pc(0x00)
	.dwattr $C$DW$201, DW_AT_TI_symbol_name("SPI_MultipleWordAccessConfig")
	.dwattr $C$DW$201, DW_AT_external
	.dwattr $C$DW$201, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$201, DW_AT_TI_begin_line(0x4d8)
	.dwattr $C$DW$201, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$201, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$201, DW_AT_decl_line(0x4d8)
	.dwattr $C$DW$201, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$201, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 1241,column 1,is_stmt,address ||SPI_MultipleWordAccessConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_MultipleWordAccessConfig||
$C$DW$202	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$202, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$202, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$202, DW_AT_location[DW_OP_regx 0x38]
$C$DW$203	.dwtag  DW_TAG_formal_parameter, DW_AT_name("moa")
	.dwattr $C$DW$203, DW_AT_TI_symbol_name("moa")
	.dwattr $C$DW$203, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$203, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_MultipleWordAccessConfig  FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_MultipleWordAccessConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$204	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$204, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$204, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$204, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$205	.dwtag  DW_TAG_variable, DW_AT_name("moa")
	.dwattr $C$DW$205, DW_AT_TI_symbol_name("moa")
	.dwattr $C$DW$205, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$205, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1241| moa
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1241| baseAdd
	.dwpsn	file "../mcspi.c",line 1242,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |1242| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1242| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1242| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1242| 
        CLR       r1, r1, 0x00000007    ; [ALU_PRU] |1242| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1242| 
	.dwpsn	file "../mcspi.c",line 1243,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |1243| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1243| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1243| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1243| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1243| moa
        AND       r1, r1, 0x80          ; [ALU_PRU] |1243| 
        OR        r1, r14, r1           ; [ALU_PRU] |1243| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1243| 
	.dwpsn	file "../mcspi.c",line 1244,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$206	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$206, DW_AT_low_pc(0x00)
	.dwattr $C$DW$206, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$201, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$201, DW_AT_TI_end_line(0x4dc)
	.dwattr $C$DW$201, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$201

	.sect	".text:SPI_FIFODatManagementConfig"
	.clink
	.global	||SPI_FIFODatManagementConfig||

$C$DW$207	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_FIFODatManagementConfig")
	.dwattr $C$DW$207, DW_AT_low_pc(||SPI_FIFODatManagementConfig||)
	.dwattr $C$DW$207, DW_AT_high_pc(0x00)
	.dwattr $C$DW$207, DW_AT_TI_symbol_name("SPI_FIFODatManagementConfig")
	.dwattr $C$DW$207, DW_AT_external
	.dwattr $C$DW$207, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$207, DW_AT_TI_begin_line(0x4eb)
	.dwattr $C$DW$207, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$207, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$207, DW_AT_decl_line(0x4eb)
	.dwattr $C$DW$207, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$207, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 1260,column 1,is_stmt,address ||SPI_FIFODatManagementConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_FIFODatManagementConfig||
$C$DW$208	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$208, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$208, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$208, DW_AT_location[DW_OP_regx 0x38]
$C$DW$209	.dwtag  DW_TAG_formal_parameter, DW_AT_name("fdaa")
	.dwattr $C$DW$209, DW_AT_TI_symbol_name("fdaa")
	.dwattr $C$DW$209, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$209, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_FIFODatManagementConfig   FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_FIFODatManagementConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$210	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$210, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$210, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$210, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$211	.dwtag  DW_TAG_variable, DW_AT_name("fdaa")
	.dwattr $C$DW$211, DW_AT_TI_symbol_name("fdaa")
	.dwattr $C$DW$211, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$211, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1260| fdaa
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1260| baseAdd
	.dwpsn	file "../mcspi.c",line 1261,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |1261| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1261| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1261| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1261| 
        CLR       r1, r1, 0x00000008    ; [ALU_PRU] |1261| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1261| 
	.dwpsn	file "../mcspi.c",line 1262,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |1262| 
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |1262| fdaa
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1262| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1262| 
        LDI       r1, 0x0100            ; [ALU_PRU] |1262| 
        AND       r1, r14, r1           ; [ALU_PRU] |1262| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1262| 
        OR        r1, r14, r1           ; [ALU_PRU] |1262| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1262| 
	.dwpsn	file "../mcspi.c",line 1263,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$212	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$212, DW_AT_low_pc(0x00)
	.dwattr $C$DW$212, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$207, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$207, DW_AT_TI_end_line(0x4ef)
	.dwattr $C$DW$207, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$207

	.sect	".text:SPI_AutoIdleConfig"
	.clink
	.global	||SPI_AutoIdleConfig||

$C$DW$213	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_AutoIdleConfig")
	.dwattr $C$DW$213, DW_AT_low_pc(||SPI_AutoIdleConfig||)
	.dwattr $C$DW$213, DW_AT_high_pc(0x00)
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("SPI_AutoIdleConfig")
	.dwattr $C$DW$213, DW_AT_external
	.dwattr $C$DW$213, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$213, DW_AT_TI_begin_line(0x4fe)
	.dwattr $C$DW$213, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$213, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$213, DW_AT_decl_line(0x4fe)
	.dwattr $C$DW$213, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$213, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 1279,column 1,is_stmt,address ||SPI_AutoIdleConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_AutoIdleConfig||
$C$DW$214	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$214, DW_AT_location[DW_OP_regx 0x38]
$C$DW$215	.dwtag  DW_TAG_formal_parameter, DW_AT_name("autoIdle")
	.dwattr $C$DW$215, DW_AT_TI_symbol_name("autoIdle")
	.dwattr $C$DW$215, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$215, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$216	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$216, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$216, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$216, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$217	.dwtag  DW_TAG_variable, DW_AT_name("autoIdle")
	.dwattr $C$DW$217, DW_AT_TI_symbol_name("autoIdle")
	.dwattr $C$DW$217, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$217, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1279| autoIdle
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1279| baseAdd
	.dwpsn	file "../mcspi.c",line 1280,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1280| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1280| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1280| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1280| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |1280| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1280| 
	.dwpsn	file "../mcspi.c",line 1281,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1281| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1281| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1281| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1281| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1281| autoIdle
        AND       r1, r1, 0x01          ; [ALU_PRU] |1281| 
        OR        r1, r14, r1           ; [ALU_PRU] |1281| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1281| 
	.dwpsn	file "../mcspi.c",line 1282,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$218	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$218, DW_AT_low_pc(0x00)
	.dwattr $C$DW$218, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$213, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$213, DW_AT_TI_end_line(0x502)
	.dwattr $C$DW$213, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$213

	.sect	".text:SPI_SmartIdleConfig"
	.clink
	.global	||SPI_SmartIdleConfig||

$C$DW$219	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SmartIdleConfig")
	.dwattr $C$DW$219, DW_AT_low_pc(||SPI_SmartIdleConfig||)
	.dwattr $C$DW$219, DW_AT_high_pc(0x00)
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("SPI_SmartIdleConfig")
	.dwattr $C$DW$219, DW_AT_external
	.dwattr $C$DW$219, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$219, DW_AT_TI_begin_line(0x513)
	.dwattr $C$DW$219, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$219, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$219, DW_AT_decl_line(0x513)
	.dwattr $C$DW$219, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$219, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 1300,column 1,is_stmt,address ||SPI_SmartIdleConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SmartIdleConfig||
$C$DW$220	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$220, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$220, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$220, DW_AT_location[DW_OP_regx 0x38]
$C$DW$221	.dwtag  DW_TAG_formal_parameter, DW_AT_name("smartIdle")
	.dwattr $C$DW$221, DW_AT_TI_symbol_name("smartIdle")
	.dwattr $C$DW$221, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$221, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$222	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$222, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$222, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$222, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$223	.dwtag  DW_TAG_variable, DW_AT_name("smartIdle")
	.dwattr $C$DW$223, DW_AT_TI_symbol_name("smartIdle")
	.dwattr $C$DW$223, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$223, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1300| smartIdle
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1300| baseAdd
	.dwpsn	file "../mcspi.c",line 1301,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1301| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1301| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1301| 
        LDI32     r1, 0xffffffe7        ; [ALU_PRU] |1301| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1301| 
        AND       r1, r14, r1           ; [ALU_PRU] |1301| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1301| 
	.dwpsn	file "../mcspi.c",line 1302,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1302| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1302| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1302| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1302| smartIdle
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1302| 
        AND       r1, r1, 0x18          ; [ALU_PRU] |1302| 
        OR        r1, r14, r1           ; [ALU_PRU] |1302| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1302| 
	.dwpsn	file "../mcspi.c",line 1303,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$224	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$224, DW_AT_low_pc(0x00)
	.dwattr $C$DW$224, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$219, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$219, DW_AT_TI_end_line(0x517)
	.dwattr $C$DW$219, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$219

	.sect	".text:SPI_ClkActivityConfig"
	.clink
	.global	||SPI_ClkActivityConfig||

$C$DW$225	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkActivityConfig")
	.dwattr $C$DW$225, DW_AT_low_pc(||SPI_ClkActivityConfig||)
	.dwattr $C$DW$225, DW_AT_high_pc(0x00)
	.dwattr $C$DW$225, DW_AT_TI_symbol_name("SPI_ClkActivityConfig")
	.dwattr $C$DW$225, DW_AT_external
	.dwattr $C$DW$225, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$225, DW_AT_TI_begin_line(0x527)
	.dwattr $C$DW$225, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$225, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$225, DW_AT_decl_line(0x527)
	.dwattr $C$DW$225, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$225, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../mcspi.c",line 1320,column 1,is_stmt,address ||SPI_ClkActivityConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkActivityConfig||
$C$DW$226	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$226, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$226, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$226, DW_AT_location[DW_OP_regx 0x38]
$C$DW$227	.dwtag  DW_TAG_formal_parameter, DW_AT_name("clkAct")
	.dwattr $C$DW$227, DW_AT_TI_symbol_name("clkAct")
	.dwattr $C$DW$227, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$227, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$228	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$228, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$228, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$228, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$229	.dwtag  DW_TAG_variable, DW_AT_name("clkAct")
	.dwattr $C$DW$229, DW_AT_TI_symbol_name("clkAct")
	.dwattr $C$DW$229, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$229, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1320| clkAct
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1320| baseAdd
	.dwpsn	file "../mcspi.c",line 1321,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1321| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1321| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1321| 
        LDI32     r1, 0xfffffcff        ; [ALU_PRU] |1321| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1321| 
        AND       r1, r14, r1           ; [ALU_PRU] |1321| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1321| 
	.dwpsn	file "../mcspi.c",line 1322,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1322| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1322| baseAdd
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |1322| clkAct
        ADD       r0, r1, r0            ; [ALU_PRU] |1322| 
        LDI       r1, 0x0300            ; [ALU_PRU] |1322| 
        AND       r1, r14, r1           ; [ALU_PRU] |1322| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1322| 
        OR        r1, r14, r1           ; [ALU_PRU] |1322| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1322| 
	.dwpsn	file "../mcspi.c",line 1323,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$230	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$230, DW_AT_low_pc(0x00)
	.dwattr $C$DW$230, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$225, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$225, DW_AT_TI_end_line(0x52b)
	.dwattr $C$DW$225, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$225

	.sect	".text:SPI_ClkConfig"
	.clink
	.global	||SPI_ClkConfig||

$C$DW$231	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkConfig")
	.dwattr $C$DW$231, DW_AT_low_pc(||SPI_ClkConfig||)
	.dwattr $C$DW$231, DW_AT_high_pc(0x00)
	.dwattr $C$DW$231, DW_AT_TI_symbol_name("SPI_ClkConfig")
	.dwattr $C$DW$231, DW_AT_external
	.dwattr $C$DW$231, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$231, DW_AT_TI_begin_line(0x23)
	.dwattr $C$DW$231, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$231, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$231, DW_AT_decl_line(0x23)
	.dwattr $C$DW$231, DW_AT_decl_column(0x06)
	.dwattr $C$DW$231, DW_AT_TI_max_frame_size(0x22)
	.dwpsn	file "../mcspi.c",line 36,column 1,is_stmt,address ||SPI_ClkConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkConfig||
$C$DW$232	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$232, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$232, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$232, DW_AT_location[DW_OP_regx 0x38]
$C$DW$233	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiInClk")
	.dwattr $C$DW$233, DW_AT_TI_symbol_name("spiInClk")
	.dwattr $C$DW$233, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$233, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$234	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiOutClk")
	.dwattr $C$DW$234, DW_AT_TI_symbol_name("spiOutClk")
	.dwattr $C$DW$234, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$234, DW_AT_location[DW_OP_regx 0x40]
$C$DW$235	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$235, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$235, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$235, DW_AT_location[DW_OP_regx 0x44]
$C$DW$236	.dwtag  DW_TAG_formal_parameter, DW_AT_name("clkMode")
	.dwattr $C$DW$236, DW_AT_TI_symbol_name("clkMode")
	.dwattr $C$DW$236, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$236, DW_AT_location[DW_OP_regx 0x48]

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
$C$DW$237	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$237, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$237, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$237, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$238	.dwtag  DW_TAG_variable, DW_AT_name("spiInClk")
	.dwattr $C$DW$238, DW_AT_TI_symbol_name("spiInClk")
	.dwattr $C$DW$238, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$238, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$239	.dwtag  DW_TAG_variable, DW_AT_name("spiOutClk")
	.dwattr $C$DW$239, DW_AT_TI_symbol_name("spiOutClk")
	.dwattr $C$DW$239, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$239, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$240	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$240, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$240, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$240, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
$C$DW$241	.dwtag  DW_TAG_variable, DW_AT_name("clkMode")
	.dwattr $C$DW$241, DW_AT_TI_symbol_name("clkMode")
	.dwattr $C$DW$241, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$241, DW_AT_location[DW_OP_breg8 16]
        NOP                             ; [ALU_PRU] 
$C$DW$242	.dwtag  DW_TAG_variable, DW_AT_name("fRatio")
	.dwattr $C$DW$242, DW_AT_TI_symbol_name("fRatio")
	.dwattr $C$DW$242, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$242, DW_AT_location[DW_OP_breg8 20]
        NOP                             ; [ALU_PRU] 
$C$DW$243	.dwtag  DW_TAG_variable, DW_AT_name("extClk")
	.dwattr $C$DW$243, DW_AT_TI_symbol_name("extClk")
	.dwattr $C$DW$243, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$243, DW_AT_location[DW_OP_breg8 24]
        NOP                             ; [ALU_PRU] 
$C$DW$244	.dwtag  DW_TAG_variable, DW_AT_name("clkD")
	.dwattr $C$DW$244, DW_AT_TI_symbol_name("clkD")
	.dwattr $C$DW$244, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$244, DW_AT_location[DW_OP_breg8 28]
        NOP                             ; [ALU_PRU] 
        SBBO      &r18, r2, 16, 4       ; [ALU_PRU] |36| clkMode
        SBBO      &r17, r2, 12, 4       ; [ALU_PRU] |36| chNum
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |36| spiOutClk
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |36| spiInClk
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |36| baseAdd
	.dwpsn	file "../mcspi.c",line 37,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |37| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |37| fRatio
	.dwpsn	file "../mcspi.c",line 38,column 18,is_stmt,isa 0
        SBBO      &r0, r2, 24, 4        ; [ALU_PRU] |38| extClk
	.dwpsn	file "../mcspi.c",line 39,column 16,is_stmt,isa 0
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |39| clkD
	.dwpsn	file "../mcspi.c",line 42,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |42| spiInClk
        LBBO      &r15, r2, 8, 4        ; [ALU_PRU] |42| spiOutClk
$C$DW$245	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$245, DW_AT_low_pc(0x00)
	.dwattr $C$DW$245, DW_AT_name("__pruabi_divu")
	.dwattr $C$DW$245, DW_AT_TI_call
        JAL       r3.w2, ||__pruabi_divu|| ; [ALU_PRU] |42| __pruabi_divu
        SBBO      &r14, r2, 20, 4       ; [ALU_PRU] |42| fRatio
	.dwpsn	file "../mcspi.c",line 45,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |45| fRatio
        LBBO      &r1, r2, 20, 4        ; [ALU_PRU] |45| fRatio
        SUB       r0, r0, 0x01          ; [ALU_PRU] |45| 
        AND       r0, r1, r0            ; [ALU_PRU] |45| 
        QBEQ      ||$C$L2||, r0, 0x00   ; [ALU_PRU] |45| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 48,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |48| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |48| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |48| 
        ADD       r0, r0, r1            ; [ALU_PRU] |48| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |48| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |48| 
        LDI       r0, 0x012c            ; [ALU_PRU] |48| 
        ADD       r0, r1, r0            ; [ALU_PRU] |48| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |48| 
        SET       r1, r1, 0x0000001d    ; [ALU_PRU] |48| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |48| 
	.dwpsn	file "../mcspi.c",line 51,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |51| fRatio
        SUB       r0, r0, 0x01          ; [ALU_PRU] |51| 
        LSR       r0, r0, 0x04          ; [ALU_PRU] |51| 
        SBBO      &r0, r2, 24, 4        ; [ALU_PRU] |51| extClk
	.dwpsn	file "../mcspi.c",line 52,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |52| fRatio
        SUB       r0, r0, 0x01          ; [ALU_PRU] |52| 
        AND       r0, r0, 0x0f          ; [ALU_PRU] |52| 
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |52| clkD
	.dwpsn	file "../mcspi.c",line 55,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |55| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |55| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |55| 
        ADD       r0, r0, r1            ; [ALU_PRU] |55| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |55| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |55| 
        LDI       r0, 0x0134            ; [ALU_PRU] |55| 
        ADD       r0, r1, r0            ; [ALU_PRU] |55| 
        LDI32     r1, 0xffff00ff        ; [ALU_PRU] |55| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |55| 
        AND       r1, r14, r1           ; [ALU_PRU] |55| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |55| 
	.dwpsn	file "../mcspi.c",line 58,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |58| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |58| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |58| 
        ADD       r0, r0, r1            ; [ALU_PRU] |58| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |58| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |58| 
        LDI       r0, 0x0134            ; [ALU_PRU] |58| 
        ADD       r0, r1, r0            ; [ALU_PRU] |58| 
        LBBO      &r1, r2, 24, 4        ; [ALU_PRU] |58| extClk
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |58| 
        LSL       r1, r1, 0x08          ; [ALU_PRU] |58| 
        OR        r1, r14, r1           ; [ALU_PRU] |58| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |58| 
	.dwpsn	file "../mcspi.c",line 60,column 2,is_stmt,isa 0
        JMP       ||$C$L4||             ; [ALU_PRU] |60| 
;* --------------------------------------------------------------------------*
||$C$L2||:    
	.dwpsn	file "../mcspi.c",line 62,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |62| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |62| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |62| 
        ADD       r0, r0, r1            ; [ALU_PRU] |62| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |62| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |62| 
        LDI       r0, 0x012c            ; [ALU_PRU] |62| 
        ADD       r0, r1, r0            ; [ALU_PRU] |62| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |62| 
        CLR       r1, r1, 0x0000001d    ; [ALU_PRU] |62| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |62| 
	.dwpsn	file "../mcspi.c",line 64,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |64| fRatio
        QBEQ      ||$C$L4||, r0, 0x01   ; [ALU_PRU] |64| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L3||
;*
;*   Loop source line                : 64
;*   Loop closing brace source line  : 68
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L3||:    
	.dwpsn	file "../mcspi.c",line 66,column 4,is_stmt,isa 0
        LSR       r0, r0, 0x01          ; [ALU_PRU] |66| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |66| fRatio
	.dwpsn	file "../mcspi.c",line 67,column 4,is_stmt,isa 0
        LBBO      &r0, r2, 28, 4        ; [ALU_PRU] |67| clkD
        ADD       r0, r0, 0x01          ; [ALU_PRU] |67| 
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |67| clkD
	.dwpsn	file "../mcspi.c",line 64,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |64| fRatio
        QBNE      ||$C$L3||, r0, 0x01   ; [ALU_PRU] |64| 
;* --------------------------------------------------------------------------*
||$C$L4||:    
	.dwpsn	file "../mcspi.c",line 72,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |72| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |72| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |72| 
        ADD       r0, r0, r1            ; [ALU_PRU] |72| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |72| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |72| 
        LDI       r0, 0x012c            ; [ALU_PRU] |72| 
        ADD       r0, r1, r0            ; [ALU_PRU] |72| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |72| 
        LDI32     r1, 0xffffffc3        ; [ALU_PRU] |72| 
        AND       r1, r14, r1           ; [ALU_PRU] |72| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |72| 
	.dwpsn	file "../mcspi.c",line 75,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |75| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |75| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |75| 
        ADD       r0, r0, r1            ; [ALU_PRU] |75| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |75| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |75| 
        LDI       r0, 0x012c            ; [ALU_PRU] |75| 
        ADD       r0, r1, r0            ; [ALU_PRU] |75| 
        LBBO      &r1, r2, 28, 4        ; [ALU_PRU] |75| clkD
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |75| 
        LSL       r1, r1, 0x02          ; [ALU_PRU] |75| 
        OR        r1, r14, r1           ; [ALU_PRU] |75| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |75| 
	.dwpsn	file "../mcspi.c",line 78,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |78| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |78| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |78| 
        ADD       r0, r0, r1            ; [ALU_PRU] |78| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |78| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |78| 
        LDI       r0, 0x012c            ; [ALU_PRU] |78| 
        ADD       r0, r1, r0            ; [ALU_PRU] |78| 
        LDI32     r1, 0xfffffffc        ; [ALU_PRU] |78| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |78| 
        AND       r1, r14, r1           ; [ALU_PRU] |78| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |78| 
	.dwpsn	file "../mcspi.c",line 81,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |81| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |81| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |81| 
        ADD       r0, r0, r1            ; [ALU_PRU] |81| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |81| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |81| 
        LDI       r0, 0x012c            ; [ALU_PRU] |81| 
        ADD       r0, r1, r0            ; [ALU_PRU] |81| 
        LBBO      &r1, r2, 16, 4        ; [ALU_PRU] |81| clkMode
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |81| 
        AND       r1, r1, 0x03          ; [ALU_PRU] |81| 
        OR        r1, r14, r1           ; [ALU_PRU] |81| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |81| 
	.dwpsn	file "../mcspi.c",line 82,column 1,is_stmt,isa 0
        LBBO      &r3.b2, r2, 32, 2     ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
        ADD       r2, r2, 0x22          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$246	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$246, DW_AT_low_pc(0x00)
	.dwattr $C$DW$246, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$231, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$231, DW_AT_TI_end_line(0x52)
	.dwattr $C$DW$231, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$231

	.sect	".text:SPI_CSEnable"
	.clink
	.global	||SPI_CSEnable||

$C$DW$247	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSEnable")
	.dwattr $C$DW$247, DW_AT_low_pc(||SPI_CSEnable||)
	.dwattr $C$DW$247, DW_AT_high_pc(0x00)
	.dwattr $C$DW$247, DW_AT_TI_symbol_name("SPI_CSEnable")
	.dwattr $C$DW$247, DW_AT_external
	.dwattr $C$DW$247, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$247, DW_AT_TI_begin_line(0x7c)
	.dwattr $C$DW$247, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$247, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$247, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$247, DW_AT_decl_column(0x06)
	.dwattr $C$DW$247, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../mcspi.c",line 125,column 1,is_stmt,address ||SPI_CSEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSEnable||
$C$DW$248	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$248, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$248, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$248, DW_AT_location[DW_OP_regx 0x38]

;***************************************************************
;* FNAME: SPI_CSEnable                  FR SIZE:   4           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            4 Auto,  0 SOE     *
;***************************************************************

||SPI_CSEnable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 4
$C$DW$249	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$249, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$249, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$249, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |125| baseAdd
	.dwpsn	file "../mcspi.c",line 126,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |126| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |126| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |126| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |126| 
        CLR       r1, r1, 0x00000001    ; [ALU_PRU] |126| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |126| 
	.dwpsn	file "../mcspi.c",line 127,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$250	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$250, DW_AT_low_pc(0x00)
	.dwattr $C$DW$250, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$247, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$247, DW_AT_TI_end_line(0x7f)
	.dwattr $C$DW$247, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$247

	.sect	".text:SPI_MasterModeConfig"
	.clink
	.global	||SPI_MasterModeConfig||

$C$DW$251	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_MasterModeConfig")
	.dwattr $C$DW$251, DW_AT_low_pc(||SPI_MasterModeConfig||)
	.dwattr $C$DW$251, DW_AT_high_pc(0x00)
	.dwattr $C$DW$251, DW_AT_TI_symbol_name("SPI_MasterModeConfig")
	.dwattr $C$DW$251, DW_AT_external
	.dwattr $C$DW$251, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$251, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$251, DW_AT_TI_begin_line(0x15d)
	.dwattr $C$DW$251, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$251, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$251, DW_AT_decl_line(0x15d)
	.dwattr $C$DW$251, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$251, DW_AT_TI_max_frame_size(0x18)
	.dwpsn	file "../mcspi.c",line 350,column 1,is_stmt,address ||SPI_MasterModeConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_MasterModeConfig||
$C$DW$252	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$252, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$252, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$252, DW_AT_location[DW_OP_regx 0x38]
$C$DW$253	.dwtag  DW_TAG_formal_parameter, DW_AT_name("channelMode")
	.dwattr $C$DW$253, DW_AT_TI_symbol_name("channelMode")
	.dwattr $C$DW$253, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$253, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$254	.dwtag  DW_TAG_formal_parameter, DW_AT_name("trMode")
	.dwattr $C$DW$254, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$254, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$254, DW_AT_location[DW_OP_regx 0x40]
$C$DW$255	.dwtag  DW_TAG_formal_parameter, DW_AT_name("pinMode")
	.dwattr $C$DW$255, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$255, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$255, DW_AT_location[DW_OP_regx 0x44]
$C$DW$256	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$256, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$256, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$256, DW_AT_location[DW_OP_regx 0x48]

;***************************************************************
;* FNAME: SPI_MasterModeConfig          FR SIZE:  24           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           24 Auto,  0 SOE     *
;***************************************************************

||SPI_MasterModeConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x18          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 24
$C$DW$257	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$257, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$257, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$257, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$258	.dwtag  DW_TAG_variable, DW_AT_name("channelMode")
	.dwattr $C$DW$258, DW_AT_TI_symbol_name("channelMode")
	.dwattr $C$DW$258, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$258, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$259	.dwtag  DW_TAG_variable, DW_AT_name("trMode")
	.dwattr $C$DW$259, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$259, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$259, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$260	.dwtag  DW_TAG_variable, DW_AT_name("pinMode")
	.dwattr $C$DW$260, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$260, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$260, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
$C$DW$261	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$261, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$261, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$261, DW_AT_location[DW_OP_breg8 16]
        NOP                             ; [ALU_PRU] 
$C$DW$262	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$262, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$262, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$262, DW_AT_location[DW_OP_breg8 20]
        NOP                             ; [ALU_PRU] 
        SBBO      &r18, r2, 16, 4       ; [ALU_PRU] |350| chNum
        SBBO      &r17, r2, 12, 4       ; [ALU_PRU] |350| pinMode
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |350| trMode
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |350| channelMode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |350| baseAdd
	.dwpsn	file "../mcspi.c",line 351,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |351| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |351| retVal
	.dwpsn	file "../mcspi.c",line 354,column 2,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |354| baseAdd
        LDI       r0, 0x0128            ; [ALU_PRU] |354| 
        ADD       r0, r1, r0            ; [ALU_PRU] |354| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |354| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |354| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |354| 
	.dwpsn	file "../mcspi.c",line 357,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |357| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |357| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |357| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |357| channelMode
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |357| 
        AND       r1, r1, 0x01          ; [ALU_PRU] |357| 
        OR        r1, r14, r1           ; [ALU_PRU] |357| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |357| 
	.dwpsn	file "../mcspi.c",line 360,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |360| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |360| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |360| 
        ADD       r0, r0, r1            ; [ALU_PRU] |360| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |360| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |360| 
        LDI       r0, 0x012c            ; [ALU_PRU] |360| 
        ADD       r0, r1, r0            ; [ALU_PRU] |360| 
        LDI32     r1, 0xffffcfff        ; [ALU_PRU] |360| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |360| 
        AND       r1, r14, r1           ; [ALU_PRU] |360| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |360| 
	.dwpsn	file "../mcspi.c",line 363,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |363| chNum
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |363| trMode
        LSL       r1, r0, 0x02          ; [ALU_PRU] |363| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |363| 
        ADD       r0, r0, r1            ; [ALU_PRU] |363| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |363| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |363| 
        LDI       r0, 0x012c            ; [ALU_PRU] |363| 
        ADD       r0, r1, r0            ; [ALU_PRU] |363| 
        LDI       r1, 0x3000            ; [ALU_PRU] |363| 
        AND       r1, r14, r1           ; [ALU_PRU] |363| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |363| 
        OR        r1, r14, r1           ; [ALU_PRU] |363| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |363| 
	.dwpsn	file "../mcspi.c",line 365,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |365| trMode
        QBNE      ||$C$L5||, r0, 0x00   ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |365| pinMode
        LDI32     r1, 0x00030000        ; [ALU_PRU] |365| 
        QBNE      ||$C$L5||, r0, r1     ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L8||             ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
||$C$L5||:    
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |365| trMode
        LDI       r1, 0x2000            ; [ALU_PRU] |365| 
        QBNE      ||$C$L6||, r0, r1     ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |365| pinMode
        LDI32     r1, 0x00030000        ; [ALU_PRU] |365| 
        QBNE      ||$C$L6||, r0, r1     ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L8||             ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
||$C$L6||:    
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |365| trMode
        QBNE      ||$C$L7||, r0, 0x00   ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |365| pinMode
        LDI32     r1, 0x00070000        ; [ALU_PRU] |365| 
        QBNE      ||$C$L7||, r0, r1     ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L8||             ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
||$C$L7||:    
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |365| trMode
        LDI       r1, 0x2000            ; [ALU_PRU] |365| 
        QBNE      ||$C$L9||, r0, r1     ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |365| pinMode
        LDI32     r1, 0x00070000        ; [ALU_PRU] |365| 
        QBNE      ||$C$L9||, r0, r1     ; [ALU_PRU] |365| 
;* --------------------------------------------------------------------------*
||$C$L8||:    
	.dwpsn	file "../mcspi.c",line 370,column 3,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |370| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |370| retVal
	.dwpsn	file "../mcspi.c",line 371,column 2,is_stmt,isa 0
        JMP       ||$C$L10||            ; [ALU_PRU] |371| 
;* --------------------------------------------------------------------------*
||$C$L9||:    
	.dwpsn	file "../mcspi.c",line 373,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |373| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |373| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |373| 
        ADD       r0, r0, r1            ; [ALU_PRU] |373| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |373| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |373| 
        LDI       r0, 0x012c            ; [ALU_PRU] |373| 
        ADD       r0, r1, r0            ; [ALU_PRU] |373| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |373| 
        LDI32     r1, 0xfff8ffff        ; [ALU_PRU] |373| 
        AND       r1, r14, r1           ; [ALU_PRU] |373| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |373| 
	.dwpsn	file "../mcspi.c",line 376,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |376| chNum
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |376| pinMode
        LSL       r1, r0, 0x02          ; [ALU_PRU] |376| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |376| 
        ADD       r0, r0, r1            ; [ALU_PRU] |376| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |376| baseAdd
        ADD       r1, r1, r0            ; [ALU_PRU] |376| 
        LDI       r0, 0x012c            ; [ALU_PRU] |376| 
        ADD       r0, r1, r0            ; [ALU_PRU] |376| 
        LDI32     r1, 0x00070000        ; [ALU_PRU] |376| 
        AND       r1, r14, r1           ; [ALU_PRU] |376| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |376| 
        OR        r1, r14, r1           ; [ALU_PRU] |376| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |376| 
	.dwpsn	file "../mcspi.c",line 378,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |378| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |378| retVal
;* --------------------------------------------------------------------------*
||$C$L10||:    
	.dwpsn	file "../mcspi.c",line 381,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 20, 4       ; [ALU_PRU] |381| retVal
	.dwpsn	file "../mcspi.c",line 382,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x18          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$263	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$263, DW_AT_low_pc(0x00)
	.dwattr $C$DW$263, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$251, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$251, DW_AT_TI_end_line(0x17e)
	.dwattr $C$DW$251, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$251

	.sect	".text:SPI_SlaveModeConfig"
	.clink
	.global	||SPI_SlaveModeConfig||

$C$DW$264	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SlaveModeConfig")
	.dwattr $C$DW$264, DW_AT_low_pc(||SPI_SlaveModeConfig||)
	.dwattr $C$DW$264, DW_AT_high_pc(0x00)
	.dwattr $C$DW$264, DW_AT_TI_symbol_name("SPI_SlaveModeConfig")
	.dwattr $C$DW$264, DW_AT_external
	.dwattr $C$DW$264, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$264, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$264, DW_AT_TI_begin_line(0x19d)
	.dwattr $C$DW$264, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$264, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$264, DW_AT_decl_line(0x19d)
	.dwattr $C$DW$264, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$264, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../mcspi.c",line 414,column 1,is_stmt,address ||SPI_SlaveModeConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SlaveModeConfig||
$C$DW$265	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$265, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$265, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$265, DW_AT_location[DW_OP_regx 0x38]
$C$DW$266	.dwtag  DW_TAG_formal_parameter, DW_AT_name("trMode")
	.dwattr $C$DW$266, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$266, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$266, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$267	.dwtag  DW_TAG_formal_parameter, DW_AT_name("pinMode")
	.dwattr $C$DW$267, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$267, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$267, DW_AT_location[DW_OP_regx 0x40]

;***************************************************************
;* FNAME: SPI_SlaveModeConfig           FR SIZE:  16           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           16 Auto,  0 SOE     *
;***************************************************************

||SPI_SlaveModeConfig||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 16
$C$DW$268	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$268, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$268, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$268, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$269	.dwtag  DW_TAG_variable, DW_AT_name("trMode")
	.dwattr $C$DW$269, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$269, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$269, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$270	.dwtag  DW_TAG_variable, DW_AT_name("pinMode")
	.dwattr $C$DW$270, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$270, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$270, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$271	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$271, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$271, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$271, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |414| pinMode
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |414| trMode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |414| baseAdd
	.dwpsn	file "../mcspi.c",line 415,column 18,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |415| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |415| retVal
	.dwpsn	file "../mcspi.c",line 418,column 2,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |418| baseAdd
        LDI       r0, 0x012c            ; [ALU_PRU] |418| 
        ADD       r0, r1, r0            ; [ALU_PRU] |418| 
        LDI32     r1, 0xffffcfff        ; [ALU_PRU] |418| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |418| 
        AND       r1, r14, r1           ; [ALU_PRU] |418| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |418| 
	.dwpsn	file "../mcspi.c",line 421,column 2,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |421| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |421| baseAdd
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |421| trMode
        ADD       r0, r1, r0            ; [ALU_PRU] |421| 
        LDI       r1, 0x3000            ; [ALU_PRU] |421| 
        AND       r1, r14, r1           ; [ALU_PRU] |421| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |421| 
        OR        r1, r14, r1           ; [ALU_PRU] |421| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |421| 
	.dwpsn	file "../mcspi.c",line 423,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |423| trMode
        QBNE      ||$C$L11||, r0, 0x00  ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |423| pinMode
        LDI32     r1, 0x00030000        ; [ALU_PRU] |423| 
        QBNE      ||$C$L11||, r0, r1    ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L14||            ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
||$C$L11||:    
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |423| trMode
        LDI       r1, 0x2000            ; [ALU_PRU] |423| 
        QBNE      ||$C$L12||, r0, r1    ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |423| pinMode
        LDI32     r1, 0x00030000        ; [ALU_PRU] |423| 
        QBNE      ||$C$L12||, r0, r1    ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L14||            ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
||$C$L12||:    
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |423| trMode
        QBNE      ||$C$L13||, r0, 0x00  ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |423| pinMode
        LDI32     r1, 0x00070000        ; [ALU_PRU] |423| 
        QBNE      ||$C$L13||, r0, r1    ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L14||            ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
||$C$L13||:    
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |423| trMode
        LDI       r1, 0x2000            ; [ALU_PRU] |423| 
        QBNE      ||$C$L15||, r0, r1    ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |423| pinMode
        LDI32     r1, 0x00070000        ; [ALU_PRU] |423| 
        QBNE      ||$C$L15||, r0, r1    ; [ALU_PRU] |423| 
;* --------------------------------------------------------------------------*
||$C$L14||:    
	.dwpsn	file "../mcspi.c",line 428,column 3,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |428| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |428| retVal
	.dwpsn	file "../mcspi.c",line 429,column 2,is_stmt,isa 0
        JMP       ||$C$L16||            ; [ALU_PRU] |429| 
;* --------------------------------------------------------------------------*
||$C$L15||:    
	.dwpsn	file "../mcspi.c",line 431,column 3,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |431| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |431| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |431| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |431| 
        LDI32     r1, 0xfff8ffff        ; [ALU_PRU] |431| 
        AND       r1, r14, r1           ; [ALU_PRU] |431| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |431| 
	.dwpsn	file "../mcspi.c",line 434,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |434| baseAdd
        LDI       r0, 0x012c            ; [ALU_PRU] |434| 
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |434| pinMode
        ADD       r0, r1, r0            ; [ALU_PRU] |434| 
        LDI32     r1, 0x00070000        ; [ALU_PRU] |434| 
        AND       r1, r14, r1           ; [ALU_PRU] |434| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |434| 
        OR        r1, r14, r1           ; [ALU_PRU] |434| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |434| 
;* --------------------------------------------------------------------------*
||$C$L16||:    
	.dwpsn	file "../mcspi.c",line 437,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |437| retVal
	.dwpsn	file "../mcspi.c",line 438,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$272	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$272, DW_AT_low_pc(0x00)
	.dwattr $C$DW$272, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$264, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$264, DW_AT_TI_end_line(0x1b6)
	.dwattr $C$DW$264, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$264

	.sect	".text:SPI_FIFOTrigLvlSet"
	.clink
	.global	||SPI_FIFOTrigLvlSet||

$C$DW$273	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_FIFOTrigLvlSet")
	.dwattr $C$DW$273, DW_AT_low_pc(||SPI_FIFOTrigLvlSet||)
	.dwattr $C$DW$273, DW_AT_high_pc(0x00)
	.dwattr $C$DW$273, DW_AT_TI_symbol_name("SPI_FIFOTrigLvlSet")
	.dwattr $C$DW$273, DW_AT_external
	.dwattr $C$DW$273, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$273, DW_AT_TI_begin_line(0x27a)
	.dwattr $C$DW$273, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$273, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$273, DW_AT_decl_line(0x27a)
	.dwattr $C$DW$273, DW_AT_decl_column(0x06)
	.dwattr $C$DW$273, DW_AT_TI_max_frame_size(0x0a)
	.dwpsn	file "../mcspi.c",line 635,column 1,is_stmt,address ||SPI_FIFOTrigLvlSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_FIFOTrigLvlSet||
$C$DW$274	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$274, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$274, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$274, DW_AT_location[DW_OP_regx 0x38]
$C$DW$275	.dwtag  DW_TAG_formal_parameter, DW_AT_name("afl")
	.dwattr $C$DW$275, DW_AT_TI_symbol_name("afl")
	.dwattr $C$DW$275, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$275, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$276	.dwtag  DW_TAG_formal_parameter, DW_AT_name("ael")
	.dwattr $C$DW$276, DW_AT_TI_symbol_name("ael")
	.dwattr $C$DW$276, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$276, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$277	.dwtag  DW_TAG_formal_parameter, DW_AT_name("trMode")
	.dwattr $C$DW$277, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$277, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$277, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$278	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$278, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$278, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$278, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$279	.dwtag  DW_TAG_variable, DW_AT_name("afl")
	.dwattr $C$DW$279, DW_AT_TI_symbol_name("afl")
	.dwattr $C$DW$279, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$279, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$280	.dwtag  DW_TAG_variable, DW_AT_name("ael")
	.dwattr $C$DW$280, DW_AT_TI_symbol_name("ael")
	.dwattr $C$DW$280, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$280, DW_AT_location[DW_OP_breg8 5]
        NOP                             ; [ALU_PRU] 
$C$DW$281	.dwtag  DW_TAG_variable, DW_AT_name("trMode")
	.dwattr $C$DW$281, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$281, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$281, DW_AT_location[DW_OP_breg8 6]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 6, 4        ; [ALU_PRU] |635| trMode
        SBBO      &r15.b1, r2, 5, 1     ; [ALU_PRU] |635| ael
        SBBO      &r15.b0, r2, 4, 1     ; [ALU_PRU] |635| afl
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |635| baseAdd
	.dwpsn	file "../mcspi.c",line 636,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 6, 4         ; [ALU_PRU] |636| trMode
        QBNE      ||$C$L17||, r0, 0x00  ; [ALU_PRU] |636| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 639,column 3,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |639| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |639| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |639| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |639| 
        LDI32     r1, 0xffff0000        ; [ALU_PRU] |639| 
        AND       r1, r14, r1           ; [ALU_PRU] |639| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |639| 
	.dwpsn	file "../mcspi.c",line 642,column 3,is_stmt,isa 0
        LBBO      &r14.b0, r2, 4, 1     ; [ALU_PRU] |642| afl
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |642| baseAdd
        LDI       r0, 0x017c            ; [ALU_PRU] |642| 
        ADD       r0, r1, r0            ; [ALU_PRU] |642| 
        LDI       r1, 0xff00            ; [ALU_PRU] |642| 
        SUB       r14, r14.b0, 0x01     ; [ALU_PRU] |642| 
        LSL       r14, r14, 0x08        ; [ALU_PRU] |642| 
        AND       r1, r14, r1           ; [ALU_PRU] |642| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |642| 
        OR        r14, r14, r1          ; [ALU_PRU] |642| 
        LBBO      &r1.b0, r2, 5, 1      ; [ALU_PRU] |642| ael
        SUB       r1, r1.b0, 0x01       ; [ALU_PRU] |642| 
        AND       r1, r1, 0xff          ; [ALU_PRU] |642| 
        OR        r1, r14, r1           ; [ALU_PRU] |642| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |642| 
	.dwpsn	file "../mcspi.c",line 644,column 2,is_stmt,isa 0
        JMP       ||$C$L19||            ; [ALU_PRU] |644| 
;* --------------------------------------------------------------------------*
||$C$L17||:    
	.dwpsn	file "../mcspi.c",line 644,column 9,is_stmt,isa 0
        LDI       r1, 0x2000            ; [ALU_PRU] |644| 
        QBNE      ||$C$L18||, r0, r1    ; [ALU_PRU] |644| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 646,column 3,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |646| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |646| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |646| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |646| 
        LDI32     r1, 0xffffff00        ; [ALU_PRU] |646| 
        AND       r1, r14, r1           ; [ALU_PRU] |646| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |646| 
	.dwpsn	file "../mcspi.c",line 649,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |649| baseAdd
        LDI       r0, 0x017c            ; [ALU_PRU] |649| 
        ADD       r0, r1, r0            ; [ALU_PRU] |649| 
        LBBO      &r1.b0, r2, 5, 1      ; [ALU_PRU] |649| ael
        SUB       r1, r1.b0, 0x01       ; [ALU_PRU] |649| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |649| 
        AND       r1, r1, 0xff          ; [ALU_PRU] |649| 
        OR        r1, r14, r1           ; [ALU_PRU] |649| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |649| 
	.dwpsn	file "../mcspi.c",line 650,column 2,is_stmt,isa 0
        JMP       ||$C$L19||            ; [ALU_PRU] |650| 
;* --------------------------------------------------------------------------*
||$C$L18||:    
	.dwpsn	file "../mcspi.c",line 650,column 9,is_stmt,isa 0
        LDI       r1, 0x1000            ; [ALU_PRU] |650| 
        QBNE      ||$C$L19||, r0, r1    ; [ALU_PRU] |650| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 652,column 3,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |652| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |652| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |652| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |652| 
        LDI32     r1, 0xffff00ff        ; [ALU_PRU] |652| 
        AND       r1, r14, r1           ; [ALU_PRU] |652| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |652| 
	.dwpsn	file "../mcspi.c",line 655,column 3,is_stmt,isa 0
        LBBO      &r14.b0, r2, 4, 1     ; [ALU_PRU] |655| afl
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |655| baseAdd
        LDI       r0, 0x017c            ; [ALU_PRU] |655| 
        ADD       r0, r1, r0            ; [ALU_PRU] |655| 
        LDI       r1, 0xff00            ; [ALU_PRU] |655| 
        SUB       r14, r14.b0, 0x01     ; [ALU_PRU] |655| 
        LSL       r14, r14, 0x08        ; [ALU_PRU] |655| 
        AND       r1, r14, r1           ; [ALU_PRU] |655| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |655| 
        OR        r1, r14, r1           ; [ALU_PRU] |655| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |655| 
	.dwpsn	file "../mcspi.c",line 657,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L19||:    
        ADD       r2, r2, 0x0a          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$282	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$282, DW_AT_low_pc(0x00)
	.dwattr $C$DW$282, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$273, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$273, DW_AT_TI_end_line(0x291)
	.dwattr $C$DW$273, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$273

	.sect	".text:SPI_ClkRead"
	.clink
	.global	||SPI_ClkRead||

$C$DW$283	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkRead")
	.dwattr $C$DW$283, DW_AT_low_pc(||SPI_ClkRead||)
	.dwattr $C$DW$283, DW_AT_high_pc(0x00)
	.dwattr $C$DW$283, DW_AT_TI_symbol_name("SPI_ClkRead")
	.dwattr $C$DW$283, DW_AT_external
	.dwattr $C$DW$283, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$283, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$283, DW_AT_TI_begin_line(0x3c2)
	.dwattr $C$DW$283, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$283, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$283, DW_AT_decl_line(0x3c2)
	.dwattr $C$DW$283, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$283, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 963,column 1,is_stmt,address ||SPI_ClkRead||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkRead||
$C$DW$284	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$284, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$284, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$284, DW_AT_location[DW_OP_regx 0x38]
$C$DW$285	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiClk")
	.dwattr $C$DW$285, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$285, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$285, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$286	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$286, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$286, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$286, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$287	.dwtag  DW_TAG_variable, DW_AT_name("spiClk")
	.dwattr $C$DW$287, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$287, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$287, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$288	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$288, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$288, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$288, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |963| spiClk
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |963| baseAdd
	.dwpsn	file "../mcspi.c",line 964,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |964| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |964| retVal
	.dwpsn	file "../mcspi.c",line 967,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |967| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |967| baseAdd
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |967| 
        QBBC      ||$C$L20||, r0, 0x0a  ; [ALU_PRU] |967| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 969,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |969| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |969| retVal
	.dwpsn	file "../mcspi.c",line 970,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |970| baseAdd
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |970| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |970| spiClk
        AND       r0, r0, 0x40          ; [ALU_PRU] |970| 
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |970| 
;* --------------------------------------------------------------------------*
||$C$L20||:    
	.dwpsn	file "../mcspi.c",line 973,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |973| retVal
	.dwpsn	file "../mcspi.c",line 974,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$289	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$289, DW_AT_low_pc(0x00)
	.dwattr $C$DW$289, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$283, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$283, DW_AT_TI_end_line(0x3ce)
	.dwattr $C$DW$283, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$283

	.sect	".text:SPI_ClkWrite"
	.clink
	.global	||SPI_ClkWrite||

$C$DW$290	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkWrite")
	.dwattr $C$DW$290, DW_AT_low_pc(||SPI_ClkWrite||)
	.dwattr $C$DW$290, DW_AT_high_pc(0x00)
	.dwattr $C$DW$290, DW_AT_TI_symbol_name("SPI_ClkWrite")
	.dwattr $C$DW$290, DW_AT_external
	.dwattr $C$DW$290, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$290, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$290, DW_AT_TI_begin_line(0x3e1)
	.dwattr $C$DW$290, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$290, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$290, DW_AT_decl_line(0x3e1)
	.dwattr $C$DW$290, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$290, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../mcspi.c",line 994,column 1,is_stmt,address ||SPI_ClkWrite||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkWrite||
$C$DW$291	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$291, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$291, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$291, DW_AT_location[DW_OP_regx 0x38]
$C$DW$292	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiClk")
	.dwattr $C$DW$292, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$292, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$292, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$293	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$293, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$293, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$293, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$294	.dwtag  DW_TAG_variable, DW_AT_name("spiClk")
	.dwattr $C$DW$294, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$294, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$294, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$295	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$295, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$295, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$295, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |994| spiClk
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |994| baseAdd
	.dwpsn	file "../mcspi.c",line 995,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |995| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |995| retVal
	.dwpsn	file "../mcspi.c",line 997,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |997| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |997| baseAdd
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |997| 
        QBBS      ||$C$L21||, r0, 0x0a  ; [ALU_PRU] |997| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 999,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |999| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |999| retVal
	.dwpsn	file "../mcspi.c",line 1002,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1002| baseAdd
        LDI       r0, 0x0124            ; [ALU_PRU] |1002| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1002| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1002| 
        CLR       r1, r1, 0x00000006    ; [ALU_PRU] |1002| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1002| 
	.dwpsn	file "../mcspi.c",line 1005,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1005| baseAdd
        LDI       r0, 0x0124            ; [ALU_PRU] |1005| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1005| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1005| spiClk
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1005| 
        AND       r1, r1, 0x40          ; [ALU_PRU] |1005| 
        OR        r1, r14, r1           ; [ALU_PRU] |1005| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1005| 
;* --------------------------------------------------------------------------*
||$C$L21||:    
	.dwpsn	file "../mcspi.c",line 1008,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |1008| retVal
	.dwpsn	file "../mcspi.c",line 1009,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$296	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$296, DW_AT_low_pc(0x00)
	.dwattr $C$DW$296, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$290, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$290, DW_AT_TI_end_line(0x3f1)
	.dwattr $C$DW$290, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$290

	.sect	".text:SPI_DataPinRead"
	.clink
	.global	||SPI_DataPinRead||

$C$DW$297	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DataPinRead")
	.dwattr $C$DW$297, DW_AT_low_pc(||SPI_DataPinRead||)
	.dwattr $C$DW$297, DW_AT_high_pc(0x00)
	.dwattr $C$DW$297, DW_AT_TI_symbol_name("SPI_DataPinRead")
	.dwattr $C$DW$297, DW_AT_external
	.dwattr $C$DW$297, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$297, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$297, DW_AT_TI_begin_line(0x406)
	.dwattr $C$DW$297, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$297, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$297, DW_AT_decl_line(0x406)
	.dwattr $C$DW$297, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$297, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../mcspi.c",line 1031,column 1,is_stmt,address ||SPI_DataPinRead||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DataPinRead||
$C$DW$298	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$298, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$298, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$298, DW_AT_location[DW_OP_regx 0x38]
$C$DW$299	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dataPinDir")
	.dwattr $C$DW$299, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$299, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$299, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$300	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiDat")
	.dwattr $C$DW$300, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$300, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$300, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$301	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$301, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$301, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$301, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$302	.dwtag  DW_TAG_variable, DW_AT_name("dataPinDir")
	.dwattr $C$DW$302, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$302, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$302, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$303	.dwtag  DW_TAG_variable, DW_AT_name("spiDat")
	.dwattr $C$DW$303, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$303, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$303, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$304	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$304, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$304, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$304, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |1031| spiDat
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1031| dataPinDir
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1031| baseAdd
	.dwpsn	file "../mcspi.c",line 1032,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |1032| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1032| retVal
	.dwpsn	file "../mcspi.c",line 1034,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |1034| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |1034| baseAdd
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |1034| 
        LDI       r0, 0x0200            ; [ALU_PRU] |1034| 
        AND       r0, r1, r0            ; [ALU_PRU] |1034| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1034| dataPinDir
        QBNE      ||$C$L22||, r0, r1    ; [ALU_PRU] |1034| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 1036,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |1036| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1036| retVal
	.dwpsn	file "../mcspi.c",line 1039,column 3,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |1039| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |1039| baseAdd
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |1039| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |1039| spiDat
        AND       r0, r0, 0x20          ; [ALU_PRU] |1039| 
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |1039| 
	.dwpsn	file "../mcspi.c",line 1040,column 2,is_stmt,isa 0
        JMP       ||$C$L23||            ; [ALU_PRU] |1040| 
;* --------------------------------------------------------------------------*
||$C$L22||:    
	.dwpsn	file "../mcspi.c",line 1040,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |1040| baseAdd
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |1040| 
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |1040| 
        LDI       r0, 0x0100            ; [ALU_PRU] |1040| 
        AND       r0, r1, r0            ; [ALU_PRU] |1040| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1040| dataPinDir
        QBNE      ||$C$L23||, r0, r1    ; [ALU_PRU] |1040| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 1041,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |1041| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1041| retVal
	.dwpsn	file "../mcspi.c",line 1044,column 3,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |1044| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |1044| baseAdd
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |1044| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |1044| spiDat
        AND       r0, r0, 0x10          ; [ALU_PRU] |1044| 
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |1044| 
	.dwpsn	file "../mcspi.c",line 1045,column 2,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L23||:    
	.dwpsn	file "../mcspi.c",line 1048,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |1048| retVal
	.dwpsn	file "../mcspi.c",line 1049,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$305	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$305, DW_AT_low_pc(0x00)
	.dwattr $C$DW$305, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$297, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$297, DW_AT_TI_end_line(0x419)
	.dwattr $C$DW$297, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$297

	.sect	".text:SPI_DataPinWrite"
	.clink
	.global	||SPI_DataPinWrite||

$C$DW$306	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DataPinWrite")
	.dwattr $C$DW$306, DW_AT_low_pc(||SPI_DataPinWrite||)
	.dwattr $C$DW$306, DW_AT_high_pc(0x00)
	.dwattr $C$DW$306, DW_AT_TI_symbol_name("SPI_DataPinWrite")
	.dwattr $C$DW$306, DW_AT_external
	.dwattr $C$DW$306, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$306, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$306, DW_AT_TI_begin_line(0x431)
	.dwattr $C$DW$306, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$306, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$306, DW_AT_decl_line(0x431)
	.dwattr $C$DW$306, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$306, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../mcspi.c",line 1074,column 1,is_stmt,address ||SPI_DataPinWrite||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DataPinWrite||
$C$DW$307	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$307, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$307, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$307, DW_AT_location[DW_OP_regx 0x38]
$C$DW$308	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dataPinDir")
	.dwattr $C$DW$308, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$308, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$308, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$309	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiDat")
	.dwattr $C$DW$309, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$309, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$309, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$310	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$310, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$310, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$310, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$311	.dwtag  DW_TAG_variable, DW_AT_name("dataPinDir")
	.dwattr $C$DW$311, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$311, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$311, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$312	.dwtag  DW_TAG_variable, DW_AT_name("spiDat")
	.dwattr $C$DW$312, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$312, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$312, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$313	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$313, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$313, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$313, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |1074| spiDat
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1074| dataPinDir
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1074| baseAdd
	.dwpsn	file "../mcspi.c",line 1075,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |1075| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1075| retVal
	.dwpsn	file "../mcspi.c",line 1077,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |1077| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |1077| baseAdd
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |1077| 
        LDI       r0, 0x0200            ; [ALU_PRU] |1077| 
        AND       r0, r1, r0            ; [ALU_PRU] |1077| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1077| dataPinDir
        QBNE      ||$C$L24||, r0, r1    ; [ALU_PRU] |1077| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 1079,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |1079| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1079| retVal
	.dwpsn	file "../mcspi.c",line 1082,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1082| baseAdd
        LDI       r0, 0x0124            ; [ALU_PRU] |1082| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1082| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1082| 
        CLR       r1, r1, 0x00000005    ; [ALU_PRU] |1082| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1082| 
	.dwpsn	file "../mcspi.c",line 1085,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1085| baseAdd
        LDI       r0, 0x0124            ; [ALU_PRU] |1085| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1085| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |1085| spiDat
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1085| 
        LSL       r1, r1, 0x05          ; [ALU_PRU] |1085| 
        OR        r1, r14, r1           ; [ALU_PRU] |1085| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1085| 
	.dwpsn	file "../mcspi.c",line 1086,column 2,is_stmt,isa 0
        JMP       ||$C$L25||            ; [ALU_PRU] |1086| 
;* --------------------------------------------------------------------------*
||$C$L24||:    
	.dwpsn	file "../mcspi.c",line 1086,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |1086| baseAdd
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |1086| 
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |1086| 
        LDI       r0, 0x0100            ; [ALU_PRU] |1086| 
        AND       r0, r1, r0            ; [ALU_PRU] |1086| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1086| dataPinDir
        QBNE      ||$C$L25||, r0, r1    ; [ALU_PRU] |1086| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 1087,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |1087| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1087| retVal
	.dwpsn	file "../mcspi.c",line 1090,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1090| baseAdd
        LDI       r0, 0x0124            ; [ALU_PRU] |1090| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1090| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1090| 
        CLR       r1, r1, 0x00000004    ; [ALU_PRU] |1090| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1090| 
	.dwpsn	file "../mcspi.c",line 1093,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1093| baseAdd
        LDI       r0, 0x0124            ; [ALU_PRU] |1093| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1093| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |1093| spiDat
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1093| 
        LSL       r1, r1, 0x04          ; [ALU_PRU] |1093| 
        OR        r1, r14, r1           ; [ALU_PRU] |1093| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1093| 
	.dwpsn	file "../mcspi.c",line 1094,column 2,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L25||:    
	.dwpsn	file "../mcspi.c",line 1097,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |1097| retVal
	.dwpsn	file "../mcspi.c",line 1098,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$314	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$314, DW_AT_low_pc(0x00)
	.dwattr $C$DW$314, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$306, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$306, DW_AT_TI_end_line(0x44a)
	.dwattr $C$DW$306, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$306

	.sect	".text:SPI_CSRead"
	.clink
	.global	||SPI_CSRead||

$C$DW$315	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSRead")
	.dwattr $C$DW$315, DW_AT_low_pc(||SPI_CSRead||)
	.dwattr $C$DW$315, DW_AT_high_pc(0x00)
	.dwattr $C$DW$315, DW_AT_TI_symbol_name("SPI_CSRead")
	.dwattr $C$DW$315, DW_AT_external
	.dwattr $C$DW$315, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$315, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$315, DW_AT_TI_begin_line(0x45e)
	.dwattr $C$DW$315, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$315, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$315, DW_AT_decl_line(0x45e)
	.dwattr $C$DW$315, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$315, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../mcspi.c",line 1119,column 1,is_stmt,address ||SPI_CSRead||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSRead||
$C$DW$316	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$316, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$316, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$316, DW_AT_location[DW_OP_regx 0x38]
$C$DW$317	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEn")
	.dwattr $C$DW$317, DW_AT_TI_symbol_name("spiEn")
	.dwattr $C$DW$317, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$317, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$318	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnNum")
	.dwattr $C$DW$318, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$318, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$318, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$319	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$319, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$319, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$319, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$320	.dwtag  DW_TAG_variable, DW_AT_name("spiEn")
	.dwattr $C$DW$320, DW_AT_TI_symbol_name("spiEn")
	.dwattr $C$DW$320, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$320, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$321	.dwtag  DW_TAG_variable, DW_AT_name("spiEnNum")
	.dwattr $C$DW$321, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$321, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$321, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$322	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$322, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$322, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$322, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |1119| spiEnNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1119| spiEn
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1119| baseAdd
	.dwpsn	file "../mcspi.c",line 1120,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |1120| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1120| retVal
	.dwpsn	file "../mcspi.c",line 1122,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |1122| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |1122| baseAdd
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |1122| 
        QBBC      ||$C$L26||, r0, 0x0a  ; [ALU_PRU] |1122| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 1124,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |1124| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1124| retVal
	.dwpsn	file "../mcspi.c",line 1127,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |1127| baseAdd
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |1127| 
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |1127| spiEnNum
        AND       r0, r1, r0            ; [ALU_PRU] |1127| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1127| spiEn
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |1127| 
;* --------------------------------------------------------------------------*
||$C$L26||:    
	.dwpsn	file "../mcspi.c",line 1130,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |1130| retVal
	.dwpsn	file "../mcspi.c",line 1131,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$323	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$323, DW_AT_low_pc(0x00)
	.dwattr $C$DW$323, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$315, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$315, DW_AT_TI_end_line(0x46b)
	.dwattr $C$DW$315, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$315

	.sect	".text:SPI_CSWrite"
	.clink
	.global	||SPI_CSWrite||

$C$DW$324	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSWrite")
	.dwattr $C$DW$324, DW_AT_low_pc(||SPI_CSWrite||)
	.dwattr $C$DW$324, DW_AT_high_pc(0x00)
	.dwattr $C$DW$324, DW_AT_TI_symbol_name("SPI_CSWrite")
	.dwattr $C$DW$324, DW_AT_external
	.dwattr $C$DW$324, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$324, DW_AT_TI_begin_file("../mcspi.c")
	.dwattr $C$DW$324, DW_AT_TI_begin_line(0x485)
	.dwattr $C$DW$324, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$324, DW_AT_decl_file("../mcspi.c")
	.dwattr $C$DW$324, DW_AT_decl_line(0x485)
	.dwattr $C$DW$324, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$324, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../mcspi.c",line 1158,column 1,is_stmt,address ||SPI_CSWrite||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSWrite||
$C$DW$325	.dwtag  DW_TAG_formal_parameter, DW_AT_name("baseAdd")
	.dwattr $C$DW$325, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$325, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$325, DW_AT_location[DW_OP_regx 0x38]
$C$DW$326	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnLvl")
	.dwattr $C$DW$326, DW_AT_TI_symbol_name("spiEnLvl")
	.dwattr $C$DW$326, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$326, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$327	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnNum")
	.dwattr $C$DW$327, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$327, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$327, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$328	.dwtag  DW_TAG_variable, DW_AT_name("baseAdd")
	.dwattr $C$DW$328, DW_AT_TI_symbol_name("baseAdd")
	.dwattr $C$DW$328, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$328, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$329	.dwtag  DW_TAG_variable, DW_AT_name("spiEnLvl")
	.dwattr $C$DW$329, DW_AT_TI_symbol_name("spiEnLvl")
	.dwattr $C$DW$329, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$329, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$330	.dwtag  DW_TAG_variable, DW_AT_name("spiEnNum")
	.dwattr $C$DW$330, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$330, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$330, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$331	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$331, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$331, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$331, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |1158| spiEnNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1158| spiEnLvl
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1158| baseAdd
	.dwpsn	file "../mcspi.c",line 1159,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |1159| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1159| retVal
	.dwpsn	file "../mcspi.c",line 1161,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |1161| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |1161| baseAdd
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |1161| 
        QBBS      ||$C$L30||, r0, 0x0a  ; [ALU_PRU] |1161| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 1163,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |1163| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1163| retVal
	.dwpsn	file "../mcspi.c",line 1165,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |1165| spiEnNum
        QBNE      ||$C$L27||, r0, 0x01  ; [ALU_PRU] |1165| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 1168,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |1168| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1168| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1168| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1168| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |1168| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1168| 
	.dwpsn	file "../mcspi.c",line 1171,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1171| baseAdd
        LDI       r0, 0x0124            ; [ALU_PRU] |1171| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1171| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1171| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1171| spiEnLvl
        AND       r1, r1, 0x01          ; [ALU_PRU] |1171| 
        OR        r1, r14, r1           ; [ALU_PRU] |1171| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1171| 
	.dwpsn	file "../mcspi.c",line 1172,column 3,is_stmt,isa 0
        JMP       ||$C$L30||            ; [ALU_PRU] |1172| 
;* --------------------------------------------------------------------------*
||$C$L27||:    
	.dwpsn	file "../mcspi.c",line 1172,column 10,is_stmt,isa 0
        QBNE      ||$C$L28||, r0, 0x02  ; [ALU_PRU] |1172| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 1174,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |1174| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1174| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1174| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1174| 
        CLR       r1, r1, 0x00000001    ; [ALU_PRU] |1174| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1174| 
	.dwpsn	file "../mcspi.c",line 1177,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1177| baseAdd
        LDI       r0, 0x0124            ; [ALU_PRU] |1177| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1177| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1177| spiEnLvl
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1177| 
        LSL       r1, r1, 0x01          ; [ALU_PRU] |1177| 
        AND       r1, r1, 0x02          ; [ALU_PRU] |1177| 
        OR        r1, r14, r1           ; [ALU_PRU] |1177| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1177| 
	.dwpsn	file "../mcspi.c",line 1180,column 3,is_stmt,isa 0
        JMP       ||$C$L30||            ; [ALU_PRU] |1180| 
;* --------------------------------------------------------------------------*
||$C$L28||:    
	.dwpsn	file "../mcspi.c",line 1180,column 10,is_stmt,isa 0
        QBNE      ||$C$L29||, r0, 0x04  ; [ALU_PRU] |1180| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 1182,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |1182| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1182| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1182| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1182| 
        CLR       r1, r1, 0x00000002    ; [ALU_PRU] |1182| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1182| 
	.dwpsn	file "../mcspi.c",line 1185,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1185| baseAdd
        LDI       r0, 0x0124            ; [ALU_PRU] |1185| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1185| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1185| spiEnLvl
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1185| 
        LSL       r1, r1, 0x02          ; [ALU_PRU] |1185| 
        AND       r1, r1, 0x04          ; [ALU_PRU] |1185| 
        OR        r1, r14, r1           ; [ALU_PRU] |1185| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1185| 
	.dwpsn	file "../mcspi.c",line 1186,column 3,is_stmt,isa 0
        JMP       ||$C$L30||            ; [ALU_PRU] |1186| 
;* --------------------------------------------------------------------------*
||$C$L29||:    
	.dwpsn	file "../mcspi.c",line 1186,column 10,is_stmt,isa 0
        QBNE      ||$C$L30||, r0, 0x08  ; [ALU_PRU] |1186| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../mcspi.c",line 1188,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |1188| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1188| baseAdd
        ADD       r0, r1, r0            ; [ALU_PRU] |1188| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1188| 
        CLR       r1, r1, 0x00000003    ; [ALU_PRU] |1188| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1188| 
	.dwpsn	file "../mcspi.c",line 1191,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1191| baseAdd
        LDI       r0, 0x0124            ; [ALU_PRU] |1191| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1191| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1191| spiEnLvl
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1191| 
        LSL       r1, r1, 0x03          ; [ALU_PRU] |1191| 
        AND       r1, r1, 0x08          ; [ALU_PRU] |1191| 
        OR        r1, r14, r1           ; [ALU_PRU] |1191| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1191| 
	.dwpsn	file "../mcspi.c",line 1194,column 3,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L30||:    
	.dwpsn	file "../mcspi.c",line 1198,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |1198| retVal
	.dwpsn	file "../mcspi.c",line 1199,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$332	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$332, DW_AT_low_pc(0x00)
	.dwattr $C$DW$332, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$324, DW_AT_TI_end_file("../mcspi.c")
	.dwattr $C$DW$324, DW_AT_TI_end_line(0x4af)
	.dwattr $C$DW$324, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$324

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
	.group    "SPI_CSDisable", 1
	.gmember  ".text:SPI_CSDisable"
	.endgroup
	.group    "SPI_CSPolarityConfig", 1
	.gmember  ".text:SPI_CSPolarityConfig"
	.endgroup
	.group    "SPI_CSTimeControlSet", 1
	.gmember  ".text:SPI_CSTimeControlSet"
	.endgroup
	.group    "SPI_ChannelDisable", 1
	.gmember  ".text:SPI_ChannelDisable"
	.endgroup
	.group    "SPI_ChannelEnable", 1
	.gmember  ".text:SPI_ChannelEnable"
	.endgroup
	.group    "SPI_ChannelStatusGet", 1
	.gmember  ".text:SPI_ChannelStatusGet"
	.endgroup
	.group    "SPI_ClkActivityConfig", 1
	.gmember  ".text:SPI_ClkActivityConfig"
	.endgroup
	.group    "SPI_DMADisable", 1
	.gmember  ".text:SPI_DMADisable"
	.endgroup
	.group    "SPI_DMAEnable", 1
	.gmember  ".text:SPI_DMAEnable"
	.endgroup
	.group    "SPI_DataPinDirectionConfig", 1
	.gmember  ".text:SPI_DataPinDirectionConfig"
	.endgroup
	.group    "SPI_FIFODatManagementConfig", 1
	.gmember  ".text:SPI_FIFODatManagementConfig"
	.endgroup
	.group    "SPI_InitDelayConfig", 1
	.gmember  ".text:SPI_InitDelayConfig"
	.endgroup
	.group    "SPI_IntDisable", 1
	.gmember  ".text:SPI_IntDisable"
	.endgroup
	.group    "SPI_IntEnable", 1
	.gmember  ".text:SPI_IntEnable"
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
	.group    "SPI_MultipleWordAccessConfig", 1
	.gmember  ".text:SPI_MultipleWordAccessConfig"
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
	.group    "SPI_TurboModeDisable", 1
	.gmember  ".text:SPI_TurboModeDisable"
	.endgroup
	.group    "SPI_TurboModeEnable", 1
	.gmember  ".text:SPI_TurboModeEnable"
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
$C$DW$T$30	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$30, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$30, DW_AT_address_class(0x20)
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

$C$DW$333	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b0")
	.dwattr $C$DW$333, DW_AT_location[DW_OP_reg0]
$C$DW$334	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b1")
	.dwattr $C$DW$334, DW_AT_location[DW_OP_reg1]
$C$DW$335	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b2")
	.dwattr $C$DW$335, DW_AT_location[DW_OP_reg2]
$C$DW$336	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b3")
	.dwattr $C$DW$336, DW_AT_location[DW_OP_reg3]
$C$DW$337	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b0")
	.dwattr $C$DW$337, DW_AT_location[DW_OP_reg4]
$C$DW$338	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b1")
	.dwattr $C$DW$338, DW_AT_location[DW_OP_reg5]
$C$DW$339	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b2")
	.dwattr $C$DW$339, DW_AT_location[DW_OP_reg6]
$C$DW$340	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b3")
	.dwattr $C$DW$340, DW_AT_location[DW_OP_reg7]
$C$DW$341	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b0")
	.dwattr $C$DW$341, DW_AT_location[DW_OP_reg8]
$C$DW$342	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b1")
	.dwattr $C$DW$342, DW_AT_location[DW_OP_reg9]
$C$DW$343	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b2")
	.dwattr $C$DW$343, DW_AT_location[DW_OP_reg10]
$C$DW$344	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b3")
	.dwattr $C$DW$344, DW_AT_location[DW_OP_reg11]
$C$DW$345	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b0")
	.dwattr $C$DW$345, DW_AT_location[DW_OP_reg12]
$C$DW$346	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b1")
	.dwattr $C$DW$346, DW_AT_location[DW_OP_reg13]
$C$DW$347	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b2")
	.dwattr $C$DW$347, DW_AT_location[DW_OP_reg14]
$C$DW$348	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b3")
	.dwattr $C$DW$348, DW_AT_location[DW_OP_reg15]
$C$DW$349	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b0")
	.dwattr $C$DW$349, DW_AT_location[DW_OP_reg16]
$C$DW$350	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b1")
	.dwattr $C$DW$350, DW_AT_location[DW_OP_reg17]
$C$DW$351	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b2")
	.dwattr $C$DW$351, DW_AT_location[DW_OP_reg18]
$C$DW$352	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b3")
	.dwattr $C$DW$352, DW_AT_location[DW_OP_reg19]
$C$DW$353	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b0")
	.dwattr $C$DW$353, DW_AT_location[DW_OP_reg20]
$C$DW$354	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b1")
	.dwattr $C$DW$354, DW_AT_location[DW_OP_reg21]
$C$DW$355	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b2")
	.dwattr $C$DW$355, DW_AT_location[DW_OP_reg22]
$C$DW$356	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b3")
	.dwattr $C$DW$356, DW_AT_location[DW_OP_reg23]
$C$DW$357	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b0")
	.dwattr $C$DW$357, DW_AT_location[DW_OP_reg24]
$C$DW$358	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b1")
	.dwattr $C$DW$358, DW_AT_location[DW_OP_reg25]
$C$DW$359	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b2")
	.dwattr $C$DW$359, DW_AT_location[DW_OP_reg26]
$C$DW$360	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b3")
	.dwattr $C$DW$360, DW_AT_location[DW_OP_reg27]
$C$DW$361	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b0")
	.dwattr $C$DW$361, DW_AT_location[DW_OP_reg28]
$C$DW$362	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b1")
	.dwattr $C$DW$362, DW_AT_location[DW_OP_reg29]
$C$DW$363	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b2")
	.dwattr $C$DW$363, DW_AT_location[DW_OP_reg30]
$C$DW$364	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b3")
	.dwattr $C$DW$364, DW_AT_location[DW_OP_reg31]
$C$DW$365	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b0")
	.dwattr $C$DW$365, DW_AT_location[DW_OP_regx 0x20]
$C$DW$366	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b1")
	.dwattr $C$DW$366, DW_AT_location[DW_OP_regx 0x21]
$C$DW$367	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b2")
	.dwattr $C$DW$367, DW_AT_location[DW_OP_regx 0x22]
$C$DW$368	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b3")
	.dwattr $C$DW$368, DW_AT_location[DW_OP_regx 0x23]
$C$DW$369	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b0")
	.dwattr $C$DW$369, DW_AT_location[DW_OP_regx 0x24]
$C$DW$370	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b1")
	.dwattr $C$DW$370, DW_AT_location[DW_OP_regx 0x25]
$C$DW$371	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b2")
	.dwattr $C$DW$371, DW_AT_location[DW_OP_regx 0x26]
$C$DW$372	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b3")
	.dwattr $C$DW$372, DW_AT_location[DW_OP_regx 0x27]
$C$DW$373	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b0")
	.dwattr $C$DW$373, DW_AT_location[DW_OP_regx 0x28]
$C$DW$374	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b1")
	.dwattr $C$DW$374, DW_AT_location[DW_OP_regx 0x29]
$C$DW$375	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b2")
	.dwattr $C$DW$375, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$376	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b3")
	.dwattr $C$DW$376, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$377	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b0")
	.dwattr $C$DW$377, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$378	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b1")
	.dwattr $C$DW$378, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$379	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b2")
	.dwattr $C$DW$379, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$380	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b3")
	.dwattr $C$DW$380, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$381	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b0")
	.dwattr $C$DW$381, DW_AT_location[DW_OP_regx 0x30]
$C$DW$382	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b1")
	.dwattr $C$DW$382, DW_AT_location[DW_OP_regx 0x31]
$C$DW$383	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b2")
	.dwattr $C$DW$383, DW_AT_location[DW_OP_regx 0x32]
$C$DW$384	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b3")
	.dwattr $C$DW$384, DW_AT_location[DW_OP_regx 0x33]
$C$DW$385	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b0")
	.dwattr $C$DW$385, DW_AT_location[DW_OP_regx 0x34]
$C$DW$386	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b1")
	.dwattr $C$DW$386, DW_AT_location[DW_OP_regx 0x35]
$C$DW$387	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b2")
	.dwattr $C$DW$387, DW_AT_location[DW_OP_regx 0x36]
$C$DW$388	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b3")
	.dwattr $C$DW$388, DW_AT_location[DW_OP_regx 0x37]
$C$DW$389	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b0")
	.dwattr $C$DW$389, DW_AT_location[DW_OP_regx 0x38]
$C$DW$390	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b1")
	.dwattr $C$DW$390, DW_AT_location[DW_OP_regx 0x39]
$C$DW$391	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b2")
	.dwattr $C$DW$391, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$392	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b3")
	.dwattr $C$DW$392, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$393	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b0")
	.dwattr $C$DW$393, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$394	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b1")
	.dwattr $C$DW$394, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$395	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b2")
	.dwattr $C$DW$395, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$396	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b3")
	.dwattr $C$DW$396, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$397	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b0")
	.dwattr $C$DW$397, DW_AT_location[DW_OP_regx 0x40]
$C$DW$398	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b1")
	.dwattr $C$DW$398, DW_AT_location[DW_OP_regx 0x41]
$C$DW$399	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b2")
	.dwattr $C$DW$399, DW_AT_location[DW_OP_regx 0x42]
$C$DW$400	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b3")
	.dwattr $C$DW$400, DW_AT_location[DW_OP_regx 0x43]
$C$DW$401	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b0")
	.dwattr $C$DW$401, DW_AT_location[DW_OP_regx 0x44]
$C$DW$402	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b1")
	.dwattr $C$DW$402, DW_AT_location[DW_OP_regx 0x45]
$C$DW$403	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b2")
	.dwattr $C$DW$403, DW_AT_location[DW_OP_regx 0x46]
$C$DW$404	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b3")
	.dwattr $C$DW$404, DW_AT_location[DW_OP_regx 0x47]
$C$DW$405	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b0")
	.dwattr $C$DW$405, DW_AT_location[DW_OP_regx 0x48]
$C$DW$406	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b1")
	.dwattr $C$DW$406, DW_AT_location[DW_OP_regx 0x49]
$C$DW$407	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b2")
	.dwattr $C$DW$407, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$408	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b3")
	.dwattr $C$DW$408, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$409	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b0")
	.dwattr $C$DW$409, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$410	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b1")
	.dwattr $C$DW$410, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$411	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b2")
	.dwattr $C$DW$411, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$412	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b3")
	.dwattr $C$DW$412, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$413	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b0")
	.dwattr $C$DW$413, DW_AT_location[DW_OP_regx 0x50]
$C$DW$414	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b1")
	.dwattr $C$DW$414, DW_AT_location[DW_OP_regx 0x51]
$C$DW$415	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b2")
	.dwattr $C$DW$415, DW_AT_location[DW_OP_regx 0x52]
$C$DW$416	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b3")
	.dwattr $C$DW$416, DW_AT_location[DW_OP_regx 0x53]
$C$DW$417	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b0")
	.dwattr $C$DW$417, DW_AT_location[DW_OP_regx 0x54]
$C$DW$418	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b1")
	.dwattr $C$DW$418, DW_AT_location[DW_OP_regx 0x55]
$C$DW$419	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b2")
	.dwattr $C$DW$419, DW_AT_location[DW_OP_regx 0x56]
$C$DW$420	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b3")
	.dwattr $C$DW$420, DW_AT_location[DW_OP_regx 0x57]
$C$DW$421	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b0")
	.dwattr $C$DW$421, DW_AT_location[DW_OP_regx 0x58]
$C$DW$422	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b1")
	.dwattr $C$DW$422, DW_AT_location[DW_OP_regx 0x59]
$C$DW$423	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b2")
	.dwattr $C$DW$423, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$424	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b3")
	.dwattr $C$DW$424, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$425	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b0")
	.dwattr $C$DW$425, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$426	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b1")
	.dwattr $C$DW$426, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$427	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b2")
	.dwattr $C$DW$427, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$428	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b3")
	.dwattr $C$DW$428, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$429	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b0")
	.dwattr $C$DW$429, DW_AT_location[DW_OP_regx 0x60]
$C$DW$430	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b1")
	.dwattr $C$DW$430, DW_AT_location[DW_OP_regx 0x61]
$C$DW$431	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b2")
	.dwattr $C$DW$431, DW_AT_location[DW_OP_regx 0x62]
$C$DW$432	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b3")
	.dwattr $C$DW$432, DW_AT_location[DW_OP_regx 0x63]
$C$DW$433	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b0")
	.dwattr $C$DW$433, DW_AT_location[DW_OP_regx 0x64]
$C$DW$434	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b1")
	.dwattr $C$DW$434, DW_AT_location[DW_OP_regx 0x65]
$C$DW$435	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b2")
	.dwattr $C$DW$435, DW_AT_location[DW_OP_regx 0x66]
$C$DW$436	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b3")
	.dwattr $C$DW$436, DW_AT_location[DW_OP_regx 0x67]
$C$DW$437	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b0")
	.dwattr $C$DW$437, DW_AT_location[DW_OP_regx 0x68]
$C$DW$438	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b1")
	.dwattr $C$DW$438, DW_AT_location[DW_OP_regx 0x69]
$C$DW$439	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b2")
	.dwattr $C$DW$439, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$440	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b3")
	.dwattr $C$DW$440, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$441	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b0")
	.dwattr $C$DW$441, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$442	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b1")
	.dwattr $C$DW$442, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$443	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b2")
	.dwattr $C$DW$443, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$444	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b3")
	.dwattr $C$DW$444, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$445	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b0")
	.dwattr $C$DW$445, DW_AT_location[DW_OP_regx 0x70]
$C$DW$446	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b1")
	.dwattr $C$DW$446, DW_AT_location[DW_OP_regx 0x71]
$C$DW$447	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b2")
	.dwattr $C$DW$447, DW_AT_location[DW_OP_regx 0x72]
$C$DW$448	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b3")
	.dwattr $C$DW$448, DW_AT_location[DW_OP_regx 0x73]
$C$DW$449	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b0")
	.dwattr $C$DW$449, DW_AT_location[DW_OP_regx 0x74]
$C$DW$450	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b1")
	.dwattr $C$DW$450, DW_AT_location[DW_OP_regx 0x75]
$C$DW$451	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b2")
	.dwattr $C$DW$451, DW_AT_location[DW_OP_regx 0x76]
$C$DW$452	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b3")
	.dwattr $C$DW$452, DW_AT_location[DW_OP_regx 0x77]
$C$DW$453	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b0")
	.dwattr $C$DW$453, DW_AT_location[DW_OP_regx 0x78]
$C$DW$454	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b1")
	.dwattr $C$DW$454, DW_AT_location[DW_OP_regx 0x79]
$C$DW$455	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b2")
	.dwattr $C$DW$455, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$456	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b3")
	.dwattr $C$DW$456, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$457	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b0")
	.dwattr $C$DW$457, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$458	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b1")
	.dwattr $C$DW$458, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$459	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b2")
	.dwattr $C$DW$459, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$460	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b3")
	.dwattr $C$DW$460, DW_AT_location[DW_OP_regx 0x7f]
	.dwendtag $C$DW$CU

