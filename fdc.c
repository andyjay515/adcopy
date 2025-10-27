#include <stdio.h>
#include "fdc.h"
#include <c64/kernalio.h>

// FDC command addresses for buffer 1
#define PARAMS_ADDR 0x8
#define JOB_Q_ADDR 0x1

// FDC commands
#define FDC_CMD_WRITE 0x90
#define FDC_CMD_READ  0x80
#define FDC_CMD_SEEK  0xB0

char cur_RTRACK = 0;
char cur_WTRACK = 0;

int issueCommand(char file_num, char command, char trk, char sec) {
    char params[8]={'M','-','W',PARAMS_ADDR&0xFF,PARAMS_ADDR>>8,0x02,trk,sec};
    int res = krnio_write(file_num,params,sizeof(params));
    if(res <= 0) {
        return -1;
    }

    // push command to job queue
    char jobq[7]={'M','-','W',JOB_Q_ADDR&0xFF,JOB_Q_ADDR>>8,0x1, command};
    res = krnio_write(file_num,jobq,sizeof(jobq));
    if(res <= 0) {
        return -1;
    }   
    return 0;
}
int waitCmdExecution(char file_num) {
    int retry = 2048;

    while(retry > 0) {
        char cmd[6]={'M','-','R',JOB_Q_ADDR&0xFF,JOB_Q_ADDR>>8,0x1};
        int res = krnio_write(file_num,cmd,sizeof(cmd));
        if(res <= 0) {
            return -1;
        }
        res = krnio_getch(file_num);
        if(res < 0) {
            return -1;
        }
        else if (res & 0x80) {
            retry--;
        } else if (res < 2) {
            break;
        } else {
            return -1;
        }
    }
    
    return 0;
}

int fdc_seek(char filenum, char track,char sec) {
    int res = 0;
    res = issueCommand(filenum,FDC_CMD_SEEK,track,sec);
    if(res < 0) {
        return -1;
    }
    res = waitCmdExecution(filenum);
    if(res < 0) {
        return -1;
    }
    return 0;
}

int fdc_readSector(char filenum, char track, char sector) {
    int res = 0;
    if(cur_RTRACK != track) {
        res = fdc_seek(filenum,track);
        if(res < 0) {
            return -1;
        }
        cur_RTRACK = track;
    }   

    res = issueCommand(filenum,FDC_CMD_READ,track,sector);
    if(res < 0) {
        return -1;
    }
    res = waitCmdExecution(filenum);
    if(res < 0) {
        return -1;
    }
    return 0;
}

int fdc_writeSector(char filenum, char track, char sector) {
    int res = 0;
    if(cur_WTRACK != track) {
        res = fdc_seek(filenum,track);
        if(res < 0) {
            return -1;
        }
        cur_WTRACK = track;
    }   

    res = issueCommand(filenum,FDC_CMD_WRITE,track,sector);
    if(res < 0) {
        return -1;
    }
    res = waitCmdExecution(filenum);
    if(res < 0) {
        return -1;
    }
    return 0;
}

int fdc_startReadSector(char filenum, char track, char sector) {
    int res = 0;
    if(cur_RTRACK != track) {
        res = fdc_seek(filenum,track);
        if(res < 0) {
            return -1;
        }
        cur_RTRACK = track;
    }   

    res = issueCommand(filenum,FDC_CMD_READ,track,sector);
    if(res < 0) {
        return -1;
    }
    return 0;
}

int fdc_startWriteSector(char filenum, char track, char sector) {
    int res = 0;
    if(cur_WTRACK != track) {
        res = fdc_seek(filenum,track,sector);
        if(res < 0) {
            return -1;
        }
        cur_WTRACK = track;
    }   

    res = issueCommand(filenum,FDC_CMD_WRITE,track,sector);
    if(res < 0) {
        return -1;
    }
    return 0;
}