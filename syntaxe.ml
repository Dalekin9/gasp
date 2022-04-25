type letter = LETTER of string

type nonemptystack = 
  | LETTER of string
  | NonEmptyStack of letter * nonemptystack

type stack = 
  | Stack of nonemptystack
  | Epsilon

type letterouvide =
  | LETTER of string
  | Epsilon

type transition = 
  | Transition of letter * letterouvide * letter * letter * stack

type translist = 
  | Translist of transition * translist
  | Epsilon

type transitions = Transitions of translist

type suitelettrenonvide = 
  | LETTER of string
  | SuiteLettresNonVides of letter * suitelettrenonvide
  

type initialstack = Initialstack of letter

type initialstate = Initialstate of letter

type states = States of suitelettrenonvide

type stacksymbols = Stacksymbols of suitelettrenonvide

type inputsymbols = Inputsymbols of suitelettrenonvide

type declarations = Declarations of inputsymbols * stacksymbols * states * initialstate * initialstack

type automate = declarations * transitions
              