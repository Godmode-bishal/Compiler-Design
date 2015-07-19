%{
/*
* This sample demonstrates simple recognition of verb
*verb/not a verb
*/
%}
%%
[\t]+   /*ignores whitespaces*/;
void |
int |
auto |
double |
struct |
break |
else |
long |
switch |
case |
enum |
register |
typedef |
extern |
return |
union |
continue |
for |
signed |
do |
if |
static |
while |
default |
goto |
sizeof |
volatile |
const |
float |
short |
unsigned  {printf("Keyword %s\n", yytext) ;}
\( |
\{ |
\[  {printf("Opening parenthesis\n");}
\) |
\} |
\]  {printf("Closing parenthesis\n");}
\+ |
\- |
\* |
\/ |
\++ |
\-- |
\= |
\== |
\!= |
\% |
\> |
\< |
\>= |
\<= |
\&\& |
\|\| 
\| |
\& 
\^ |
\~ |
\<< |
\>> {printf("%s is an operator\n",yytext);}

\+ {printf("%s is plus sign\n",yytext);}
\- {printf("%s is minus sign\n",yytext);}
\* {printf("%s is multiplication sign\n",yytext);}
\/ {printf("%s is division sign\n",yytext);} 
\, {printf("%s is a comma\n",yytext);}
\; {printf("%s is a semi-comma\n",yytext);}
[+-]?[0-9]+[.]?[0-9]+  {printf("%s: Number\n",yytext);}
[a-zA-Z0-9]+  {printf("%s: Identifier\n",yytext);}
.|\n  {ECHO;/*normal default anyway*/}
%%
 main()
{
    yylex();
}

