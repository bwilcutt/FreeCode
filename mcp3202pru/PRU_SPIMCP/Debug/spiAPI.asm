;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.1.2 *
;* Date/Time created: Fri Aug 19 11:58:12 2016                                *
;******************************************************************************
	.compiler_opts --abi=eabi --diag_wrap=off --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../spiAPI.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI PRU C/C++ Codegen Unix v2.1.2 Copyright (c) 2012-2015 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/home/bwilcutt/workspace/PRU_workspace/PRU_SPIMCP/Debug")
;	/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/bin/acpiapru -@/tmp/06990XsYdza 
	.sect	".text:SPI_WordLengthSet"
	.clink
	.global	||SPI_WordLengthSet||

$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_WordLengthSet")
	.dwattr $C$DW$1, DW_AT_low_pc(||SPI_WordLengthSet||)
	.dwattr $C$DW$1, DW_AT_high_pc(0x00)
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("SPI_WordLengthSet")
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$1, DW_AT_TI_begin_line(0xa3)
	.dwattr $C$DW$1, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$1, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$1, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$1, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$1, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spiAPI.c",line 164,column 1,is_stmt,address ||SPI_WordLengthSet||,isa 0

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
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |164| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |164| wordLength
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |164| spiAddr
	.dwpsn	file "../spiAPI.c",line 165,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |165| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |165| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |165| 
        ADD       r0, r0, r1            ; [ALU_PRU] |165| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |165| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |165| 
        LDI       r0, 0x012c            ; [ALU_PRU] |165| 
        ADD       r0, r1, r0            ; [ALU_PRU] |165| 
        LDI32     r1, 0xfffff07f        ; [ALU_PRU] |165| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |165| 
        AND       r1, r14, r1           ; [ALU_PRU] |165| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |165| 
	.dwpsn	file "../spiAPI.c",line 166,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |166| chNum
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |166| wordLength
        LSL       r1, r0, 0x02          ; [ALU_PRU] |166| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |166| 
        ADD       r0, r0, r1            ; [ALU_PRU] |166| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |166| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |166| 
        LDI       r0, 0x012c            ; [ALU_PRU] |166| 
        ADD       r0, r1, r0            ; [ALU_PRU] |166| 
        LDI       r1, 0x0f80            ; [ALU_PRU] |166| 
        AND       r1, r14, r1           ; [ALU_PRU] |166| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |166| 
        OR        r1, r14, r1           ; [ALU_PRU] |166| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |166| 
	.dwpsn	file "../spiAPI.c",line 167,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$8	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$8, DW_AT_low_pc(0x00)
	.dwattr $C$DW$8, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$1, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$1, DW_AT_TI_end_line(0xa7)
	.dwattr $C$DW$1, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$1

	.sect	".text:SPI_CSPolaritySet"
	.clink
	.global	||SPI_CSPolaritySet||

$C$DW$9	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSPolaritySet")
	.dwattr $C$DW$9, DW_AT_low_pc(||SPI_CSPolaritySet||)
	.dwattr $C$DW$9, DW_AT_high_pc(0x00)
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("SPI_CSPolaritySet")
	.dwattr $C$DW$9, DW_AT_external
	.dwattr $C$DW$9, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$9, DW_AT_TI_begin_line(0xc9)
	.dwattr $C$DW$9, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$9, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$9, DW_AT_decl_line(0xc9)
	.dwattr $C$DW$9, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$9, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spiAPI.c",line 202,column 1,is_stmt,address ||SPI_CSPolaritySet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSPolaritySet||
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
;* FNAME: SPI_CSPolaritySet             FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_CSPolaritySet||:
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
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |202| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |202| spiEnPol
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |202| spiAddr
	.dwpsn	file "../spiAPI.c",line 203,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |203| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |203| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |203| 
        ADD       r0, r0, r1            ; [ALU_PRU] |203| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |203| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |203| 
        LDI       r0, 0x012c            ; [ALU_PRU] |203| 
        ADD       r0, r1, r0            ; [ALU_PRU] |203| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |203| 
        CLR       r1, r1, 0x00000006    ; [ALU_PRU] |203| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |203| 
	.dwpsn	file "../spiAPI.c",line 204,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |204| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |204| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |204| 
        ADD       r0, r0, r1            ; [ALU_PRU] |204| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |204| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |204| 
        LDI       r0, 0x012c            ; [ALU_PRU] |204| 
        ADD       r0, r1, r0            ; [ALU_PRU] |204| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |204| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |204| spiEnPol
        AND       r1, r1, 0x40          ; [ALU_PRU] |204| 
        OR        r1, r14, r1           ; [ALU_PRU] |204| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |204| 
	.dwpsn	file "../spiAPI.c",line 205,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$16	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$16, DW_AT_low_pc(0x00)
	.dwattr $C$DW$16, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$9, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$9, DW_AT_TI_end_line(0xcd)
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
	.dwattr $C$DW$17, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$17, DW_AT_TI_begin_line(0xda)
	.dwattr $C$DW$17, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$17, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$17, DW_AT_decl_line(0xda)
	.dwattr $C$DW$17, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$17, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spiAPI.c",line 219,column 1,is_stmt,address ||SPI_CSTimeControlSet||,isa 0

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
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |219| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |219| csTimeControl
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |219| spiAddr
	.dwpsn	file "../spiAPI.c",line 220,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |220| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |220| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |220| 
        ADD       r0, r0, r1            ; [ALU_PRU] |220| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |220| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |220| 
        LDI       r0, 0x012c            ; [ALU_PRU] |220| 
        ADD       r0, r1, r0            ; [ALU_PRU] |220| 
        LDI32     r1, 0xf9ffffff        ; [ALU_PRU] |220| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |220| 
        AND       r1, r14, r1           ; [ALU_PRU] |220| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |220| 
	.dwpsn	file "../spiAPI.c",line 221,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |221| chNum
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |221| csTimeControl
        LSL       r1, r0, 0x02          ; [ALU_PRU] |221| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |221| 
        ADD       r0, r0, r1            ; [ALU_PRU] |221| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |221| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |221| 
        LDI       r0, 0x012c            ; [ALU_PRU] |221| 
        ADD       r0, r1, r0            ; [ALU_PRU] |221| 
        LDI32     r1, 0x06000000        ; [ALU_PRU] |221| 
        AND       r1, r14, r1           ; [ALU_PRU] |221| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |221| 
        OR        r1, r14, r1           ; [ALU_PRU] |221| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |221| 
	.dwpsn	file "../spiAPI.c",line 222,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$24	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$24, DW_AT_low_pc(0x00)
	.dwattr $C$DW$24, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$17, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$17, DW_AT_TI_end_line(0xde)
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
	.dwattr $C$DW$25, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$25, DW_AT_TI_begin_line(0xe9)
	.dwattr $C$DW$25, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$25, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$25, DW_AT_decl_line(0xe9)
	.dwattr $C$DW$25, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$25, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 234,column 1,is_stmt,address ||SPI_CSAssert||,isa 0

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
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |234| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |234| spiAddr
	.dwpsn	file "../spiAPI.c",line 235,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |235| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |235| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |235| 
        ADD       r0, r0, r1            ; [ALU_PRU] |235| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |235| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |235| 
        LDI       r0, 0x012c            ; [ALU_PRU] |235| 
        ADD       r0, r1, r0            ; [ALU_PRU] |235| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |235| 
        SET       r1, r1, 0x00000014    ; [ALU_PRU] |235| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |235| 
	.dwpsn	file "../spiAPI.c",line 236,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$30	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$30, DW_AT_low_pc(0x00)
	.dwattr $C$DW$30, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$25, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$25, DW_AT_TI_end_line(0xec)
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
	.dwattr $C$DW$31, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$31, DW_AT_TI_begin_line(0xf6)
	.dwattr $C$DW$31, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$31, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$31, DW_AT_decl_line(0xf6)
	.dwattr $C$DW$31, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$31, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 247,column 1,is_stmt,address ||SPI_CSDeAssert||,isa 0

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
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |247| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |247| spiAddr
	.dwpsn	file "../spiAPI.c",line 248,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |248| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |248| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |248| 
        ADD       r0, r0, r1            ; [ALU_PRU] |248| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |248| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |248| 
        LDI       r0, 0x012c            ; [ALU_PRU] |248| 
        ADD       r0, r1, r0            ; [ALU_PRU] |248| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |248| 
        CLR       r1, r1, 0x00000014    ; [ALU_PRU] |248| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |248| 
	.dwpsn	file "../spiAPI.c",line 249,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$36	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$36, DW_AT_low_pc(0x00)
	.dwattr $C$DW$36, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$31, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$31, DW_AT_TI_end_line(0xf9)
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
	.dwattr $C$DW$37, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$37, DW_AT_TI_begin_line(0x104)
	.dwattr $C$DW$37, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$37, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$37, DW_AT_decl_line(0x104)
	.dwattr $C$DW$37, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$37, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 261,column 1,is_stmt,address ||SPI_StartBitEnable||,isa 0

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
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |261| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |261| spiAddr
	.dwpsn	file "../spiAPI.c",line 262,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |262| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |262| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |262| 
        ADD       r0, r0, r1            ; [ALU_PRU] |262| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |262| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |262| 
        LDI       r0, 0x012c            ; [ALU_PRU] |262| 
        ADD       r0, r1, r0            ; [ALU_PRU] |262| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |262| 
        SET       r1, r1, 0x00000017    ; [ALU_PRU] |262| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |262| 
	.dwpsn	file "../spiAPI.c",line 263,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$42	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$42, DW_AT_low_pc(0x00)
	.dwattr $C$DW$42, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$37, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$37, DW_AT_TI_end_line(0x107)
	.dwattr $C$DW$37, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$37

	.sect	".text:SPI_StartBitPolaritySet"
	.clink
	.global	||SPI_StartBitPolaritySet||

$C$DW$43	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_StartBitPolaritySet")
	.dwattr $C$DW$43, DW_AT_low_pc(||SPI_StartBitPolaritySet||)
	.dwattr $C$DW$43, DW_AT_high_pc(0x00)
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("SPI_StartBitPolaritySet")
	.dwattr $C$DW$43, DW_AT_external
	.dwattr $C$DW$43, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$43, DW_AT_TI_begin_line(0x114)
	.dwattr $C$DW$43, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$43, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$43, DW_AT_decl_line(0x114)
	.dwattr $C$DW$43, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$43, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spiAPI.c",line 277,column 1,is_stmt,address ||SPI_StartBitPolaritySet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_StartBitPolaritySet||
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
;* FNAME: SPI_StartBitPolaritySet       FR SIZE:  12           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           12 Auto,  0 SOE     *
;***************************************************************

||SPI_StartBitPolaritySet||:
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
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |277| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |277| startBitPol
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |277| spiAddr
	.dwpsn	file "../spiAPI.c",line 278,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |278| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |278| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |278| 
        ADD       r0, r0, r1            ; [ALU_PRU] |278| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |278| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |278| 
        LDI       r0, 0x012c            ; [ALU_PRU] |278| 
        ADD       r0, r1, r0            ; [ALU_PRU] |278| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |278| 
        CLR       r1, r1, 0x00000018    ; [ALU_PRU] |278| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |278| 
	.dwpsn	file "../spiAPI.c",line 279,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |279| startBitPol
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |279| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |279| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |279| 
        ADD       r0, r0, r1            ; [ALU_PRU] |279| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |279| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |279| 
        LDI       r0, 0x012c            ; [ALU_PRU] |279| 
        ADD       r0, r1, r0            ; [ALU_PRU] |279| 
        LDI32     r1, 0x01000000        ; [ALU_PRU] |279| 
        AND       r1, r14, r1           ; [ALU_PRU] |279| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |279| 
        OR        r1, r14, r1           ; [ALU_PRU] |279| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |279| 
	.dwpsn	file "../spiAPI.c",line 280,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$50	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$50, DW_AT_low_pc(0x00)
	.dwattr $C$DW$50, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$43, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$43, DW_AT_TI_end_line(0x118)
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
	.dwattr $C$DW$51, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$51, DW_AT_TI_begin_line(0x123)
	.dwattr $C$DW$51, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$51, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$51, DW_AT_decl_line(0x123)
	.dwattr $C$DW$51, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$51, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 292,column 1,is_stmt,address ||SPI_StartBitDisable||,isa 0

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
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |292| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |292| spiAddr
	.dwpsn	file "../spiAPI.c",line 293,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |293| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |293| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |293| 
        ADD       r0, r0, r1            ; [ALU_PRU] |293| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |293| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |293| 
        LDI       r0, 0x012c            ; [ALU_PRU] |293| 
        ADD       r0, r1, r0            ; [ALU_PRU] |293| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |293| 
        CLR       r1, r1, 0x00000017    ; [ALU_PRU] |293| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |293| 
	.dwpsn	file "../spiAPI.c",line 294,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$56	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$56, DW_AT_low_pc(0x00)
	.dwattr $C$DW$56, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$51, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$51, DW_AT_TI_end_line(0x126)
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
	.dwattr $C$DW$57, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$57, DW_AT_TI_begin_line(0x130)
	.dwattr $C$DW$57, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$57, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$57, DW_AT_decl_line(0x130)
	.dwattr $C$DW$57, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$57, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../spiAPI.c",line 305,column 1,is_stmt,address ||SPI_MasterModeEnable||,isa 0

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
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |305| spiAddr
	.dwpsn	file "../spiAPI.c",line 306,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |306| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |306| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |306| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |306| 
        CLR       r1, r1, 0x00000002    ; [ALU_PRU] |306| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |306| 
	.dwpsn	file "../spiAPI.c",line 307,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |307| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |307| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |307| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |307| 
        CLR       r1, r1, 0x0000000a    ; [ALU_PRU] |307| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |307| 
	.dwpsn	file "../spiAPI.c",line 308,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$60	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$60, DW_AT_low_pc(0x00)
	.dwattr $C$DW$60, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$57, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$57, DW_AT_TI_end_line(0x134)
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
	.dwattr $C$DW$61, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$61, DW_AT_TI_begin_line(0x13e)
	.dwattr $C$DW$61, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$61, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$61, DW_AT_decl_line(0x13e)
	.dwattr $C$DW$61, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$61, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../spiAPI.c",line 319,column 1,is_stmt,address ||SPI_SlaveModeEnable||,isa 0

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
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |319| spiAddr
	.dwpsn	file "../spiAPI.c",line 320,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |320| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |320| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |320| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |320| 
        SET       r1, r1, 0x00000002    ; [ALU_PRU] |320| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |320| 
	.dwpsn	file "../spiAPI.c",line 321,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |321| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |321| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |321| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |321| 
        SET       r1, r1, 0x0000000a    ; [ALU_PRU] |321| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |321| 
	.dwpsn	file "../spiAPI.c",line 322,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$64	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$64, DW_AT_low_pc(0x00)
	.dwattr $C$DW$64, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$61, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$61, DW_AT_TI_end_line(0x142)
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
	.dwattr $C$DW$65, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$65, DW_AT_TI_begin_line(0x1a8)
	.dwattr $C$DW$65, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$65, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$65, DW_AT_decl_line(0x1a8)
	.dwattr $C$DW$65, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$65, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spiAPI.c",line 425,column 1,is_stmt,address ||SPI_ChannelSet||,isa 0

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
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |425| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |425| mode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |425| spiAddr
	.dwpsn	file "../spiAPI.c",line 426,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |426| mode
        QBNE      ||$C$L1||, r0, 0x01   ; [ALU_PRU] |426| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 428,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |428| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |428| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |428| 
        ADD       r0, r0, r1            ; [ALU_PRU] |428| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |428| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |428| 
        LDI       r0, 0x0134            ; [ALU_PRU] |428| 
        ADD       r0, r1, r0            ; [ALU_PRU] |428| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |428| 
        SET       r1, r1, 0x00000000    ; [ALU_PRU] |428| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |428| 
	.dwpsn	file "../spiAPI.c",line 429,column 2,is_stmt,isa 0
        JMP       ||$C$L2||             ; [ALU_PRU] |429| 
;* --------------------------------------------------------------------------*
||$C$L1||:    
	.dwpsn	file "../spiAPI.c",line 429,column 9,is_stmt,isa 0
        QBNE      ||$C$L2||, r0, 0x00   ; [ALU_PRU] |429| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 430,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |430| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |430| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |430| 
        ADD       r0, r0, r1            ; [ALU_PRU] |430| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |430| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |430| 
        LDI       r0, 0x0134            ; [ALU_PRU] |430| 
        ADD       r0, r1, r0            ; [ALU_PRU] |430| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |430| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |430| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |430| 
	.dwpsn	file "../spiAPI.c",line 432,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L2||:    
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$72	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$72, DW_AT_low_pc(0x00)
	.dwattr $C$DW$72, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$65, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$65, DW_AT_TI_end_line(0x1b0)
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
	.dwattr $C$DW$73, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$73, DW_AT_TI_begin_line(0x1bc)
	.dwattr $C$DW$73, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$73, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$73, DW_AT_decl_line(0x1bc)
	.dwattr $C$DW$73, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$73, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../spiAPI.c",line 445,column 1,is_stmt,address ||SPI_Reset||,isa 0

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
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |445| spiAddr
	.dwpsn	file "../spiAPI.c",line 446,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |446| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |446| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |446| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |446| 
        SET       r1, r1, 0x00000001    ; [ALU_PRU] |446| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |446| 
	.dwpsn	file "../spiAPI.c",line 447,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0114         ; [ALU_PRU] |447| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L3||
;*
;*   Loop source line                : 447
;*   Loop closing brace source line  : 447
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L3||:    
	.dwpsn	file "../spiAPI.c",line 447,column 8,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |447| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |447| 
        QBBC      ||$C$L3||, r0, 0x00   ; [ALU_PRU] |447| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 448,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$76	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$76, DW_AT_low_pc(0x00)
	.dwattr $C$DW$76, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$73, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$73, DW_AT_TI_end_line(0x1c0)
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
	.dwattr $C$DW$77, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$77, DW_AT_TI_begin_line(0x1cd)
	.dwattr $C$DW$77, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$77, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$77, DW_AT_decl_line(0x1cd)
	.dwattr $C$DW$77, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$77, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spiAPI.c",line 462,column 1,is_stmt,address ||SPI_TurboModeSet||,isa 0

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
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |462| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |462| mode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |462| spiAddr
	.dwpsn	file "../spiAPI.c",line 463,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |463| mode
        QBNE      ||$C$L4||, r0, 0x01   ; [ALU_PRU] |463| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 465,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |465| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |465| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |465| 
        ADD       r0, r0, r1            ; [ALU_PRU] |465| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |465| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |465| 
        LDI       r0, 0x012c            ; [ALU_PRU] |465| 
        ADD       r0, r1, r0            ; [ALU_PRU] |465| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |465| 
        SET       r1, r1, 0x00000013    ; [ALU_PRU] |465| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |465| 
	.dwpsn	file "../spiAPI.c",line 466,column 2,is_stmt,isa 0
        JMP       ||$C$L5||             ; [ALU_PRU] |466| 
;* --------------------------------------------------------------------------*
||$C$L4||:    
	.dwpsn	file "../spiAPI.c",line 466,column 9,is_stmt,isa 0
        QBNE      ||$C$L5||, r0, 0x00   ; [ALU_PRU] |466| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 467,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |467| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |467| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |467| 
        ADD       r0, r0, r1            ; [ALU_PRU] |467| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |467| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |467| 
        LDI       r0, 0x012c            ; [ALU_PRU] |467| 
        ADD       r0, r1, r0            ; [ALU_PRU] |467| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |467| 
        CLR       r1, r1, 0x00000013    ; [ALU_PRU] |467| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |467| 
	.dwpsn	file "../spiAPI.c",line 469,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L5||:    
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$84	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$84, DW_AT_low_pc(0x00)
	.dwattr $C$DW$84, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$77, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$77, DW_AT_TI_end_line(0x1d5)
	.dwattr $C$DW$77, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$77

	.sect	".text:SPI_DataPinDirection"
	.clink
	.global	||SPI_DataPinDirection||

$C$DW$85	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DataPinDirection")
	.dwattr $C$DW$85, DW_AT_low_pc(||SPI_DataPinDirection||)
	.dwattr $C$DW$85, DW_AT_high_pc(0x00)
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("SPI_DataPinDirection")
	.dwattr $C$DW$85, DW_AT_external
	.dwattr $C$DW$85, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$85, DW_AT_TI_begin_line(0x1e1)
	.dwattr $C$DW$85, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$85, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$85, DW_AT_decl_line(0x1e1)
	.dwattr $C$DW$85, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$85, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 482,column 1,is_stmt,address ||SPI_DataPinDirection||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DataPinDirection||
$C$DW$86	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$86, DW_AT_location[DW_OP_regx 0x38]
$C$DW$87	.dwtag  DW_TAG_formal_parameter, DW_AT_name("datDirection")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("datDirection")
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$87, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_DataPinDirection          FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_DataPinDirection||:
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
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |482| datDirection
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |482| spiAddr
	.dwpsn	file "../spiAPI.c",line 483,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |483| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |483| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |483| 
        LDI32     r1, 0xfffffcff        ; [ALU_PRU] |483| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |483| 
        AND       r1, r14, r1           ; [ALU_PRU] |483| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |483| 
	.dwpsn	file "../spiAPI.c",line 484,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |484| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |484| spiAddr
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |484| datDirection
        ADD       r0, r1, r0            ; [ALU_PRU] |484| 
        LDI       r1, 0x0300            ; [ALU_PRU] |484| 
        AND       r1, r14, r1           ; [ALU_PRU] |484| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |484| 
        OR        r1, r14, r1           ; [ALU_PRU] |484| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |484| 
	.dwpsn	file "../spiAPI.c",line 485,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$90	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$90, DW_AT_low_pc(0x00)
	.dwattr $C$DW$90, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$85, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$85, DW_AT_TI_end_line(0x1e5)
	.dwattr $C$DW$85, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$85

	.sect	".text:SPI_TxFIFOEnable"
	.clink
	.global	||SPI_TxFIFOEnable||

$C$DW$91	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TxFIFOEnable")
	.dwattr $C$DW$91, DW_AT_low_pc(||SPI_TxFIFOEnable||)
	.dwattr $C$DW$91, DW_AT_high_pc(0x00)
	.dwattr $C$DW$91, DW_AT_TI_symbol_name("SPI_TxFIFOEnable")
	.dwattr $C$DW$91, DW_AT_external
	.dwattr $C$DW$91, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$91, DW_AT_TI_begin_line(0x1f1)
	.dwattr $C$DW$91, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$91, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$91, DW_AT_decl_line(0x1f1)
	.dwattr $C$DW$91, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$91, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 498,column 1,is_stmt,address ||SPI_TxFIFOEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_TxFIFOEnable||
$C$DW$92	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$92, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$92, DW_AT_location[DW_OP_regx 0x38]
$C$DW$93	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$93, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$93, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_TxFIFOEnable              FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_TxFIFOEnable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$94	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$94, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$94, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$94, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$95	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$95, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |498| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |498| spiAddr
	.dwpsn	file "../spiAPI.c",line 499,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |499| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |499| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |499| 
        ADD       r0, r0, r1            ; [ALU_PRU] |499| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |499| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |499| 
        LDI       r0, 0x012c            ; [ALU_PRU] |499| 
        ADD       r0, r1, r0            ; [ALU_PRU] |499| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |499| 
        SET       r1, r1, 0x0000001b    ; [ALU_PRU] |499| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |499| 
	.dwpsn	file "../spiAPI.c",line 500,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$96	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$96, DW_AT_low_pc(0x00)
	.dwattr $C$DW$96, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$91, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$91, DW_AT_TI_end_line(0x1f4)
	.dwattr $C$DW$91, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$91

	.sect	".text:SPI_TxFIFODisable"
	.clink
	.global	||SPI_TxFIFODisable||

$C$DW$97	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TxFIFODisable")
	.dwattr $C$DW$97, DW_AT_low_pc(||SPI_TxFIFODisable||)
	.dwattr $C$DW$97, DW_AT_high_pc(0x00)
	.dwattr $C$DW$97, DW_AT_TI_symbol_name("SPI_TxFIFODisable")
	.dwattr $C$DW$97, DW_AT_external
	.dwattr $C$DW$97, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$97, DW_AT_TI_begin_line(0x1ff)
	.dwattr $C$DW$97, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$97, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$97, DW_AT_decl_line(0x1ff)
	.dwattr $C$DW$97, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$97, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 512,column 1,is_stmt,address ||SPI_TxFIFODisable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_TxFIFODisable||
$C$DW$98	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$98, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$98, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$98, DW_AT_location[DW_OP_regx 0x38]
$C$DW$99	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$99, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$99, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$99, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_TxFIFODisable             FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_TxFIFODisable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$100	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$100, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$101	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$101, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$101, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$101, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |512| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |512| spiAddr
	.dwpsn	file "../spiAPI.c",line 513,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |513| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |513| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |513| 
        ADD       r0, r0, r1            ; [ALU_PRU] |513| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |513| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |513| 
        LDI       r0, 0x012c            ; [ALU_PRU] |513| 
        ADD       r0, r1, r0            ; [ALU_PRU] |513| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |513| 
        CLR       r1, r1, 0x0000001b    ; [ALU_PRU] |513| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |513| 
	.dwpsn	file "../spiAPI.c",line 514,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$102	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$102, DW_AT_low_pc(0x00)
	.dwattr $C$DW$102, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$97, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$97, DW_AT_TI_end_line(0x202)
	.dwattr $C$DW$97, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$97

	.sect	".text:Is_TxFIFOEmpty"
	.clink
	.global	||Is_TxFIFOEmpty||

$C$DW$103	.dwtag  DW_TAG_subprogram, DW_AT_name("Is_TxFIFOEmpty")
	.dwattr $C$DW$103, DW_AT_low_pc(||Is_TxFIFOEmpty||)
	.dwattr $C$DW$103, DW_AT_high_pc(0x00)
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("Is_TxFIFOEmpty")
	.dwattr $C$DW$103, DW_AT_external
	.dwattr $C$DW$103, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$103, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$103, DW_AT_TI_begin_line(0x20d)
	.dwattr $C$DW$103, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$103, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$103, DW_AT_decl_line(0x20d)
	.dwattr $C$DW$103, DW_AT_decl_column(0x11)
	.dwattr $C$DW$103, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 526,column 1,is_stmt,address ||Is_TxFIFOEmpty||,isa 0

	.dwfde $C$DW$CIE, ||Is_TxFIFOEmpty||
$C$DW$104	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$104, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$104, DW_AT_location[DW_OP_regx 0x38]
$C$DW$105	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$105, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: Is_TxFIFOEmpty                FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||Is_TxFIFOEmpty||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$106	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$106, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$106, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$106, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$107	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$107, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$107, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$107, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |526| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |526| spiAddr
	.dwpsn	file "../spiAPI.c",line 527,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |527| chNum
        ZERO      &r14, 4               ; [ALU_PRU] |527| 
        LSL       r1, r0, 0x02          ; [ALU_PRU] |527| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |527| 
        ADD       r0, r0, r1            ; [ALU_PRU] |527| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |527| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |527| 
        LDI       r1.w0, 0x012c         ; [ALU_PRU] |527| 
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |527| 
        LDI32     r0, 0x08000000        ; [ALU_PRU] |527| 
        AND       r0, r1, r0            ; [ALU_PRU] |527| 
        LDI32     r1, 0x08000000        ; [ALU_PRU] |527| 
        QBNE      ||$C$L6||, r0, r1     ; [ALU_PRU] |527| 
;* --------------------------------------------------------------------------*
        LDI       r14, 0x0001           ; [ALU_PRU] |527| 
;* --------------------------------------------------------------------------*
||$C$L6||:    
	.dwpsn	file "../spiAPI.c",line 528,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$108	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$108, DW_AT_low_pc(0x00)
	.dwattr $C$DW$108, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$103, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$103, DW_AT_TI_end_line(0x210)
	.dwattr $C$DW$103, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$103

	.sect	".text:Is_TxFIFOEnabled"
	.clink
	.global	||Is_TxFIFOEnabled||

$C$DW$109	.dwtag  DW_TAG_subprogram, DW_AT_name("Is_TxFIFOEnabled")
	.dwattr $C$DW$109, DW_AT_low_pc(||Is_TxFIFOEnabled||)
	.dwattr $C$DW$109, DW_AT_high_pc(0x00)
	.dwattr $C$DW$109, DW_AT_TI_symbol_name("Is_TxFIFOEnabled")
	.dwattr $C$DW$109, DW_AT_external
	.dwattr $C$DW$109, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$109, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$109, DW_AT_TI_begin_line(0x21b)
	.dwattr $C$DW$109, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$109, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$109, DW_AT_decl_line(0x21b)
	.dwattr $C$DW$109, DW_AT_decl_column(0x11)
	.dwattr $C$DW$109, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 540,column 1,is_stmt,address ||Is_TxFIFOEnabled||,isa 0

	.dwfde $C$DW$CIE, ||Is_TxFIFOEnabled||
$C$DW$110	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$110, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$110, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$110, DW_AT_location[DW_OP_regx 0x38]
$C$DW$111	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$111, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$111, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$111, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: Is_TxFIFOEnabled              FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||Is_TxFIFOEnabled||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$112	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$112, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$112, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$112, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$113	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$113, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$113, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |540| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |540| spiAddr
	.dwpsn	file "../spiAPI.c",line 541,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |541| chNum
        ZERO      &r14, 4               ; [ALU_PRU] |541| 
        LSL       r1, r0, 0x02          ; [ALU_PRU] |541| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |541| 
        ADD       r0, r0, r1            ; [ALU_PRU] |541| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |541| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |541| 
        LDI       r1.w0, 0x012c         ; [ALU_PRU] |541| 
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |541| 
        LDI32     r0, 0x08000000        ; [ALU_PRU] |541| 
        AND       r0, r1, r0            ; [ALU_PRU] |541| 
        LDI32     r1, 0x08000000        ; [ALU_PRU] |541| 
        QBNE      ||$C$L7||, r0, r1     ; [ALU_PRU] |541| 
;* --------------------------------------------------------------------------*
        LDI       r14, 0x0001           ; [ALU_PRU] |541| 
;* --------------------------------------------------------------------------*
||$C$L7||:    
	.dwpsn	file "../spiAPI.c",line 542,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$114	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$114, DW_AT_low_pc(0x00)
	.dwattr $C$DW$114, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$109, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$109, DW_AT_TI_end_line(0x21e)
	.dwattr $C$DW$109, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$109

	.sect	".text:SPI_RxFIFOEnable"
	.clink
	.global	||SPI_RxFIFOEnable||

$C$DW$115	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_RxFIFOEnable")
	.dwattr $C$DW$115, DW_AT_low_pc(||SPI_RxFIFOEnable||)
	.dwattr $C$DW$115, DW_AT_high_pc(0x00)
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("SPI_RxFIFOEnable")
	.dwattr $C$DW$115, DW_AT_external
	.dwattr $C$DW$115, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$115, DW_AT_TI_begin_line(0x22b)
	.dwattr $C$DW$115, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$115, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$115, DW_AT_decl_line(0x22b)
	.dwattr $C$DW$115, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$115, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 556,column 1,is_stmt,address ||SPI_RxFIFOEnable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_RxFIFOEnable||
$C$DW$116	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$116, DW_AT_location[DW_OP_regx 0x38]
$C$DW$117	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$117, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_RxFIFOEnable              FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_RxFIFOEnable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$118	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$118, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$118, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$118, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$119	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$119, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$119, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |556| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |556| spiAddr
	.dwpsn	file "../spiAPI.c",line 557,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |557| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |557| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |557| 
        ADD       r0, r0, r1            ; [ALU_PRU] |557| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |557| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |557| 
        LDI       r0, 0x012c            ; [ALU_PRU] |557| 
        ADD       r0, r1, r0            ; [ALU_PRU] |557| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |557| 
        SET       r1, r1, 0x0000001c    ; [ALU_PRU] |557| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |557| 
	.dwpsn	file "../spiAPI.c",line 558,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$120	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$120, DW_AT_low_pc(0x00)
	.dwattr $C$DW$120, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$115, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$115, DW_AT_TI_end_line(0x22e)
	.dwattr $C$DW$115, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$115

	.sect	".text:SPI_RxFIFODisable"
	.clink
	.global	||SPI_RxFIFODisable||

$C$DW$121	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_RxFIFODisable")
	.dwattr $C$DW$121, DW_AT_low_pc(||SPI_RxFIFODisable||)
	.dwattr $C$DW$121, DW_AT_high_pc(0x00)
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("SPI_RxFIFODisable")
	.dwattr $C$DW$121, DW_AT_external
	.dwattr $C$DW$121, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$121, DW_AT_TI_begin_line(0x230)
	.dwattr $C$DW$121, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$121, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$121, DW_AT_decl_line(0x230)
	.dwattr $C$DW$121, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$121, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 561,column 1,is_stmt,address ||SPI_RxFIFODisable||,isa 0

	.dwfde $C$DW$CIE, ||SPI_RxFIFODisable||
$C$DW$122	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$122, DW_AT_location[DW_OP_regx 0x38]
$C$DW$123	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$123, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$123, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_RxFIFODisable             FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_RxFIFODisable||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$124	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$124, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$125	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$125, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |561| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |561| spiAddr
	.dwpsn	file "../spiAPI.c",line 562,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |562| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |562| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |562| 
        ADD       r0, r0, r1            ; [ALU_PRU] |562| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |562| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |562| 
        LDI       r0, 0x012c            ; [ALU_PRU] |562| 
        ADD       r0, r1, r0            ; [ALU_PRU] |562| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |562| 
        CLR       r1, r1, 0x0000001c    ; [ALU_PRU] |562| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |562| 
	.dwpsn	file "../spiAPI.c",line 563,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$126	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$126, DW_AT_low_pc(0x00)
	.dwattr $C$DW$126, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$121, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$121, DW_AT_TI_end_line(0x233)
	.dwattr $C$DW$121, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$121

	.sect	".text:Is_RxFIFOEmpty"
	.clink
	.global	||Is_RxFIFOEmpty||

$C$DW$127	.dwtag  DW_TAG_subprogram, DW_AT_name("Is_RxFIFOEmpty")
	.dwattr $C$DW$127, DW_AT_low_pc(||Is_RxFIFOEmpty||)
	.dwattr $C$DW$127, DW_AT_high_pc(0x00)
	.dwattr $C$DW$127, DW_AT_TI_symbol_name("Is_RxFIFOEmpty")
	.dwattr $C$DW$127, DW_AT_external
	.dwattr $C$DW$127, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$127, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$127, DW_AT_TI_begin_line(0x235)
	.dwattr $C$DW$127, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$127, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$127, DW_AT_decl_line(0x235)
	.dwattr $C$DW$127, DW_AT_decl_column(0x11)
	.dwattr $C$DW$127, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 566,column 1,is_stmt,address ||Is_RxFIFOEmpty||,isa 0

	.dwfde $C$DW$CIE, ||Is_RxFIFOEmpty||
$C$DW$128	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$128, DW_AT_location[DW_OP_regx 0x38]
$C$DW$129	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$129, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: Is_RxFIFOEmpty                FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||Is_RxFIFOEmpty||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$130	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$130, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$130, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$130, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$131	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$131, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$131, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |566| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |566| spiAddr
	.dwpsn	file "../spiAPI.c",line 567,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |567| chNum
        ZERO      &r14, 4               ; [ALU_PRU] |567| 
        LSL       r1, r0, 0x02          ; [ALU_PRU] |567| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |567| 
        ADD       r0, r0, r1            ; [ALU_PRU] |567| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |567| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |567| 
        LDI       r1.w0, 0x012c         ; [ALU_PRU] |567| 
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |567| 
        LDI32     r0, 0x10000000        ; [ALU_PRU] |567| 
        AND       r0, r1, r0            ; [ALU_PRU] |567| 
        LDI32     r1, 0x10000000        ; [ALU_PRU] |567| 
        QBNE      ||$C$L8||, r0, r1     ; [ALU_PRU] |567| 
;* --------------------------------------------------------------------------*
        LDI       r14, 0x0001           ; [ALU_PRU] |567| 
;* --------------------------------------------------------------------------*
||$C$L8||:    
	.dwpsn	file "../spiAPI.c",line 568,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$132	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$132, DW_AT_low_pc(0x00)
	.dwattr $C$DW$132, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$127, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$127, DW_AT_TI_end_line(0x238)
	.dwattr $C$DW$127, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$127

	.sect	".text:Is_RxFIFOEnabled"
	.clink
	.global	||Is_RxFIFOEnabled||

$C$DW$133	.dwtag  DW_TAG_subprogram, DW_AT_name("Is_RxFIFOEnabled")
	.dwattr $C$DW$133, DW_AT_low_pc(||Is_RxFIFOEnabled||)
	.dwattr $C$DW$133, DW_AT_high_pc(0x00)
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("Is_RxFIFOEnabled")
	.dwattr $C$DW$133, DW_AT_external
	.dwattr $C$DW$133, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$133, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$133, DW_AT_TI_begin_line(0x23a)
	.dwattr $C$DW$133, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$133, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$133, DW_AT_decl_line(0x23a)
	.dwattr $C$DW$133, DW_AT_decl_column(0x11)
	.dwattr $C$DW$133, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 571,column 1,is_stmt,address ||Is_RxFIFOEnabled||,isa 0

	.dwfde $C$DW$CIE, ||Is_RxFIFOEnabled||
$C$DW$134	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$134, DW_AT_location[DW_OP_regx 0x38]
$C$DW$135	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$135, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: Is_RxFIFOEnabled              FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||Is_RxFIFOEnabled||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$136	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$136, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$136, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$137	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$137, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |571| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |571| spiAddr
	.dwpsn	file "../spiAPI.c",line 572,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |572| chNum
        ZERO      &r14, 4               ; [ALU_PRU] |572| 
        LSL       r1, r0, 0x02          ; [ALU_PRU] |572| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |572| 
        ADD       r0, r0, r1            ; [ALU_PRU] |572| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |572| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |572| 
        LDI       r1.w0, 0x012c         ; [ALU_PRU] |572| 
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |572| 
        LDI32     r0, 0x10000000        ; [ALU_PRU] |572| 
        AND       r0, r1, r0            ; [ALU_PRU] |572| 
        LDI32     r1, 0x10000000        ; [ALU_PRU] |572| 
        QBNE      ||$C$L9||, r0, r1     ; [ALU_PRU] |572| 
;* --------------------------------------------------------------------------*
        LDI       r14, 0x0001           ; [ALU_PRU] |572| 
;* --------------------------------------------------------------------------*
||$C$L9||:    
	.dwpsn	file "../spiAPI.c",line 573,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$138	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$138, DW_AT_low_pc(0x00)
	.dwattr $C$DW$138, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$133, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$133, DW_AT_TI_end_line(0x23d)
	.dwattr $C$DW$133, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$133

	.sect	".text:Is_RxDataReady"
	.clink
	.global	||Is_RxDataReady||

$C$DW$139	.dwtag  DW_TAG_subprogram, DW_AT_name("Is_RxDataReady")
	.dwattr $C$DW$139, DW_AT_low_pc(||Is_RxDataReady||)
	.dwattr $C$DW$139, DW_AT_high_pc(0x00)
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("Is_RxDataReady")
	.dwattr $C$DW$139, DW_AT_external
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$139, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$139, DW_AT_TI_begin_line(0x23f)
	.dwattr $C$DW$139, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$139, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$139, DW_AT_decl_line(0x23f)
	.dwattr $C$DW$139, DW_AT_decl_column(0x11)
	.dwattr $C$DW$139, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 576,column 1,is_stmt,address ||Is_RxDataReady||,isa 0

	.dwfde $C$DW$CIE, ||Is_RxDataReady||
$C$DW$140	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$140, DW_AT_location[DW_OP_regx 0x38]
$C$DW$141	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$141, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: Is_RxDataReady                FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||Is_RxDataReady||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$142	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$142, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$143	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$143, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |576| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |576| spiAddr
	.dwpsn	file "../spiAPI.c",line 577,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |577| chNum
        ZERO      &r14, 4               ; [ALU_PRU] |577| 
        LSL       r1, r0, 0x02          ; [ALU_PRU] |577| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |577| 
        ADD       r0, r0, r1            ; [ALU_PRU] |577| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |577| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |577| 
        LDI       r1.w0, 0x0130         ; [ALU_PRU] |577| 
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |577| 
        AND       r0, r0, 0x01          ; [ALU_PRU] |577| 
        QBNE      ||$C$L10||, r0, 0x01  ; [ALU_PRU] |577| 
;* --------------------------------------------------------------------------*
        LDI       r14, 0x0001           ; [ALU_PRU] |577| 
;* --------------------------------------------------------------------------*
||$C$L10||:    
	.dwpsn	file "../spiAPI.c",line 578,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$144	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$144, DW_AT_low_pc(0x00)
	.dwattr $C$DW$144, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$139, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$139, DW_AT_TI_end_line(0x242)
	.dwattr $C$DW$139, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$139

	.sect	".text:SPI_WordCountSet"
	.clink
	.global	||SPI_WordCountSet||

$C$DW$145	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_WordCountSet")
	.dwattr $C$DW$145, DW_AT_low_pc(||SPI_WordCountSet||)
	.dwattr $C$DW$145, DW_AT_high_pc(0x00)
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("SPI_WordCountSet")
	.dwattr $C$DW$145, DW_AT_external
	.dwattr $C$DW$145, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$145, DW_AT_TI_begin_line(0x287)
	.dwattr $C$DW$145, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$145, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$145, DW_AT_decl_line(0x287)
	.dwattr $C$DW$145, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$145, DW_AT_TI_max_frame_size(0x06)
	.dwpsn	file "../spiAPI.c",line 648,column 1,is_stmt,address ||SPI_WordCountSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_WordCountSet||
$C$DW$146	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$146, DW_AT_location[DW_OP_regx 0x38]
$C$DW$147	.dwtag  DW_TAG_formal_parameter, DW_AT_name("wCnt")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("wCnt")
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$147, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$148	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$148, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$149	.dwtag  DW_TAG_variable, DW_AT_name("wCnt")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("wCnt")
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$149, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15.w0, r2, 4, 2     ; [ALU_PRU] |648| wCnt
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |648| spiAddr
	.dwpsn	file "../spiAPI.c",line 649,column 2,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |649| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |649| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |649| 
        LDI       r1, 0xffff            ; [ALU_PRU] |649| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |649| 
        AND       r1, r14, r1           ; [ALU_PRU] |649| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |649| 
	.dwpsn	file "../spiAPI.c",line 650,column 2,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |650| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |650| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |650| 
        LBBO      &r1.w0, r2, 4, 2      ; [ALU_PRU] |650| wCnt
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |650| 
        LSL       r1, r1.w0, 0x10       ; [ALU_PRU] |650| 
        OR        r1, r14, r1           ; [ALU_PRU] |650| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |650| 
	.dwpsn	file "../spiAPI.c",line 651,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x06          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$150	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$150, DW_AT_low_pc(0x00)
	.dwattr $C$DW$150, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$145, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$145, DW_AT_TI_end_line(0x28b)
	.dwattr $C$DW$145, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$145

	.sect	".text:SPI_DMASet"
	.clink
	.global	||SPI_DMASet||

$C$DW$151	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DMASet")
	.dwattr $C$DW$151, DW_AT_low_pc(||SPI_DMASet||)
	.dwattr $C$DW$151, DW_AT_high_pc(0x00)
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("SPI_DMASet")
	.dwattr $C$DW$151, DW_AT_external
	.dwattr $C$DW$151, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$151, DW_AT_TI_begin_line(0x29a)
	.dwattr $C$DW$151, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$151, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$151, DW_AT_decl_line(0x29a)
	.dwattr $C$DW$151, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$151, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spiAPI.c",line 667,column 1,is_stmt,address ||SPI_DMASet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DMASet||
$C$DW$152	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$152, DW_AT_location[DW_OP_regx 0x38]
$C$DW$153	.dwtag  DW_TAG_formal_parameter, DW_AT_name("mode")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$153, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$154	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dmaFlags")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("dmaFlags")
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$154, DW_AT_location[DW_OP_regx 0x40]
$C$DW$155	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$155, DW_AT_location[DW_OP_regx 0x44]

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
$C$DW$156	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$156, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$156, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$156, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$157	.dwtag  DW_TAG_variable, DW_AT_name("mode")
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$157, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$158	.dwtag  DW_TAG_variable, DW_AT_name("dmaFlags")
	.dwattr $C$DW$158, DW_AT_TI_symbol_name("dmaFlags")
	.dwattr $C$DW$158, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$158, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$159	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$159, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$159, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$159, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r17, r2, 12, 4       ; [ALU_PRU] |667| chNum
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |667| dmaFlags
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |667| mode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |667| spiAddr
	.dwpsn	file "../spiAPI.c",line 668,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |668| mode
        QBNE      ||$C$L11||, r0, 0x01  ; [ALU_PRU] |668| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 670,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |670| chNum
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |670| dmaFlags
        LSL       r1, r0, 0x02          ; [ALU_PRU] |670| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |670| 
        ADD       r0, r0, r1            ; [ALU_PRU] |670| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |670| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |670| 
        LDI       r0, 0x012c            ; [ALU_PRU] |670| 
        ADD       r0, r1, r0            ; [ALU_PRU] |670| 
        LDI       r1, 0xc000            ; [ALU_PRU] |670| 
        AND       r1, r14, r1           ; [ALU_PRU] |670| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |670| 
        OR        r1, r14, r1           ; [ALU_PRU] |670| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |670| 
	.dwpsn	file "../spiAPI.c",line 671,column 2,is_stmt,isa 0
        JMP       ||$C$L12||            ; [ALU_PRU] |671| 
;* --------------------------------------------------------------------------*
||$C$L11||:    
	.dwpsn	file "../spiAPI.c",line 671,column 9,is_stmt,isa 0
        QBNE      ||$C$L12||, r0, 0x00  ; [ALU_PRU] |671| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 672,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |672| chNum
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |672| dmaFlags
        LSL       r1, r0, 0x02          ; [ALU_PRU] |672| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |672| 
        ADD       r0, r0, r1            ; [ALU_PRU] |672| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |672| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |672| 
        LDI       r0, 0x012c            ; [ALU_PRU] |672| 
        ADD       r0, r1, r0            ; [ALU_PRU] |672| 
        LDI       r1, 0xc000            ; [ALU_PRU] |672| 
        AND       r1, r14, r1           ; [ALU_PRU] |672| 
        NOT       r1, r1                ; [ALU_PRU] |672| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |672| 
        AND       r1, r14, r1           ; [ALU_PRU] |672| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |672| 
	.dwpsn	file "../spiAPI.c",line 674,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L12||:    
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$160	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$160, DW_AT_low_pc(0x00)
	.dwattr $C$DW$160, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$151, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$151, DW_AT_TI_end_line(0x2a2)
	.dwattr $C$DW$151, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$151

	.sect	".text:SPI_IntSet"
	.clink
	.global	||SPI_IntSet||

$C$DW$161	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_IntSet")
	.dwattr $C$DW$161, DW_AT_low_pc(||SPI_IntSet||)
	.dwattr $C$DW$161, DW_AT_high_pc(0x00)
	.dwattr $C$DW$161, DW_AT_TI_symbol_name("SPI_IntSet")
	.dwattr $C$DW$161, DW_AT_external
	.dwattr $C$DW$161, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$161, DW_AT_TI_begin_line(0x2b2)
	.dwattr $C$DW$161, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$161, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$161, DW_AT_decl_line(0x2b2)
	.dwattr $C$DW$161, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$161, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spiAPI.c",line 691,column 1,is_stmt,address ||SPI_IntSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_IntSet||
$C$DW$162	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$162, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$162, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$162, DW_AT_location[DW_OP_regx 0x38]
$C$DW$163	.dwtag  DW_TAG_formal_parameter, DW_AT_name("mode")
	.dwattr $C$DW$163, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$163, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$164	.dwtag  DW_TAG_formal_parameter, DW_AT_name("intFlags")
	.dwattr $C$DW$164, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$164, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$164, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$165	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$165, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$165, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$165, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$166	.dwtag  DW_TAG_variable, DW_AT_name("mode")
	.dwattr $C$DW$166, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$166, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$166, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$167	.dwtag  DW_TAG_variable, DW_AT_name("intFlags")
	.dwattr $C$DW$167, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$167, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$167, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |691| intFlags
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |691| mode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |691| spiAddr
	.dwpsn	file "../spiAPI.c",line 692,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |692| mode
        QBNE      ||$C$L13||, r0, 0x01  ; [ALU_PRU] |692| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 694,column 3,is_stmt,isa 0
        LDI       r0, 0x011c            ; [ALU_PRU] |694| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |694| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |694| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |694| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |694| intFlags
        OR        r1, r14, r1           ; [ALU_PRU] |694| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |694| 
	.dwpsn	file "../spiAPI.c",line 695,column 2,is_stmt,isa 0
        JMP       ||$C$L14||            ; [ALU_PRU] |695| 
;* --------------------------------------------------------------------------*
||$C$L13||:    
	.dwpsn	file "../spiAPI.c",line 695,column 9,is_stmt,isa 0
        QBNE      ||$C$L14||, r0, 0x00  ; [ALU_PRU] |695| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 696,column 3,is_stmt,isa 0
        LDI       r0, 0x011c            ; [ALU_PRU] |696| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |696| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |696| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |696| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |696| intFlags
        NOT       r1, r1                ; [ALU_PRU] |696| 
        AND       r1, r14, r1           ; [ALU_PRU] |696| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |696| 
	.dwpsn	file "../spiAPI.c",line 698,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L14||:    
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$168	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$168, DW_AT_low_pc(0x00)
	.dwattr $C$DW$168, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$161, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$161, DW_AT_TI_end_line(0x2ba)
	.dwattr $C$DW$161, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$161

	.sect	".text:SPI_InitDelaySet"
	.clink
	.global	||SPI_InitDelaySet||

$C$DW$169	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_InitDelaySet")
	.dwattr $C$DW$169, DW_AT_low_pc(||SPI_InitDelaySet||)
	.dwattr $C$DW$169, DW_AT_high_pc(0x00)
	.dwattr $C$DW$169, DW_AT_TI_symbol_name("SPI_InitDelaySet")
	.dwattr $C$DW$169, DW_AT_external
	.dwattr $C$DW$169, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$169, DW_AT_TI_begin_line(0x2c8)
	.dwattr $C$DW$169, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$169, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$169, DW_AT_decl_line(0x2c8)
	.dwattr $C$DW$169, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$169, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 713,column 1,is_stmt,address ||SPI_InitDelaySet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_InitDelaySet||
$C$DW$170	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$170, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$170, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$170, DW_AT_location[DW_OP_regx 0x38]
$C$DW$171	.dwtag  DW_TAG_formal_parameter, DW_AT_name("initDelay")
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("initDelay")
	.dwattr $C$DW$171, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$171, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_InitDelaySet              FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_InitDelaySet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$172	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$172, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$172, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$172, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$173	.dwtag  DW_TAG_variable, DW_AT_name("initDelay")
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("initDelay")
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$173, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |713| initDelay
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |713| spiAddr
	.dwpsn	file "../spiAPI.c",line 714,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |714| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |714| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |714| 
        LDI32     r1, 0xffffff8f        ; [ALU_PRU] |714| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |714| 
        AND       r1, r14, r1           ; [ALU_PRU] |714| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |714| 
	.dwpsn	file "../spiAPI.c",line 715,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |715| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |715| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |715| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |715| initDelay
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |715| 
        AND       r1, r1, 0x70          ; [ALU_PRU] |715| 
        OR        r1, r14, r1           ; [ALU_PRU] |715| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |715| 
	.dwpsn	file "../spiAPI.c",line 716,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$174	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$174, DW_AT_low_pc(0x00)
	.dwattr $C$DW$174, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$169, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$169, DW_AT_TI_end_line(0x2cc)
	.dwattr $C$DW$169, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$169

	.sect	".text:SPI_SysTestModeSet"
	.clink
	.global	||SPI_SysTestModeSet||

$C$DW$175	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SysTestModeSet")
	.dwattr $C$DW$175, DW_AT_low_pc(||SPI_SysTestModeSet||)
	.dwattr $C$DW$175, DW_AT_high_pc(0x00)
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("SPI_SysTestModeSet")
	.dwattr $C$DW$175, DW_AT_external
	.dwattr $C$DW$175, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$175, DW_AT_TI_begin_line(0x2d8)
	.dwattr $C$DW$175, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$175, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$175, DW_AT_decl_line(0x2d8)
	.dwattr $C$DW$175, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$175, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 729,column 1,is_stmt,address ||SPI_SysTestModeSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SysTestModeSet||
$C$DW$176	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$176, DW_AT_location[DW_OP_regx 0x38]
$C$DW$177	.dwtag  DW_TAG_formal_parameter, DW_AT_name("sysTest")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("sysTest")
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$177, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_SysTestModeSet            FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_SysTestModeSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$178	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$178, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$178, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$178, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$179	.dwtag  DW_TAG_variable, DW_AT_name("sysTest")
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("sysTest")
	.dwattr $C$DW$179, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$179, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |729| sysTest
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |729| spiAddr
	.dwpsn	file "../spiAPI.c",line 730,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |730| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |730| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |730| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |730| 
        CLR       r1, r1, 0x00000003    ; [ALU_PRU] |730| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |730| 
	.dwpsn	file "../spiAPI.c",line 731,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |731| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |731| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |731| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |731| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |731| sysTest
        AND       r1, r1, 0x08          ; [ALU_PRU] |731| 
        OR        r1, r14, r1           ; [ALU_PRU] |731| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |731| 
	.dwpsn	file "../spiAPI.c",line 732,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$180	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$180, DW_AT_low_pc(0x00)
	.dwattr $C$DW$180, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$175, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$175, DW_AT_TI_end_line(0x2dc)
	.dwattr $C$DW$175, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$175

	.sect	".text:SPI_SlaveSelect"
	.clink
	.global	||SPI_SlaveSelect||

$C$DW$181	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SlaveSelect")
	.dwattr $C$DW$181, DW_AT_low_pc(||SPI_SlaveSelect||)
	.dwattr $C$DW$181, DW_AT_high_pc(0x00)
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("SPI_SlaveSelect")
	.dwattr $C$DW$181, DW_AT_external
	.dwattr $C$DW$181, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$181, DW_AT_TI_begin_line(0x2e8)
	.dwattr $C$DW$181, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$181, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$181, DW_AT_decl_line(0x2e8)
	.dwattr $C$DW$181, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$181, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 745,column 1,is_stmt,address ||SPI_SlaveSelect||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SlaveSelect||
$C$DW$182	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$182, DW_AT_location[DW_OP_regx 0x38]
$C$DW$183	.dwtag  DW_TAG_formal_parameter, DW_AT_name("slaveSelect")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("slaveSelect")
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$183, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$184	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$184, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$184, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$184, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$185	.dwtag  DW_TAG_variable, DW_AT_name("slaveSelect")
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("slaveSelect")
	.dwattr $C$DW$185, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$185, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |745| slaveSelect
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |745| spiAddr
	.dwpsn	file "../spiAPI.c",line 746,column 2,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |746| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |746| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |746| 
        LDI32     r1, 0xff9fffff        ; [ALU_PRU] |746| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |746| 
        AND       r1, r14, r1           ; [ALU_PRU] |746| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |746| 
	.dwpsn	file "../spiAPI.c",line 747,column 2,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |747| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |747| spiAddr
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |747| slaveSelect
        ADD       r0, r1, r0            ; [ALU_PRU] |747| 
        LDI32     r1, 0x00600000        ; [ALU_PRU] |747| 
        AND       r1, r14, r1           ; [ALU_PRU] |747| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |747| 
        OR        r1, r14, r1           ; [ALU_PRU] |747| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |747| 
	.dwpsn	file "../spiAPI.c",line 748,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$186	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$186, DW_AT_low_pc(0x00)
	.dwattr $C$DW$186, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$181, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$181, DW_AT_TI_end_line(0x2ec)
	.dwattr $C$DW$181, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$181

	.sect	".text:SPI_TransmitData"
	.clink
	.global	||SPI_TransmitData||

$C$DW$187	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_TransmitData")
	.dwattr $C$DW$187, DW_AT_low_pc(||SPI_TransmitData||)
	.dwattr $C$DW$187, DW_AT_high_pc(0x00)
	.dwattr $C$DW$187, DW_AT_TI_symbol_name("SPI_TransmitData")
	.dwattr $C$DW$187, DW_AT_external
	.dwattr $C$DW$187, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$187, DW_AT_TI_begin_line(0x2f7)
	.dwattr $C$DW$187, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$187, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$187, DW_AT_decl_line(0x2f7)
	.dwattr $C$DW$187, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$187, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spiAPI.c",line 760,column 1,is_stmt,address ||SPI_TransmitData||,isa 0

	.dwfde $C$DW$CIE, ||SPI_TransmitData||
$C$DW$188	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$188, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$188, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$188, DW_AT_location[DW_OP_regx 0x38]
$C$DW$189	.dwtag  DW_TAG_formal_parameter, DW_AT_name("txData")
	.dwattr $C$DW$189, DW_AT_TI_symbol_name("txData")
	.dwattr $C$DW$189, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$189, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$190	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$190, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$190, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$190, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$191	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$191, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$191, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$191, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$192	.dwtag  DW_TAG_variable, DW_AT_name("txData")
	.dwattr $C$DW$192, DW_AT_TI_symbol_name("txData")
	.dwattr $C$DW$192, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$192, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$193	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$193, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$193, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$193, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |760| chNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |760| txData
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |760| spiAddr
	.dwpsn	file "../spiAPI.c",line 761,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0138        ; [ALU_PRU] |761| 
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |761| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |761| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |761| 
        ADD       r0, r0, r1            ; [ALU_PRU] |761| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |761| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |761| 
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |761| txData
        SBBO      &r0, r1, r14.w0, 4    ; [ALU_PRU] |761| 
	.dwpsn	file "../spiAPI.c",line 762,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$194	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$194, DW_AT_low_pc(0x00)
	.dwattr $C$DW$194, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$187, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$187, DW_AT_TI_end_line(0x2fa)
	.dwattr $C$DW$187, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$187

	.sect	".text:SPI_ReceiveData"
	.clink
	.global	||SPI_ReceiveData||

$C$DW$195	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ReceiveData")
	.dwattr $C$DW$195, DW_AT_low_pc(||SPI_ReceiveData||)
	.dwattr $C$DW$195, DW_AT_high_pc(0x00)
	.dwattr $C$DW$195, DW_AT_TI_symbol_name("SPI_ReceiveData")
	.dwattr $C$DW$195, DW_AT_external
	.dwattr $C$DW$195, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$195, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$195, DW_AT_TI_begin_line(0x330)
	.dwattr $C$DW$195, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$195, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$195, DW_AT_decl_line(0x330)
	.dwattr $C$DW$195, DW_AT_decl_column(0x11)
	.dwattr $C$DW$195, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 817,column 1,is_stmt,address ||SPI_ReceiveData||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ReceiveData||
$C$DW$196	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$196, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$196, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$196, DW_AT_location[DW_OP_regx 0x38]
$C$DW$197	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$197, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$197, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$197, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$198	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$198, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$198, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$198, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$199	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$199, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$199, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$199, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |817| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |817| spiAddr
	.dwpsn	file "../spiAPI.c",line 818,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |818| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |818| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |818| 
        ADD       r0, r0, r1            ; [ALU_PRU] |818| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |818| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |818| 
        LDI       r1.w0, 0x013c         ; [ALU_PRU] |818| 
        LBBO      &r14, r0, r1.w0, 4    ; [ALU_PRU] |818| 
	.dwpsn	file "../spiAPI.c",line 819,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$200	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$200, DW_AT_low_pc(0x00)
	.dwattr $C$DW$200, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$195, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$195, DW_AT_TI_end_line(0x333)
	.dwattr $C$DW$195, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$195

	.sect	".text:SPI_IntStatusGet"
	.clink
	.global	||SPI_IntStatusGet||

$C$DW$201	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_IntStatusGet")
	.dwattr $C$DW$201, DW_AT_low_pc(||SPI_IntStatusGet||)
	.dwattr $C$DW$201, DW_AT_high_pc(0x00)
	.dwattr $C$DW$201, DW_AT_TI_symbol_name("SPI_IntStatusGet")
	.dwattr $C$DW$201, DW_AT_external
	.dwattr $C$DW$201, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$201, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$201, DW_AT_TI_begin_line(0x340)
	.dwattr $C$DW$201, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$201, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$201, DW_AT_decl_line(0x340)
	.dwattr $C$DW$201, DW_AT_decl_column(0x11)
	.dwattr $C$DW$201, DW_AT_TI_max_frame_size(0x04)
	.dwpsn	file "../spiAPI.c",line 833,column 1,is_stmt,address ||SPI_IntStatusGet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_IntStatusGet||
$C$DW$202	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$202, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$202, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$202, DW_AT_location[DW_OP_regx 0x38]

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
$C$DW$203	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$203, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$203, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$203, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |833| spiAddr
	.dwpsn	file "../spiAPI.c",line 834,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0118         ; [ALU_PRU] |834| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |834| spiAddr
        LBBO      &r14, r0, r1.w0, 4    ; [ALU_PRU] |834| 
	.dwpsn	file "../spiAPI.c",line 835,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x04          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$204	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$204, DW_AT_low_pc(0x00)
	.dwattr $C$DW$204, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$201, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$201, DW_AT_TI_end_line(0x343)
	.dwattr $C$DW$201, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$201

	.sect	".text:SPI_IntStatusClear"
	.clink
	.global	||SPI_IntStatusClear||

$C$DW$205	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_IntStatusClear")
	.dwattr $C$DW$205, DW_AT_low_pc(||SPI_IntStatusClear||)
	.dwattr $C$DW$205, DW_AT_high_pc(0x00)
	.dwattr $C$DW$205, DW_AT_TI_symbol_name("SPI_IntStatusClear")
	.dwattr $C$DW$205, DW_AT_external
	.dwattr $C$DW$205, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$205, DW_AT_TI_begin_line(0x350)
	.dwattr $C$DW$205, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$205, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$205, DW_AT_decl_line(0x350)
	.dwattr $C$DW$205, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$205, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 849,column 1,is_stmt,address ||SPI_IntStatusClear||,isa 0

	.dwfde $C$DW$CIE, ||SPI_IntStatusClear||
$C$DW$206	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$206, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$206, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$206, DW_AT_location[DW_OP_regx 0x38]
$C$DW$207	.dwtag  DW_TAG_formal_parameter, DW_AT_name("intFlags")
	.dwattr $C$DW$207, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$207, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$207, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$208	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$208, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$208, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$208, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$209	.dwtag  DW_TAG_variable, DW_AT_name("intFlags")
	.dwattr $C$DW$209, DW_AT_TI_symbol_name("intFlags")
	.dwattr $C$DW$209, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$209, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |849| intFlags
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |849| spiAddr
	.dwpsn	file "../spiAPI.c",line 850,column 2,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |850| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |850| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |850| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |850| 
        CLR       r1, r1, 0x0000000b    ; [ALU_PRU] |850| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |850| 
	.dwpsn	file "../spiAPI.c",line 851,column 2,is_stmt,isa 0
        LDI       r14.w0, 0x0118        ; [ALU_PRU] |851| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |851| spiAddr
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |851| intFlags
        SBBO      &r0, r1, r14.w0, 4    ; [ALU_PRU] |851| 
	.dwpsn	file "../spiAPI.c",line 852,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$210	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$210, DW_AT_low_pc(0x00)
	.dwattr $C$DW$210, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$205, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$205, DW_AT_TI_end_line(0x354)
	.dwattr $C$DW$205, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$205

	.sect	".text:SPI_ChannelStatusGet"
	.clink
	.global	||SPI_ChannelStatusGet||

$C$DW$211	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ChannelStatusGet")
	.dwattr $C$DW$211, DW_AT_low_pc(||SPI_ChannelStatusGet||)
	.dwattr $C$DW$211, DW_AT_high_pc(0x00)
	.dwattr $C$DW$211, DW_AT_TI_symbol_name("SPI_ChannelStatusGet")
	.dwattr $C$DW$211, DW_AT_external
	.dwattr $C$DW$211, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$211, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$211, DW_AT_TI_begin_line(0x424)
	.dwattr $C$DW$211, DW_AT_TI_begin_column(0x11)
	.dwattr $C$DW$211, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$211, DW_AT_decl_line(0x424)
	.dwattr $C$DW$211, DW_AT_decl_column(0x11)
	.dwattr $C$DW$211, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 1061,column 1,is_stmt,address ||SPI_ChannelStatusGet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ChannelStatusGet||
$C$DW$212	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$212, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$212, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$212, DW_AT_location[DW_OP_regx 0x38]
$C$DW$213	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$213, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$213, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$214	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$214, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$215	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$215, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$215, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$215, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1061| chNum
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1061| spiAddr
	.dwpsn	file "../spiAPI.c",line 1062,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |1062| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |1062| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |1062| 
        ADD       r0, r0, r1            ; [ALU_PRU] |1062| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1062| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1062| 
        LDI       r1.w0, 0x0130         ; [ALU_PRU] |1062| 
        LBBO      &r14, r0, r1.w0, 4    ; [ALU_PRU] |1062| 
	.dwpsn	file "../spiAPI.c",line 1063,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$216	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$216, DW_AT_low_pc(0x00)
	.dwattr $C$DW$216, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$211, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$211, DW_AT_TI_end_line(0x427)
	.dwattr $C$DW$211, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$211

	.sect	".text:SPI_MultiWordAccessSet"
	.clink
	.global	||SPI_MultiWordAccessSet||

$C$DW$217	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_MultiWordAccessSet")
	.dwattr $C$DW$217, DW_AT_low_pc(||SPI_MultiWordAccessSet||)
	.dwattr $C$DW$217, DW_AT_high_pc(0x00)
	.dwattr $C$DW$217, DW_AT_TI_symbol_name("SPI_MultiWordAccessSet")
	.dwattr $C$DW$217, DW_AT_external
	.dwattr $C$DW$217, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$217, DW_AT_TI_begin_line(0x433)
	.dwattr $C$DW$217, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$217, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$217, DW_AT_decl_line(0x433)
	.dwattr $C$DW$217, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$217, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 1076,column 1,is_stmt,address ||SPI_MultiWordAccessSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_MultiWordAccessSet||
$C$DW$218	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$218, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$218, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$218, DW_AT_location[DW_OP_regx 0x38]
$C$DW$219	.dwtag  DW_TAG_formal_parameter, DW_AT_name("moa")
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("moa")
	.dwattr $C$DW$219, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$219, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_MultiWordAccessSet        FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_MultiWordAccessSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$220	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$220, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$220, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$220, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$221	.dwtag  DW_TAG_variable, DW_AT_name("moa")
	.dwattr $C$DW$221, DW_AT_TI_symbol_name("moa")
	.dwattr $C$DW$221, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$221, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1076| moa
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1076| spiAddr
	.dwpsn	file "../spiAPI.c",line 1077,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |1077| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1077| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1077| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1077| 
        CLR       r1, r1, 0x00000007    ; [ALU_PRU] |1077| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1077| 
	.dwpsn	file "../spiAPI.c",line 1078,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |1078| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1078| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1078| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1078| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1078| moa
        AND       r1, r1, 0x80          ; [ALU_PRU] |1078| 
        OR        r1, r14, r1           ; [ALU_PRU] |1078| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1078| 
	.dwpsn	file "../spiAPI.c",line 1079,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$222	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$222, DW_AT_low_pc(0x00)
	.dwattr $C$DW$222, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$217, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$217, DW_AT_TI_end_line(0x437)
	.dwattr $C$DW$217, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$217

	.sect	".text:SPI_FIFODatSet"
	.clink
	.global	||SPI_FIFODatSet||

$C$DW$223	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_FIFODatSet")
	.dwattr $C$DW$223, DW_AT_low_pc(||SPI_FIFODatSet||)
	.dwattr $C$DW$223, DW_AT_high_pc(0x00)
	.dwattr $C$DW$223, DW_AT_TI_symbol_name("SPI_FIFODatSet")
	.dwattr $C$DW$223, DW_AT_external
	.dwattr $C$DW$223, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$223, DW_AT_TI_begin_line(0x443)
	.dwattr $C$DW$223, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$223, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$223, DW_AT_decl_line(0x443)
	.dwattr $C$DW$223, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$223, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 1092,column 1,is_stmt,address ||SPI_FIFODatSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_FIFODatSet||
$C$DW$224	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$224, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$224, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$224, DW_AT_location[DW_OP_regx 0x38]
$C$DW$225	.dwtag  DW_TAG_formal_parameter, DW_AT_name("fdaa")
	.dwattr $C$DW$225, DW_AT_TI_symbol_name("fdaa")
	.dwattr $C$DW$225, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$225, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$226	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$226, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$226, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$226, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$227	.dwtag  DW_TAG_variable, DW_AT_name("fdaa")
	.dwattr $C$DW$227, DW_AT_TI_symbol_name("fdaa")
	.dwattr $C$DW$227, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$227, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1092| fdaa
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1092| spiAddr
	.dwpsn	file "../spiAPI.c",line 1093,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |1093| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1093| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1093| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1093| 
        CLR       r1, r1, 0x00000008    ; [ALU_PRU] |1093| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1093| 
	.dwpsn	file "../spiAPI.c",line 1094,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |1094| 
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |1094| fdaa
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1094| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1094| 
        LDI       r1, 0x0100            ; [ALU_PRU] |1094| 
        AND       r1, r14, r1           ; [ALU_PRU] |1094| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1094| 
        OR        r1, r14, r1           ; [ALU_PRU] |1094| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1094| 
	.dwpsn	file "../spiAPI.c",line 1095,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$228	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$228, DW_AT_low_pc(0x00)
	.dwattr $C$DW$228, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$223, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$223, DW_AT_TI_end_line(0x447)
	.dwattr $C$DW$223, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$223

	.sect	".text:SPI_AutoIdleSet"
	.clink
	.global	||SPI_AutoIdleSet||

$C$DW$229	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_AutoIdleSet")
	.dwattr $C$DW$229, DW_AT_low_pc(||SPI_AutoIdleSet||)
	.dwattr $C$DW$229, DW_AT_high_pc(0x00)
	.dwattr $C$DW$229, DW_AT_TI_symbol_name("SPI_AutoIdleSet")
	.dwattr $C$DW$229, DW_AT_external
	.dwattr $C$DW$229, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$229, DW_AT_TI_begin_line(0x453)
	.dwattr $C$DW$229, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$229, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$229, DW_AT_decl_line(0x453)
	.dwattr $C$DW$229, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$229, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 1108,column 1,is_stmt,address ||SPI_AutoIdleSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_AutoIdleSet||
$C$DW$230	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$230, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$230, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$230, DW_AT_location[DW_OP_regx 0x38]
$C$DW$231	.dwtag  DW_TAG_formal_parameter, DW_AT_name("autoIdle")
	.dwattr $C$DW$231, DW_AT_TI_symbol_name("autoIdle")
	.dwattr $C$DW$231, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$231, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_AutoIdleSet               FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_AutoIdleSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$232	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$232, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$232, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$232, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$233	.dwtag  DW_TAG_variable, DW_AT_name("autoIdle")
	.dwattr $C$DW$233, DW_AT_TI_symbol_name("autoIdle")
	.dwattr $C$DW$233, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$233, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1108| autoIdle
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1108| spiAddr
	.dwpsn	file "../spiAPI.c",line 1109,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1109| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1109| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1109| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1109| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |1109| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1109| 
	.dwpsn	file "../spiAPI.c",line 1110,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1110| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1110| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1110| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1110| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1110| autoIdle
        AND       r1, r1, 0x01          ; [ALU_PRU] |1110| 
        OR        r1, r14, r1           ; [ALU_PRU] |1110| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1110| 
	.dwpsn	file "../spiAPI.c",line 1111,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$234	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$234, DW_AT_low_pc(0x00)
	.dwattr $C$DW$234, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$229, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$229, DW_AT_TI_end_line(0x457)
	.dwattr $C$DW$229, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$229

	.sect	".text:SPI_SmartIdleSet"
	.clink
	.global	||SPI_SmartIdleSet||

$C$DW$235	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SmartIdleSet")
	.dwattr $C$DW$235, DW_AT_low_pc(||SPI_SmartIdleSet||)
	.dwattr $C$DW$235, DW_AT_high_pc(0x00)
	.dwattr $C$DW$235, DW_AT_TI_symbol_name("SPI_SmartIdleSet")
	.dwattr $C$DW$235, DW_AT_external
	.dwattr $C$DW$235, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$235, DW_AT_TI_begin_line(0x464)
	.dwattr $C$DW$235, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$235, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$235, DW_AT_decl_line(0x464)
	.dwattr $C$DW$235, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$235, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 1125,column 1,is_stmt,address ||SPI_SmartIdleSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SmartIdleSet||
$C$DW$236	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$236, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$236, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$236, DW_AT_location[DW_OP_regx 0x38]
$C$DW$237	.dwtag  DW_TAG_formal_parameter, DW_AT_name("smartIdle")
	.dwattr $C$DW$237, DW_AT_TI_symbol_name("smartIdle")
	.dwattr $C$DW$237, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$237, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_SmartIdleSet              FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_SmartIdleSet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$238	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$238, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$238, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$238, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$239	.dwtag  DW_TAG_variable, DW_AT_name("smartIdle")
	.dwattr $C$DW$239, DW_AT_TI_symbol_name("smartIdle")
	.dwattr $C$DW$239, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$239, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1125| smartIdle
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1125| spiAddr
	.dwpsn	file "../spiAPI.c",line 1126,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1126| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1126| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1126| 
        LDI32     r1, 0xffffffe7        ; [ALU_PRU] |1126| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1126| 
        AND       r1, r14, r1           ; [ALU_PRU] |1126| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1126| 
	.dwpsn	file "../spiAPI.c",line 1127,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1127| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1127| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1127| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1127| smartIdle
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1127| 
        AND       r1, r1, 0x18          ; [ALU_PRU] |1127| 
        OR        r1, r14, r1           ; [ALU_PRU] |1127| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1127| 
	.dwpsn	file "../spiAPI.c",line 1128,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$240	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$240, DW_AT_low_pc(0x00)
	.dwattr $C$DW$240, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$235, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$235, DW_AT_TI_end_line(0x468)
	.dwattr $C$DW$235, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$235

	.sect	".text:SPI_ClkActivitySet"
	.clink
	.global	||SPI_ClkActivitySet||

$C$DW$241	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkActivitySet")
	.dwattr $C$DW$241, DW_AT_low_pc(||SPI_ClkActivitySet||)
	.dwattr $C$DW$241, DW_AT_high_pc(0x00)
	.dwattr $C$DW$241, DW_AT_TI_symbol_name("SPI_ClkActivitySet")
	.dwattr $C$DW$241, DW_AT_external
	.dwattr $C$DW$241, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$241, DW_AT_TI_begin_line(0x475)
	.dwattr $C$DW$241, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$241, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$241, DW_AT_decl_line(0x475)
	.dwattr $C$DW$241, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$241, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 1142,column 1,is_stmt,address ||SPI_ClkActivitySet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkActivitySet||
$C$DW$242	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$242, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$242, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$242, DW_AT_location[DW_OP_regx 0x38]
$C$DW$243	.dwtag  DW_TAG_formal_parameter, DW_AT_name("clkAct")
	.dwattr $C$DW$243, DW_AT_TI_symbol_name("clkAct")
	.dwattr $C$DW$243, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$243, DW_AT_location[DW_OP_regx 0x3c]

;***************************************************************
;* FNAME: SPI_ClkActivitySet            FR SIZE:   8           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            8 Auto,  0 SOE     *
;***************************************************************

||SPI_ClkActivitySet||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 8
$C$DW$244	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$244, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$244, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$244, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$245	.dwtag  DW_TAG_variable, DW_AT_name("clkAct")
	.dwattr $C$DW$245, DW_AT_TI_symbol_name("clkAct")
	.dwattr $C$DW$245, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$245, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1142| clkAct
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1142| spiAddr
	.dwpsn	file "../spiAPI.c",line 1143,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1143| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1143| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1143| 
        LDI32     r1, 0xfffffcff        ; [ALU_PRU] |1143| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1143| 
        AND       r1, r14, r1           ; [ALU_PRU] |1143| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1143| 
	.dwpsn	file "../spiAPI.c",line 1144,column 2,is_stmt,isa 0
        LDI       r0, 0x0110            ; [ALU_PRU] |1144| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1144| spiAddr
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |1144| clkAct
        ADD       r0, r1, r0            ; [ALU_PRU] |1144| 
        LDI       r1, 0x0300            ; [ALU_PRU] |1144| 
        AND       r1, r14, r1           ; [ALU_PRU] |1144| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1144| 
        OR        r1, r14, r1           ; [ALU_PRU] |1144| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1144| 
	.dwpsn	file "../spiAPI.c",line 1145,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$246	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$246, DW_AT_low_pc(0x00)
	.dwattr $C$DW$246, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$241, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$241, DW_AT_TI_end_line(0x479)
	.dwattr $C$DW$241, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$241

	.sect	".text:SPI_ClkConfig"
	.clink
	.global	||SPI_ClkConfig||

$C$DW$247	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkConfig")
	.dwattr $C$DW$247, DW_AT_low_pc(||SPI_ClkConfig||)
	.dwattr $C$DW$247, DW_AT_high_pc(0x00)
	.dwattr $C$DW$247, DW_AT_TI_symbol_name("SPI_ClkConfig")
	.dwattr $C$DW$247, DW_AT_external
	.dwattr $C$DW$247, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$247, DW_AT_TI_begin_line(0x67)
	.dwattr $C$DW$247, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$247, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$247, DW_AT_decl_line(0x67)
	.dwattr $C$DW$247, DW_AT_decl_column(0x06)
	.dwattr $C$DW$247, DW_AT_TI_max_frame_size(0x22)
	.dwpsn	file "../spiAPI.c",line 104,column 1,is_stmt,address ||SPI_ClkConfig||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkConfig||
$C$DW$248	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$248, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$248, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$248, DW_AT_location[DW_OP_regx 0x38]
$C$DW$249	.dwtag  DW_TAG_formal_parameter, DW_AT_name("srcFreq")
	.dwattr $C$DW$249, DW_AT_TI_symbol_name("srcFreq")
	.dwattr $C$DW$249, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$249, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$250	.dwtag  DW_TAG_formal_parameter, DW_AT_name("sampleFreq")
	.dwattr $C$DW$250, DW_AT_TI_symbol_name("sampleFreq")
	.dwattr $C$DW$250, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$250, DW_AT_location[DW_OP_regx 0x40]
$C$DW$251	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$251, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$251, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$251, DW_AT_location[DW_OP_regx 0x44]
$C$DW$252	.dwtag  DW_TAG_formal_parameter, DW_AT_name("clkMode")
	.dwattr $C$DW$252, DW_AT_TI_symbol_name("clkMode")
	.dwattr $C$DW$252, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$252, DW_AT_location[DW_OP_regx 0x48]

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
$C$DW$253	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$253, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$253, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$253, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$254	.dwtag  DW_TAG_variable, DW_AT_name("srcFreq")
	.dwattr $C$DW$254, DW_AT_TI_symbol_name("srcFreq")
	.dwattr $C$DW$254, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$254, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$255	.dwtag  DW_TAG_variable, DW_AT_name("sampleFreq")
	.dwattr $C$DW$255, DW_AT_TI_symbol_name("sampleFreq")
	.dwattr $C$DW$255, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$255, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$256	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$256, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$256, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$256, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
$C$DW$257	.dwtag  DW_TAG_variable, DW_AT_name("clkMode")
	.dwattr $C$DW$257, DW_AT_TI_symbol_name("clkMode")
	.dwattr $C$DW$257, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$257, DW_AT_location[DW_OP_breg8 16]
        NOP                             ; [ALU_PRU] 
$C$DW$258	.dwtag  DW_TAG_variable, DW_AT_name("fRatio")
	.dwattr $C$DW$258, DW_AT_TI_symbol_name("fRatio")
	.dwattr $C$DW$258, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$258, DW_AT_location[DW_OP_breg8 20]
        NOP                             ; [ALU_PRU] 
$C$DW$259	.dwtag  DW_TAG_variable, DW_AT_name("extClk")
	.dwattr $C$DW$259, DW_AT_TI_symbol_name("extClk")
	.dwattr $C$DW$259, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$259, DW_AT_location[DW_OP_breg8 24]
        NOP                             ; [ALU_PRU] 
$C$DW$260	.dwtag  DW_TAG_variable, DW_AT_name("clkD")
	.dwattr $C$DW$260, DW_AT_TI_symbol_name("clkD")
	.dwattr $C$DW$260, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$260, DW_AT_location[DW_OP_breg8 28]
        NOP                             ; [ALU_PRU] 
        SBBO      &r18, r2, 16, 4       ; [ALU_PRU] |104| clkMode
        SBBO      &r17, r2, 12, 4       ; [ALU_PRU] |104| chNum
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |104| sampleFreq
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |104| srcFreq
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |104| spiAddr
	.dwpsn	file "../spiAPI.c",line 105,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |105| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |105| fRatio
	.dwpsn	file "../spiAPI.c",line 106,column 18,is_stmt,isa 0
        SBBO      &r0, r2, 24, 4        ; [ALU_PRU] |106| extClk
	.dwpsn	file "../spiAPI.c",line 107,column 17,is_stmt,isa 0
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |107| clkD
	.dwpsn	file "../spiAPI.c",line 110,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |110| srcFreq
        LBBO      &r15, r2, 8, 4        ; [ALU_PRU] |110| sampleFreq
$C$DW$261	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$261, DW_AT_low_pc(0x00)
	.dwattr $C$DW$261, DW_AT_name("__pruabi_divu")
	.dwattr $C$DW$261, DW_AT_TI_call
        JAL       r3.w2, ||__pruabi_divu|| ; [ALU_PRU] |110| __pruabi_divu
        SBBO      &r14, r2, 20, 4       ; [ALU_PRU] |110| fRatio
	.dwpsn	file "../spiAPI.c",line 113,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |113| fRatio
        LBBO      &r1, r2, 20, 4        ; [ALU_PRU] |113| fRatio
        SUB       r0, r0, 0x01          ; [ALU_PRU] |113| 
        AND       r0, r1, r0            ; [ALU_PRU] |113| 
        QBEQ      ||$C$L15||, r0, 0x00  ; [ALU_PRU] |113| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 116,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |116| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |116| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |116| 
        ADD       r0, r0, r1            ; [ALU_PRU] |116| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |116| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |116| 
        LDI       r0, 0x012c            ; [ALU_PRU] |116| 
        ADD       r0, r1, r0            ; [ALU_PRU] |116| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |116| 
        SET       r1, r1, 0x0000001d    ; [ALU_PRU] |116| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |116| 
	.dwpsn	file "../spiAPI.c",line 119,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |119| fRatio
        SUB       r0, r0, 0x01          ; [ALU_PRU] |119| 
        LSR       r0, r0, 0x04          ; [ALU_PRU] |119| 
        SBBO      &r0, r2, 24, 4        ; [ALU_PRU] |119| extClk
	.dwpsn	file "../spiAPI.c",line 120,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |120| fRatio
        SUB       r0, r0, 0x01          ; [ALU_PRU] |120| 
        AND       r0, r0, 0x0f          ; [ALU_PRU] |120| 
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |120| clkD
	.dwpsn	file "../spiAPI.c",line 123,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |123| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |123| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |123| 
        ADD       r0, r0, r1            ; [ALU_PRU] |123| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |123| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |123| 
        LDI       r0, 0x0134            ; [ALU_PRU] |123| 
        ADD       r0, r1, r0            ; [ALU_PRU] |123| 
        LDI32     r1, 0xffff00ff        ; [ALU_PRU] |123| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |123| 
        AND       r1, r14, r1           ; [ALU_PRU] |123| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |123| 
	.dwpsn	file "../spiAPI.c",line 126,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |126| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |126| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |126| 
        ADD       r0, r0, r1            ; [ALU_PRU] |126| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |126| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |126| 
        LDI       r0, 0x0134            ; [ALU_PRU] |126| 
        ADD       r0, r1, r0            ; [ALU_PRU] |126| 
        LBBO      &r1, r2, 24, 4        ; [ALU_PRU] |126| extClk
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |126| 
        LSL       r1, r1, 0x08          ; [ALU_PRU] |126| 
        OR        r1, r14, r1           ; [ALU_PRU] |126| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |126| 
	.dwpsn	file "../spiAPI.c",line 127,column 2,is_stmt,isa 0
        JMP       ||$C$L17||            ; [ALU_PRU] |127| 
;* --------------------------------------------------------------------------*
||$C$L15||:    
	.dwpsn	file "../spiAPI.c",line 129,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |129| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |129| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |129| 
        ADD       r0, r0, r1            ; [ALU_PRU] |129| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |129| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |129| 
        LDI       r0, 0x012c            ; [ALU_PRU] |129| 
        ADD       r0, r1, r0            ; [ALU_PRU] |129| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |129| 
        CLR       r1, r1, 0x0000001d    ; [ALU_PRU] |129| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |129| 
	.dwpsn	file "../spiAPI.c",line 131,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |131| fRatio
        QBEQ      ||$C$L17||, r0, 0x01  ; [ALU_PRU] |131| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L16||
;*
;*   Loop source line                : 131
;*   Loop closing brace source line  : 135
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L16||:    
	.dwpsn	file "../spiAPI.c",line 133,column 4,is_stmt,isa 0
        LSR       r0, r0, 0x01          ; [ALU_PRU] |133| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |133| fRatio
	.dwpsn	file "../spiAPI.c",line 134,column 4,is_stmt,isa 0
        LBBO      &r0, r2, 28, 4        ; [ALU_PRU] |134| clkD
        ADD       r0, r0, 0x01          ; [ALU_PRU] |134| 
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |134| clkD
	.dwpsn	file "../spiAPI.c",line 131,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |131| fRatio
        QBNE      ||$C$L16||, r0, 0x01  ; [ALU_PRU] |131| 
;* --------------------------------------------------------------------------*
||$C$L17||:    
	.dwpsn	file "../spiAPI.c",line 139,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |139| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |139| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |139| 
        ADD       r0, r0, r1            ; [ALU_PRU] |139| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |139| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |139| 
        LDI       r0, 0x012c            ; [ALU_PRU] |139| 
        ADD       r0, r1, r0            ; [ALU_PRU] |139| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |139| 
        LDI32     r1, 0xffffffc3        ; [ALU_PRU] |139| 
        AND       r1, r14, r1           ; [ALU_PRU] |139| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |139| 
	.dwpsn	file "../spiAPI.c",line 142,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |142| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |142| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |142| 
        ADD       r0, r0, r1            ; [ALU_PRU] |142| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |142| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |142| 
        LDI       r0, 0x012c            ; [ALU_PRU] |142| 
        ADD       r0, r1, r0            ; [ALU_PRU] |142| 
        LBBO      &r1, r2, 28, 4        ; [ALU_PRU] |142| clkD
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |142| 
        LSL       r1, r1, 0x02          ; [ALU_PRU] |142| 
        OR        r1, r14, r1           ; [ALU_PRU] |142| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |142| 
	.dwpsn	file "../spiAPI.c",line 145,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |145| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |145| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |145| 
        ADD       r0, r0, r1            ; [ALU_PRU] |145| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |145| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |145| 
        LDI       r0, 0x012c            ; [ALU_PRU] |145| 
        ADD       r0, r1, r0            ; [ALU_PRU] |145| 
        LDI32     r1, 0xfffffffc        ; [ALU_PRU] |145| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |145| 
        AND       r1, r14, r1           ; [ALU_PRU] |145| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |145| 
	.dwpsn	file "../spiAPI.c",line 148,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |148| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |148| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |148| 
        ADD       r0, r0, r1            ; [ALU_PRU] |148| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |148| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |148| 
        LDI       r0, 0x012c            ; [ALU_PRU] |148| 
        ADD       r0, r1, r0            ; [ALU_PRU] |148| 
        LBBO      &r1, r2, 16, 4        ; [ALU_PRU] |148| clkMode
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |148| 
        AND       r1, r1, 0x03          ; [ALU_PRU] |148| 
        OR        r1, r14, r1           ; [ALU_PRU] |148| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |148| 
	.dwpsn	file "../spiAPI.c",line 149,column 1,is_stmt,isa 0
        LBBO      &r3.b2, r2, 32, 2     ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
        ADD       r2, r2, 0x22          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$262	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$262, DW_AT_low_pc(0x00)
	.dwattr $C$DW$262, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$247, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$247, DW_AT_TI_end_line(0x95)
	.dwattr $C$DW$247, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$247

	.sect	".text:SPI_CSSet"
	.clink
	.global	||SPI_CSSet||

$C$DW$263	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSSet")
	.dwattr $C$DW$263, DW_AT_low_pc(||SPI_CSSet||)
	.dwattr $C$DW$263, DW_AT_high_pc(0x00)
	.dwattr $C$DW$263, DW_AT_TI_symbol_name("SPI_CSSet")
	.dwattr $C$DW$263, DW_AT_external
	.dwattr $C$DW$263, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$263, DW_AT_TI_begin_line(0xb4)
	.dwattr $C$DW$263, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$263, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$263, DW_AT_decl_line(0xb4)
	.dwattr $C$DW$263, DW_AT_decl_column(0x06)
	.dwattr $C$DW$263, DW_AT_TI_max_frame_size(0x08)
	.dwpsn	file "../spiAPI.c",line 181,column 1,is_stmt,address ||SPI_CSSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSSet||
$C$DW$264	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$264, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$264, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$264, DW_AT_location[DW_OP_regx 0x38]
$C$DW$265	.dwtag  DW_TAG_formal_parameter, DW_AT_name("mode")
	.dwattr $C$DW$265, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$265, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$265, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$266	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$266, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$266, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$266, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$267	.dwtag  DW_TAG_variable, DW_AT_name("mode")
	.dwattr $C$DW$267, DW_AT_TI_symbol_name("mode")
	.dwattr $C$DW$267, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$267, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |181| mode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |181| spiAddr
	.dwpsn	file "../spiAPI.c",line 182,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |182| mode
        QBNE      ||$C$L18||, r0, 0x01  ; [ALU_PRU] |182| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 184,column 3,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |184| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |184| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |184| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |184| 
        CLR       r1, r1, 0x00000001    ; [ALU_PRU] |184| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |184| 
	.dwpsn	file "../spiAPI.c",line 185,column 2,is_stmt,isa 0
        JMP       ||$C$L19||            ; [ALU_PRU] |185| 
;* --------------------------------------------------------------------------*
||$C$L18||:    
	.dwpsn	file "../spiAPI.c",line 185,column 9,is_stmt,isa 0
        QBNE      ||$C$L19||, r0, 0x00  ; [ALU_PRU] |185| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 186,column 3,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |186| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |186| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |186| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |186| 
        SET       r1, r1, 0x00000001    ; [ALU_PRU] |186| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |186| 
	.dwpsn	file "../spiAPI.c",line 188,column 1,is_stmt,isa 0
;* --------------------------------------------------------------------------*
||$C$L19||:    
        ADD       r2, r2, 0x08          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$268	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$268, DW_AT_low_pc(0x00)
	.dwattr $C$DW$268, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$263, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$263, DW_AT_TI_end_line(0xbc)
	.dwattr $C$DW$263, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$263

	.sect	".text:SPI_MasterModeSet"
	.clink
	.global	||SPI_MasterModeSet||

$C$DW$269	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_MasterModeSet")
	.dwattr $C$DW$269, DW_AT_low_pc(||SPI_MasterModeSet||)
	.dwattr $C$DW$269, DW_AT_high_pc(0x00)
	.dwattr $C$DW$269, DW_AT_TI_symbol_name("SPI_MasterModeSet")
	.dwattr $C$DW$269, DW_AT_external
	.dwattr $C$DW$269, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$269, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$269, DW_AT_TI_begin_line(0x154)
	.dwattr $C$DW$269, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$269, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$269, DW_AT_decl_line(0x154)
	.dwattr $C$DW$269, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$269, DW_AT_TI_max_frame_size(0x18)
	.dwpsn	file "../spiAPI.c",line 341,column 1,is_stmt,address ||SPI_MasterModeSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_MasterModeSet||
$C$DW$270	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$270, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$270, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$270, DW_AT_location[DW_OP_regx 0x38]
$C$DW$271	.dwtag  DW_TAG_formal_parameter, DW_AT_name("channelMode")
	.dwattr $C$DW$271, DW_AT_TI_symbol_name("channelMode")
	.dwattr $C$DW$271, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$271, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$272	.dwtag  DW_TAG_formal_parameter, DW_AT_name("trMode")
	.dwattr $C$DW$272, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$272, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$272, DW_AT_location[DW_OP_regx 0x40]
$C$DW$273	.dwtag  DW_TAG_formal_parameter, DW_AT_name("pinMode")
	.dwattr $C$DW$273, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$273, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$273, DW_AT_location[DW_OP_regx 0x44]
$C$DW$274	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$274, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$274, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$274, DW_AT_location[DW_OP_regx 0x48]

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
$C$DW$275	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$275, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$275, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$275, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$276	.dwtag  DW_TAG_variable, DW_AT_name("channelMode")
	.dwattr $C$DW$276, DW_AT_TI_symbol_name("channelMode")
	.dwattr $C$DW$276, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$276, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$277	.dwtag  DW_TAG_variable, DW_AT_name("trMode")
	.dwattr $C$DW$277, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$277, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$277, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$278	.dwtag  DW_TAG_variable, DW_AT_name("pinMode")
	.dwattr $C$DW$278, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$278, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$278, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
$C$DW$279	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$279, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$279, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$279, DW_AT_location[DW_OP_breg8 16]
        NOP                             ; [ALU_PRU] 
$C$DW$280	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$280, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$280, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$280, DW_AT_location[DW_OP_breg8 20]
        NOP                             ; [ALU_PRU] 
        SBBO      &r18, r2, 16, 4       ; [ALU_PRU] |341| chNum
        SBBO      &r17, r2, 12, 4       ; [ALU_PRU] |341| pinMode
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |341| trMode
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |341| channelMode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |341| spiAddr
	.dwpsn	file "../spiAPI.c",line 342,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |342| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |342| retVal
	.dwpsn	file "../spiAPI.c",line 344,column 2,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |344| spiAddr
        LDI       r0, 0x0128            ; [ALU_PRU] |344| 
        ADD       r0, r1, r0            ; [ALU_PRU] |344| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |344| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |344| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |344| 
	.dwpsn	file "../spiAPI.c",line 345,column 2,is_stmt,isa 0
        LDI       r0, 0x0128            ; [ALU_PRU] |345| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |345| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |345| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |345| channelMode
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |345| 
        AND       r1, r1, 0x01          ; [ALU_PRU] |345| 
        OR        r1, r14, r1           ; [ALU_PRU] |345| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |345| 
	.dwpsn	file "../spiAPI.c",line 347,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |347| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |347| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |347| 
        ADD       r0, r0, r1            ; [ALU_PRU] |347| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |347| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |347| 
        LDI       r0, 0x012c            ; [ALU_PRU] |347| 
        ADD       r0, r1, r0            ; [ALU_PRU] |347| 
        LDI32     r1, 0xffffcfff        ; [ALU_PRU] |347| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |347| 
        AND       r1, r14, r1           ; [ALU_PRU] |347| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |347| 
	.dwpsn	file "../spiAPI.c",line 348,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |348| chNum
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |348| trMode
        LSL       r1, r0, 0x02          ; [ALU_PRU] |348| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |348| 
        ADD       r0, r0, r1            ; [ALU_PRU] |348| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |348| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |348| 
        LDI       r0, 0x012c            ; [ALU_PRU] |348| 
        ADD       r0, r1, r0            ; [ALU_PRU] |348| 
        LDI       r1, 0x3000            ; [ALU_PRU] |348| 
        AND       r1, r14, r1           ; [ALU_PRU] |348| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |348| 
        OR        r1, r14, r1           ; [ALU_PRU] |348| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |348| 
	.dwpsn	file "../spiAPI.c",line 352,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |352| trMode
        QBNE      ||$C$L20||, r0, 0x00  ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |352| pinMode
        QBNE      ||$C$L20||, r0, 0x00  ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L23||            ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
||$C$L20||:    
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |352| trMode
        LDI32     r1, 0x02000000        ; [ALU_PRU] |352| 
        QBNE      ||$C$L21||, r0, r1    ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |352| pinMode
        QBNE      ||$C$L21||, r0, 0x00  ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L23||            ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
||$C$L21||:    
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |352| trMode
        QBNE      ||$C$L22||, r0, 0x00  ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |352| pinMode
        QBNE      ||$C$L22||, r0, 0x00  ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L23||            ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
||$C$L22||:    
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |352| trMode
        QBNE      ||$C$L24||, r0, r1    ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 12, 4        ; [ALU_PRU] |352| pinMode
        QBNE      ||$C$L24||, r0, 0x00  ; [ALU_PRU] |352| 
;* --------------------------------------------------------------------------*
||$C$L23||:    
	.dwpsn	file "../spiAPI.c",line 357,column 3,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |357| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |357| retVal
	.dwpsn	file "../spiAPI.c",line 358,column 2,is_stmt,isa 0
        JMP       ||$C$L25||            ; [ALU_PRU] |358| 
;* --------------------------------------------------------------------------*
||$C$L24||:    
	.dwpsn	file "../spiAPI.c",line 359,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |359| chNum
        LSL       r1, r0, 0x02          ; [ALU_PRU] |359| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |359| 
        ADD       r0, r0, r1            ; [ALU_PRU] |359| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |359| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |359| 
        LDI       r0, 0x012c            ; [ALU_PRU] |359| 
        ADD       r0, r1, r0            ; [ALU_PRU] |359| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |359| 
        LDI32     r1, 0xfff8ffff        ; [ALU_PRU] |359| 
        AND       r1, r14, r1           ; [ALU_PRU] |359| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |359| 
	.dwpsn	file "../spiAPI.c",line 360,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |360| chNum
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |360| pinMode
        LSL       r1, r0, 0x02          ; [ALU_PRU] |360| 
        LSL       r0, r0, 0x04          ; [ALU_PRU] |360| 
        ADD       r0, r0, r1            ; [ALU_PRU] |360| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |360| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |360| 
        LDI       r0, 0x012c            ; [ALU_PRU] |360| 
        ADD       r0, r1, r0            ; [ALU_PRU] |360| 
        LDI32     r1, 0x00070000        ; [ALU_PRU] |360| 
        AND       r1, r14, r1           ; [ALU_PRU] |360| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |360| 
        OR        r1, r14, r1           ; [ALU_PRU] |360| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |360| 
	.dwpsn	file "../spiAPI.c",line 362,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |362| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |362| retVal
;* --------------------------------------------------------------------------*
||$C$L25||:    
	.dwpsn	file "../spiAPI.c",line 365,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 20, 4       ; [ALU_PRU] |365| retVal
	.dwpsn	file "../spiAPI.c",line 366,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x18          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$281	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$281, DW_AT_low_pc(0x00)
	.dwattr $C$DW$281, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$269, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$269, DW_AT_TI_end_line(0x16e)
	.dwattr $C$DW$269, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$269

	.sect	".text:SPI_SlaveModeSet"
	.clink
	.global	||SPI_SlaveModeSet||

$C$DW$282	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_SlaveModeSet")
	.dwattr $C$DW$282, DW_AT_low_pc(||SPI_SlaveModeSet||)
	.dwattr $C$DW$282, DW_AT_high_pc(0x00)
	.dwattr $C$DW$282, DW_AT_TI_symbol_name("SPI_SlaveModeSet")
	.dwattr $C$DW$282, DW_AT_external
	.dwattr $C$DW$282, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$282, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$282, DW_AT_TI_begin_line(0x181)
	.dwattr $C$DW$282, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$282, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$282, DW_AT_decl_line(0x181)
	.dwattr $C$DW$282, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$282, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spiAPI.c",line 386,column 1,is_stmt,address ||SPI_SlaveModeSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_SlaveModeSet||
$C$DW$283	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$283, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$283, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$283, DW_AT_location[DW_OP_regx 0x38]
$C$DW$284	.dwtag  DW_TAG_formal_parameter, DW_AT_name("trMode")
	.dwattr $C$DW$284, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$284, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$284, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$285	.dwtag  DW_TAG_formal_parameter, DW_AT_name("pinMode")
	.dwattr $C$DW$285, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$285, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$285, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$286	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$286, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$286, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$286, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$287	.dwtag  DW_TAG_variable, DW_AT_name("trMode")
	.dwattr $C$DW$287, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$287, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$287, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$288	.dwtag  DW_TAG_variable, DW_AT_name("pinMode")
	.dwattr $C$DW$288, DW_AT_TI_symbol_name("pinMode")
	.dwattr $C$DW$288, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$288, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$289	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$289, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$289, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$289, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |386| pinMode
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |386| trMode
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |386| spiAddr
	.dwpsn	file "../spiAPI.c",line 387,column 18,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |387| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |387| retVal
	.dwpsn	file "../spiAPI.c",line 390,column 2,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |390| spiAddr
        LDI       r0, 0x012c            ; [ALU_PRU] |390| 
        ADD       r0, r1, r0            ; [ALU_PRU] |390| 
        LDI32     r1, 0xffffcfff        ; [ALU_PRU] |390| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |390| 
        AND       r1, r14, r1           ; [ALU_PRU] |390| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |390| 
	.dwpsn	file "../spiAPI.c",line 393,column 2,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |393| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |393| spiAddr
        LBBO      &r14, r2, 4, 4        ; [ALU_PRU] |393| trMode
        ADD       r0, r1, r0            ; [ALU_PRU] |393| 
        LDI       r1, 0x3000            ; [ALU_PRU] |393| 
        AND       r1, r14, r1           ; [ALU_PRU] |393| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |393| 
        OR        r1, r14, r1           ; [ALU_PRU] |393| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |393| 
	.dwpsn	file "../spiAPI.c",line 395,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |395| trMode
        QBNE      ||$C$L26||, r0, 0x00  ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |395| pinMode
        QBNE      ||$C$L26||, r0, 0x00  ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L29||            ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
||$C$L26||:    
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |395| trMode
        LDI32     r1, 0x02000000        ; [ALU_PRU] |395| 
        QBNE      ||$C$L27||, r0, r1    ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |395| pinMode
        QBNE      ||$C$L27||, r0, 0x00  ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L29||            ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
||$C$L27||:    
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |395| trMode
        QBNE      ||$C$L28||, r0, 0x00  ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |395| pinMode
        QBNE      ||$C$L28||, r0, 0x00  ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L29||            ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
||$C$L28||:    
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |395| trMode
        QBNE      ||$C$L30||, r0, r1    ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |395| pinMode
        QBNE      ||$C$L30||, r0, 0x00  ; [ALU_PRU] |395| 
;* --------------------------------------------------------------------------*
||$C$L29||:    
	.dwpsn	file "../spiAPI.c",line 400,column 3,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |400| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |400| retVal
	.dwpsn	file "../spiAPI.c",line 401,column 2,is_stmt,isa 0
        JMP       ||$C$L31||            ; [ALU_PRU] |401| 
;* --------------------------------------------------------------------------*
||$C$L30||:    
	.dwpsn	file "../spiAPI.c",line 403,column 3,is_stmt,isa 0
        LDI       r0, 0x012c            ; [ALU_PRU] |403| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |403| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |403| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |403| 
        LDI32     r1, 0xfff8ffff        ; [ALU_PRU] |403| 
        AND       r1, r14, r1           ; [ALU_PRU] |403| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |403| 
	.dwpsn	file "../spiAPI.c",line 406,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |406| spiAddr
        LDI       r0, 0x012c            ; [ALU_PRU] |406| 
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |406| pinMode
        ADD       r0, r1, r0            ; [ALU_PRU] |406| 
        LDI32     r1, 0x00070000        ; [ALU_PRU] |406| 
        AND       r1, r14, r1           ; [ALU_PRU] |406| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |406| 
        OR        r1, r14, r1           ; [ALU_PRU] |406| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |406| 
;* --------------------------------------------------------------------------*
||$C$L31||:    
	.dwpsn	file "../spiAPI.c",line 409,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |409| retVal
	.dwpsn	file "../spiAPI.c",line 410,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$290	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$290, DW_AT_low_pc(0x00)
	.dwattr $C$DW$290, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$282, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$282, DW_AT_TI_end_line(0x19a)
	.dwattr $C$DW$282, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$282

	.sect	".text:SPI_FIFOTrigLvlSet"
	.clink
	.global	||SPI_FIFOTrigLvlSet||

$C$DW$291	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_FIFOTrigLvlSet")
	.dwattr $C$DW$291, DW_AT_low_pc(||SPI_FIFOTrigLvlSet||)
	.dwattr $C$DW$291, DW_AT_high_pc(0x00)
	.dwattr $C$DW$291, DW_AT_TI_symbol_name("SPI_FIFOTrigLvlSet")
	.dwattr $C$DW$291, DW_AT_external
	.dwattr $C$DW$291, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$291, DW_AT_TI_begin_line(0x25f)
	.dwattr $C$DW$291, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$291, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$291, DW_AT_decl_line(0x25f)
	.dwattr $C$DW$291, DW_AT_decl_column(0x06)
	.dwattr $C$DW$291, DW_AT_TI_max_frame_size(0x0a)
	.dwpsn	file "../spiAPI.c",line 608,column 1,is_stmt,address ||SPI_FIFOTrigLvlSet||,isa 0

	.dwfde $C$DW$CIE, ||SPI_FIFOTrigLvlSet||
$C$DW$292	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$292, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$292, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$292, DW_AT_location[DW_OP_regx 0x38]
$C$DW$293	.dwtag  DW_TAG_formal_parameter, DW_AT_name("afl")
	.dwattr $C$DW$293, DW_AT_TI_symbol_name("afl")
	.dwattr $C$DW$293, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$293, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$294	.dwtag  DW_TAG_formal_parameter, DW_AT_name("ael")
	.dwattr $C$DW$294, DW_AT_TI_symbol_name("ael")
	.dwattr $C$DW$294, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$294, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$295	.dwtag  DW_TAG_formal_parameter, DW_AT_name("trMode")
	.dwattr $C$DW$295, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$295, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$295, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$296	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$296, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$296, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$296, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$297	.dwtag  DW_TAG_variable, DW_AT_name("afl")
	.dwattr $C$DW$297, DW_AT_TI_symbol_name("afl")
	.dwattr $C$DW$297, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$297, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$298	.dwtag  DW_TAG_variable, DW_AT_name("ael")
	.dwattr $C$DW$298, DW_AT_TI_symbol_name("ael")
	.dwattr $C$DW$298, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$298, DW_AT_location[DW_OP_breg8 5]
        NOP                             ; [ALU_PRU] 
$C$DW$299	.dwtag  DW_TAG_variable, DW_AT_name("trMode")
	.dwattr $C$DW$299, DW_AT_TI_symbol_name("trMode")
	.dwattr $C$DW$299, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$299, DW_AT_location[DW_OP_breg8 6]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 6, 4        ; [ALU_PRU] |608| trMode
        SBBO      &r15.b1, r2, 5, 1     ; [ALU_PRU] |608| ael
        SBBO      &r15.b0, r2, 4, 1     ; [ALU_PRU] |608| afl
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |608| spiAddr
	.dwpsn	file "../spiAPI.c",line 609,column 2,is_stmt,isa 0
        JMP       ||$C$L35||            ; [ALU_PRU] |609| 
;* --------------------------------------------------------------------------*
||$C$L32||:    
	.dwpsn	file "../spiAPI.c",line 613,column 4,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |613| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |613| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |613| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |613| 
        LDI32     r1, 0xffffff00        ; [ALU_PRU] |613| 
        AND       r1, r14, r1           ; [ALU_PRU] |613| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |613| 
	.dwpsn	file "../spiAPI.c",line 616,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |616| spiAddr
        LDI       r0, 0x017c            ; [ALU_PRU] |616| 
        ADD       r0, r1, r0            ; [ALU_PRU] |616| 
        LBBO      &r1.b0, r2, 5, 1      ; [ALU_PRU] |616| ael
        SUB       r1, r1.b0, 0x01       ; [ALU_PRU] |616| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |616| 
        AND       r1, r1, 0xff          ; [ALU_PRU] |616| 
        OR        r1, r14, r1           ; [ALU_PRU] |616| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |616| 
	.dwpsn	file "../spiAPI.c",line 617,column 4,is_stmt,isa 0
        JMP       ||$C$L36||            ; [ALU_PRU] |617| 
;* --------------------------------------------------------------------------*
||$C$L33||:    
	.dwpsn	file "../spiAPI.c",line 621,column 4,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |621| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |621| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |621| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |621| 
        LDI32     r1, 0xffff00ff        ; [ALU_PRU] |621| 
        AND       r1, r14, r1           ; [ALU_PRU] |621| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |621| 
	.dwpsn	file "../spiAPI.c",line 624,column 4,is_stmt,isa 0
        LBBO      &r14.b0, r2, 4, 1     ; [ALU_PRU] |624| afl
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |624| spiAddr
        LDI       r0, 0x017c            ; [ALU_PRU] |624| 
        ADD       r0, r1, r0            ; [ALU_PRU] |624| 
        LDI       r1, 0xff00            ; [ALU_PRU] |624| 
        SUB       r14, r14.b0, 0x01     ; [ALU_PRU] |624| 
        LSL       r14, r14, 0x08        ; [ALU_PRU] |624| 
        AND       r1, r14, r1           ; [ALU_PRU] |624| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |624| 
        OR        r1, r14, r1           ; [ALU_PRU] |624| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |624| 
	.dwpsn	file "../spiAPI.c",line 625,column 4,is_stmt,isa 0
        JMP       ||$C$L36||            ; [ALU_PRU] |625| 
;* --------------------------------------------------------------------------*
||$C$L34||:    
	.dwpsn	file "../spiAPI.c",line 630,column 4,is_stmt,isa 0
        LDI       r0, 0x017c            ; [ALU_PRU] |630| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |630| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |630| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |630| 
        LDI32     r1, 0xffff0000        ; [ALU_PRU] |630| 
        AND       r1, r14, r1           ; [ALU_PRU] |630| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |630| 
	.dwpsn	file "../spiAPI.c",line 633,column 4,is_stmt,isa 0
        LBBO      &r14.b0, r2, 4, 1     ; [ALU_PRU] |633| afl
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |633| spiAddr
        LDI       r0, 0x017c            ; [ALU_PRU] |633| 
        ADD       r0, r1, r0            ; [ALU_PRU] |633| 
        LDI       r1, 0xff00            ; [ALU_PRU] |633| 
        SUB       r14, r14.b0, 0x01     ; [ALU_PRU] |633| 
        LSL       r14, r14, 0x08        ; [ALU_PRU] |633| 
        AND       r14, r14, r1          ; [ALU_PRU] |633| 
        LBBO      &r1.b0, r2, 5, 1      ; [ALU_PRU] |633| ael
        SUB       r1, r1.b0, 0x01       ; [ALU_PRU] |633| 
        AND       r1, r1, 0xff          ; [ALU_PRU] |633| 
        OR        r1, r14, r1           ; [ALU_PRU] |633| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |633| 
        OR        r1, r14, r1           ; [ALU_PRU] |633| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |633| 
	.dwpsn	file "../spiAPI.c",line 634,column 4,is_stmt,isa 0
        JMP       ||$C$L36||            ; [ALU_PRU] |634| 
;* --------------------------------------------------------------------------*
;* --------------------------------------------------------------------------*
||$C$L35||:    
	.dwpsn	file "../spiAPI.c",line 609,column 2,is_stmt,isa 0
        LBBO      &r0, r2, 6, 4         ; [ALU_PRU] |609| trMode
        QBEQ      ||$C$L34||, r0, 0x00  ; [ALU_PRU] |609| 
;* --------------------------------------------------------------------------*
        LDI32     r1, 0x01000000        ; [ALU_PRU] |609| 
        QBEQ      ||$C$L33||, r1, r0    ; [ALU_PRU] |609| 
;* --------------------------------------------------------------------------*
        LDI32     r1, 0x02000000        ; [ALU_PRU] |609| 
        QBEQ      ||$C$L32||, r1, r0    ; [ALU_PRU] |609| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L34||            ; [ALU_PRU] |609| 
;* --------------------------------------------------------------------------*
;* --------------------------------------------------------------------------*
||$C$L36||:    
        ADD       r2, r2, 0x0a          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$300	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$300, DW_AT_low_pc(0x00)
	.dwattr $C$DW$300, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$291, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$291, DW_AT_TI_end_line(0x27c)
	.dwattr $C$DW$291, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$291

	.sect	".text:SPI_BlitOutData"
	.clink
	.global	||SPI_BlitOutData||

$C$DW$301	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_BlitOutData")
	.dwattr $C$DW$301, DW_AT_low_pc(||SPI_BlitOutData||)
	.dwattr $C$DW$301, DW_AT_high_pc(0x00)
	.dwattr $C$DW$301, DW_AT_TI_symbol_name("SPI_BlitOutData")
	.dwattr $C$DW$301, DW_AT_external
	.dwattr $C$DW$301, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$301, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$301, DW_AT_TI_begin_line(0x309)
	.dwattr $C$DW$301, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$301, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$301, DW_AT_decl_line(0x309)
	.dwattr $C$DW$301, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$301, DW_AT_TI_max_frame_size(0x20)
	.dwpsn	file "../spiAPI.c",line 778,column 1,is_stmt,address ||SPI_BlitOutData||,isa 0

	.dwfde $C$DW$CIE, ||SPI_BlitOutData||
$C$DW$302	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$302, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$302, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$302, DW_AT_location[DW_OP_regx 0x38]
$C$DW$303	.dwtag  DW_TAG_formal_parameter, DW_AT_name("txData")
	.dwattr $C$DW$303, DW_AT_TI_symbol_name("txData")
	.dwattr $C$DW$303, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$303, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$304	.dwtag  DW_TAG_formal_parameter, DW_AT_name("bitcount")
	.dwattr $C$DW$304, DW_AT_TI_symbol_name("bitcount")
	.dwattr $C$DW$304, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$304, DW_AT_location[DW_OP_regx 0x40]
$C$DW$305	.dwtag  DW_TAG_formal_parameter, DW_AT_name("chNum")
	.dwattr $C$DW$305, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$305, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$305, DW_AT_location[DW_OP_regx 0x44]

;***************************************************************
;* FNAME: SPI_BlitOutData               FR SIZE:  32           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                           32 Auto,  0 SOE     *
;***************************************************************

||SPI_BlitOutData||:
;* --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x20          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 32
$C$DW$306	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$306, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$306, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$306, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$307	.dwtag  DW_TAG_variable, DW_AT_name("txData")
	.dwattr $C$DW$307, DW_AT_TI_symbol_name("txData")
	.dwattr $C$DW$307, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$307, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$308	.dwtag  DW_TAG_variable, DW_AT_name("bitcount")
	.dwattr $C$DW$308, DW_AT_TI_symbol_name("bitcount")
	.dwattr $C$DW$308, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$308, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$309	.dwtag  DW_TAG_variable, DW_AT_name("chNum")
	.dwattr $C$DW$309, DW_AT_TI_symbol_name("chNum")
	.dwattr $C$DW$309, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$309, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
$C$DW$310	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$310, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$310, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$310, DW_AT_location[DW_OP_breg8 16]
        NOP                             ; [ALU_PRU] 
$C$DW$311	.dwtag  DW_TAG_variable, DW_AT_name("bits")
	.dwattr $C$DW$311, DW_AT_TI_symbol_name("bits")
	.dwattr $C$DW$311, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$311, DW_AT_location[DW_OP_breg8 20]
        NOP                             ; [ALU_PRU] 
$C$DW$312	.dwtag  DW_TAG_variable, DW_AT_name("shift")
	.dwattr $C$DW$312, DW_AT_TI_symbol_name("shift")
	.dwattr $C$DW$312, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$312, DW_AT_location[DW_OP_breg8 24]
        NOP                             ; [ALU_PRU] 
$C$DW$313	.dwtag  DW_TAG_variable, DW_AT_name("mask")
	.dwattr $C$DW$313, DW_AT_TI_symbol_name("mask")
	.dwattr $C$DW$313, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$313, DW_AT_location[DW_OP_breg8 28]
        NOP                             ; [ALU_PRU] 
        SBBO      &r17, r2, 12, 4       ; [ALU_PRU] |778| chNum
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |778| bitcount
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |778| txData
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |778| spiAddr
	.dwpsn	file "../spiAPI.c",line 779,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |779| 
        SBBO      &r0, r2, 16, 4        ; [ALU_PRU] |779| retVal
	.dwpsn	file "../spiAPI.c",line 780,column 11,is_stmt,isa 0
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |780| bits
	.dwpsn	file "../spiAPI.c",line 781,column 17,is_stmt,isa 0
        SBBO      &r0, r2, 24, 4        ; [ALU_PRU] |781| shift
	.dwpsn	file "../spiAPI.c",line 782,column 16,is_stmt,isa 0
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |782| mask
	.dwpsn	file "../spiAPI.c",line 784,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |784| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |784| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |784| 
        QBBC      ||$C$L37||, r0, 0x09  ; [ALU_PRU] |784| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 786,column 3,is_stmt,isa 0
        LDI       r0, 0x0004            ; [ALU_PRU] |786| 
        SBBO      &r0, r2, 24, 4        ; [ALU_PRU] |786| shift
	.dwpsn	file "../spiAPI.c",line 787,column 3,is_stmt,isa 0
        LDI       r0, 0x0010            ; [ALU_PRU] |787| 
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |787| mask
	.dwpsn	file "../spiAPI.c",line 788,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |788| 
        SBBO      &r0, r2, 16, 4        ; [ALU_PRU] |788| retVal
	.dwpsn	file "../spiAPI.c",line 789,column 2,is_stmt,isa 0
        JMP       ||$C$L43||            ; [ALU_PRU] |789| 
;* --------------------------------------------------------------------------*
||$C$L37||:    
	.dwpsn	file "../spiAPI.c",line 789,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |789| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |789| 
        QBBC      ||$C$L43||, r0, 0x08  ; [ALU_PRU] |789| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 790,column 3,is_stmt,isa 0
        LDI       r0, 0x0005            ; [ALU_PRU] |790| 
        SBBO      &r0, r2, 24, 4        ; [ALU_PRU] |790| shift
	.dwpsn	file "../spiAPI.c",line 791,column 3,is_stmt,isa 0
        LDI       r0, 0x0020            ; [ALU_PRU] |791| 
        SBBO      &r0, r2, 28, 4        ; [ALU_PRU] |791| mask
	.dwpsn	file "../spiAPI.c",line 792,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |792| 
        SBBO      &r0, r2, 16, 4        ; [ALU_PRU] |792| retVal
	.dwpsn	file "../spiAPI.c",line 795,column 7,is_stmt,isa 0
        JMP       ||$C$L43||            ; [ALU_PRU] |795| 
;* --------------------------------------------------------------------------*
||$C$L38||:    
	.dwpsn	file "../spiAPI.c",line 797,column 3,is_stmt,isa 0
        LBBO      &r0.b0, r2, 20, 1     ; [ALU_PRU] |797| bits
        LBBO      &r0.b1, r2, 8, 1      ; [ALU_PRU] |797| bitcount
        SUB       r0.b0, r0.b1, r0.b0   ; [ALU_PRU] |797| 
        SUB       r0.b0, r0.b0, 0x01    ; [ALU_PRU] |797| 
        MOV       r0, r0.b0             ; [ALU_PRU] |797| 
        QBBC      ||$C$L39||, r0, 0x07  ; [ALU_PRU] |797| 
;* --------------------------------------------------------------------------*
        FILL      &r0.b1, 3             ; [ALU_PRU] |797| 
;* --------------------------------------------------------------------------*
||$C$L39||:    
        LDI       r1, 0x0001            ; [ALU_PRU] |797| 
        LSL       r1, r1, r0            ; [ALU_PRU] |797| 
        LBBO      &r0, r2, 4, 4         ; [ALU_PRU] |797| txData
        AND       r0, r1, r0            ; [ALU_PRU] |797| 
        QBEQ      ||$C$L41||, r0, 0x00  ; [ALU_PRU] |797| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 799,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |799| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |799| spiAddr
        ADD       r1, r1, r0            ; [ALU_PRU] |799| 
        LBBO      &r0.b0, r2, 24, 1     ; [ALU_PRU] |799| shift
        MOV       r0, r0.b0             ; [ALU_PRU] |799| 
        QBBC      ||$C$L40||, r0, 0x07  ; [ALU_PRU] |799| 
;* --------------------------------------------------------------------------*
        FILL      &r0.b1, 3             ; [ALU_PRU] |799| 
;* --------------------------------------------------------------------------*
||$C$L40||:    
        LDI       r14, 0x0001           ; [ALU_PRU] |799| 
        LSL       r0, r14, r0           ; [ALU_PRU] |799| 
        LBBO      &r14, r1, 0, 4        ; [ALU_PRU] |799| 
        OR        r0, r14, r0           ; [ALU_PRU] |799| 
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |799| 
	.dwpsn	file "../spiAPI.c",line 800,column 3,is_stmt,isa 0
        JMP       ||$C$L42||            ; [ALU_PRU] |800| 
;* --------------------------------------------------------------------------*
||$C$L41||:    
	.dwpsn	file "../spiAPI.c",line 801,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |801| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |801| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |801| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |801| 
        LBBO      &r1, r2, 28, 4        ; [ALU_PRU] |801| mask
        NOT       r1, r1                ; [ALU_PRU] |801| 
        AND       r1, r14, r1           ; [ALU_PRU] |801| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |801| 
;* --------------------------------------------------------------------------*
||$C$L42||:    
	.dwpsn	file "../spiAPI.c",line 795,column 52,is_stmt,isa 0
        LBBO      &r0, r2, 20, 4        ; [ALU_PRU] |795| bits
        ADD       r0, r0, 0x01          ; [ALU_PRU] |795| 
        SBBO      &r0, r2, 20, 4        ; [ALU_PRU] |795| bits
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L43||
;* --------------------------------------------------------------------------*
||$C$L43||:    
	.dwpsn	file "../spiAPI.c",line 795,column 17,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |795| bitcount
        LBBO      &r1, r2, 20, 4        ; [ALU_PRU] |795| bits
        QBGE      ||$C$L44||, r0, r1    ; [ALU_PRU] |795| 
;* --------------------------------------------------------------------------*
        LBBO      &r0, r2, 16, 4        ; [ALU_PRU] |795| retVal
        QBNE      ||$C$L44||, r0, 0x01  ; [ALU_PRU] |795| 
;* --------------------------------------------------------------------------*
        JMP       ||$C$L38||            ; [ALU_PRU] |795| 
;* --------------------------------------------------------------------------*
||$C$L44||:    
	.dwpsn	file "../spiAPI.c",line 805,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 16, 4       ; [ALU_PRU] |805| retVal
	.dwpsn	file "../spiAPI.c",line 806,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x20          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$314	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$314, DW_AT_low_pc(0x00)
	.dwattr $C$DW$314, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$301, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$301, DW_AT_TI_end_line(0x326)
	.dwattr $C$DW$301, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$301

	.sect	".text:SPI_ClkRead"
	.clink
	.global	||SPI_ClkRead||

$C$DW$315	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkRead")
	.dwattr $C$DW$315, DW_AT_low_pc(||SPI_ClkRead||)
	.dwattr $C$DW$315, DW_AT_high_pc(0x00)
	.dwattr $C$DW$315, DW_AT_TI_symbol_name("SPI_ClkRead")
	.dwattr $C$DW$315, DW_AT_external
	.dwattr $C$DW$315, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$315, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$315, DW_AT_TI_begin_line(0x35f)
	.dwattr $C$DW$315, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$315, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$315, DW_AT_decl_line(0x35f)
	.dwattr $C$DW$315, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$315, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spiAPI.c",line 864,column 1,is_stmt,address ||SPI_ClkRead||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkRead||
$C$DW$316	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$316, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$316, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$316, DW_AT_location[DW_OP_regx 0x38]
$C$DW$317	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiClk")
	.dwattr $C$DW$317, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$317, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$317, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$318	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$318, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$318, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$318, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$319	.dwtag  DW_TAG_variable, DW_AT_name("spiClk")
	.dwattr $C$DW$319, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$319, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$319, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$320	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$320, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$320, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$320, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |864| spiClk
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |864| spiAddr
	.dwpsn	file "../spiAPI.c",line 865,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |865| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |865| retVal
	.dwpsn	file "../spiAPI.c",line 868,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |868| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |868| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |868| 
        QBBC      ||$C$L45||, r0, 0x0a  ; [ALU_PRU] |868| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 870,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |870| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |870| retVal
	.dwpsn	file "../spiAPI.c",line 871,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |871| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |871| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |871| spiClk
        AND       r0, r0, 0x40          ; [ALU_PRU] |871| 
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |871| 
;* --------------------------------------------------------------------------*
||$C$L45||:    
	.dwpsn	file "../spiAPI.c",line 874,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |874| retVal
	.dwpsn	file "../spiAPI.c",line 875,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$321	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$321, DW_AT_low_pc(0x00)
	.dwattr $C$DW$321, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$315, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$315, DW_AT_TI_end_line(0x36b)
	.dwattr $C$DW$315, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$315

	.sect	".text:SPI_ClkWrite"
	.clink
	.global	||SPI_ClkWrite||

$C$DW$322	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_ClkWrite")
	.dwattr $C$DW$322, DW_AT_low_pc(||SPI_ClkWrite||)
	.dwattr $C$DW$322, DW_AT_high_pc(0x00)
	.dwattr $C$DW$322, DW_AT_TI_symbol_name("SPI_ClkWrite")
	.dwattr $C$DW$322, DW_AT_external
	.dwattr $C$DW$322, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$322, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$322, DW_AT_TI_begin_line(0x377)
	.dwattr $C$DW$322, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$322, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$322, DW_AT_decl_line(0x377)
	.dwattr $C$DW$322, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$322, DW_AT_TI_max_frame_size(0x0c)
	.dwpsn	file "../spiAPI.c",line 888,column 1,is_stmt,address ||SPI_ClkWrite||,isa 0

	.dwfde $C$DW$CIE, ||SPI_ClkWrite||
$C$DW$323	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$323, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$323, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$323, DW_AT_location[DW_OP_regx 0x38]
$C$DW$324	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiClk")
	.dwattr $C$DW$324, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$324, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$324, DW_AT_location[DW_OP_regx 0x3c]

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
$C$DW$325	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$325, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$325, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$325, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$326	.dwtag  DW_TAG_variable, DW_AT_name("spiClk")
	.dwattr $C$DW$326, DW_AT_TI_symbol_name("spiClk")
	.dwattr $C$DW$326, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$326, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$327	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$327, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$327, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$327, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |888| spiClk
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |888| spiAddr
	.dwpsn	file "../spiAPI.c",line 889,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |889| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |889| retVal
	.dwpsn	file "../spiAPI.c",line 891,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |891| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |891| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |891| 
        QBBS      ||$C$L46||, r0, 0x0a  ; [ALU_PRU] |891| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 893,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |893| 
        SBBO      &r0, r2, 8, 4         ; [ALU_PRU] |893| retVal
	.dwpsn	file "../spiAPI.c",line 896,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |896| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |896| 
        ADD       r0, r1, r0            ; [ALU_PRU] |896| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |896| 
        CLR       r1, r1, 0x00000006    ; [ALU_PRU] |896| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |896| 
	.dwpsn	file "../spiAPI.c",line 899,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |899| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |899| 
        ADD       r0, r1, r0            ; [ALU_PRU] |899| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |899| spiClk
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |899| 
        AND       r1, r1, 0x40          ; [ALU_PRU] |899| 
        OR        r1, r14, r1           ; [ALU_PRU] |899| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |899| 
;* --------------------------------------------------------------------------*
||$C$L46||:    
	.dwpsn	file "../spiAPI.c",line 902,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 8, 4        ; [ALU_PRU] |902| retVal
	.dwpsn	file "../spiAPI.c",line 903,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x0c          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$328	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$328, DW_AT_low_pc(0x00)
	.dwattr $C$DW$328, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$322, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$322, DW_AT_TI_end_line(0x387)
	.dwattr $C$DW$322, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$322

	.sect	".text:SPI_DataPinRead"
	.clink
	.global	||SPI_DataPinRead||

$C$DW$329	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DataPinRead")
	.dwattr $C$DW$329, DW_AT_low_pc(||SPI_DataPinRead||)
	.dwattr $C$DW$329, DW_AT_high_pc(0x00)
	.dwattr $C$DW$329, DW_AT_TI_symbol_name("SPI_DataPinRead")
	.dwattr $C$DW$329, DW_AT_external
	.dwattr $C$DW$329, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$329, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$329, DW_AT_TI_begin_line(0x395)
	.dwattr $C$DW$329, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$329, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$329, DW_AT_decl_line(0x395)
	.dwattr $C$DW$329, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$329, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spiAPI.c",line 918,column 1,is_stmt,address ||SPI_DataPinRead||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DataPinRead||
$C$DW$330	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$330, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$330, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$330, DW_AT_location[DW_OP_regx 0x38]
$C$DW$331	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dataPinDir")
	.dwattr $C$DW$331, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$331, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$331, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$332	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiDat")
	.dwattr $C$DW$332, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$332, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$332, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$333	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$333, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$333, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$333, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$334	.dwtag  DW_TAG_variable, DW_AT_name("dataPinDir")
	.dwattr $C$DW$334, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$334, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$334, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$335	.dwtag  DW_TAG_variable, DW_AT_name("spiDat")
	.dwattr $C$DW$335, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$335, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$335, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$336	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$336, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$336, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$336, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |918| spiDat
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |918| dataPinDir
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |918| spiAddr
	.dwpsn	file "../spiAPI.c",line 919,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |919| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |919| retVal
	.dwpsn	file "../spiAPI.c",line 921,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |921| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |921| spiAddr
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |921| 
        LDI       r0, 0x0200            ; [ALU_PRU] |921| 
        AND       r0, r1, r0            ; [ALU_PRU] |921| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |921| dataPinDir
        QBNE      ||$C$L47||, r0, r1    ; [ALU_PRU] |921| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 923,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |923| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |923| retVal
	.dwpsn	file "../spiAPI.c",line 926,column 3,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |926| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |926| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |926| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |926| spiDat
        AND       r0, r0, 0x20          ; [ALU_PRU] |926| 
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |926| 
	.dwpsn	file "../spiAPI.c",line 927,column 2,is_stmt,isa 0
        JMP       ||$C$L48||            ; [ALU_PRU] |927| 
;* --------------------------------------------------------------------------*
||$C$L47||:    
	.dwpsn	file "../spiAPI.c",line 927,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |927| spiAddr
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |927| 
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |927| 
        LDI       r0, 0x0100            ; [ALU_PRU] |927| 
        AND       r0, r1, r0            ; [ALU_PRU] |927| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |927| dataPinDir
        QBNE      ||$C$L48||, r0, r1    ; [ALU_PRU] |927| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 928,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |928| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |928| retVal
	.dwpsn	file "../spiAPI.c",line 931,column 3,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |931| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |931| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |931| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |931| spiDat
        AND       r0, r0, 0x10          ; [ALU_PRU] |931| 
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |931| 
;* --------------------------------------------------------------------------*
||$C$L48||:    
	.dwpsn	file "../spiAPI.c",line 934,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |934| retVal
	.dwpsn	file "../spiAPI.c",line 935,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$337	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$337, DW_AT_low_pc(0x00)
	.dwattr $C$DW$337, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$329, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$329, DW_AT_TI_end_line(0x3a7)
	.dwattr $C$DW$329, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$329

	.sect	".text:SPI_DataPinWrite"
	.clink
	.global	||SPI_DataPinWrite||

$C$DW$338	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_DataPinWrite")
	.dwattr $C$DW$338, DW_AT_low_pc(||SPI_DataPinWrite||)
	.dwattr $C$DW$338, DW_AT_high_pc(0x00)
	.dwattr $C$DW$338, DW_AT_TI_symbol_name("SPI_DataPinWrite")
	.dwattr $C$DW$338, DW_AT_external
	.dwattr $C$DW$338, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$338, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$338, DW_AT_TI_begin_line(0x3b5)
	.dwattr $C$DW$338, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$338, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$338, DW_AT_decl_line(0x3b5)
	.dwattr $C$DW$338, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$338, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spiAPI.c",line 950,column 1,is_stmt,address ||SPI_DataPinWrite||,isa 0

	.dwfde $C$DW$CIE, ||SPI_DataPinWrite||
$C$DW$339	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$339, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$339, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$339, DW_AT_location[DW_OP_regx 0x38]
$C$DW$340	.dwtag  DW_TAG_formal_parameter, DW_AT_name("dataPinDir")
	.dwattr $C$DW$340, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$340, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$340, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$341	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiDat")
	.dwattr $C$DW$341, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$341, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$341, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$342	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$342, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$342, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$342, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$343	.dwtag  DW_TAG_variable, DW_AT_name("dataPinDir")
	.dwattr $C$DW$343, DW_AT_TI_symbol_name("dataPinDir")
	.dwattr $C$DW$343, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$343, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$344	.dwtag  DW_TAG_variable, DW_AT_name("spiDat")
	.dwattr $C$DW$344, DW_AT_TI_symbol_name("spiDat")
	.dwattr $C$DW$344, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$344, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$345	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$345, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$345, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$345, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |950| spiDat
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |950| dataPinDir
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |950| spiAddr
	.dwpsn	file "../spiAPI.c",line 951,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |951| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |951| retVal
	.dwpsn	file "../spiAPI.c",line 953,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |953| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |953| spiAddr
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |953| 
        LDI       r0, 0x0200            ; [ALU_PRU] |953| 
        AND       r0, r1, r0            ; [ALU_PRU] |953| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |953| dataPinDir
        QBNE      ||$C$L49||, r0, r1    ; [ALU_PRU] |953| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 955,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |955| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |955| retVal
	.dwpsn	file "../spiAPI.c",line 958,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |958| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |958| 
        ADD       r0, r1, r0            ; [ALU_PRU] |958| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |958| 
        CLR       r1, r1, 0x00000005    ; [ALU_PRU] |958| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |958| 
	.dwpsn	file "../spiAPI.c",line 961,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |961| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |961| 
        ADD       r0, r1, r0            ; [ALU_PRU] |961| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |961| spiDat
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |961| 
        LSL       r1, r1, 0x05          ; [ALU_PRU] |961| 
        OR        r1, r14, r1           ; [ALU_PRU] |961| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |961| 
	.dwpsn	file "../spiAPI.c",line 962,column 2,is_stmt,isa 0
        JMP       ||$C$L50||            ; [ALU_PRU] |962| 
;* --------------------------------------------------------------------------*
||$C$L49||:    
	.dwpsn	file "../spiAPI.c",line 962,column 9,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |962| spiAddr
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |962| 
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |962| 
        LDI       r0, 0x0100            ; [ALU_PRU] |962| 
        AND       r0, r1, r0            ; [ALU_PRU] |962| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |962| dataPinDir
        QBNE      ||$C$L50||, r0, r1    ; [ALU_PRU] |962| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 963,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |963| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |963| retVal
	.dwpsn	file "../spiAPI.c",line 966,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |966| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |966| 
        ADD       r0, r1, r0            ; [ALU_PRU] |966| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |966| 
        CLR       r1, r1, 0x00000004    ; [ALU_PRU] |966| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |966| 
	.dwpsn	file "../spiAPI.c",line 969,column 3,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |969| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |969| 
        ADD       r0, r1, r0            ; [ALU_PRU] |969| 
        LBBO      &r1, r2, 8, 4         ; [ALU_PRU] |969| spiDat
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |969| 
        LSL       r1, r1, 0x04          ; [ALU_PRU] |969| 
        OR        r1, r14, r1           ; [ALU_PRU] |969| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |969| 
;* --------------------------------------------------------------------------*
||$C$L50||:    
	.dwpsn	file "../spiAPI.c",line 972,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |972| retVal
	.dwpsn	file "../spiAPI.c",line 973,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$346	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$346, DW_AT_low_pc(0x00)
	.dwattr $C$DW$346, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$338, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$338, DW_AT_TI_end_line(0x3cd)
	.dwattr $C$DW$338, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$338

	.sect	".text:SPI_CSRead"
	.clink
	.global	||SPI_CSRead||

$C$DW$347	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSRead")
	.dwattr $C$DW$347, DW_AT_low_pc(||SPI_CSRead||)
	.dwattr $C$DW$347, DW_AT_high_pc(0x00)
	.dwattr $C$DW$347, DW_AT_TI_symbol_name("SPI_CSRead")
	.dwattr $C$DW$347, DW_AT_external
	.dwattr $C$DW$347, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$347, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$347, DW_AT_TI_begin_line(0x3d9)
	.dwattr $C$DW$347, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$347, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$347, DW_AT_decl_line(0x3d9)
	.dwattr $C$DW$347, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$347, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spiAPI.c",line 986,column 1,is_stmt,address ||SPI_CSRead||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSRead||
$C$DW$348	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$348, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$348, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$348, DW_AT_location[DW_OP_regx 0x38]
$C$DW$349	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEn")
	.dwattr $C$DW$349, DW_AT_TI_symbol_name("spiEn")
	.dwattr $C$DW$349, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$349, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$350	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnNum")
	.dwattr $C$DW$350, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$350, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$350, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$351	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$351, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$351, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$351, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$352	.dwtag  DW_TAG_variable, DW_AT_name("spiEn")
	.dwattr $C$DW$352, DW_AT_TI_symbol_name("spiEn")
	.dwattr $C$DW$352, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$352, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$353	.dwtag  DW_TAG_variable, DW_AT_name("spiEnNum")
	.dwattr $C$DW$353, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$353, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$353, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$354	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$354, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$354, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$354, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |986| spiEnNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |986| spiEn
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |986| spiAddr
	.dwpsn	file "../spiAPI.c",line 987,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |987| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |987| retVal
	.dwpsn	file "../spiAPI.c",line 989,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |989| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |989| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |989| 
        QBBC      ||$C$L51||, r0, 0x0a  ; [ALU_PRU] |989| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 991,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |991| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |991| retVal
	.dwpsn	file "../spiAPI.c",line 994,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |994| spiAddr
        LBBO      &r1, r0, r1.w0, 4     ; [ALU_PRU] |994| 
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |994| spiEnNum
        AND       r0, r1, r0            ; [ALU_PRU] |994| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |994| spiEn
        SBBO      &r0, r1, 0, 4         ; [ALU_PRU] |994| 
;* --------------------------------------------------------------------------*
||$C$L51||:    
	.dwpsn	file "../spiAPI.c",line 997,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |997| retVal
	.dwpsn	file "../spiAPI.c",line 998,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$355	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$355, DW_AT_low_pc(0x00)
	.dwattr $C$DW$355, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$347, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$347, DW_AT_TI_end_line(0x3e6)
	.dwattr $C$DW$347, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$347

	.sect	".text:SPI_CSWrite"
	.clink
	.global	||SPI_CSWrite||

$C$DW$356	.dwtag  DW_TAG_subprogram, DW_AT_name("SPI_CSWrite")
	.dwattr $C$DW$356, DW_AT_low_pc(||SPI_CSWrite||)
	.dwattr $C$DW$356, DW_AT_high_pc(0x00)
	.dwattr $C$DW$356, DW_AT_TI_symbol_name("SPI_CSWrite")
	.dwattr $C$DW$356, DW_AT_external
	.dwattr $C$DW$356, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$356, DW_AT_TI_begin_file("../spiAPI.c")
	.dwattr $C$DW$356, DW_AT_TI_begin_line(0x3f4)
	.dwattr $C$DW$356, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$356, DW_AT_decl_file("../spiAPI.c")
	.dwattr $C$DW$356, DW_AT_decl_line(0x3f4)
	.dwattr $C$DW$356, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$356, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../spiAPI.c",line 1013,column 1,is_stmt,address ||SPI_CSWrite||,isa 0

	.dwfde $C$DW$CIE, ||SPI_CSWrite||
$C$DW$357	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiAddr")
	.dwattr $C$DW$357, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$357, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$357, DW_AT_location[DW_OP_regx 0x38]
$C$DW$358	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnLvl")
	.dwattr $C$DW$358, DW_AT_TI_symbol_name("spiEnLvl")
	.dwattr $C$DW$358, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$358, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$359	.dwtag  DW_TAG_formal_parameter, DW_AT_name("spiEnNum")
	.dwattr $C$DW$359, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$359, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$359, DW_AT_location[DW_OP_regx 0x40]

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
$C$DW$360	.dwtag  DW_TAG_variable, DW_AT_name("spiAddr")
	.dwattr $C$DW$360, DW_AT_TI_symbol_name("spiAddr")
	.dwattr $C$DW$360, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$360, DW_AT_location[DW_OP_breg8 0]
        NOP                             ; [ALU_PRU] 
$C$DW$361	.dwtag  DW_TAG_variable, DW_AT_name("spiEnLvl")
	.dwattr $C$DW$361, DW_AT_TI_symbol_name("spiEnLvl")
	.dwattr $C$DW$361, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$361, DW_AT_location[DW_OP_breg8 4]
        NOP                             ; [ALU_PRU] 
$C$DW$362	.dwtag  DW_TAG_variable, DW_AT_name("spiEnNum")
	.dwattr $C$DW$362, DW_AT_TI_symbol_name("spiEnNum")
	.dwattr $C$DW$362, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$362, DW_AT_location[DW_OP_breg8 8]
        NOP                             ; [ALU_PRU] 
$C$DW$363	.dwtag  DW_TAG_variable, DW_AT_name("retVal")
	.dwattr $C$DW$363, DW_AT_TI_symbol_name("retVal")
	.dwattr $C$DW$363, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$363, DW_AT_location[DW_OP_breg8 12]
        NOP                             ; [ALU_PRU] 
        SBBO      &r16, r2, 8, 4        ; [ALU_PRU] |1013| spiEnNum
        SBBO      &r15, r2, 4, 4        ; [ALU_PRU] |1013| spiEnLvl
        SBBO      &r14, r2, 0, 4        ; [ALU_PRU] |1013| spiAddr
	.dwpsn	file "../spiAPI.c",line 1014,column 18,is_stmt,isa 0
        LDI       r0, 0x0000            ; [ALU_PRU] |1014| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1014| retVal
	.dwpsn	file "../spiAPI.c",line 1016,column 2,is_stmt,isa 0
        LDI       r1.w0, 0x0124         ; [ALU_PRU] |1016| 
        LBBO      &r0, r2, 0, 4         ; [ALU_PRU] |1016| spiAddr
        LBBO      &r0, r0, r1.w0, 4     ; [ALU_PRU] |1016| 
        QBBS      ||$C$L55||, r0, 0x0a  ; [ALU_PRU] |1016| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 1018,column 3,is_stmt,isa 0
        LDI       r0, 0x0001            ; [ALU_PRU] |1018| 
        SBBO      &r0, r2, 12, 4        ; [ALU_PRU] |1018| retVal
	.dwpsn	file "../spiAPI.c",line 1020,column 3,is_stmt,isa 0
        LBBO      &r0, r2, 8, 4         ; [ALU_PRU] |1020| spiEnNum
        QBNE      ||$C$L52||, r0, 0x01  ; [ALU_PRU] |1020| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 1023,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |1023| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1023| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1023| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1023| 
        CLR       r1, r1, 0x00000000    ; [ALU_PRU] |1023| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1023| 
	.dwpsn	file "../spiAPI.c",line 1026,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1026| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |1026| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1026| 
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1026| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1026| spiEnLvl
        AND       r1, r1, 0x01          ; [ALU_PRU] |1026| 
        OR        r1, r14, r1           ; [ALU_PRU] |1026| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1026| 
	.dwpsn	file "../spiAPI.c",line 1027,column 3,is_stmt,isa 0
        JMP       ||$C$L55||            ; [ALU_PRU] |1027| 
;* --------------------------------------------------------------------------*
||$C$L52||:    
	.dwpsn	file "../spiAPI.c",line 1027,column 10,is_stmt,isa 0
        QBNE      ||$C$L53||, r0, 0x02  ; [ALU_PRU] |1027| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 1029,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |1029| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1029| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1029| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1029| 
        CLR       r1, r1, 0x00000001    ; [ALU_PRU] |1029| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1029| 
	.dwpsn	file "../spiAPI.c",line 1032,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1032| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |1032| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1032| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1032| spiEnLvl
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1032| 
        LSL       r1, r1, 0x01          ; [ALU_PRU] |1032| 
        AND       r1, r1, 0x02          ; [ALU_PRU] |1032| 
        OR        r1, r14, r1           ; [ALU_PRU] |1032| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1032| 
	.dwpsn	file "../spiAPI.c",line 1033,column 3,is_stmt,isa 0
        JMP       ||$C$L55||            ; [ALU_PRU] |1033| 
;* --------------------------------------------------------------------------*
||$C$L53||:    
	.dwpsn	file "../spiAPI.c",line 1033,column 10,is_stmt,isa 0
        QBNE      ||$C$L54||, r0, 0x04  ; [ALU_PRU] |1033| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 1035,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |1035| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1035| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1035| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1035| 
        CLR       r1, r1, 0x00000002    ; [ALU_PRU] |1035| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1035| 
	.dwpsn	file "../spiAPI.c",line 1038,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1038| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |1038| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1038| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1038| spiEnLvl
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1038| 
        LSL       r1, r1, 0x02          ; [ALU_PRU] |1038| 
        AND       r1, r1, 0x04          ; [ALU_PRU] |1038| 
        OR        r1, r14, r1           ; [ALU_PRU] |1038| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1038| 
	.dwpsn	file "../spiAPI.c",line 1039,column 3,is_stmt,isa 0
        JMP       ||$C$L55||            ; [ALU_PRU] |1039| 
;* --------------------------------------------------------------------------*
||$C$L54||:    
	.dwpsn	file "../spiAPI.c",line 1039,column 10,is_stmt,isa 0
        QBNE      ||$C$L55||, r0, 0x08  ; [ALU_PRU] |1039| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../spiAPI.c",line 1041,column 4,is_stmt,isa 0
        LDI       r0, 0x0124            ; [ALU_PRU] |1041| 
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1041| spiAddr
        ADD       r0, r1, r0            ; [ALU_PRU] |1041| 
        LBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1041| 
        CLR       r1, r1, 0x00000003    ; [ALU_PRU] |1041| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1041| 
	.dwpsn	file "../spiAPI.c",line 1044,column 4,is_stmt,isa 0
        LBBO      &r1, r2, 0, 4         ; [ALU_PRU] |1044| spiAddr
        LDI       r0, 0x0124            ; [ALU_PRU] |1044| 
        ADD       r0, r1, r0            ; [ALU_PRU] |1044| 
        LBBO      &r1, r2, 4, 4         ; [ALU_PRU] |1044| spiEnLvl
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |1044| 
        LSL       r1, r1, 0x03          ; [ALU_PRU] |1044| 
        AND       r1, r1, 0x08          ; [ALU_PRU] |1044| 
        OR        r1, r14, r1           ; [ALU_PRU] |1044| 
        SBBO      &r1, r0, 0, 4         ; [ALU_PRU] |1044| 
;* --------------------------------------------------------------------------*
||$C$L55||:    
	.dwpsn	file "../spiAPI.c",line 1048,column 2,is_stmt,isa 0
        LBBO      &r14, r2, 12, 4       ; [ALU_PRU] |1048| retVal
	.dwpsn	file "../spiAPI.c",line 1049,column 1,is_stmt,isa 0
        ADD       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$364	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$364, DW_AT_low_pc(0x00)
	.dwattr $C$DW$364, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$356, DW_AT_TI_end_file("../spiAPI.c")
	.dwattr $C$DW$356, DW_AT_TI_end_line(0x419)
	.dwattr $C$DW$356, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$356

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	||__pruabi_divu||
;*****************************************************************************
;* SECTION GROUPS                                                            *
;*****************************************************************************
	.group    "Is_RxDataReady", 1
	.gmember  ".text:Is_RxDataReady"
	.endgroup
	.group    "Is_RxFIFOEmpty", 1
	.gmember  ".text:Is_RxFIFOEmpty"
	.endgroup
	.group    "Is_RxFIFOEnabled", 1
	.gmember  ".text:Is_RxFIFOEnabled"
	.endgroup
	.group    "Is_TxFIFOEmpty", 1
	.gmember  ".text:Is_TxFIFOEmpty"
	.endgroup
	.group    "Is_TxFIFOEnabled", 1
	.gmember  ".text:Is_TxFIFOEnabled"
	.endgroup
	.group    "SPI_AutoIdleSet", 1
	.gmember  ".text:SPI_AutoIdleSet"
	.endgroup
	.group    "SPI_CSAssert", 1
	.gmember  ".text:SPI_CSAssert"
	.endgroup
	.group    "SPI_CSDeAssert", 1
	.gmember  ".text:SPI_CSDeAssert"
	.endgroup
	.group    "SPI_CSPolaritySet", 1
	.gmember  ".text:SPI_CSPolaritySet"
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
	.group    "SPI_ClkActivitySet", 1
	.gmember  ".text:SPI_ClkActivitySet"
	.endgroup
	.group    "SPI_DMASet", 1
	.gmember  ".text:SPI_DMASet"
	.endgroup
	.group    "SPI_DataPinDirection", 1
	.gmember  ".text:SPI_DataPinDirection"
	.endgroup
	.group    "SPI_FIFODatSet", 1
	.gmember  ".text:SPI_FIFODatSet"
	.endgroup
	.group    "SPI_InitDelaySet", 1
	.gmember  ".text:SPI_InitDelaySet"
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
	.group    "SPI_MultiWordAccessSet", 1
	.gmember  ".text:SPI_MultiWordAccessSet"
	.endgroup
	.group    "SPI_ReceiveData", 1
	.gmember  ".text:SPI_ReceiveData"
	.endgroup
	.group    "SPI_Reset", 1
	.gmember  ".text:SPI_Reset"
	.endgroup
	.group    "SPI_RxFIFODisable", 1
	.gmember  ".text:SPI_RxFIFODisable"
	.endgroup
	.group    "SPI_RxFIFOEnable", 1
	.gmember  ".text:SPI_RxFIFOEnable"
	.endgroup
	.group    "SPI_SlaveModeEnable", 1
	.gmember  ".text:SPI_SlaveModeEnable"
	.endgroup
	.group    "SPI_SlaveSelect", 1
	.gmember  ".text:SPI_SlaveSelect"
	.endgroup
	.group    "SPI_SmartIdleSet", 1
	.gmember  ".text:SPI_SmartIdleSet"
	.endgroup
	.group    "SPI_StartBitDisable", 1
	.gmember  ".text:SPI_StartBitDisable"
	.endgroup
	.group    "SPI_StartBitEnable", 1
	.gmember  ".text:SPI_StartBitEnable"
	.endgroup
	.group    "SPI_StartBitPolaritySet", 1
	.gmember  ".text:SPI_StartBitPolaritySet"
	.endgroup
	.group    "SPI_SysTestModeSet", 1
	.gmember  ".text:SPI_SysTestModeSet"
	.endgroup
	.group    "SPI_TransmitData", 1
	.gmember  ".text:SPI_TransmitData"
	.endgroup
	.group    "SPI_TurboModeSet", 1
	.gmember  ".text:SPI_TurboModeSet"
	.endgroup
	.group    "SPI_TxFIFODisable", 1
	.gmember  ".text:SPI_TxFIFODisable"
	.endgroup
	.group    "SPI_TxFIFOEnable", 1
	.gmember  ".text:SPI_TxFIFOEnable"
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
$C$DW$T$24	.dwtag  DW_TAG_typedef, DW_AT_name("uint8_t")
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$24, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$24, DW_AT_decl_file("/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/include/stdint.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x1c)
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
$C$DW$T$26	.dwtag  DW_TAG_typedef, DW_AT_name("uint16_t")
	.dwattr $C$DW$T$26, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$26, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$26, DW_AT_decl_file("/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/include/stdint.h")
	.dwattr $C$DW$T$26, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$T$26, DW_AT_decl_column(0x1c)
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
$C$DW$T$34	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$34, DW_AT_address_class(0x20)
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

$C$DW$365	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b0")
	.dwattr $C$DW$365, DW_AT_location[DW_OP_reg0]
$C$DW$366	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b1")
	.dwattr $C$DW$366, DW_AT_location[DW_OP_reg1]
$C$DW$367	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b2")
	.dwattr $C$DW$367, DW_AT_location[DW_OP_reg2]
$C$DW$368	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b3")
	.dwattr $C$DW$368, DW_AT_location[DW_OP_reg3]
$C$DW$369	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b0")
	.dwattr $C$DW$369, DW_AT_location[DW_OP_reg4]
$C$DW$370	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b1")
	.dwattr $C$DW$370, DW_AT_location[DW_OP_reg5]
$C$DW$371	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b2")
	.dwattr $C$DW$371, DW_AT_location[DW_OP_reg6]
$C$DW$372	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b3")
	.dwattr $C$DW$372, DW_AT_location[DW_OP_reg7]
$C$DW$373	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b0")
	.dwattr $C$DW$373, DW_AT_location[DW_OP_reg8]
$C$DW$374	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b1")
	.dwattr $C$DW$374, DW_AT_location[DW_OP_reg9]
$C$DW$375	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b2")
	.dwattr $C$DW$375, DW_AT_location[DW_OP_reg10]
$C$DW$376	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b3")
	.dwattr $C$DW$376, DW_AT_location[DW_OP_reg11]
$C$DW$377	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b0")
	.dwattr $C$DW$377, DW_AT_location[DW_OP_reg12]
$C$DW$378	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b1")
	.dwattr $C$DW$378, DW_AT_location[DW_OP_reg13]
$C$DW$379	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b2")
	.dwattr $C$DW$379, DW_AT_location[DW_OP_reg14]
$C$DW$380	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b3")
	.dwattr $C$DW$380, DW_AT_location[DW_OP_reg15]
$C$DW$381	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b0")
	.dwattr $C$DW$381, DW_AT_location[DW_OP_reg16]
$C$DW$382	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b1")
	.dwattr $C$DW$382, DW_AT_location[DW_OP_reg17]
$C$DW$383	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b2")
	.dwattr $C$DW$383, DW_AT_location[DW_OP_reg18]
$C$DW$384	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b3")
	.dwattr $C$DW$384, DW_AT_location[DW_OP_reg19]
$C$DW$385	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b0")
	.dwattr $C$DW$385, DW_AT_location[DW_OP_reg20]
$C$DW$386	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b1")
	.dwattr $C$DW$386, DW_AT_location[DW_OP_reg21]
$C$DW$387	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b2")
	.dwattr $C$DW$387, DW_AT_location[DW_OP_reg22]
$C$DW$388	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b3")
	.dwattr $C$DW$388, DW_AT_location[DW_OP_reg23]
$C$DW$389	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b0")
	.dwattr $C$DW$389, DW_AT_location[DW_OP_reg24]
$C$DW$390	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b1")
	.dwattr $C$DW$390, DW_AT_location[DW_OP_reg25]
$C$DW$391	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b2")
	.dwattr $C$DW$391, DW_AT_location[DW_OP_reg26]
$C$DW$392	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b3")
	.dwattr $C$DW$392, DW_AT_location[DW_OP_reg27]
$C$DW$393	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b0")
	.dwattr $C$DW$393, DW_AT_location[DW_OP_reg28]
$C$DW$394	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b1")
	.dwattr $C$DW$394, DW_AT_location[DW_OP_reg29]
$C$DW$395	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b2")
	.dwattr $C$DW$395, DW_AT_location[DW_OP_reg30]
$C$DW$396	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b3")
	.dwattr $C$DW$396, DW_AT_location[DW_OP_reg31]
$C$DW$397	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b0")
	.dwattr $C$DW$397, DW_AT_location[DW_OP_regx 0x20]
$C$DW$398	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b1")
	.dwattr $C$DW$398, DW_AT_location[DW_OP_regx 0x21]
$C$DW$399	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b2")
	.dwattr $C$DW$399, DW_AT_location[DW_OP_regx 0x22]
$C$DW$400	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b3")
	.dwattr $C$DW$400, DW_AT_location[DW_OP_regx 0x23]
$C$DW$401	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b0")
	.dwattr $C$DW$401, DW_AT_location[DW_OP_regx 0x24]
$C$DW$402	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b1")
	.dwattr $C$DW$402, DW_AT_location[DW_OP_regx 0x25]
$C$DW$403	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b2")
	.dwattr $C$DW$403, DW_AT_location[DW_OP_regx 0x26]
$C$DW$404	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b3")
	.dwattr $C$DW$404, DW_AT_location[DW_OP_regx 0x27]
$C$DW$405	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b0")
	.dwattr $C$DW$405, DW_AT_location[DW_OP_regx 0x28]
$C$DW$406	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b1")
	.dwattr $C$DW$406, DW_AT_location[DW_OP_regx 0x29]
$C$DW$407	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b2")
	.dwattr $C$DW$407, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$408	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b3")
	.dwattr $C$DW$408, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$409	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b0")
	.dwattr $C$DW$409, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$410	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b1")
	.dwattr $C$DW$410, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$411	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b2")
	.dwattr $C$DW$411, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$412	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b3")
	.dwattr $C$DW$412, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$413	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b0")
	.dwattr $C$DW$413, DW_AT_location[DW_OP_regx 0x30]
$C$DW$414	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b1")
	.dwattr $C$DW$414, DW_AT_location[DW_OP_regx 0x31]
$C$DW$415	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b2")
	.dwattr $C$DW$415, DW_AT_location[DW_OP_regx 0x32]
$C$DW$416	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b3")
	.dwattr $C$DW$416, DW_AT_location[DW_OP_regx 0x33]
$C$DW$417	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b0")
	.dwattr $C$DW$417, DW_AT_location[DW_OP_regx 0x34]
$C$DW$418	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b1")
	.dwattr $C$DW$418, DW_AT_location[DW_OP_regx 0x35]
$C$DW$419	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b2")
	.dwattr $C$DW$419, DW_AT_location[DW_OP_regx 0x36]
$C$DW$420	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b3")
	.dwattr $C$DW$420, DW_AT_location[DW_OP_regx 0x37]
$C$DW$421	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b0")
	.dwattr $C$DW$421, DW_AT_location[DW_OP_regx 0x38]
$C$DW$422	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b1")
	.dwattr $C$DW$422, DW_AT_location[DW_OP_regx 0x39]
$C$DW$423	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b2")
	.dwattr $C$DW$423, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$424	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b3")
	.dwattr $C$DW$424, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$425	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b0")
	.dwattr $C$DW$425, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$426	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b1")
	.dwattr $C$DW$426, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$427	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b2")
	.dwattr $C$DW$427, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$428	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b3")
	.dwattr $C$DW$428, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$429	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b0")
	.dwattr $C$DW$429, DW_AT_location[DW_OP_regx 0x40]
$C$DW$430	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b1")
	.dwattr $C$DW$430, DW_AT_location[DW_OP_regx 0x41]
$C$DW$431	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b2")
	.dwattr $C$DW$431, DW_AT_location[DW_OP_regx 0x42]
$C$DW$432	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b3")
	.dwattr $C$DW$432, DW_AT_location[DW_OP_regx 0x43]
$C$DW$433	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b0")
	.dwattr $C$DW$433, DW_AT_location[DW_OP_regx 0x44]
$C$DW$434	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b1")
	.dwattr $C$DW$434, DW_AT_location[DW_OP_regx 0x45]
$C$DW$435	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b2")
	.dwattr $C$DW$435, DW_AT_location[DW_OP_regx 0x46]
$C$DW$436	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b3")
	.dwattr $C$DW$436, DW_AT_location[DW_OP_regx 0x47]
$C$DW$437	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b0")
	.dwattr $C$DW$437, DW_AT_location[DW_OP_regx 0x48]
$C$DW$438	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b1")
	.dwattr $C$DW$438, DW_AT_location[DW_OP_regx 0x49]
$C$DW$439	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b2")
	.dwattr $C$DW$439, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$440	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b3")
	.dwattr $C$DW$440, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$441	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b0")
	.dwattr $C$DW$441, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$442	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b1")
	.dwattr $C$DW$442, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$443	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b2")
	.dwattr $C$DW$443, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$444	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b3")
	.dwattr $C$DW$444, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$445	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b0")
	.dwattr $C$DW$445, DW_AT_location[DW_OP_regx 0x50]
$C$DW$446	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b1")
	.dwattr $C$DW$446, DW_AT_location[DW_OP_regx 0x51]
$C$DW$447	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b2")
	.dwattr $C$DW$447, DW_AT_location[DW_OP_regx 0x52]
$C$DW$448	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b3")
	.dwattr $C$DW$448, DW_AT_location[DW_OP_regx 0x53]
$C$DW$449	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b0")
	.dwattr $C$DW$449, DW_AT_location[DW_OP_regx 0x54]
$C$DW$450	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b1")
	.dwattr $C$DW$450, DW_AT_location[DW_OP_regx 0x55]
$C$DW$451	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b2")
	.dwattr $C$DW$451, DW_AT_location[DW_OP_regx 0x56]
$C$DW$452	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b3")
	.dwattr $C$DW$452, DW_AT_location[DW_OP_regx 0x57]
$C$DW$453	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b0")
	.dwattr $C$DW$453, DW_AT_location[DW_OP_regx 0x58]
$C$DW$454	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b1")
	.dwattr $C$DW$454, DW_AT_location[DW_OP_regx 0x59]
$C$DW$455	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b2")
	.dwattr $C$DW$455, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$456	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b3")
	.dwattr $C$DW$456, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$457	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b0")
	.dwattr $C$DW$457, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$458	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b1")
	.dwattr $C$DW$458, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$459	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b2")
	.dwattr $C$DW$459, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$460	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b3")
	.dwattr $C$DW$460, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$461	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b0")
	.dwattr $C$DW$461, DW_AT_location[DW_OP_regx 0x60]
$C$DW$462	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b1")
	.dwattr $C$DW$462, DW_AT_location[DW_OP_regx 0x61]
$C$DW$463	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b2")
	.dwattr $C$DW$463, DW_AT_location[DW_OP_regx 0x62]
$C$DW$464	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b3")
	.dwattr $C$DW$464, DW_AT_location[DW_OP_regx 0x63]
$C$DW$465	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b0")
	.dwattr $C$DW$465, DW_AT_location[DW_OP_regx 0x64]
$C$DW$466	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b1")
	.dwattr $C$DW$466, DW_AT_location[DW_OP_regx 0x65]
$C$DW$467	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b2")
	.dwattr $C$DW$467, DW_AT_location[DW_OP_regx 0x66]
$C$DW$468	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b3")
	.dwattr $C$DW$468, DW_AT_location[DW_OP_regx 0x67]
$C$DW$469	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b0")
	.dwattr $C$DW$469, DW_AT_location[DW_OP_regx 0x68]
$C$DW$470	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b1")
	.dwattr $C$DW$470, DW_AT_location[DW_OP_regx 0x69]
$C$DW$471	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b2")
	.dwattr $C$DW$471, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$472	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b3")
	.dwattr $C$DW$472, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$473	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b0")
	.dwattr $C$DW$473, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$474	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b1")
	.dwattr $C$DW$474, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$475	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b2")
	.dwattr $C$DW$475, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$476	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b3")
	.dwattr $C$DW$476, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$477	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b0")
	.dwattr $C$DW$477, DW_AT_location[DW_OP_regx 0x70]
$C$DW$478	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b1")
	.dwattr $C$DW$478, DW_AT_location[DW_OP_regx 0x71]
$C$DW$479	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b2")
	.dwattr $C$DW$479, DW_AT_location[DW_OP_regx 0x72]
$C$DW$480	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b3")
	.dwattr $C$DW$480, DW_AT_location[DW_OP_regx 0x73]
$C$DW$481	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b0")
	.dwattr $C$DW$481, DW_AT_location[DW_OP_regx 0x74]
$C$DW$482	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b1")
	.dwattr $C$DW$482, DW_AT_location[DW_OP_regx 0x75]
$C$DW$483	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b2")
	.dwattr $C$DW$483, DW_AT_location[DW_OP_regx 0x76]
$C$DW$484	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b3")
	.dwattr $C$DW$484, DW_AT_location[DW_OP_regx 0x77]
$C$DW$485	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b0")
	.dwattr $C$DW$485, DW_AT_location[DW_OP_regx 0x78]
$C$DW$486	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b1")
	.dwattr $C$DW$486, DW_AT_location[DW_OP_regx 0x79]
$C$DW$487	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b2")
	.dwattr $C$DW$487, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$488	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b3")
	.dwattr $C$DW$488, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$489	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b0")
	.dwattr $C$DW$489, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$490	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b1")
	.dwattr $C$DW$490, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$491	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b2")
	.dwattr $C$DW$491, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$492	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b3")
	.dwattr $C$DW$492, DW_AT_location[DW_OP_regx 0x7f]
	.dwendtag $C$DW$CU

