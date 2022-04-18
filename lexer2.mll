{
  open Token
}

let lettre = ['0'-'9''a'-'z''A'-'Z']
let espace = [ ' ' '\t' '\n']

rule lexeur = parse
  | "input symbols:"    { DINSY }
  | espace            { lexeur lexbuf }
  | ","               { VIRG }
  | ')'			          { PARD }
  | '('			          { PARG }
  | lettre            { CHAR(Lexing.lexeme lexbuf) }
  | eof			{ EOF }
  