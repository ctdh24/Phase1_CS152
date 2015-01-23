/* 
 * CS 152 - Project Phase 1
 * Jonathan Pang
 * Calvin Huynh
 */

/*  */
	int num_integers = 0, num_operators = 0, num_parentheses = 0, num_equal = 0;

/* Task 1: Read text from standard-in and prints identified tokens, 1 token per line */

/* Reserved Words*/
PROGRAM ("program")
BEGIN_PROGRAM ("beginprogram")
END_PROGRAM ("endprogram")
INTEGER ("integer")
ARRAY ("array")
OF ("of")
IF ("if")
THEN ("then")
ENDIF ("endif")
ELSE ("else")
WHILE ("while")
BEGINLOOP ("beginloop")
ENDLOOP ("endloop")
BREAK ("break")
CONTINUE ("continue")
EXIT ("exit")
READ ("read")
WRITE ("write")
AND ("and")
OR ("or")
NOT ("not")
TRUE ("true")
FALSE ("false")

/* Arithemetic Operators*/
SUB ("-")
ADD ("+")
MULT ("*")
DIV (/)
MOD ("%")

/* Comparison Operators*/
EQ ("=")
NEQ ("!=")
LT ("<")
GT ("<")
LTE ("<=")
GTE (">=")


/* Identifiers and Numbers*/
IDENT
digit	[0-9]
NUMBER  ({digit}+)

/* Other Special Symbols*/
SEMICOLON (";")
COLON (":")
COMMA (",")
QUESTION ("?")
L_PAREN ("(")
R_PAREN (")")
ASSIGN (":=")


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
