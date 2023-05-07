%{
#include <iostream>
using namespace std;
#include <math.h>
%}
LETTER [A-Za-z]  
ID  {LETTER}*
EQ  =
DIGIT [0-9]
NUMBER {DIGIT}*
SPACE [ ]
TYPE int|float|string
%s  INSIDE_COMMENT
%s  INSIDE_ONE_LINE_COMMENT
COMMAND {TYPE}{SPACE}+{ID}{SPACE}*{EQ}{SPACE}*{NUMBER}{SPACE}*;

%%


int+{SPACE}+{ID}{SPACE}*{EQ}{SPACE}*{NUMBER}{SPACE}*; {cout<<"DEKLARACJA_INT"<<endl;}
string+{SPACE}+{ID}{SPACE}*{EQ}{SPACE}*\".*\"; {cout<<"DEKLARACJA_STRING"<<endl;}
float+{SPACE}+{ID}{SPACE}*{EQ}{SPACE}*{DIGIT}+"."{DIGIT}*{SPACE}*; {cout<<"DEKLARACJA_FLOAT"<<endl;}
"+"|"-"|"*"|"/"   printf( "Operator: %s\n", yytext );
\/\*      {cout<< "Początek komentarza "<<yytext <<endl; BEGIN(INSIDE_COMMENT);}
\*\/      {cout<< "Koniec komentarza "<<yytext <<endl; BEGIN(INITIAL);}
<INSIDE_COMMENT>{COMMAND} {cout<< "UWAGA instrukcja "<< yytext << " w komentarzu, potencjalny błąd czystego kodu"<<endl;}
<INSIDE_ONE_LINE_COMMENT>{COMMAND} {cout<< "UWAGA instrukcja "<< yytext << " w komentarzu, potencjalny błąd czystego kodu"<<endl;}
\/\/      {cout<< "Początek komentarza "<<yytext <<endl; BEGIN(INSIDE_ONE_LINE_COMMENT);}
<INSIDE_ONE_LINE_COMMENT>\n   {cout<< "Koniec komentarza w linii"<<yytext <<endl; BEGIN(INITIAL);}
if\({SPACE}[^)]*\)\{{SPACE}+[^}]+\}else\{{SPACE}+[^}]+\}  {cout<<"Pełny warunek IF ... ELSE"<<endl;}
if\({SPACE}[^)]*\)\{{SPACE}+[^}]+\}   { cout << "Znaleziono poprawny warunek IF" << endl; }
if   {cout<<"Błąd IF"<<endl;}
else\{{SPACE}+[^}]+\}   { cout << "Znaleziono warunek ELSE" << endl; }
while+\({SPACE}[^)]*\)\{{SPACE}+[^}]+\}   { cout << "Znaleziono poprawną pętlę while" << endl; }
while   { cout << "Błąd WHILE" << endl; }

%%

int yywrap(void){}

int main()
{
	yylex();
	return 0;
}