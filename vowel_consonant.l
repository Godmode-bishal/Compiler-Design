%{
    #include<stdio.h>
    int vowel=0;
    int consonant=0;
%}
%%
[aeiouAEIOU]    {vowel++;}
\n    {}
[^ aeiouAEIOU]   {consonant++;}
%%
main()
{
    printf("Enter the string\n");
    yylex();
    printf("Vowel=%d and Consonants=%d",vowel,consonant);
}
