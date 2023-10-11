/*
 * DAC_example.h
 *
 *  Created on: Mar 1, 2022
 */

#ifndef DAC_H_
#define DAC_H_

void initDAC(void);
void DacSend(uint32_t Data);
void callback_send(void);

#endif /* DAC_H_ */
