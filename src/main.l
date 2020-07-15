%{
#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *);
%}

%%

[0-9]+ { yylval = atoi(yytext); return INT; }	//identificar inteiros

\n { return EOL; }	//identificar fim de linha

[+] { return SUM; }	//identificar soma
	
[*] { return MUL; }	//identificar multiplicacao	

[\/] { return DIV; }	//identificar divisao

(\^) { return POW; }	//identificar exponenciacao
	
\( { return '('; }	//identificar parenteses aberto

\) { return ')'; }	//identificar parenteses fechado

[ \t]+ ;

. ;
%%

int yywrap() {
  return 1;
}
