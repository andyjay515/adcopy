#pragma once

int waitCmdExecution(char file_num,char *err_code);

int fdc_seek(char filenum, char track,char sec, char* err_code);
int fdc_startWriteSector(char filenum, char track, char sector, char* err_code);
#pragma compile("fdc.c")