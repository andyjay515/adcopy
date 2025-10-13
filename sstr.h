#pragma once
#include <stdio.h>

struct sstr {
    unsigned char len;
    char str[32];
};
typedef struct sstr sstr_t;

void set_sstr(sstr_t* s, const char* src);
char* get_sstr(sstr_t* s);
void append_sstr(sstr_t* s, const char* src);
void append_sstr_num(sstr_t* s, int num);


#pragma compile("sstr.c")