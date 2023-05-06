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
TYPE int|double
SPACE [ ]
COMMAND {TYPE}{SPACE}+{ID}{SPACE}*{EQ}{SPACE}*{NUMBER}{SPACE}*;
%s  INSIDE_COMMENT
%s  INSIDE_ONE_LINE_COMMENT



%%
<INITIAL>{COMMAND} {cout<< "Wykryłem instrukcję "<<yytext <<endl;}
{DIGIT}+ { printf("Liczba calkowita: %s (%d)\n",yytext,atoi(yytext));}
{DIGIT}+"."{DIGIT}* { printf("Liczba zmiennoprzecinkowa: %s (%g)\n",yytext,atoi(yytext));}
if|then|begin|end|for|while {printf("Słowo kluczowe:: %s \n",yytext);}
"+"|"-"|"*"|"/"   printf( "Operator: %s\n", yytext );
\/\*      {cout<< "Początek komentarza "<<yytext <<endl; BEGIN(INSIDE_COMMENT);}
\*\/      {cout<< "Koniec komentarza "<<yytext <<endl; BEGIN(INITIAL);}
<INSIDE_COMMENT>{COMMAND} {cout<< "UWAGA instrukcja "<< yytext << " w komentarzu, potencjalny błąd czystego kodu"<<endl;}
<INSIDE_ONE_LINE_COMMENT>{COMMAND} {cout<< "UWAGA instrukcja "<< yytext << " w komentarzu, potencjalny błąd czystego kodu"<<endl;}
\/\/      {cout<< "Początek komentarza "<<yytext <<endl; BEGIN(INSIDE_ONE_LINE_COMMENT);}
<INSIDE_ONE_LINE_COMMENT>\n   {cout<< "Koniec komentarza w linii"<<yytext <<endl; BEGIN(INITIAL);}

%%

int yywrap(void){}

int main()
{
	yylex();
	return 0;
}