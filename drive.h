#pragma once
#include <stdio.h>

#define BUFSIZE 256

int writeSector(char driveid, char track,  char sec, char *buf);
int readSector(char driveid, char track,  char sec, char *buf);
int openCommandCannels(char src_drive, char dest_drive);
void closeChannelsCleanup();
int getDriveInfo(char driveid);
bool checkBufferEmpty(char *buf);

#pragma compile("drive.c")