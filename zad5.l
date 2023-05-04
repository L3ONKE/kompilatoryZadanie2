%{
#include<stdio.h>
#include<string.h>
#include <map>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;
map<string, int> w_map;
typedef pair<string, int> para;
void word_count(string text);
%}


LETTER [a-zA-ZąćęłńóśżźĄĆĘŃÓŁŚŻŹ]
WORD  {LETTER}{3,}+


%%
{WORD} {string word1(yytext); word_count(word1);}
%%
int yywrap(){}
void word_count(string text){
    if(w_map.find(text) != w_map.end()){
        w_map[text]++;
     }
     else{
        w_map[text]=1;
     }

}


int main()
{
	yylex();
	vector<para> vec;
	copy(w_map.begin(), w_map.end(), back_inserter<vector<para>>(vec));
	sort(vec.begin(), vec.end(),[](const para &l, const para &r){ /*sortowanie wynikow, tak zeby pierwsze byly te najczesciej wystepujace */
                if (l.second != r.second) {
                    return l.second > r.second;
                }

                return l.first > r.first;
            });
            pair first=vec[0]; /*Dodanie wynikow do doatkowej struktury para, aby moc wyprowadzic na ekran*/
	cout<<"Najczesciej wystepujace słowo w tekscie to: "<<first.first<<" owe slowo wystepuje "<<first.second<<" razy"<<endl;
	return 0;
}