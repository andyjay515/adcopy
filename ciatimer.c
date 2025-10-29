#include <stdio.h>
#include "ciatimer.h"

/* CIA registry address */
#define CIA1_REG 0xDC00
unsigned char* CIA1_TODT = (unsigned char*)(CIA1_REG+0x08);
unsigned char* CIA1_TODS = (unsigned char*)(CIA1_REG+0x09);
unsigned char* CIA1_TODM = (unsigned char*)(CIA1_REG+0x0A);
unsigned char* CIA1_TODH = (unsigned char*)(CIA1_REG+0x0B);

char timerStr[6] = {0x30,0x30,'.',0x30,0x30,0x0};

char* getCiaTOD()
{
    // read Hour to activate latch
    //unsigned char h = *CIA1_TODH;
    __asm {
        lda CIA1_TODH;
    }
    
    char ml,mh = 0;
    char sl,sh = 0;
    // convert BCD to binary
    ml = *CIA1_TODM & 0x0F;
    mh = ((*CIA1_TODM >> 4) & 0x0F);
    sl = *CIA1_TODS & 0x0F;
    sh = ((*CIA1_TODS >> 4) & 0x0F);
    timerStr[0] = 0x30+mh;
    timerStr[1] = 0x30+ml;
    timerStr[3] = 0x30+sh;
    timerStr[4] = 0x30+sl;

    // relase latch
    //h = *CIA1_TODT;
    __asm {
        lda CIA1_TODT;
    }

    return timerStr;
}

void resetCiaTimer()
{
    *CIA1_TODH = 12;
    *CIA1_TODM = 0;
    *CIA1_TODS = 0;
    *CIA1_TODT = 0;
}

void stopCiaTimer()
{
    *CIA1_TODH = 12;
}