let print_tok x =
  print_string (Token.to_string x) in

let liste = ref [] in
let ch = open_in (Sys.argv.(1)) in
  let lexbuf = Lexing.from_channel ch in
  let rec f (t:Token.token ) =
    match t with
    | EOF -> 
      List.iter print_tok (List.rev !liste);
      print_newline()
    | _ -> (liste := t::(!liste) ) ; f (Lexer2.lexeur lexbuf)
    
  in 
  f (Lexer2.lexeur lexbuf);;
