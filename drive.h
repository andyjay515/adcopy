#pragma once
#include <stdio.h>

char sectors[35];

int writeSector(char driveid, char track,  char sec,sstr_t* status_str);
int readSector(char driveid, char track,  char sec, sstr_t* status_str);
int openCommandChannels(char src_drive, char dest_drive);
void closeCommandChannels();
int getDriveInfo(char driveid);
bool checkBufferEmpty();
void fillSectorsInfo();

int waitWriteResult(sstr_t* status_str);

#pragma compile("drive.c")