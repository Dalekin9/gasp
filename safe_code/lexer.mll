{
open Parser
}

let automate = declarations[" "]transitions
let declarations = inputsymbols[" "]stacksymbols[" "]states[" "]initialstate[" "]initialstack
let inputsymbols = ["input symbols: "]suitelettres-nonvide
let stacksymbols = ["stack symbols: "]suitelettres-nonvide
let states = ["states: "]suitelettres-nonvide
let initialstate = ["initial state: "] lettre
let initialstack = ["initial stack symbol: "] lettre
let suitelettres-nonvide = lettre([" , "]suitelettres-nonvide)?
let transitions = ["transitions: "]translist
let translist = (transition[ ]translist)?
let transition = ["( "]lettre[" , "]lettre-ou-vide[" , "]lettre[" , "]lettre[" , "]stack[" )"]
let lettre-ou-vide = (lettre)?
let stack = (nonemptystack)?
let nonemptystack = lettre([" ; "]nonemptystack)?
let lettre = ['0'-'9''a'-'z''A'-'Z']

rule main = parse
  | layout		{ main lexbuf }
  | ')'			{ RPAREN }
  | '('			{ LPAREN }
  | "\\/"		{ OR }
  | "/\\"		{ AND }
  | "="     { EQUAL }
  | "let"   { LET }
  | "in"    { IN }
  | "false"		{ FALSE }
  | "true"		{ TRUE }
  | ident_char+		{ ID (Lexing.lexeme lexbuf) }
  | eof			{ EOF }
  | _			{ failwith "unexpected character" }
