################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/fsl_adc16.c \
../drivers/fsl_clock.c \
../drivers/fsl_common.c \
../drivers/fsl_common_arm.c \
../drivers/fsl_flexcan.c \
../drivers/fsl_ftfx_cache.c \
../drivers/fsl_ftfx_controller.c \
../drivers/fsl_ftfx_flash.c \
../drivers/fsl_ftfx_flexnvm.c \
../drivers/fsl_gpio.c \
../drivers/fsl_i2c.c \
../drivers/fsl_smc.c \
../drivers/fsl_uart.c 

C_DEPS += \
./drivers/fsl_adc16.d \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_common_arm.d \
./drivers/fsl_flexcan.d \
./drivers/fsl_ftfx_cache.d \
./drivers/fsl_ftfx_controller.d \
./drivers/fsl_ftfx_flash.d \
./drivers/fsl_ftfx_flexnvm.d \
./drivers/fsl_gpio.d \
./drivers/fsl_i2c.d \
./drivers/fsl_smc.d \
./drivers/fsl_uart.d 

OBJS += \
./drivers/fsl_adc16.o \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_common_arm.o \
./drivers/fsl_flexcan.o \
./drivers/fsl_ftfx_cache.o \
./drivers/fsl_ftfx_controller.o \
./drivers/fsl_ftfx_flash.o \
./drivers/fsl_ftfx_flexnvm.o \
./drivers/fsl_gpio.o \
./drivers/fsl_i2c.o \
./drivers/fsl_smc.o \
./drivers/fsl_uart.o 


# Each subdirectory must supply rules for building sources it contributes
drivers/%.o: ../drivers/%.c drivers/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MK64FN1M0VLL12 -DCPU_MK64FN1M0VLL12_cm4 -DFLEXCAN_WAIT_TIMEOUT=1000 -DFRDM_K64F -DFREEDOM -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_OS_FREE_RTOS -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\utilities" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\drivers" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\device" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\component\uart" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\component\lists" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\CMSIS" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\freertos\freertos_kernel\include" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\freertos\freertos_kernel\portable\GCC\ARM_CM4F" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\board" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\source" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\source" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\utilities" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\drivers" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\device" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\component\uart" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\component\lists" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\CMSIS" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\board" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_CLIENT.zip_expanded\frdmk64f_flexcan_loopback_CLIENT\frdmk64f\driver_examples\flexcan\loopback" -O0 -fno-common -g3 -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-drivers

clean-drivers:
	-$(RM) ./drivers/fsl_adc16.d ./drivers/fsl_adc16.o ./drivers/fsl_clock.d ./drivers/fsl_clock.o ./drivers/fsl_common.d ./drivers/fsl_common.o ./drivers/fsl_common_arm.d ./drivers/fsl_common_arm.o ./drivers/fsl_flexcan.d ./drivers/fsl_flexcan.o ./drivers/fsl_ftfx_cache.d ./drivers/fsl_ftfx_cache.o ./drivers/fsl_ftfx_controller.d ./drivers/fsl_ftfx_controller.o ./drivers/fsl_ftfx_flash.d ./drivers/fsl_ftfx_flash.o ./drivers/fsl_ftfx_flexnvm.d ./drivers/fsl_ftfx_flexnvm.o ./drivers/fsl_gpio.d ./drivers/fsl_gpio.o ./drivers/fsl_i2c.d ./drivers/fsl_i2c.o ./drivers/fsl_smc.d ./drivers/fsl_smc.o ./drivers/fsl_uart.d ./drivers/fsl_uart.o

.PHONY: clean-drivers
