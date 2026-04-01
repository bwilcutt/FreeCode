################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
main.obj: ../main.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: PRU Compiler'
	"/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/bin/clpru" -v3 --include_path="/opt/ti/ccsv6/tools/compiler/ti-cgt-pru_2.1.2/include" --include_path="/opt/ti/ccsv6/ccs_base/pru/include" --include_path="../../../../../include" --include_path="/opt/ti-processor-sdk-linux-am335x-evm-02.00.00.00/example-applications/include" --include_path="/opt/ti-processor-sdk-linux-am335x-evm-02.00.00.00/example-applications/include/am335x" -g --define=am3359 --define=pru0 --diag_warning=225 --diag_wrap=off --display_error_number --hardware_mac=on --endian=little --preproc_with_compile --preproc_dependency="main.pp" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: $<'
	@echo ' '


