#ifndef _TEST_H
#define _TEST_H
/*==================================================================
  File Name    : test.h
  Author       : Emile
*/
#include <stdint.h>
#include <stdbool.h>

typedef struct _clock_struct
{
    uint8_t  min;
    uint8_t  sec;
    bool     active;
    bool     active_prev;
    bool     blink;
    uint16_t digits;
} clock_struct;


#endif // _TEST_H
