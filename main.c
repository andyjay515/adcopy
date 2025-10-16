#include <stdio.h>
#include <c64/kernalio.h>
#include <conio.h>
#include <c64/keyboard.h>
#include "sstr.h"
#include "drive.h"
#include "ciatimer.h"

#define WELCOME_MSG p"Andy Jay 202510.1"
#define BASESCR_ADDR 0x0400
#define BASECOLOR_ADDR 0xD800
char buffer[BUFSIZE];
char sectors[35];

sstr_t tmpstr;

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

    s= (unsigned char*)(BASECOLOR_ADDR);
    e= (unsigned char*)(BASECOLOR_ADDR + 40);

    for(unsigned char* p = s; p < e;p++) {
        *p = 15;
    }
}

void setDarkTheme() {
#if defined(__C128__) || defined(__C128B__) || defined(__C128E__)
#else
    unsigned char* border = (unsigned char*)53280;
    unsigned char* background = (unsigned char*)53281;
    *border = 11;
    *background = 0;
#endif
    for(unsigned char* p = (unsigned char*)BASECOLOR_ADDR; p < (unsigned char*)(BASECOLOR_ADDR + 1000);p++) {
        *p = 15;
    }
    setColorInfo();

}

void setAccentXY(char x, char y) {
    unsigned char* p = (unsigned char*)(BASECOLOR_ADDR + y*40 + x);
    *p = 3;
}

void setNormalXY(char x, char y) {
    unsigned char* p = (unsigned char*)(BASECOLOR_ADDR + y*40 + x);
    *p = 15;
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

void printTimer()
{
    getCiaTimer(&tmpstr);
    putsxy(35,0,get_sstr(&tmpstr));
}

void resetCPU()
{
#if defined(__C128__) || defined(__C128B__) || defined(__C128E__)
 __asm {
        jmp 65341;

       }
#else
    __asm {
        jmp 64738;

       }
#endif
}

int copyDisk(char src_drive, char dest_drive, bool skip_empty = false)
{
    sstr_t tmpstr;
    bool res = false;
    char key;

    setColorInfo();

    resetCiaTimer();

    if(openCommandCannels(src_drive,dest_drive) < 0) {
        return -1;
    }
    
    // loop tracks and sectors
    for(char t=1; t < 36; t++) {
        for (char s=0; s < sectors[t-1]; s++){
            printTimer();
           
            key = getchx();

            if (key == 'S') {
                closeChannelsCleanup();
                stopCiaTimer();
                return -1;
            }
         
            setAccentXY(t+2,s+4);
            putsxy(t+2,s+4,"R");
            if(readSector(src_drive,t,s,buffer, &tmpstr) < 0) {
                putsxy(t+2,s+4,"!");
                putsxy(10,3,get_sstr(&tmpstr));
                continue;
            }

            printTimer();

            if(skip_empty && checkBufferEmpty(buffer)) {
                putsxy(t+2,s+4,"O");
                setNormalXY(t+2, s+4);
                continue;
            }

            
            key = getchx();
    
            if (key == 'S') { 
                closeChannelsCleanup();
                stopCiaTimer();
                return -1;
            }
            

            putsxy(t+2,s+4,"W");
            if(writeSector(dest_drive,t,s,buffer, &tmpstr) < 0) {
                putsxy(t+2,s+4,"!");
                putsxy(10,3,get_sstr(&tmpstr));
                continue;
            }

            
            putsxy(t+2,s+4,".");
            setNormalXY(t+2, s+4);
            keyb_poll();
        }
    }

    closeChannelsCleanup();
    stopCiaTimer();
    return 0;
}

void printTrackNumbers()
{
    for(int t=1; t < 36; t++) {
        
        set_sstr(&tmpstr,"");
        append_sstr_num(&tmpstr,t/10);
        char* cmd = get_sstr(&tmpstr);  
        putsxy(2+t,1,cmd);

        
        set_sstr(&tmpstr,"");
        append_sstr_num(&tmpstr,t%10);
        cmd = get_sstr(&tmpstr);
        putsxy(2+t,2,cmd);
    }
}

void printSectorNumbers()
{
    for(int s=0; s < 21; s++) {
        
        set_sstr(&tmpstr,"");
        append_sstr_num(&tmpstr,s);
        char* cmd = get_sstr(&tmpstr);
        putsxy(0,s+4,cmd);
    }
}

void printLegend()
{
    putsxy(33,22,p"!=error");
    putsxy(28,23,p"o=skip, .=ok");
    putsxy(26,24,p"r=read,w=write");
}

int main(void)
{
    char src_drive= 8;
    char dest_drive= 9;
    char tmp,key;
    int res = 0;
    bool optimize = false;

    fillSectorsInfo();

    while(true) {
        // clear screen
        putchar(147);

        putchar(14);

        setDarkTheme();

        optimize = false;

        // welcome message
        putsxy(10,5,p"Another Disk Copy");
        putsxy(10,23,WELCOME_MSG);
        keyb_poll();

        drawBox(8,7);
        drawBox(8,13);

        set_sstr(&tmpstr,p"in ");
        append_sstr_num(&tmpstr,src_drive);
        putsxy(16,11,get_sstr(&tmpstr));

        set_sstr(&tmpstr,p"out ");
        append_sstr_num(&tmpstr,dest_drive);
        putsxy(16,17,get_sstr(&tmpstr));

        putsxy(12,20,p"swap ?(Y/N)");
        
        while(true) {
        
            key = getch();

            if (key=='Y') {   
                // swap drives
                tmp=dest_drive;
                dest_drive=src_drive;
                src_drive=tmp;
                
                // redraw info

                set_sstr(&tmpstr,p"in ");
                append_sstr_num(&tmpstr,src_drive);
                putsxy(16,11,get_sstr(&tmpstr));

                set_sstr(&tmpstr,p"out ");
                append_sstr_num(&tmpstr,dest_drive);
                putsxy(16,17,get_sstr(&tmpstr));
            } else if (key=='N') {
                break;
            } else if( key=='Q') {
                resetCPU();
                return 0;
            }

        }
        
        res = getDriveInfo(src_drive);
        if(res > 0) {
            set_sstr(&tmpstr,"");
            append_sstr_num(&tmpstr,res);
            putsxy(16,7,get_sstr(&tmpstr));
        } else {
            putsxy(16,7,"?");
        }

        res = getDriveInfo(dest_drive);
        if(res > 0) {
            set_sstr(&tmpstr,"");
            append_sstr_num(&tmpstr,res);
            putsxy(16,13,get_sstr(&tmpstr));
        } else {
            putsxy(16,13,"?");
        }

        putsxy(10,20,p"press C for complete copy");
        putsxy(10,21,p"press O for optimized copy");
        putsxy(10,22,p"or Q to quit");

        while(true) {
            
            key = getch();
            
            if(key=='C') {
                break;
            }
            else if(key=='O') {
                optimize = true;
                break;
            } else if (key=='Q') {
                resetCPU();
                return 0;
            } 

        }

        // copy screen
        putchar(147);
        printTrackNumbers();
        printSectorNumbers();
        printLegend();
        putsxy(10,0,p"press and hold S to stop");
        
        res = copyDisk(src_drive,dest_drive,optimize);
        if(res >= 0) {
            putsxy(10,0,p"job completed! press C or Q   ");
        } else {
            putsxy(10,0,p"copy error! press C or Q      ");
        }

        while(true) {
            
            key = getch();

            if(key == 'C') {
                break;
            } else if (key=='Q') {
                resetCPU();
                return 0;
            }
        }
    }

    return 0;
}
