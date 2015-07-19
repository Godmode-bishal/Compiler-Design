%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
%}
%token NUM
%left '+''-'
%left '*''/'
%%
stmt:expr{printf("Result:%d\n",$1);return 0;}
;
expr:expr'+'expr{$$=$1+$3;}
|expr'-'expr {$$=$1-$3;}
|expr'*'expr {$$=$1*$3;}
|expr'/'expr
{
if($3==0)
{
printf("Divide by zero error\n");
exit(0);
}
else
$$=$1/$3;
}
|'('expr')' {$$=$2;}
|NUM {$$=$1;}
;
%%
int main()
{
printf("Enter the expression\n");
yyparse();
}
int yyerror()
{
printf("Invalid input\n");
exit(0);
}
