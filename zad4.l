%{
%}
%%
[a-zA-Z0-9][.,][ ] {printf("%s",yytext);} /*jesli jest spacja to juz jej nie dodawaj*/
[a-zA-Z0-9][.,] {printf("%s ",yytext);} /*dodaj spacje po znaku jesli jest przecinek lub kropka*/
[.,] {printf("%s ",yytext);} /*jesli sam znak przestankowy, dodaj spacje*/

%%
int yywrap(){}
int main(){
yylex();
return 0;
}