%token <string> LETTER
%token DINSY DSTSY DSTAT DINST DINSS TRANS PARG PARD VIRG PVIRG EOF
%start <Syntaxe.automate> automate
%{ open Syntaxe %}
%%


automate : decla=declarations { (decla) }

declarations : a=inputsymbols b=stacksymbols c=states d=initialstate
  { Declarations(a, b, c, d) }

inputsymbols : DINSY a=suitelettresnonvide { Inputsymbols(Suitelettrenonvide(a)) }

stacksymbols : DSTSY b=suitelettresnonvide { Stacksymbols(Suitelettrenonvide(b)) }

states : DSTAT c=suitelettresnonvide { States(Suitelettrenonvide(c)) }

initialstate : DINST b=letter { Initialstate(b) }

initialstack : DINSS b=letter { Initialstack(b) }

suitelettresnonvide :
  | a=letter { a::[] }
  | a=letter VIRG b=suitelettresnonvide { (a::b) }

transitions : TRANS a=translist { Transitions(Translist(a)) }

translist : 
  | a=transition b=translist { (a::b) }
  | { [] }

transition : PARG a=letter VIRG b=lettreouvide VIRG c=letter VIRG d=letter VIRG e=stack PARD
  { Transition(a,b,c,d,e) }

lettreouvide : 
  | a=letter {(a)}
  | { Epsilon }

stack :
  | a=nonemptystack { Stack(Nonemptystack(a))}
  | { Epsilon }

nonemptystack :
  | a=letter { (a) }
  | a=letter PVIRG b=nonemptystack { (a::b)}
  
letter : a=LETTER {LETTER(a)}