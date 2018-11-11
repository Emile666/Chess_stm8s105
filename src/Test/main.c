#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "chess.h"
#include "test.h"

uint8_t reed_relays[8];
extern uint8_t chess_std;
extern uint8_t table[];
extern uint8_t sq_begin;
extern uint8_t sq_end;
extern char    move_black_str[];
extern bool    move_black_received;

extern uint8_t new_game;
clock_struct clk1;
clock_struct clk2;

void print_chess_board(void)
{
    int8_t  j = 56;
    uint8_t i;

    do
    {
        for (i = 0; i < 8; i++)
        {
            switch(table[i+j])
            {
                case EMPTY       : printf("."); break;
                case PAWN_WHITE  : printf("p"); break;
                case PAWN_BLACK  : printf("P"); break;
                case ROOK_WHITE  : printf("r"); break;
                case ROOK_BLACK  : printf("R"); break;
                case BISHOP_WHITE: printf("b"); break;
                case BISHOP_BLACK: printf("B"); break;
                case KNIGHT_WHITE: printf("n"); break;
                case KNIGHT_BLACK: printf("N"); break;
                case QUEEN_WHITE : printf("q"); break;
                case QUEEN_BLACK : printf("Q"); break;
                case KING_WHITE  : printf("k"); break;
                case KING_BLACK  : printf("K"); break;
            } // switch
        } // for i
        j -= 8;
        printf("\n");
    } while (j >= 0);
    printf("\n");
} // print_chess_board()

void print_sq_position(uint8_t sq)
{
    printf("%c%d",'a'+(sq%8),1+(sq/8));
} // print_sq_position()

void print_std_nr(uint8_t std)
{
   switch (std)
   {
       case CHESS_INIT           : printf("std=INIT\n"); break;
       case CHESS_NEW_GAME       : printf("std=NEW_GAME\n"); break;
       case CHESS_WHITE          : printf("std=WHITE\n"); break;
       case CHESS_WHITE2         : printf("std=WHITE2\n"); break;
       case CHESS_WHITE3         : printf("std=WHITE3\n"); break;
       case CHESS_WHITE_EP       : printf("std=WHITE_EP\n"); break;
       case CHESS_WHITE_CASTLING : printf("std=WHITE_CASTLING\n"); break;
       case CHESS_WHITE_CASTLING2: printf("std=WHITE_CASTLING2\n"); break;
       case CHESS_PAUSE_WHITE    : printf("std=PAUSE_WHITE\n"); break;
       case CHESS_BLACK          : printf("std=BLACK\n"); break;
       case CHESS_BLACK2         : printf("std=BLACK2\n"); break;
       case CHESS_BLACK3         : printf("std=BLACK3\n"); break;
       case CHESS_BLACK_EP       : printf("std=BLACK_EP\n"); break;
       case CHESS_BLACK_CASTLING : printf("std=BLACK_CASTLING\n"); break;
       case CHESS_BLACK_CASTLING2: printf("std=BLACK_CASTLING2\n"); break;
       case CHESS_BLACK_WHITE    : printf("std=PAUSE_BLACK\n"); break;
   } // switch
} // print_std_nr()

int main()
{
    uint8_t i;

    printf("Test program for chess_main()\nInit. all reed-relays to 0\n");
    for (i = 0; i < 8; i++) reed_relays[i] = 0x00;
    chess_main(); print_std_nr(chess_std);
    new_game = true; printf("Input: set new_game = true\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();
    chess_main(); print_std_nr(chess_std);
    printf("now set all pieces in begin order\n");
    for (i = 0; i < 8; i++) reed_relays[i] = 0xC3;
    chess_main(); print_std_nr(chess_std);

    // 1. e2-e4
    printf("Input: lift pawn at e2: ");
    reed_relays[4] &= ~2; // lift e2
    chess_main(); print_std_nr(chess_std);
    printf("Output: piece picked up at: "); print_sq_position(sq_begin);
    printf("\nInput: Now drop pawn at e4: ");
    reed_relays[4] |= 8; // drop e4
    chess_main(); print_std_nr(chess_std);
    printf("Output: piece dropped at: "); print_sq_position(sq_end); printf("\n");
    print_chess_board();
    chess_main(); print_std_nr(chess_std);

    // ... ; e7-e5
    printf("Input: receiving e7e5\n");
    strcpy(move_black_str,"e7e5");
    move_black_received = true;
    chess_main(); print_std_nr(chess_std);
    reed_relays[4] &= ~64; // lift e7
    printf("Input: piece at e7 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[4] |= 16; // drop e5
    printf("Input: piece at e5 dropped\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // 2. Ng1-f3
    printf("Input: now lift knight at g1: ");
    reed_relays[6] &= ~1; // lift g1
    chess_main(); print_std_nr(chess_std);
    printf("Output: piece picked up at: "); print_sq_position(sq_begin);
    printf("\nInput: now drop knight at f3: ");
    reed_relays[5] |= 4; // drop f3
    chess_main(); print_std_nr(chess_std);
    printf("Output: Piece dropped at: "); print_sq_position(sq_end); printf("\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // ... ; Nb8-c6
    printf("Input: receiving b8c6\n");
    strcpy(move_black_str,"b8c6");
    move_black_received = true;
    chess_main(); print_std_nr(chess_std);
    reed_relays[1] &= ~128; // lift b8
    printf("Input: piece at b8 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[2] |= 32; // drop c6
    printf("Input: piece at c6 dropped\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // 3. Nf3xe5
    printf("Input: now lift knight at f3: ");
    reed_relays[5] &= ~4; // lift f3
    chess_main(); print_std_nr(chess_std);
    printf("Output: piece picked up at: "); print_sq_position(sq_begin);
    printf("\nInput: now lift pawn at e5: ");
    reed_relays[4] &= ~16; // lift e5
    chess_main(); print_std_nr(chess_std);
    printf("Output: piece picked up at: "); print_sq_position(sq_end);
    printf("\nInput: now drop knight at e5: ");
    reed_relays[4] |= 16; // lift e5
    chess_main(); print_std_nr(chess_std);
    printf("Output: Piece dropped at: "); print_sq_position(sq_end); printf("\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // ... ; Nc6xe5
    printf("Input: receiving c6e5\n");
    strcpy(move_black_str,"c6e5");
    move_black_received = true;
    chess_main(); print_std_nr(chess_std);
    reed_relays[2] &= ~32; // lift c6
    printf("Input: piece at b8 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[4] &= ~16; // lift e5
    printf("Input: piece at e5 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[4] |= 16; // drop e5
    printf("Input: piece at e5 dropped\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // 4. Ng1-f3
    printf("Input: lift Bishop at f1: ");
    reed_relays[5] &= ~1; // lift f1
    chess_main(); print_std_nr(chess_std);
    printf("\nInput: drop knight at d3: ");
    reed_relays[3] |= 4; // drop d3
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // ... ; Bf8-d6
    printf("Input: receiving f8d6\n");
    strcpy(move_black_str,"f8d6");
    move_black_received = true;
    chess_main(); print_std_nr(chess_std);
    reed_relays[5] &= ~128; // lift f8
    printf("Input: bishop at f8 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[3] |= 32; // drop d6
    printf("Input: piece at d6 dropped\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

   // 5. o-o
    printf("Input: now lift King at e1: ");
    reed_relays[4] &= ~1; // lift e1
    chess_main(); print_std_nr(chess_std);
    printf("Output: piece picked up at: "); print_sq_position(sq_begin);
    printf("\nInput: now drop King at g1: ");
    reed_relays[6] |= 1; // drop g1
    chess_main(); print_std_nr(chess_std);
    printf("Output: Piece dropped at: "); print_sq_position(sq_end); printf("\n");
    chess_main(); print_std_nr(chess_std);
    printf("Input: lift Rook at h1: ");
    reed_relays[7] &= ~1; // lift h1
    chess_main(); print_std_nr(chess_std);
    printf("Input: drop Rook at f1: ");
    reed_relays[5] |= 1; // drop f1
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // ... ; Ng8-f6
    printf("Input: receiving g8f6\n");
    strcpy(move_black_str,"g8f6");
    move_black_received = true;
    chess_main(); print_std_nr(chess_std);
    reed_relays[6] &= ~128; // lift g8
    printf("Input: knight at g8 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[5] |= 32; // drop f6
    printf("Input: knight at f6 dropped\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // 6. Nb1-c3
    printf("Input: lift Bishop at b1: ");
    reed_relays[1] &= ~1; // lift b1
    chess_main(); print_std_nr(chess_std);
    printf("\nInput: drop Bishop at c3: ");
    reed_relays[2] |= 4; // drop d3
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // ... ; o-o
    printf("Input: receiving o-o\n");
    //strcpy(move_black_str,"e8g8");
    strcpy(move_black_str,"o-o");
    move_black_received = true;
    chess_main(); print_std_nr(chess_std);
    reed_relays[4] &= ~128; // lift e8
    printf("Input: King at e8 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[6] |= 128; // drop g8
    printf("Input: King at g8 dropped\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[7] &= ~128; // lift h8
    printf("Input: Rook at h8 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[5] |= 128; // drop f8
    printf("Input: Rook at f8 dropped\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

        // 7. f2-f4
    printf("Input: lift Pawn at f2: ");
    reed_relays[5] &= ~2; // lift f2
    chess_main(); print_std_nr(chess_std);
    printf("\nInput: drop Pawn at f4: ");
    reed_relays[5] |= 8; // drop d3
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // ... ; b7-b5
    printf("Input: receiving b7b5\n");
    strcpy(move_black_str,"b7b5");
    move_black_received = true;
    chess_main(); print_std_nr(chess_std);
    reed_relays[1] &= ~64; // lift b7
    printf("Input: pawn at b7 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[1] |= 16; // drop b5
    printf("Input: pawn at b5 dropped\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // 8. f4-f5
    printf("Input: lift Pawn at f4: ");
    reed_relays[5] &= ~8; // lift f4
    chess_main(); print_std_nr(chess_std);
    printf("\nInput: drop Pawn at f5: ");
    reed_relays[5] |= 16; // drop f5
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // ... ; b5-b4
    printf("Input: receiving b5b4\n");
    strcpy(move_black_str,"b5b4");
    move_black_received = true;
    chess_main(); print_std_nr(chess_std);
    reed_relays[1] &= ~16; // lift b5
    printf("Input: pawn at b5 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[1] |= 8; // drop b4
    printf("Input: pawn at b4 dropped\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // 9. a2-a4
    printf("Input: lift Pawn at a2: ");
    reed_relays[0] &= ~2; // lift a2
    chess_main(); print_std_nr(chess_std);
    printf("\nInput: drop Pawn at a4: ");
    reed_relays[0] |= 8; // drop a4
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // ... ; a4xb3ep
    printf("Input: receiving b4a3\n");
    strcpy(move_black_str,"b4a3");
    move_black_received = true;
    chess_main(); print_std_nr(chess_std);
    reed_relays[1] &= ~8; // lift b4
    printf("Input: pawn at b4 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[0] |= 4; // drop a3
    printf("Input: pawn at a3 dropped: en passant.\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[0] &= ~8; // lift a4
    printf("Input: pawn at a4 removed\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // 10. b2xa3
    printf("Input: lift Pawn at b2: ");
    reed_relays[1] &= ~2; // lift b2
    chess_main(); print_std_nr(chess_std);
    printf("Input: lift black Pawn at a3: ");
    reed_relays[0] &= ~4; // lift a3
    chess_main(); print_std_nr(chess_std);
    printf("\nInput: drop Pawn at a3: ");
    reed_relays[0] |= 4; // drop a3
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // ... ; g7-g5
    printf("Input: receiving g7g5\n");
    strcpy(move_black_str,"g7g5");
    move_black_received = true;
    chess_main(); print_std_nr(chess_std);
    reed_relays[6] &= ~64; // lift g7
    printf("Input: pawn at g7 lifted\n");
    chess_main(); print_std_nr(chess_std);
    reed_relays[6] |= 16; // drop g5
    printf("Input: pawn at g5 dropped\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    // 11 f5xg6ep
    printf("Input: pawn at f5 lifted\n");
    reed_relays[5] &= ~16; // lift f5
    chess_main(); print_std_nr(chess_std);
    printf("Input: pawn at g6 dropped: en passant.\n");
    reed_relays[6] |= 32; // drop g6
    chess_main(); print_std_nr(chess_std);
    reed_relays[6] &= ~16; // lift g5
    printf("Input: black pawn at g5 removed\n");
    chess_main(); print_std_nr(chess_std);
    print_chess_board();

    printf("Test program ended...\n");
    return 0;
} // main()
