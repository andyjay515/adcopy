#include <stdio.h>
#include "sstr.h"
#include "drive.h"

sstr_t tmpstr;

#define RBHANDLE 5
#define RCMDHANDLE 15
#define WBHANDLE 9
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

void closeCommandChannels()
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

#if defined(__C128__) || defined(__C128B__) || defined(__C128E__)
    krnio_setbnk(0,0);
#endif
    return 0;
}

int openBufferChannel(char file_handle_buff, char buf_num, char channel_num, char driveid) {
     int res = 0;
    // generic buffer
    set_sstr(&tmpstr,"#");
    append_sstr_num(&tmpstr,buf_num);
    char* cmd = get_sstr(&tmpstr);
    krnio_setnam(cmd);
    // open buffer channel
    if(!krnio_open(file_handle_buff,driveid,channel_num)){
        return -1;
    }
    return 0;
}

int loadSectorToBuffer(char file_handle_cmd, char channel,char track, char sec, sstr_t* status_str)
{
    int res = 0;

    // prepare command to move head to sector
    set_sstr(&tmpstr,"U1 ");
    append_sstr_num(&tmpstr,channel);
    append_sstr(&tmpstr," 0 ");
    append_sstr_num(&tmpstr,track);
    append_sstr(&tmpstr," ");
    append_sstr_num(&tmpstr,sec);
    char* cmd = get_sstr(&tmpstr);
    res = krnio_puts(file_handle_cmd,cmd);
    if(res <= 0) {
        return -1;
    }

    // read status
    krnio_read(file_handle_cmd,cmd,16);
    cmd[15] = 0;

    res = atoi(cmd);
    if(res >= 20) {
        set_sstr(status_str,cmd);
        return -1;
    }
    return 0;
            
}

int readBufferToMem(char file_handle_buff, char* buf)
{
    int res = 0;
    res = krnio_read(file_handle_buff,buf,BUFSIZE);
    if(res < 0) {
        return -1;
    }
    return 0;
}

int writeMemToBuffer(char file_handle_buff, char file_handle_cmd, char channel, char* buf)
{
    int res = 0;
    // set buffer pointer at the beginning (defaults to 1)
    set_sstr(&tmpstr,"B-P ");
    append_sstr_num(&tmpstr,channel);
    append_sstr(&tmpstr," 0");
    char* cmd = get_sstr(&tmpstr);
    res = krnio_puts(file_handle_cmd,cmd);
    if(res <= 0) {
        krnio_close(file_handle_buff);
        return -1;
    }

    // fill buffer
    res = krnio_write(file_handle_buff,buf,BUFSIZE);
    if(res < 0) {
        return -1;
    }

    return 0;
}

int saveBufferToSector(char file_handle_cmd, char channel,char track, char sec, sstr_t* status_str)
{
    int res = 0;
    // prepare command to move head to sector
    set_sstr(&tmpstr,"U2 ");
    append_sstr_num(&tmpstr,channel);
    append_sstr(&tmpstr," 0 ");
    append_sstr_num(&tmpstr,track);
    append_sstr(&tmpstr," ");
    append_sstr_num(&tmpstr,sec);
    char* cmd = get_sstr(&tmpstr);
    res = krnio_puts(file_handle_cmd,cmd);
    if(res <= 0) {
        return -1;
    }

    // read status
    krnio_read(file_handle_cmd,cmd,16);
    cmd[15] = 0;
    
    res = atoi(cmd);
    if(res >= 20) {
        set_sstr(status_str,cmd);
        return -1;
    }
    return 0;
            
}

int readSector(char driveid, char track,  char sec, char *buf,  sstr_t* status_str)
{
    int res = 0;

    res=openBufferChannel(RBHANDLE,1,5,driveid);
    if(res < 0) {
        krnio_close(RBHANDLE);
        return -1;
    }

    res = loadSectorToBuffer(RCMDHANDLE,5,track,sec,status_str);
    if(res < 0) {
        krnio_close(RBHANDLE);
        return -1;
    }

    res = readBufferToMem(RBHANDLE,buf);
    krnio_close(RBHANDLE);
    if(res < 0) {
        return -1;
    }
    
    return 0;
            
}

int writeSector(char driveid, char track,  char sec, char *buf, sstr_t* status_str)
{
  
    int res = 0;
    
    res=openBufferChannel(WBHANDLE,2,6,driveid);
    if(res < 0) {
        krnio_close(WBHANDLE);
        return -1;
    }

    res=writeMemToBuffer(WBHANDLE,WCMDHANDLE,6,buf);
    if(res < 0) {
        krnio_close(WBHANDLE);
        return -1;
    }

    res= saveBufferToSector(WCMDHANDLE,6,track,sec,status_str);
    krnio_close(WBHANDLE);
    if(res < 0) {       
        return -1;
    }

    return 0;

}