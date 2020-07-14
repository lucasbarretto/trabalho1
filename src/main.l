%{
#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *);
%}

%%

[0-9]+ { yylval = atoi(yytext); return INT; }

\n { return EOL; }

[+] { return SUM; }

[*] { return MUL; }

[\/] { return DIV; }

(\^) { return POW; }

\( { return '('; }

\) { return ')'; }

[[:space:]]+ ;

. ;

%%

int yywrap() {
  return 1;
}
