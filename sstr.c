#include "sstr.h"

void set_sstr(sstr_t* s, const char* src) {
    unsigned char len = 0;
    while(src[len] != '\0' && len < 31) {
        s->str[len] = src[len];
        len++;
    }
    s->str[len] = '\0';
    s->len = len;
}

char* get_sstr(sstr_t* s) {
    return s->str;
}

void append_sstr(sstr_t* s, const char* src) {
    unsigned char len = s->len;
    unsigned char i = 0;
    while(src[i] != '\0' && len < 31) {
        s->str[len] = src[i];
        len++;
        i++;
    }
    s->str[len] = '\0';
    s->len = len;
}

void append_sstr_num(sstr_t* s, int num) {
    char num_str[12];
    itoa(num, num_str, 10);
    append_sstr(s, num_str);
}