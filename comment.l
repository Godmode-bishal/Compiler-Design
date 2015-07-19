%{
#include <stdio.h>
#include <stdlib.h>
int cno = 0; /*comment counts */
%}
cstart "/*"
cend "*/"
character [a-zA-Z]
digit [0-9]
symbols [^a-zA-Z0-9"*/"\n]
line \n
word1 ({character}|{digit}|{symbols}|{line})+
word2 ({character}|{digit}|{symbols})+
comment1 ({cstart}{word1}{cend})
c1start \/\/
comment2 ({c1start}{word2})
%%
{comment1} {cno++; }
{comment2} {cno++;}
. { ECHO; }
%%
int main(void)
{
    yylex();
    printf("Number of comments: %d\n", cno);
    return 0;
}+6
