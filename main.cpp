
#include <stdio.h>
#include <string>
void printToken(char *);
void parseString();
extern int yylineno;
extern char* yytext;
extern int yyleng;
extern int yylex();


int main(){
    int token;
    token = yylex();
    while(token) {

        token = yylex();
    }
    return 0;
}
void parseString()
{
    char* curr= yytext;
    printf("%d %s ", yylineno, "STRING");
    curr++;
    while(*curr!='\0')
    {
        if(*curr=='\"')
        {
            curr++;
            continue;
        }
        if(*curr=='\\')
        {
            int sum;
            curr++;
            switch (*curr) {
                case 'n':
                    putchar('\n');
                    break;
                case '\"':
                    putchar('\"');
                    break;
                case 't':
                    putchar('\t');
                    break;
                case 'r':
                    putchar('\r');
                    break;
                case '0':
                    curr++;
                    if(*curr==' ') //not sure what to do with \0
                    {

                    }
                case 'x':
                        curr++;
                        char tmp [3];
                        tmp[0]=*curr; // now we are in the first digit of /xdd
                        tmp[1]=*(curr+1);
                        tmp[2]='\0';
                        int sum=std::stoi(tmp,nullptr,16);
                    putchar(sum);
                    break;
                    //should check for error if the number is bigger than 127
            }

        }
        else
        {
            printf("%c",*curr);
        }
        curr++;
    }
    printf("\n");
}