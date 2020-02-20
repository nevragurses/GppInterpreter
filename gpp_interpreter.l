%{ 
/* Definition section */
#include<stdio.h> 
#include "y.tab.h" 

 
%} 

/* Rule Section */
%%
" "|"\t" { } 
"\n" {printf("%s\n",yytext); return 0; }
	 

"+" { return '+';}
"-" { return '-';}
"/" { return '/';}
"*" { return '*';}
"(" { return '(';}
"'(" { return KW_OPLIST;}
")" { return ')';} 
"**" {return KW_DOUBLEMULT;}
"\"" {return OP_DBLQUOTE;}
"and" { return KW_AND  ;}
"or" { return KW_OR ;}
"not" { return  KW_NOT ;}
"equal" { return KW_EQUAL ;} 
"less" { return KW_LESS ;}
"nil" { return KW_NIL ;}
"list" { return KW_LIST ;}
"append" {return KW_APPEND ;}
"concat" {return KW_CONCAT ;}
"set" { return KW_SET ;}
"deffun" { return KW_DEFFUN ;}
"for" { return KW_FOR; }
"while" { return KW_WHILE; }
"defvar" { return KW_DEFVAR; }
"if" { return KW_IF; }
"exit" { return KW_EXIT; }
"load" { return KW_LOAD; }
"disp" { return KW_DISP; }
"true" { return KW_TRUE; }
"false" { return KW_FALSE; }
 



[1-9][0-9]*|"0" {
    yylval=atoi(yytext); 
    return IntegerValue; 
}
[a-zA-Z_][a-z.A-Z0-9_]* { return Id; }

";;".* {return COMMENT;}





%% 

int yywrap() 
{ 
return 1; 
} 
