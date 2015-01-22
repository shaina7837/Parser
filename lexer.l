%{
#include <iostream>
#include <string>
using namespace std;

#define YY_DECL extern "C" int yylex()
#include "parser.tab.h"

%}
%option yylineno

%%
[ \t\n]		;

YY	{ return YY; }

ZZ 	{ return ZZ; }

[;]	{ return sc; }
. ;
