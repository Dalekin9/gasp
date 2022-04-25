%{ open Syntaxe %}

%token <string> LETTER
%token DINSY DSTSY
   DSTAT
   DINST
   DINSS
   TRANS
   PARG
   PARD
   VIRG
   PVIRG
   EOF
%start <Syntaxe.automate> automate

%%


automate : decla=declarations trans=transitions { (decla, trans) }

declarations : a=inputsymbols b=stacksymbols c=states d=initialstate e=initialstack
  { Declarations(a,b,c,d,e) }

inputsymbols : DINSY a=suitelettresnonvide { Inputsymbols(a) }

stacksymbols : DSTSY b=suitelettresnonvide { Stacksymbols(b) }

states : DSTAT c=suitelettresnonvide { States(c) }

initialstate : DSTSY b=letter { Initialstate(b) }

initialstack : DSTSY b=letter { Initialstack(b) }

suitelettresnonvide :
  | a=LETTER {LETTER(a)}
  | a=letter VIRG b=suitelettresnonvide { (SuiteLettresNonVides(a, b)) }

transitions : TRANS a=translist { Transitions(a) }

translist : 
  | a=transition b=translist { Translist(a,b) }
  | { Epsilon }

transition : PARG a=letter VIRG b=lettreouvide VIRG c=letter VIRG d=letter VIRG e=stack PARD
  { Transition(a,b,c,d,e) }

lettreouvide : 
  | a=LETTER {LETTER(a)}
  | { Epsilon }

stack :
  | a=nonemptystack { Stack(a)}
  | { Epsilon }

nonemptystack :
  | a=LETTER { LETTER(a) }
  | a=letter PVIRG b=nonemptystack { NonEmptyStack(a,b)}

letter : a=LETTER {LETTER(a)}
