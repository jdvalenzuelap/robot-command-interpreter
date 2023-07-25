%{
    #include "y.tab.h"
    void yyerror(char *);
%}

%option yylineno

%%

"please"|"kindly"     { return POLITE; }
"Robot"               { return CALL; }
"move"|"go"|"advance" { return MOV; }
"turn"                { return TURN; }
"degrees"             { return DEGREES; }
[0-9]+                { yylval.num = atoi(yytext); return NUMBER; }
"and then"|", then"|\n   { return AND_THEN; }
"blocks ahead"|"spaces ahead"|"positions ahead"|"block ahead" { return MOV_AHEAD; }
[ \t]+              { /* ignore whitespace */ }
[a-zA-Z]+             { /* ignore unrecognized words */ }
.                     { yyerror("Invalid character"); }

%%
