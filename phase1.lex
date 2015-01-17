/* 
 * CS 152 - Project Phase 1
 * Jonathan Pang
 * Calvin Huynh
 */

/*  */
	int num_integers = 0, num_operators = 0, num_parentheses = 0, num_equal = 0;

/* Task 1: Read text from standard-in and prints identified tokens, 1 token per line */
PROGRAM ("program")
BEGIN_PROGRAM ("beginprogram")

/* Actions that occur when reading in token */
%%

. printf("Character is unrecognized, \'%s\' not in calculator language. Exiting program.\n", yytext); exit(0);
%%

int main( int argc, char **argv )
{
	 ++argv, --argc;  /* skip over program name */
	 if ( argc > 0 )
		 yyin = fopen( argv[0], "r" );
	 else
		 yyin = stdin;
 
	 yylex();
	 /* print # of integers, operators, parentheses, equal signs counted */
	 printf("# of integers = %d\n# of operators = %d\n# of parentheses = %d\n# of equal signs = %d\n", num_integers, num_operators, num_parentheses,num_equal);
}
