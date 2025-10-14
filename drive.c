#include <stdio.h>
#include "sstr.h"
#include "drive.h"

sstr_t tmpstr;

#define RBHANDLE 5
#define RCMDHANDLE 15
#define WFHANDLE 6
#define WCMDHANDLE 16

int getDriveInfo(char driveid)
{
    int res = 0;
    char tmpbuf[32];

    krnio_setnam("");
    res = krnio_open(RCMDHANDLE,driveid,15);
    if(!res) {
        return -1;
    }
    
    // send soft reset
    res =krnio_puts(RCMDHANDLE,"UI");
    if(res <= 0) {
        krnio_close(RCMDHANDLE);
        return res;
    }

     // read dos version string
    krnio_read(RCMDHANDLE,tmpbuf,32);
    tmpbuf[31] = 0;
    // set pointer to drive type location
    char* drive_type = &tmpbuf[16];

    res = atoi(drive_type);
    
    krnio_close(RCMDHANDLE);
    return res;
}

bool checkBufferEmpty(char *buf)
{
    for(int i=0;i<BUFSIZE;i++) {
        if(buf[i] != 0) return false;
    }
    return true;
}

void closeChannelsCleanup()
{
    krnio_close(WCMDHANDLE);
    krnio_close(RCMDHANDLE);
    
}

int openCommandCannels(char src_drive, char dest_drive) {
    int res = 0;
    // open command channels
    krnio_setnam("");
    res = krnio_open(RCMDHANDLE,src_drive,15);
    if(!res) {
        return -1;
    }
    krnio_setnam("");
    res = krnio_open(WCMDHANDLE,dest_drive,15);
    if(!res) {
        return -1;
    }
    return 0;
}

int readSector(char driveid, char track,  char sec, char *buf)
{
    int res = 0;
    // generic buffer
    krnio_setnam("#");
    // open buffer channel
    if(!krnio_open(RBHANDLE,driveid,5)){
        return -1;
    }

    // prepare command to move head to sector
    
    set_sstr(&tmpstr,"U1 5 0 ");
    append_sstr_num(&tmpstr,track);
    append_sstr(&tmpstr," ");
    append_sstr_num(&tmpstr,sec);
    char* cmd = get_sstr(&tmpstr);
    res = krnio_puts(RCMDHANDLE,cmd);
    if(res <= 0) {
        krnio_close(RBHANDLE);
        return res;
    }

    // read status
    krnio_read(RCMDHANDLE,cmd,16);
    cmd[15] = 0;
    
    //sscanf(cmd,"%d",&res);
    res = atoi(cmd);
    if(res >= 20) {
        putsxy(10,3,cmd);
        return -1;
    }

    // set buffer pointer at the beginning (defaults to 1)
    /*res = krnio_puts(RCMDHANDLE,"B-P 5 0");
    if(res <= 0) {
        krnio_close(RBHANDLE);
        return res;
    }*/

    res = krnio_read(RBHANDLE,buf,BUFSIZE);
    if(res <= 0) {
        krnio_close(RBHANDLE);
        return res;
    }
    krnio_close(RBHANDLE);
    return res;
            
}

int writeSector(char driveid, char track,  char sec, char *buf)
{
  
    int res = 0;
    
    // generic buffer
    krnio_setnam("#");
    // open buffer channel
    if(!krnio_open(WFHANDLE,driveid,6)){
        return -1;
    }
    
    // set buffer pointer at the beginning (defaults to 1)
    res = krnio_puts(WCMDHANDLE,"B-P 6 0");
    if(res <= 0) {
        krnio_close(WFHANDLE);
        return -1;
    }

    // fill buffer
    res = krnio_write(WFHANDLE,buf,BUFSIZE);
    

    if(res <= 0) {
        return -1;
    }

    // prepare command to move head to sector
    set_sstr(&tmpstr,"U2 6 0 ");
    append_sstr_num(&tmpstr,track);
    append_sstr(&tmpstr," ");
    append_sstr_num(&tmpstr,sec);
    char* cmd = get_sstr(&tmpstr);
    res = krnio_puts(WCMDHANDLE,cmd);
    if(res <= 0) {
        return -1;
    }

    // read status
    krnio_read(WCMDHANDLE,cmd,16);
    cmd[15] = 0;
    //sscanf(cmd,"%d",&res);
    res = atoi(cmd);
    if(res >= 20) {
        putsxy(10,3,cmd);
        krnio_close(WFHANDLE);
        return -1;
    }
    krnio_close(WFHANDLE);
    return 0;

}