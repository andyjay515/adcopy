#pragma once

int waitCmdExecution(char file_num);

int fdc_seek(char filenum, char track,char sec);
int fdc_startWriteSector(char filenum, char track, char sector);

char getLastErrorCode();

#pragma compile("fdc.c")