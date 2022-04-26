let print_position outx lexbuf =
  Lexing.(
    let pos = lexbuf.lex_curr_p in
    Printf.fprintf outx "Ligne %d Col %d"
      pos.pos_lnum
      (pos.pos_cnum - pos.pos_bol + 1)
  )

let _ =
  let ch = open_in (Sys.argv.(1)) in
  let lexbuf = Lexing.from_channel ch in
  try
    Parser.automate Lexer.lexeur lexbuf 
  with
    | Parser.Error ->
    Printf.fprintf stderr "%a: Syntax error\n" print_position lexbuf;
    exit (-1)