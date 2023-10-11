################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/freertos_kernel/croutine.c \
../freertos/freertos_kernel/event_groups.c \
../freertos/freertos_kernel/list.c \
../freertos/freertos_kernel/queue.c \
../freertos/freertos_kernel/stream_buffer.c \
../freertos/freertos_kernel/tasks.c \
../freertos/freertos_kernel/timers.c 

C_DEPS += \
./freertos/freertos_kernel/croutine.d \
./freertos/freertos_kernel/event_groups.d \
./freertos/freertos_kernel/list.d \
./freertos/freertos_kernel/queue.d \
./freertos/freertos_kernel/stream_buffer.d \
./freertos/freertos_kernel/tasks.d \
./freertos/freertos_kernel/timers.d 

OBJS += \
./freertos/freertos_kernel/croutine.o \
./freertos/freertos_kernel/event_groups.o \
./freertos/freertos_kernel/list.o \
./freertos/freertos_kernel/queue.o \
./freertos/freertos_kernel/stream_buffer.o \
./freertos/freertos_kernel/tasks.o \
./freertos/freertos_kernel/timers.o 


# Each subdirectory must supply rules for building sources it contributes
freertos/freertos_kernel/%.o: ../freertos/freertos_kernel/%.c freertos/freertos_kernel/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MK64FN1M0VLL12 -DCPU_MK64FN1M0VLL12_cm4 -DFLEXCAN_WAIT_TIMEOUT=1000 -DFRDM_K64F -DFREEDOM -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_OS_FREE_RTOS -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\utilities" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\drivers" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\device" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\component\uart" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\component\lists" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\CMSIS" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\freertos\freertos_kernel\include" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\freertos\freertos_kernel\portable\GCC\ARM_CM4F" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\board" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\source" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\source" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\utilities" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\drivers" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\device" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\component\uart" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\component\lists" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\CMSIS" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\board" -I"D:\MPO\ITESO\9_semestre\Redes\programas\frdmk64f_flexcan_loopback_HOST.zip_expanded\frdmk64f_flexcan_loopback_HOST\frdmk64f\driver_examples\flexcan\loopback" -O0 -fno-common -g3 -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-freertos-2f-freertos_kernel

clean-freertos-2f-freertos_kernel:
	-$(RM) ./freertos/freertos_kernel/croutine.d ./freertos/freertos_kernel/croutine.o ./freertos/freertos_kernel/event_groups.d ./freertos/freertos_kernel/event_groups.o ./freertos/freertos_kernel/list.d ./freertos/freertos_kernel/list.o ./freertos/freertos_kernel/queue.d ./freertos/freertos_kernel/queue.o ./freertos/freertos_kernel/stream_buffer.d ./freertos/freertos_kernel/stream_buffer.o ./freertos/freertos_kernel/tasks.d ./freertos/freertos_kernel/tasks.o ./freertos/freertos_kernel/timers.d ./freertos/freertos_kernel/timers.o

.PHONY: clean-freertos-2f-freertos_kernel

