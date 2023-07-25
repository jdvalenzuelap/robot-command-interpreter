%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex(void);
extern int yylineno; // Add this line to declare yylineno
void yyerror(char *s);

extern FILE* yyin;
%}

%union {
    int num;
}

%token <num> NUMBER
%token POLITE CALL MOV TURN AND_THEN MOV_AHEAD DEGREES
%start commands

%%

commands: 
    CALL callCommand
    ;
callCommand:
    command
    | callCommand AND_THEN command
    | callCommand AND_THEN CALL command
    ;
command:
    POLITE MOV NUMBER MOV_AHEAD 
        { printf("MOV,%d\n", $3); }
    | MOV NUMBER MOV_AHEAD POLITE 
        { printf("MOV,%d\n", $2); }
    | POLITE TURN NUMBER DEGREES 
        {
            if($3 == 90 || $3 == 180 || $3 == 270 || $3 == 360)
                printf("TURN,%d\n", $3);
            else
                yyerror("Invalid degree value");
        }
    | TURN NUMBER DEGREES POLITE 
        {
            if($2 == 90 || $2 == 180 || $2 == 270 || $2 == 360)
                printf("TURN,%d\n", $2);
            else
                yyerror("Invalid degree value");
        }
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Syntax error: %s at line %d\n", s, yylineno);
    exit(1);
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s input_file\n", argv[0]);
        return 1;
    }

    FILE* file = fopen(argv[1], "r");
    if (!file) {
        fprintf(stderr, "Error: Unable to open the input file.\n");
        return 1;
    }

    yyin = file; 
    yyparse();

    fclose(file);

    return 0;
}