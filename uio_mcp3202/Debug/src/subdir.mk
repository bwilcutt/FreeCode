################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/uio_mcp3202.c 

OBJS += \
./src/uio_mcp3202.o 

C_DEPS += \
./src/uio_mcp3202.d 


# Each subdirectory must supply rules for building sources it contributes
src/uio_mcp3202.o: ../src/uio_mcp3202.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -I/usr/src/linux-headers-4.2.0-35/include/ -I/usr/src/linux-headers-4.2.0-35/include/linux -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"src/uio_mcp3202.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


