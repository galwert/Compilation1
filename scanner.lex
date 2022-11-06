
%{
#include <stdio.h>
#include <string.h>
#include "tokens.hpp"
void printToken(char * name);
void parseString();
void printError(char * name);
%}

%option yylineno
%option noyywrap
digit [0-9]
letter [A-Za-z]
whitespace [\t \n]
relativeoperator [<>=!]=?
comment \/\/.*\n
binaryoperator [\*\+\\\-]
id [A-Za-z][A-Za-z0-9]*
number [0-9]+
%x QUOTES
string \".*\"
%%


void {char name[10]="VOID";printToken(name);}
int {char name[10]="INT";printToken(name);}
byte {char name[10]="BYTE";printToken(name);}
b {char name[10]="B";printToken(name);}
bool {char name[10]="BOOL";printToken(name);}
and {char name[10]="AND";printToken(name);}
or {char name[10]="OR";printToken(name);}
not {char name[10]="NOT";printToken(name);}
true {char name[10]="TRUE";printToken(name);}
false {char name[10]="FALSE";printToken(name);}
return {char name[10]="RETURN";printToken(name);}
if {char name[10]="IF";printToken(name);}
else {char name[10]="ELSE";printToken(name);}
while {char name[10]="WHILE";printToken(name);}
break {char name[10]="BREAK";printToken(name);}
continue {char name[10]="CONTINUE";printToken(name);}
; {char name[10]="SC";   printToken(name);}
, {char name[10]="COMMA";printToken(name);}
\( {char name[10]="LPAREN";printToken(name);}
\) {char name[10]="RPAREN";printToken(name);}
\{ {char name[10]="LBRACE";printToken(name);}
\} {char name[10]="RBRACE";printToken(name);}
= {char name[10]="ASSIGN";printToken(name);}
{relativeoperator} {char name[10]="RELOP";printToken(name);}
{binaryoperator} {char name[10]="BINOP"; printToken(name);}
{comment} {char name[10]="COMMENT";printToken(name);}
{id} {char name[10]="ID";printToken(name);}
{number} {char name[10]="NUM";printToken(name);}

\"  BEGIN(QUOTES);
<QUOTES>[ !#-~]* {char name[10]="STRING";parseString();}
<QUOTES>\" BEGIN(INITIAL);
<QUOTES>. {printf("Error unclosed string\n");}
{string} {char name[10]="STRING";parseString();}

{whitespace} {;}


. {printf("Error %s\n",yytext);}

%%

void printToken(char * name)
{
    if(strcmp("COMMENT",name) == 0)
        printf("%d %s %s\n", yylineno-1, name, "//");
    else
        printf("%d %s %s\n", yylineno, name, yytext);
}

void printError(char * name)
{
    printf("%s %s\n","Error",name);
    exit(0);   
}