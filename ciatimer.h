#pragma once
#include <stdio.h>
#include "sstr.h"


char* getCiaTOD();
void resetCiaTimer();
void stopCiaTimer();

#pragma compile("ciatimer.c")