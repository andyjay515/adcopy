#pragma once
#include <stdio.h>

#define BUFSIZE 256

int writeSector(char driveid, char track,  char sec, char *buf,sstr_t* status_str);
int readSector(char driveid, char track,  char sec, char *buf, sstr_t* status_str);
int openCommandCannels(char src_drive, char dest_drive);
void closeCommandChannels();
int getDriveInfo(char driveid);
bool checkBufferEmpty(char *buf);

#pragma compile("drive.c")