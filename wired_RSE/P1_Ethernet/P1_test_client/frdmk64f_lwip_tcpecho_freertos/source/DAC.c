#include "MK64F12.h"
#include "DAC.h"
#include "PIT.h"

static uint16_t buffer_dac [40];
static uint8_t counter = 0;

void initDAC(void){

	SIM->SCGC2 = SIM_SCGC2_DAC0_MASK;
	DAC0->C0 = 0xC0;
	DAC0->DAT[0].DATL = 0;
	DAC0->DAT[0].DATH = 0;
}

void DacSend(uint32_t Data){

    buffer_dac[counter] = Data;
    counter ++;
    if (counter >= 40)
    {
    	PIT_callback_init(PIT_0, &callback_send);
		counter = 0;
    }
}

void callback_send (void)
{
	static uint8_t counter_cb = 0;
    DAC0->DAT[0].DATL = (buffer_dac[counter_cb]) & 0xFF;
    DAC0->DAT[0].DATH = ((buffer_dac[counter_cb]) >> 8) & 0x0F;
    counter_cb ++;
    if (counter >= 40)
    {
    	PIT_callback_deinit(PIT_0);
		counter_cb = 0;
    }
}
