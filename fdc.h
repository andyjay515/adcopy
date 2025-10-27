#pragma once

int issueCommand(char file_num, char command, char trk, char sec);
int waitCmdExecution(char file_num);

int fdc_seek(char filenum, char track,char sec);
int fdc_readSector(char filenum, char track, char sector);
int fdc_writeSector(char filenum, char track, char sector);
int fdc_startReadSector(char filenum, char track, char sector);
int fdc_startWriteSector(char filenum, char track, char sector);
#pragma compile("fdc.c")