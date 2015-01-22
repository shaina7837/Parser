%{
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

extern "C" int yylex();
extern "C" int yyparse (void);
extern "C" FILE *yyin;

void yyerror(const char *s1);
#define YYDEBUG 1
%}

%union{
	char *c;
}

%token <c> YY
%token <c> ZZ
%token sc
%%

slist: slist stmt sc { cout<<"slist"<<endl;}
	| stmt sc { cout<<"stmt"<<endl;}	
	| error stmt sc { cout<<"Error";}
	;

stmt: ZZ stmt
	| ZZ
	;

%%

int main (int argc, char **argv)
{
	FILE* myfile = fopen("sample.txt", "r");
	
	yyin = myfile;
	yyparse();
}

void yyerror(const char *s1)
{
	extern int yylineno;
	cout << "ERROR: line number"<<yylineno << s1<<endl;

	exit(-1);
}
