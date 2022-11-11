
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

map<char,int> m = {{'0',0},{'1',1},{'2',2},{'3',3},{'4',4},{'5',5},{'6',6},{'7',7},{'8',8},{'9',9},{'A',10},{'B',11},{'C',12},{'D',13},{'E',14},{'F',15},{'a',10},{'b',11},{'c',13},{'e',14},{'f',15}};

int main(){
    int token;
    token = yylex();
    while(token) {

        token = yylex();
    }
    return 0;
}

void parseString(char* str,int len)
{
    string s = str;
    string res = "";
    int n = len;

    for(int i=0;i<n;i++)
    {
        if(s[i] == '\\') // For escape sequences
        {
            i++;
            if(i >= n) // String is not long enough
            {
                cout << "Error unclosed string" << endl;
                exit(0);
            }
            switch (s[i])
            {
                case 'n': // \n case
                    res += '\n';
                    break;
                case 'r': // \r case
                    res += '\r';
                    break;
                case 't': // \t case
                    res += '\t';
                    break;
                case '\\': // \\ case
                    res += '\\';
                    break;
                case '"': // \" case
                    res += '\"';
                    break;
                case '0': // \0 case
                    cout << to_string(yylineno) + " STRING " + res << endl;
                    return;
                    break;
                case 'x': // \xdd case
                {
                    if(i+1 >= n) // \xdd at the end but the string is not long enough
                    {
                        cout << "Error undefined escape sequence x" << endl;
                        exit(0);
                    }
                    else if(i+2 >= n)
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
                    if(num < 0 || num >127) // if the hex value is not valid
                    {
                        string error{'x',s[i+1],s[i+2]};
                        cout << "Error undefined escape sequence " << error << endl;
                        exit(0);
                    }
                    if(num == 0) // if the hex is 0 (\0)
                    {
                        cout << to_string(yylineno) + " STRING " + res << endl;
                        return;
                    }
                    i+=2;
                    res += num;
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
