%{
open Ast
%}

%token OR AND EQUAL LET IN LPAREN RPAREN TRUE FALSE EOF
%token<string> ID 

%start<Ast.expression> input
%right OR AND
%left IN EQUAL

%%

  
input: c=expression EOF { c }

expression:
x=ID  { Var x }
| l=expression OR r=expression { Or (l, r) }
| l=expression AND r=expression { And (l, r) }
| TRUE { True}
| FALSE { False }
| LPAREN c=expression RPAREN { c }
| LET x=expression EQUAL l=expression IN r=expression { Let(x, l, r)}
