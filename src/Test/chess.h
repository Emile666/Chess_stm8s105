/*==================================================================
   File Name    : chess.h
   Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the main STD for the chess program
  ------------------------------------------------------------------
  ================================================================== */
#ifndef _CHESS_H_
#define _CHESS_H_
#include <stdint.h>

#define NO_SQUARE   (64)

#define EMPTY        (0)
#define PAWN_WHITE   (1)
#define PAWN_BLACK   (2)
#define ROOK_WHITE   (3)
#define ROOK_BLACK   (4)
#define BISHOP_WHITE (5)
#define BISHOP_BLACK (6)
#define KNIGHT_WHITE (7)
#define KNIGHT_BLACK (8)
#define QUEEN_WHITE  (9)
#define QUEEN_BLACK (10)
#define KING_WHITE  (11)
#define KING_BLACK  (12)

#define CHESS_INIT             (0)
#define CHESS_NEW_GAME         (1)
#define CHESS_WHITE            (2)
#define CHESS_WHITE2           (3)
#define CHESS_WHITE3           (4)
#define CHESS_WHITE_EP         (5)
#define CHESS_WHITE_CASTLING   (6)
#define CHESS_WHITE_CASTLING2  (7)
#define CHESS_PAUSE_WHITE      (8)
#define CHESS_BLACK            (9)
#define CHESS_BLACK2          (10)
#define CHESS_BLACK3          (11)
#define CHESS_BLACK_EP        (12)
#define CHESS_BLACK_EP2       (13)
#define CHESS_BLACK_EP3       (14)
#define CHESS_BLACK_CASTLING  (15)
#define CHESS_BLACK_CASTLING2 (16)
#define CHESS_BLACK_WHITE     (17)
#define CHESS_PAUSE_BLACK     (18)

void chess_main(void);

#endif
