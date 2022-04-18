let ch = open_in (Sys.argv.(1)) in
let lexbuf = Lexing.from_channel ch in

let ast = Parser.input Lexer.main lexbuf 

let _ = Printf.printf "Parse:\n%s\n" (Ast.as_string ast)
