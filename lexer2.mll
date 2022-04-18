{
  open Token
}

let lettre = ['0'-'9''a'-'z''A'-'Z']
let espace = [ ' ' '\t' '\n']

rule lexeur = parse
  | "input symbols:"    { DINSY }
  | "stack symbols:"    { DSTSY }
  | "states:"           { DSTAT }
  | "initial state:"    { DINST }
  | "intial stack symbol:"  { DINSS }
  | "transitions:"          { TRANS }
  | espace            { lexeur lexbuf }
  | ","               { VIRG }
  | ";"               { PVIRG }
  | ')'			          { PARD }
  | '('			          { PARG }
  | lettre            { LETTER(Lexing.lexeme lexbuf) }
  | eof			{ EOF }
  