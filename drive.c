#include <stdio.h>
#include "sstr.h"
#include "drive.h"
#include "fdc.h"

#define BUFSIZE 256
#define RBHANDLE 5
#define RCMDHANDLE 15
#define WBHANDLE 9
#define WCMDHANDLE 16

char buffer[BUFSIZE];

void fillSectorsInfo()
{
    for(int i=0;i<17;i++) sectors[i] = 21;
    for(int i=17;i<24;i++) sectors[i] = 19;
    for(int i=24;i<30;i++) sectors[i] = 18;
    for(int i=30;i<35;i++) sectors[i] = 17;
}

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

bool checkBufferEmpty()
{
    for(int i=0;i<BUFSIZE;i++) {
        if(buffer[i] != 0) return false;
    }
    return true;
}

void closeCommandChannels()
{
    krnio_close(WCMDHANDLE);
    krnio_close(RCMDHANDLE);
    
}

int changeBusSpeed() {
    int res = 0;
    int addr = 0x1806;
    char buf[32];
    sstr_t tmpstr;
    char cmd[8]={'M','-','W',addr&0xFF,addr>>8,0x02,0x00,0x01};
    char cmd2[6]={'M','-','R',addr&0xFF,addr>>8,0x02};
    

    // sweet spot for IRQ timing

    res = krnio_write(RCMDHANDLE,cmd,sizeof(cmd));
    if(res <= 0) {
        return -1;
    }

    res = krnio_write(WCMDHANDLE,cmd,sizeof(cmd));
    if(res <= 0) {
        return -1;
    }

    addr = 0x1C06;
    cmd[3] = addr&0xFF;
    cmd[4] = addr>>8;
    cmd2[3] = addr&0xFF;
    cmd2[4] = addr>>8;
    // sweet spot
    cmd[6]=0x3A;
    cmd[7]=0x0F;

    res = krnio_write(RCMDHANDLE,cmd,sizeof(cmd));
    if(res <= 0) {
        return -1;
    }

    res = krnio_write(WCMDHANDLE,cmd,sizeof(cmd));
    if(res <= 0) {
        return -1;
    }
    return 0;
}

int openCommandChannels(char src_drive, char dest_drive) {
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

#if defined(__C128__) || defined(__C128B__) || defined(__C128E__)
    krnio_setbnk(0,0);
#endif
    return 0;
}

int openBufferChannel(char file_handle_buff, char ch_num,char driveid) {
     int res = 0;
    // generic buffer
    krnio_setnam("#1");
    // open buffer channel
    if(!krnio_open(file_handle_buff,driveid,ch_num)){
        return -1;
    }
    return 0;
}

int openWriteBufferChannel(char driveid)
{
    return openBufferChannel(WBHANDLE,6,driveid);
}

int openReadBufferChannel(char driveid)
{
    return openBufferChannel(RBHANDLE,5,driveid);
}

int waitForReadStatus(sstr_t* status_str)
{
    int res = 0;
    char *tmp = get_sstr(status_str);
    // read status
    krnio_read(RCMDHANDLE,tmp,16);
    tmp[15] = 0;

    res = atoi(tmp);
    if(res >= 20) {
        krnio_close(RBHANDLE);
        return -1;
    }
    return 0;
}

int waitForWriteStatus(sstr_t* status_str)
{
    int res = 0;
    char *tmp = get_sstr(status_str);
    // read status
    krnio_read(WCMDHANDLE,tmp,16);
    tmp[15] = 0;

    res = atoi(tmp);
    krnio_close(WBHANDLE);
    if(res >= 20) {
        return -1;
    }
    return 0;
}

int loadSectorToBuffer(char track, char sec, sstr_t* status_str)
{
    int res = 0;
    sstr_t tmpstr;
    // prepare command to move head to sector
    set_sstr(&tmpstr,"U1 5 0 ");
    append_sstr_num(&tmpstr,track);
    append_sstr(&tmpstr," ");
    append_sstr_num(&tmpstr,sec);
    char* cmd = get_sstr(&tmpstr);
    res = krnio_puts(RCMDHANDLE,cmd);
    if(res <= 0) {
        krnio_close(RBHANDLE);
        return -1;
    }
    return waitForReadStatus(status_str);
}

int readBufferToMem()
{
    int res = 0;
    res = krnio_read(RBHANDLE,buffer,BUFSIZE);
    krnio_close(RBHANDLE);
    if(res < 0) {
        return -1;
    }
    return 0;
}

int writeMemToBuffer()
{
    int res = 0;
    // set buffer pointer at the beginning (defaults to 1)
    res = krnio_puts(WCMDHANDLE,"B-P 6 0");
    if(res <= 0) {
        krnio_close(WBHANDLE);
        return -1;
    }

    // fill buffer
    res = krnio_write(WBHANDLE,buffer,BUFSIZE);
    if(res < 0) {
        krnio_close(WBHANDLE);
        return -1;
    }
    return 0;
}

int saveBufferToSector(char track, char sec, sstr_t* status_str)
{
    int res = 0;
    sstr_t tmpstr;
    // prepare command to move head to sector
    set_sstr(&tmpstr,"U2 6 0 ");
    append_sstr_num(&tmpstr,track);
    append_sstr(&tmpstr," ");
    append_sstr_num(&tmpstr,sec);
    char* cmd = get_sstr(&tmpstr);
    res = krnio_puts(WCMDHANDLE,cmd);
    krnio_close(WBHANDLE);
    if(res <= 0) {
        return -1;
    }
    return waitForWriteStatus(status_str);
}

int readSector(char driveid, char track,  char sec, sstr_t* status_str)
{
    int res = 0;

    res=openReadBufferChannel(driveid);
    if(res < 0) {
        return -1;
    }

    res = loadSectorToBuffer(track,sec, status_str);
    if(res < 0) {
        return -1;
    }

    res = readBufferToMem();
    if(res < 0) {
        return -1;
    }
    
    return 0;
            
}

int writeSector(char driveid, char track,  char sec, sstr_t* status_str)
{
  
    int res = 0;
    
    res=openWriteBufferChannel(driveid);
    if(res < 0) {
        return -1;
    }

    res=writeMemToBuffer();
    if(res < 0) {
        return -1;
    }

    res= fdc_startWriteSector(WCMDHANDLE,track,sec);
    krnio_close(WBHANDLE);
    if(res < 0) {
        return -1;
    }

    return 0;

}

int waitWriteComplete(){

    return waitCmdExecution(WCMDHANDLE);
}