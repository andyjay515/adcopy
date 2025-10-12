#include <stdio.h>
//#include <string.h>
#include <c64/kernalio.h>
#include <c64/keyboard.h>


#define RBHANDLE 5
#define RCMDHANDLE 15
#define WFHANDLE 6
#define WCMDHANDLE 16
#define BUFSIZE 256
#define BASESCR_ADDR 0x0400
#define BASECOLOR_ADDR 0xD800
char buffer[BUFSIZE];
char sectors[35];
char cmd[32];

/* CIA registry address */
#define CIA1_REG 0xDC00
unsigned char* CIA1_TODT = (unsigned char*)(CIA1_REG+0x08);
unsigned char* CIA1_TODS = (unsigned char*)(CIA1_REG+0x09);
unsigned char* CIA1_TODM = (unsigned char*)(CIA1_REG+0x0A);
unsigned char* CIA1_TODH = (unsigned char*)(CIA1_REG+0x0B);


/* DRIVE IMAGE DATA */
const char r1[15] = {0x70, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x6E, 0x0 };
const char r2[15] = {0x5D, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x5D, 0x0 };
const char r3[15] = {0x5D, 0x20, 0x6F, 0x6F, 0x6F, 0x62, 0x62, 0x62, 0x6F, 0x6F, 0x6F, 0x20, 0x20, 0x5D, 0x0 };
const char r4[15] = {0x5D, 0x20, 0x20, 0x20, 0x20, 0x78, 0x78, 0x78, 0x20, 0x20, 0x20, 0x20, 0x20, 0x5D, 0x0 };
const char r5[15] = {0x5D, 0x20, 0x2E, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x5D, 0x0 };
const char r6[15] = {0x6D, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x7D, 0x0 };


void setColorInfo()
{
    char x = 10;
    char y = 3;
    unsigned char* s = (unsigned char*)(BASECOLOR_ADDR + y*40 + x);
    unsigned char* e = (unsigned char*)(BASECOLOR_ADDR + y*40 + x + 16);

    for(unsigned char* p = s; p < e;p++) {
        *p = 4;
    }
}
void fillSectorsInfo()
{
    for(int i=0;i<17;i++) sectors[i] = 21;
    for(int i=17;i<24;i++) sectors[i] = 19;
    for(int i=24;i<30;i++) sectors[i] = 18;
    for(int i=30;i<35;i++) sectors[i] = 17;
}

void putsxy(char x, char y, const char *s)
{
    unsigned char *p = (unsigned char *)BASESCR_ADDR + y*40 + x;
    while(*s) {
        *p++ = *s++;
    }
}

void drawBox(char x, char y)
{
    putsxy(x,y,r1);
    putsxy(x,y+1,r2);
    putsxy(x,y+2,r3);
    putsxy(x,y+3,r4);
    putsxy(x,y+4,r5);
    putsxy(x,y+5,r6);   
}

void closeChannelsCleanup()
{
    krnio_close(WCMDHANDLE);
    krnio_close(RCMDHANDLE);
    *CIA1_TODH = 12;
    
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
    sprintf(cmd,"U1 5 0 %d %d",track,sec);
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
    res = krnio_puts(WCMDHANDLE,"B-P 6 0");
    if(res <= 0) {
        krnio_close(RBHANDLE);
        return res;
    }

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
        return res;
    }

    // fill buffer
    res = krnio_write(WFHANDLE,buf,BUFSIZE);
    if(res <= 0) {
        krnio_close(WFHANDLE);
        return res;
    }

    // prepare command to move head to sector
    sprintf(cmd,"U2 6 0 %d %d",track,sec);

    res = krnio_puts(WCMDHANDLE,cmd);
    if(res <= 0) {
        return res;
    }

    // read status
    krnio_read(WCMDHANDLE,cmd,16);
    cmd[15] = 0;
    //sscanf(cmd,"%d",&res);
    res = atoi(cmd);
    if(res >= 20) {
        putsxy(10,3,cmd);
        return -1;
    }
    
    krnio_close(WFHANDLE);
    return res;

}

void printTrackNumbers()
{
    for(int t=1; t < 36; t++) {
        sprintf(cmd,"%01d",t/10);
        putsxy(2+t,1,cmd);
        sprintf(cmd,"%01d",t%10);
        putsxy(2+t,2,cmd);
    }
}

void printSectorNumbers()
{
    for(int s=0; s < 21; s++) {
        sprintf(cmd,"%02d",s);
        putsxy(0,s+4,cmd);
    }
}

void printTimer()
{
    // read Hour to activate latch
    unsigned char h = *CIA1_TODH;
    char timerStr[6] = {0x0,0x0,'.',0x0,0x0,0x0};
    char ml,mh = 0;
    char sl,sh = 0;
    // convert BCD to binary
    ml = *CIA1_TODM & 0x0F;
    mh = ((*CIA1_TODM >> 4) & 0x0F);
    sl = *CIA1_TODS & 0x0F;
    sh = ((*CIA1_TODS >> 4) & 0x0F);
    timerStr[0] = 0x30;
    timerStr[1] = 0x30+ml;
    timerStr[3] = 0x30+sh;
    timerStr[4] = 0x30+sl;
    putsxy(35,0,timerStr);
    // relase latch
    h = *CIA1_TODH;
}


int getDriveInfo(char driveid)
{
    int res = 0;
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
    krnio_read(RCMDHANDLE,cmd,32);
    cmd[31] = 0;
    // set pointer to drive type location
    char* drive_type = &cmd[16];

    res = atoi(drive_type);
    
    krnio_close(RCMDHANDLE);
    return res;
}

int copyDisk(char src_drive, char dest_drive)
{
    bool res = false;

    setColorInfo();

    // reset TOD clock
    *CIA1_TODH = 12;
    *CIA1_TODM = 0;
    *CIA1_TODS = 0;
    *CIA1_TODT = 0;

    // open command channels
    krnio_setnam("");
    res = krnio_open(RCMDHANDLE,src_drive,15);
    if(!res) {
        return -1;
    }
    res = krnio_open(WCMDHANDLE,dest_drive,15);
    if(!res) {
        return -1;
    }

    for(char t=1; t < 36; t++) {
        for (char s=0; s < sectors[t-1]; s++){
            printTimer();
            putsxy(t+2,s+4,"R");
            if(readSector(src_drive,t,s,buffer) < 0) {
                putsxy(t+2,s+4,"!");

                closeChannelsCleanup();
               
                return -1;
            }

            keyb_poll();

            if (key_pressed(KSCAN_Q)) {
                closeChannelsCleanup();
                return -1;
            }

            printTimer();
            putsxy(t+2,s+4,"W");
            if(writeSector(dest_drive,t,s,buffer) < 0) {
                putsxy(t+2,s+4,"!");

                closeChannelsCleanup();
                return -1;
            }
            putsxy(t+2,s+4,".");
            
            keyb_poll();
        }
    }

    closeChannelsCleanup();
    return 0;
}

int main(void)
{
    char src_drive= 8;
    char dest_drive= 9;
    char tmp;
    int res = 0;
    int key_y_cnt = 0;
    int key_n_cnt = 0;
    int key_s_cnt = 0;
    int key_q_cnt = 0;

    fillSectorsInfo();
    // clear screen
    putchar(147);

    putchar(14);
    // welcome message
    putsxy(10,5,p"MOS Disk Copy");
    putsxy(10,23,p"Andy Jay 202510");
    keyb_poll();

    drawBox(8,7);
    drawBox(8,13);

    sprintf(cmd,p"in %d",src_drive);
    putsxy(16,11,cmd);

    sprintf(cmd,p"out %d",dest_drive);
    putsxy(16,17,cmd);
       
    putsxy(12,20,p"swap ?(Y/N)");
    while(true) {
       
        
        keyb_poll();
        
        if (key_pressed(KSCAN_Y)) {   
            key_y_cnt++;
        } else {
            // if key is not pressed continuously reset counter
            key_y_cnt = 0;
        }
        if( key_pressed(KSCAN_N)) {
            key_n_cnt++;
        } else {
            // if key is not pressed continuously reset counter
            key_n_cnt = 0;
        }

        if(key_y_cnt > 100) {
            key_y_cnt = -100;

            // swap drives
            tmp=dest_drive;
            dest_drive=src_drive;
            src_drive=tmp;
            
            // redraw info

            sprintf(cmd,p"in %d",src_drive);
            putsxy(16,11,cmd);

            sprintf(cmd,p"out %d",dest_drive);
            putsxy(16,17,cmd);
        }
        if(key_n_cnt > 100) {
            key_n_cnt = 0;
            break;
        }

    }
    res = getDriveInfo(src_drive);
    if(res > 0) {
        sprintf(cmd,p"%d",res);
        putsxy(16,7,cmd);
    } else {
        putsxy(16,7,"?");
    }

    res = getDriveInfo(dest_drive);
    if(res > 0) {
        sprintf(cmd,p"%d",res);
        putsxy(16,13,cmd);
    } else {
        putsxy(16,13,"?");
    }
  
    putsxy(10,20,p"press S to continue");
    putsxy(10,21,p"or Q to quit");

    keyb_poll();

    while(true) {
        
        keyb_poll();
        
        if(key_pressed(KSCAN_S)) {
            key_s_cnt++;
        }
        else {
            // if key is not pressed continuously reset counter
            key_s_cnt = 0;
        }

        if(key_pressed(KSCAN_Q)) {
            key_q_cnt++;
        }
        else {
            // if key is not pressed continuously reset counter
            key_q_cnt = 0;
        }

        if (key_q_cnt > 30) {
            key_q_cnt = 0;
            putchar(147);
            return 0;
        }

        if(key_s_cnt > 30) {
            key_s_cnt = 0;
            break;
        }
    }

    // copy screen
    putchar(147);
    printTrackNumbers();
    printSectorNumbers();
    putsxy(10,0,p"press and hold Q to quit.");
    
    res = copyDisk(src_drive,dest_drive);
    if(res >= 0) {
        putsxy(10,0,p"job complete! press Q to quit.");
    } else {
        putsxy(10,0,p"copy error! press Q to quit.");
    }

    keyb_poll();

    while(true) {
        
        keyb_poll();
        
        if(key_pressed(KSCAN_Q)) {
            key_q_cnt++;
        }
        else {
            // if key is not pressed continuously reset counter
            key_q_cnt = 0;
        }   
        if (key_q_cnt > 30) {
            key_q_cnt = 0;
            break;
        }
    }

    putchar(147);
    putchar(14);
   
    return 0;
}