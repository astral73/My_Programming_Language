%{
#include <stdio.h>
int yyval;
extern int lineCounter;
%}

variable [a-z_]+
function_name [A-Z][a-z]+
float [+-]?[0-9]*(\.)[0-9]+
integer [+-]?[0-9]+
newline [\n]
comment !!.*
char [\'][a-zA-Z][\']


%%
"BEGIN" {return TOKENBEGIN;}
"END" {return TOKENEND;}
"print" return(PRINT);
"ask" return(ASK);
"int" return(INT_TYPE);
"float" return(FLOAT_TYPE);
"string" return(STRING_TYPE);
"void" return(VOID_TYPE);
"const" return(CONST_TYPE);
"char" return(CHAR);
"+" return(PLUS);
"-" return(MINUS);
"*" return(ASTERISK);
"/" return(SLASH);
"%" return(MOD);
"if" return(IF);
"else" return(ELSE);
"while" return(WHILE);
"for" return(FOR);       
"," return(COMMA);
"(" return(LEFT_P);
")" return(RIGHT_P);
"{" return(SCOPE_START);
"}" return(SCOPE_END);
"||" return(OR);
"==" return(EQUAL);
"?=" return(IS_EQUAL);
"!=" return(IS_NOT_EQUAL);
"<=" return(LESS_OR_EQ);
">=" return(GREATER_OR_EQ);
"<" return(LESS_THAN);
">" return(GREATER_THAN);
"&&" return(AND);
":"  return(COLON);
! return(NOT);
"return" return(RETURN);
{integer} return(INTEGER);
{float} return(FLOAT);
{comment} return(COMMENT);
{variable} return(VARIABLE);
{function_name} return(FUNCTION_NAME);
{newline} {lineCounter++;}
[A-Z_]+ return(CONST);
\; return(SEMICOLON);
[ \r\t]+ ;
. return(INVALID);
%%

int yywrap() { return 1; }
