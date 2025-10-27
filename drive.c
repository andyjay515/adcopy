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

char error_messages[13][16] = {
    "00,OK",
    "20,READ ERROR",
    "21,READ ERROR",
    "22,READ ERROR",
    "23,READ ERROR",
    "24,READ ERROR",
    "25,WRITE ERROR",
    "26,WRITE PROTECT",
    "27,READ ERROR",
    "28,READ ERROR",
    "29,DISK ID MISM.",
    "74,DRIVE NOT RDY",
    "UNKNOW ERROR"
};

char *getErrorMessage(char code)
{
    switch (code)
    {
    case 0:
    case 1:
        return error_messages[0];
        break;
        
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
        return error_messages[code];
        break;
    case 15:
        return error_messages[12];
        break;
    default:
        return error_messages[13];
    }
    
}

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

int getReadRes(sstr_t* status_str)
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
    return getReadRes(status_str);
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

int writeSector(char driveid, char track,  char sec,sstr_t* status_str)
{
  
    int res = 0;
    char err_code = 0;
    res=openWriteBufferChannel(driveid);
    if(res < 0) {
        return -1;
    }

    res=writeMemToBuffer();
    if(res < 0) {
        return -1;
    }

    res= fdc_startWriteSector(WCMDHANDLE,track,sec, &err_code);
    krnio_close(WBHANDLE);
    if(res < 0) {
        set_sstr(status_str,getErrorMessage(err_code));
        return -1;
    }

    return 0;

}

int waitWriteResult(sstr_t* status_str){

    char err_code = 0;
    int res =waitCmdExecution(WCMDHANDLE,&err_code);
    set_sstr(status_str,getErrorMessage(err_code));
    return res;
}