################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../startup/startup_mk64f12.c 

C_DEPS += \
./startup/startup_mk64f12.d 

OBJS += \
./startup/startup_mk64f12.o 


# Each subdirectory must supply rules for building sources it contributes
startup/%.o: ../startup/%.c startup/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MK64FN1M0VLL12 -DCPU_MK64FN1M0VLL12_cm4 -DFLEXCAN_WAIT_TIMEOUT=1000 -DFRDM_K64F -DFREEDOM -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_OS_FREE_RTOS -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\utilities" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\drivers" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\device" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\component\uart" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\component\lists" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\CMSIS" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\freertos\freertos_kernel\include" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\freertos\freertos_kernel\portable\GCC\ARM_CM4F" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\board" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\source" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\source" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\utilities" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\drivers" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\device" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\component\uart" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\component\lists" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\CMSIS" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\board" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\frdmk64f\driver_examples\flexcan\loopback" -O0 -fno-common -g3 -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-startup

clean-startup:
	-$(RM) ./startup/startup_mk64f12.d ./startup/startup_mk64f12.o

.PHONY: clean-startup

