################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
mcp3202.obj: ../mcp3202.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: PRU Compiler'
	"/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/bin/clpru" -v3 --include_path="/opt/ti/ccsv6/ccs_base/pru/include" --include_path="/home/bwilcutt/workspace_v6_1/PRU_SPIMCP" --include_path="/home/bwilcutt/workspace/PRU_workspace/PRU_SPIMCP" --include_path="/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/include" -g --gcc --define=am3359 --define=pru0 --diag_warning=225 --diag_wrap=off --display_error_number --hardware_mac=on --endian=little -k --asm_listing --output_all_syms --preproc_with_compile --preproc_dependency="mcp3202.pp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '

spiAPI.obj: ../spiAPI.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: PRU Compiler'
	"/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/bin/clpru" -v3 --include_path="/opt/ti/ccsv6/ccs_base/pru/include" --include_path="/home/bwilcutt/workspace_v6_1/PRU_SPIMCP" --include_path="/home/bwilcutt/workspace/PRU_workspace/PRU_SPIMCP" --include_path="/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/include" -g --gcc --define=am3359 --define=pru0 --diag_warning=225 --diag_wrap=off --display_error_number --hardware_mac=on --endian=little -k --asm_listing --output_all_syms --preproc_with_compile --preproc_dependency="spiAPI.pp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


