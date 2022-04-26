  open Interp
  
  let ch = open_in (Sys.argv.(1)) in
  let lexbuf = Lexing.from_channel ch in
  let ast = Parser.automate Lexer.lexeur lexbuf in 
  Interp.autom ast;;
  