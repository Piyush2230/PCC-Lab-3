/*PROGRAM 3: develop lexical analyser for 'C' using LEX tool*/
/*Declarations*/
%{
#include <stdio.h>
%}

letter [a-zA-Z_]
digit [0-9]
id {letter}({letter}|{digit})*
number {digit}+(\.{digit}+)?(E[+-]?{digit}+)?
relop (<|>|<=|>=|==|!=)

/*Translation rules*/
%%

"if" { printf("KEYWORD: %s\n", yytext); }
"else" { printf("KEYWORD: %s\n", yytext); }
"then" { printf("KEYWORD: %s\n", yytext); }
{id} { printf("IDENTIFIER: %s\n", yytext); }
{relop} { printf("RELATIONAL_OPERATOR: %s\n", yytext); }
{number} { printf("NUMBER: %s\n", yytext); }
"(" { printf("LEFT_PARENTHESIS: %s\n", yytext); }
")" { printf("RIGHT_PARENTHESIS: %s\n", yytext); }
"[" { printf("LEFT_SQUARE_BRACKET: %s\n", yytext); }
"]" { printf("RIGHT_SQUARE_BRACKET: %s\n", yytext); }
"{" { printf("LEFT_CURLY_BRACKET: %s\n", yytext); }
"}" { printf("RIGHT_CURLY_BRACKET: %s\n", yytext); }
";" { printf("SEMICOLON: %s\n", yytext); }
"," { printf("COMMA: %s\n", yytext); }
"#" { printf("PREPROCESSOR: %s\n", yytext); }
\"[^"]*\" { printf("STRING_LITERAL: %s\n", yytext); }
[ \t\n]+ { }
"//".* { /* Ignore single-line comments */ }
"/*"([^*]|\*+[^*/])*\*+"/" { /* Ignore multi-line comments */ }
. { }

%%

/* Auxiliary functions */
int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}