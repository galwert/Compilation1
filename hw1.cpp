
#include <stdio.h>
#include <iostream>
#include <string>
#include <map>
void printToken(char *);
void parseString();
extern int yylineno;
extern char* yytext;
extern int yyleng;
extern int yylex();
using namespace std;

map<char,int> m = {{'0',0},{'1',1},{'2',2},{'3',3},{'4',4},{'5',5},{'6',6},{'7',7},{'8',8},{'9',9},{'A',10},{'B',11},{'C',12},{'D',13},{'E',14},{'F',15}};

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
    string s = yytext;
    string res = "";
    int n = yyleng;

    for(int i=0;i<n;i++)
    {
        if(s[i] == '\"') // For first and last "
            continue;
        if(s[i] == '\\') // For escape sequences
        {
            i++;
            if(i >= n-1) // String is not long enough
            {
                cout << "Error unclosed string" << endl;
                exit(0);
            }
            switch (s[i])
            {
                case 'n': // \n case
                    res += 0x0a;
                    break;
                case 'r': // \r case
                    res += 0x0d;
                    break;
                case 't': // \t case
                    res += 0x09;
                    break;
                case '\\': // \\ case
                    res += 0x5c;
                    break;
                case '"': // \" case
                    res += 0x22;
                    break;
                case 'x': // \xdd case
                {
                    if(i+1 >= n-1) // \xdd at the end but the string is not long enough
                    {
                        cout << "Error unclosed string" << endl;
                        exit(0);
                    }
                    else if(i+2 >= n-1)
                    {
                        string error{'x',s[i+1]};
                        cout << "Error undefined escape sequence " + error << endl;
                        exit(0);
                    }
                    if(m.find(s[i+1]) == m.end() || m.find(s[i+2]) == m.end()) // the chars are not valid
                    {
                        string error{'x',s[i+1],s[i+2]};
                        cout << "Error undefined escape sequence " << error << endl;
                        exit(0);
                    }
                    int num = (m[s[i+1]])*16 + m[s[i+2]];
                    i+=2;
                    res += (char)num;
                    break;
                }
                default: // Escape sequences error
                {
                    string error{s[i]};
                    cout << "Error undefined escape sequence " + error << endl;
                    exit(0);
                    break;
                }
            }
        }
        else
            res += s[i];
    }
    cout << to_string(yylineno) + " STRING " + res << endl;
}

/*
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
*/