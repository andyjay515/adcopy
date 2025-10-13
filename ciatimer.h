#pragma once
#include <stdio.h>
#include "sstr.h"


void getCiaTimer(sstr_t *tmpstr);
void resetCiaTimer();
void stopCiaTimer();

#pragma compile("ciatimer.c")