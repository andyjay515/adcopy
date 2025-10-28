#pragma once
#include <stdio.h>

char sectors[35];

int writeSector(char driveid, char track,  char sec);
int readSector(char driveid, char track,  char sec);
int openCommandChannels(char src_drive, char dest_drive);
void closeCommandChannels();
int getDriveInfo(char driveid);
bool checkBufferEmpty();
void fillSectorsInfo();

int waitWriteResult();
char *getLastErrorMessage();

#pragma compile("drive.c")