(*print les tokens dans le terminal*)
let print_token x =
  print_string (Token.to_string x);;


let rec verif_transition (liste:Token.token list) =
  match liste with
  | PARG::LETTER(a)::VIRG::VIRG::LETTER(c)::VIRG::LETTER(d)::VIRG::PARD::l ->
      verif_transition l
  | PARG::LETTER(a)::VIRG::LETTER(b)::VIRG::LETTER(c)::VIRG::LETTER(d)::VIRG::PARD::l ->
    verif_transition l
  | PARG::LETTER(a)::VIRG::LETTER(b)::VIRG::LETTER(c)::VIRG::LETTER(d)::VIRG::LETTER(e)::PVIRG::LETTER(f)::PARD::l ->
    verif_transition l
  | PARG::LETTER(a)::VIRG::LETTER(b)::VIRG::LETTER(c)::VIRG::LETTER(d)::VIRG::LETTER(e)::PARD::l ->
    verif_transition l
  | EOF::[] -> print_string "Fichier correct.\n"
  | [] -> print_string "Fichier correct.\n"
  | _ -> failwith "une transition est incorrecte.\n"



let verif_init_stack (liste:Token.token list) =
  match liste with 
  | DINSS::LETTER(a)::TRANS::l -> verif_transition l
  | _ -> failwith "erreur dans l'initial stack'.\n";;

let verif_init_state (liste:Token.token list) =
  match liste with 
  | DINST::LETTER(a)::DINSS::l -> verif_init_stack (DINSS::l)
  | _ -> failwith "erreur dans l'initial state'.\n";;

let rec verif_states (liste:Token.token list) =
  match liste with 
  | LETTER(a)::DINST::l -> verif_init_state (DINST::l)
  | LETTER(a)::VIRG::l -> verif_states l
  | _ -> failwith "erreur dans les states symbols.\n";;

let rec verif_stack_symbols (liste:Token.token list) =
  match liste with 
  | LETTER(x)::DSTAT::LETTER(a)::l -> verif_states (LETTER(a)::l)
  | LETTER(a)::VIRG::l -> verif_stack_symbols l
  | DSTSY::l -> print_string "1"
  | DSTAT::l -> print_string "2"
  | DINST::l -> print_string "3"
  | DINSS::l -> print_string "4"
  | TRANS::l -> print_string "5"
  | PARG::l -> print_string "6"
  | PARD::l -> print_string "7"
  | VIRG::l -> print_string "8"
  | PVIRG::l -> print_string "9"
  | _ -> failwith "erreur dans les stack symbols.\n";;

let rec verif_input_symbols (liste:Token.token list) =
  match liste with 
  | LETTER(a)::DSTSY::LETTER(b)::l -> verif_stack_symbols (LETTER(b)::l)
  | LETTER(a)::VIRG::l -> (verif_input_symbols l)
  | _ -> failwith "erreur dans les input symbols.\n";;

let analyse_syntaxique (liste:Token.token list) = 
  match liste with
  | DINSY::LETTER(a)::l -> verif_input_symbols (LETTER(a)::l)
  | _ -> failwith "pas d'input symbols.\n";;

let liste = ref [] in
let ch = open_in (Sys.argv.(1)) in

  let lexbuf = Lexing.from_channel ch in
  let rec f (t:Token.token ) =
    match t with
    | EOF -> 
      List.iter print_token (List.rev !liste) ;
      analyse_syntaxique (List.rev !liste)
    | _ -> (liste := t::(!liste) ) ; f (Lexer2.lexeur lexbuf)
  in 
  f (Lexer2.lexeur lexbuf);;


