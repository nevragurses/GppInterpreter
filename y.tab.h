/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IntegerValue = 258,
    Id = 259,
    OP_DBLQUOTE = 260,
    KW_AND = 261,
    KW_OR = 262,
    KW_NOT = 263,
    KW_EQUAL = 264,
    KW_LESS = 265,
    KW_NIL = 266,
    KW_APPEND = 267,
    KW_CONCAT = 268,
    KW_SET = 269,
    KW_DEFFUN = 270,
    KW_OPLIST = 271,
    KW_DOUBLEMULT = 272,
    KW_FOR = 273,
    KW_WHILE = 274,
    KW_DEFVAR = 275,
    KW_IF = 276,
    KW_EXIT = 277,
    KW_LOAD = 278,
    KW_DISP = 279,
    KW_TRUE = 280,
    KW_FALSE = 281,
    KW_LIST = 282,
    COMMENT = 283
  };
#endif
/* Tokens.  */
#define IntegerValue 258
#define Id 259
#define OP_DBLQUOTE 260
#define KW_AND 261
#define KW_OR 262
#define KW_NOT 263
#define KW_EQUAL 264
#define KW_LESS 265
#define KW_NIL 266
#define KW_APPEND 267
#define KW_CONCAT 268
#define KW_SET 269
#define KW_DEFFUN 270
#define KW_OPLIST 271
#define KW_DOUBLEMULT 272
#define KW_FOR 273
#define KW_WHILE 274
#define KW_DEFVAR 275
#define KW_IF 276
#define KW_EXIT 277
#define KW_LOAD 278
#define KW_DISP 279
#define KW_TRUE 280
#define KW_FALSE 281
#define KW_LIST 282
#define COMMENT 283

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
