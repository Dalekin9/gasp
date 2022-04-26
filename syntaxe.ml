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

type transitions = Transitions of transition list

type initialstack = Initialstack of string

type initialstate = Initialstate of string

type states = States of string list

type stacksymbols = Stacksymbols of string list

type inputsymbols = Inputsymbols of string list

type declarations = Declarations of inputsymbols * stacksymbols * states * initialstate * initialstack

type automate = declarations * transitions
              