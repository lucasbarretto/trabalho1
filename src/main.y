%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *c);
int yylex(void);
int i=0;

%}

%token INT SUM MUL POW DIV '(' ')' EOL //tokens terminais

//considerar as precedencias de operacoes
%left SUM
%left MUL DIV
%right POW

%%

S:
  S E EOL { printf("POP A\n"); i=0;}
  |
  ;

E:
  INT { printf("PUSH %d\n", $1); } // coloca os inteiros na pilha
  | E SUM E { printf("POP B\nPOP A\nADD A,B\nPUSH A\n"); }	//operacao de soma
  | E MUL E { printf("POP B\nPOP A\nMUL B\nPUSH A\n"); }	//operacao de multiplicacao
  | E DIV E { printf("POP B\nPOP A\nDIV B\nPUSH A\n"); }	//operacao de divisao
  | E POW E { printf("POP C\nPOP B\nMOV A,1\nCMP C,0\nJZ .end%d\n.loop%d:\n\tMUL B\n\tDEC C\n\tJNZ .loop%d\n.end%d:\nPUSH A\n",i,i,i,i); i++; } //operacao de exponenciacao
  | '(' E ')' { }	//considerar os parenteses em operacoes
  ;

%%

void yyerror(char *s) {
  printf("token invalido \n");
}

int main() {
  yyparse();
  return 0;
}
