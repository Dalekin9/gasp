let lexbuf = Lexing.from_channel stdin 

let ast = Parser.automate Lexer.lexeur lexbuf 