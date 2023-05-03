%{
int licznik=1;
%}
linia .*\n
%%
{linia} {printf("%d| %s",licznik++, yytext);} /*wypisanie w formacie: nr_linii| tresc */

%%
int yywrap(){}
int main(){
yylex();
return 0;
}