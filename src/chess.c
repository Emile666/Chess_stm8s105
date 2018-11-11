/*==================================================================
   File Name    : chess.c
   Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the main STD for the chess program
  ------------------------------------------------------------------
  ================================================================== */ 
#include "chess.h"
#include "chess_stm8s105_main.h"
#include <stdbool.h>
#include <ctype.h>
#include "max7219.h"
// 
// 8 56 57 58 59 60 61 62 63
// 7 48 49 50 51 52 53 54 55
// 6 40 41 42 43 44 45 46 47
// 5 32 33 34 35 36 37 38 39
// 4 24 25 26 27 28 29 30 31
// 3 16 17 18 19 20 21 22 23
// 2 08 09 10 11 12 13 14 15
// 1 00 01 02 03 04 05 06 07
//    A  B  C  D  E  F  G  H -> Files 
uint8_t table[64];
char    move_black_str[10];
bool    move_black_received = false;

// White: Positions from 00-15 ; Black: positions from 63-48
uint8_t init_white[8] = {ROOK_WHITE,KNIGHT_WHITE,BISHOP_WHITE,QUEEN_WHITE,
			             KING_WHITE,BISHOP_WHITE,KNIGHT_WHITE,ROOK_WHITE};
uint8_t init_black[8] = {ROOK_BLACK,KNIGHT_BLACK,BISHOP_BLACK,QUEEN_BLACK,
                         KING_BLACK,BISHOP_BLACK,KNIGHT_BLACK,ROOK_BLACK};
						  
extern uint8_t reed_relays[]; // status of all reed-relays
extern clock_struct clk1;
extern clock_struct clk2;

uint8_t reed_relays_old[8]; // previous value of reed_relays[]
uint8_t chess_std  = CHESS_INIT;
uint8_t piece_picked;
uint8_t sq_begin;
uint8_t sq_end;
uint8_t moves_half_cntr;
bool    new_game   = false;
bool    pause_game = false;

uint8_t position_to_board_nr(char *s)
{
	return tolower(s[0]) - 'a' + ((s[1] - '1') << 3);
} // position_to_board_nr()

void board_nr_to_position(char *s, uint8_t nr)
{
	s[0] = 'a' + (nr % 8);
	s[1] = '1' + (nr >> 3);
	s[2] = '\0';
} // board_nr_to_position()

// returns square number where piece was lifted or NO_SQUARE
// *lifted: true is piece is lifted, false when piece is placed
uint8_t piece_detect_move(uint8_t *lifted)
{
    uint8_t i      = 0;
	uint8_t row    = 0; 
	uint8_t square = 0;

	do
	{
		row = (reed_relays[i] ^ reed_relays_old[i]);
		i++;
	} while (!row && (i < 8));
	if (row)
	{	// a change is detected
		*lifted = ((reed_relays_old[--i] & row) > 0); // piece is lifted
		row >>= 1;
		while (row)
		{
			row >>= 1;
			square += 8;
		} // while
		square += i;
	} // if
	else square = NO_SQUARE;
	return square;
} // piece_detect_move()
				
bool is_black_piece(uint8_t sq_nr)
{
	uint8_t p = table[sq_nr];
	
	if ((p != EMPTY) && ((p & 0x01) == 0x00))
		 return true;
	else return false;
} // is_black_piece()

bool is_white_piece(uint8_t sq_nr)
{
	uint8_t p = table[sq_nr];
	
	if ((p != EMPTY) && ((p & 0x01) == 0x01))
		 return true;
	else return false;
} // is_white_piece()

// sq1: white begin move, sq2: white end move
bool is_en_passant_white(uint8_t sq1, uint8_t sq2)
{
    uint8_t sq3 = 0;

	if (sq1 + 7 == sq2)      sq3 = sq1 - 1;
	else if (sq1 + 9 == sq2) sq3 = sq1 + 1;
	else return false;

	if ((table[sq1] == PAWN_WHITE) && (table[sq2] == EMPTY) &&
	    (table[sq3] == PAWN_BLACK))
         return true;
    else return false;
} // is_en_passant_white()

// sq1: white black move, sq2: black end move
bool is_en_passant_black(uint8_t sq1, uint8_t sq2)
{
	uint8_t sq3 = 0;
	
	if (sq1 - 7 == sq2)      sq3 = sq1 + 1;
	else if (sq1 - 9 == sq2) sq3 = sq1 - 1;
	else return false;
	
	if ((table[sq1] == PAWN_BLACK) && (table[sq2] == EMPTY) && 
	    (table[sq3] == PAWN_WHITE))
	     return true;
	else return false;
} // is_en_passant_black()

bool is_castling_white(uint8_t sq1, uint8_t sq2)
{
	bool ret = false;
	
	ret = (table[sq1] == KING_WHITE) && (table[sq2] == EMPTY) && 
	      ((sq1 == 4) && ((sq2 == 2) || (sq2 == 6))); 
	return ret;
} // is_castling_white()

// Examples:  e2e4, e7e5, e1g1 (white short castling), e7e8q (for promotion)
uint8_t eval_black_move(uint8_t *sqb, uint8_t *sqe)
{
    uint8_t retv;
	char    s[10];

    if (!strncmp(move_black_str,"0-0-0",5) ||
        !strncmp(move_black_str,"O-O-O",5) ||
        !strncmp(move_black_str,"o-o-o",5))
    {
        *sqb = 60;
        *sqe = 58;
        retv = CHESS_BLACK_CASTLING;
    } // if
    else if (!strncmp(move_black_str,"0-0",3) ||
             !strncmp(move_black_str,"O-O",3) ||
             !strncmp(move_black_str,"o-o",3))
	{
        *sqb = 60;
        *sqe = 62;
	    retv = CHESS_BLACK_CASTLING;
	} // else if
    else
    {
		s[0] = move_black_str[0];
		s[1] = move_black_str[1];
		s[2] = '\0';
		*sqb = position_to_board_nr(s);
		s[0] = move_black_str[2];
		s[1] = move_black_str[3];
		s[2] = '\0';
		*sqe = position_to_board_nr(s);
		if ((*sqb == 60) && (table[60] == KING_BLACK))
		{
			if ((*sqe == 62) || (*sqe == 58))
                 retv = CHESS_BLACK_CASTLING;
			else retv = CHESS_BLACK2; // normal move
		} // if
		else if (is_en_passant_black(*sqb,*sqe)) retv = CHESS_BLACK_EP;
		else retv = CHESS_BLACK2; // normal move
    } // else
    return retv;
} // eval_black_move()

		
void chess_main(void)
{
	uint8_t i, sq_black, sq_white;
	bool    all_set;
    uint8_t lifted;
	
	switch (chess_std)
	{
		case CHESS_INIT:
			// All lights off
			// PL1 and PL2 LEDs off
			if (new_game)
			{
				for (i = 0 ; i <  8; i++) table[i] = init_white[i];
				for (i = 8 ; i < 16; i++) table[i] = PAWN_WHITE;
				for (i = 16; i < 48; i++) table[i] = EMPTY;
				for (i = 48; i < 56; i++) table[i] = PAWN_BLACK;
				for (i = 56; i < 64; i++) table[i] = init_black[i-56];
				for (i = 0; i < 8; i++)
				{   // Set lights 00-15 and lights 48-63
					max7219_write((MAX7219_REG_DIG0 + (i << 8)) | 0xC3);
				} // for i
        			chess_std = CHESS_NEW_GAME;
			} // if
			break;
		case CHESS_NEW_GAME:
			clk1.active     = false; 
			clk2.active     = false; 
			all_set         = false;
            moves_half_cntr = 0; // move counter
			i = 0;
			while ((i < 8) && !all_set)
			{
				all_set = (reed_relays[i++] == 0xC3);
			} // while
			for (i = 0; i < 8; i++) 
			{	// update LEDs on chess-board
				max7219_write((MAX7219_REG_DIG0 + (i << 8)) | (reed_relays[i] ^ 0xC3));
			} // for
			if (all_set) chess_std = CHESS_WHITE;
			// else: remain in this state
			break;
		case CHESS_WHITE:
			clk1.active = true;
			clk2.active = false; 
			if (pause_game) chess_std = CHESS_PAUSE_WHITE;
			else if ((sq_begin = piece_detect_move(&lifted)) != NO_SQUARE) 
			{
                piece_picked = table[sq_begin]; // which piece is picked up?
				chess_std = CHESS_WHITE2;
			} // else if
			break;
		case CHESS_WHITE2: // A piece was lifted, now check for another piece lifted or a piece returned
			if ((sq_end = piece_detect_move(&lifted)) != NO_SQUARE) 
			{
				if (!lifted)
				{	// a piece is returned, no attack
					if (sq_end == sq_begin)
                    {   // piece returned to same square
					    chess_std = CHESS_WHITE; // start again with white move
                    } // if
                    else
                    {	
                        if (is_en_passant_white(sq_begin,sq_end))
						     chess_std  = CHESS_WHITE_EP;
					    else if (is_castling_white(sq_begin,sq_end))
						     chess_std  = CHESS_WHITE_CASTLING;
					    else 
						{
							chess_std  = CHESS_BLACK; // Black to move
                            moves_half_cntr++;
						} // else
                        table[sq_end]   = table[sq_begin];
					    table[sq_begin] = EMPTY;
					} // else
				} // if
				else if (is_black_piece(sq_end))
				{	// a 2nd piece (black) is lifted
					sq_black  = sq_end;
					chess_std = CHESS_WHITE3;
				} // else
				// else a 2nd white piece was moved, illegal move!
			} // else if
			break;
		case CHESS_WHITE3: // A 2nd piece (black) was lifted, now check for a piece returned
			if ((sq_end = piece_detect_move(&lifted)) != NO_SQUARE) 
			{
				if (!lifted)
				{	// a piece is returned, normal attack
					table[sq_end]   = table[sq_begin]; // from state CHESS_WHITE
					table[sq_begin] = EMPTY;
					moves_half_cntr++;
					chess_std       = CHESS_BLACK;
				} // if
				// else another piece was lifted, illegal move!
			} // else if
			break;
		case CHESS_WHITE_EP: // En-passant move
			if ((sq_black = piece_detect_move(&lifted)) != NO_SQUARE)
			{	// Black pawn was removed
				table[sq_black] = EMPTY;
				moves_half_cntr++;
				chess_std       = CHESS_BLACK;
			} // if
			break;
		case CHESS_WHITE_CASTLING: // Castling move
			if ((sq_white = piece_detect_move(&lifted)) != NO_SQUARE)
			{	// White Rook should be lifted
				if (lifted && (((sq_white == 0) && (table[0] == ROOK_WHITE)) || 
				               ((sq_white == 7) && (table[7] == ROOK_WHITE))))
				{
					table[sq_white] = EMPTY;
					chess_std       = CHESS_WHITE_CASTLING2;
				} // if
				// else: illegal move
			} // if
			break;
		case CHESS_WHITE_CASTLING2: // Castling move
			if ((sq_white = piece_detect_move(&lifted)) != NO_SQUARE)
			{	// White Rook should be placed
				if (!lifted && ((sq_white == 3) || (sq_white == 5)))
				{
					table[sq_white] = ROOK_WHITE;
					moves_half_cntr++;
					chess_std       = CHESS_BLACK;
				} // if
				// else: illegal move
			} // if
			break;
		case CHESS_PAUSE_WHITE:
			clk1.active = false; 
			if (!pause_game) chess_std = CHESS_WHITE;
			break;
		case CHESS_BLACK:
			clk1.active = false;
			clk2.active = true; 
			if (pause_game)               chess_std = CHESS_PAUSE_BLACK;
            else if (move_black_received) 
			{
				move_black_received = false;
				chess_std = eval_black_move(&sq_begin,&sq_end);
			} // else if
			break;
		case CHESS_BLACK2:
			if (((sq_black = piece_detect_move(&lifted)) != NO_SQUARE) && (sq_black == sq_begin)) 
			{
				chess_std = CHESS_BLACK3; // the correct piece was picked up
			} // if
			break;
		case CHESS_BLACK3: // the correct piece was picked up, now check for proper return
			if ((sq_black = piece_detect_move(&lifted)) != NO_SQUARE) 
			{
				if (!lifted && (sq_black == sq_end))
				{
                    table[sq_end]   = table[sq_begin]; // from eval_black_move() in CHESS_BLACK
					table[sq_begin] = EMPTY;
                    chess_std       = CHESS_WHITE; // the correct piece was picked up
                    moves_half_cntr++;
				} // if
			} // if
			break;
        case CHESS_BLACK_CASTLING:
			if (((sq_black = piece_detect_move(&lifted)) != NO_SQUARE) && (sq_black == sq_begin))
			{
				chess_std = CHESS_BLACK_CASTLING2; // the correct piece (king) was picked up
			} // if
            break;
        case CHESS_BLACK_CASTLING2:
			if ((sq_black = piece_detect_move(&lifted)) != NO_SQUARE)
			{
				if (!lifted && (sq_black == sq_end))
                {   // King is returned
                    table[sq_end]   = table[sq_begin]; // from eval_black_move() in CHESS_BLACK
					table[sq_begin] = EMPTY;
					if (sq_end == 62)
                    {   // short castling
                        sq_begin = 63;
                        sq_end   = 61;
                    }
                    else
                    {   // long castling
                        sq_begin = 56;
                        sq_end   = 59;
                    } // else
                    chess_std    = CHESS_BLACK2;    // now handle pick and place of Rook
                } // if
			} // if
			break;
        case CHESS_BLACK_EP:
			if (((sq_black = piece_detect_move(&lifted)) != NO_SQUARE) && (sq_black == sq_begin))
			{
				chess_std = CHESS_BLACK_EP2; // the correct pawn was picked up
			} // if
            break;
        case CHESS_BLACK_EP2:
			if ((sq_black = piece_detect_move(&lifted)) != NO_SQUARE)
			{
				if (!lifted && (sq_black == sq_end))
                {   // Pawn is returned
                    table[sq_end]   = table[sq_begin]; // from eval_black_move() in CHESS_BLACK
					table[sq_begin] = EMPTY;
                    chess_std       = CHESS_BLACK_EP3;    // now handle pick-up of white pawn
                } // if
			} // if
			break;
        case CHESS_BLACK_EP3:
            if (sq_begin - 7 == sq_end)      sq_white = sq_begin + 1;
            else if (sq_begin - 9 == sq_end) sq_white = sq_begin - 1;

			if (((sq_begin = piece_detect_move(&lifted)) != NO_SQUARE) && (sq_begin == sq_white))
			{
				table[sq_begin] = EMPTY; // remove white en-passant pawn
				chess_std = CHESS_WHITE; //
                moves_half_cntr++;
			} // if
            break;
		case CHESS_PAUSE_BLACK:
			clk2.active = false; 
			if (!pause_game) chess_std = CHESS_BLACK;
			break;
	} // switch
	for (i = 0; i < 8; i++) reed_relays_old[i] = reed_relays[i];
} // chess_main()