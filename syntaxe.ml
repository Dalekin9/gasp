type letter = LETTER of string

type nonemptystack = 
  | Nonemptystack of letter list

type stack = 
  | Stack of nonemptystack
  | Epsilon

type letterouvide =
  | LETTER of string
  | Epsilon

type transition = 
  | Transition of letter * letterouvide * letter * letter * stack

type translist = 
  | Translist of transition list

type transitions = Transitions of translist

type suitelettresnonvide = 
  | Suitelettrenonvide of letter list  

type initialstack = Initialstack of letter

type initialstate = Initialstate of letter

type states = States of suitelettresnonvide

type stacksymbols = Stacksymbols of suitelettresnonvide

type inputsymbols = Inputsymbols of suitelettresnonvide

type declarations = Declarations of inputsymbols * stacksymbols * states * initialstate * initialstack

type automate = declarations * transitions
              