%{
    unsigned charCount=0,lineCount=0,wordCount=0;
%}
word [^ \t\n]+
eol \n
%%
. {charCount++;}
{word} {charCount+=yyleng;wordCount++;}
{eol}  {lineCount++;charCount++;}
%%
main()
{
    yylex();
    printf("Linecount=%d Wordcount=%d Charactercount=%d\n",lineCount,wordCount,charCount);
}

