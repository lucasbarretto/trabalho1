# Macros para compilacao
CC = gcc
CFLAGS = -Wextra -lfl
DIR = src
FILENAME = $(DIR)/main.c
YYTABH = $(DIR)/y.tab.h
YYTABC = $(DIR)/y.tab.c
LEXOUT = $(DIR)/lex.yy.c
YACCFILE = $(DIR)/main.y
LEXFILE = $(DIR)/main.l
TARGET = ./main
YACC = bison
LEX = flex

all:$(TARGET)

$(TARGET):$(LEXOUT) $(YYTABC)
	$(CC) -o$(TARGET) $(LEXOUT) $(YYTABC) $(CFLAGS)

$(LEXOUT):$(LEXFILE) $(YYTABC)
	$(LEX) -o$(LEXOUT) $(LEXFILE)

$(YYTABC):$(YACCFILE)
	$(YACC) -o$(YYTABC) -dy $(YACCFILE)

