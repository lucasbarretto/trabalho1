%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void yyerror(char *c);
int yylex(void);
%}

%token INT SUM MUL POW DIV '(' ')' EOL //tokens terminais

//considerar as precedencias de operacoes
%left SUM
%left MUL DIV
%right POW

%%

S:
  S E EOL { printf("POP A\n"); }
  |
  ;

E:
  INT { $$ = $1; printf("PUSH %d\n", $1); }
  | E SUM E { $$ = $1+$3; printf("POP B\nPOP A\nADD A,B\nPUSH A\n"); }	//operacao de soma
  | E MUL E { $$ = $1*$3; printf("POP B\nPOP A\nMUL B\nPUSH A\n"); }	//operacao de multiplicacao
  | E DIV E { $$ = $1/$3; printf("POP B\nPOP A\nDIV B\nPUSH A\n"); }	//operacao de divisao
  | E POW E { $$ = pow($1,$3); printf("POP C\nPOP B\nMOV A,1\n"); int i; for(i=0; i < $3; i++){ printf("MUL B\n"); } printf("PUSH A\n"); }	//operacao de exponenciacao
  | '(' E ')' { $$ = $2; }	//considerar os parenteses em operacoes
  ;

%%

void yyerror(char *s) {
  printf("token invalido \n");
}

int main() {
  yyparse();
  return 0;
}
