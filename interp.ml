open Syntaxe

(*affiche letat actuel sur le terminal*)
let rec print_config l =
  match l with
  | [] -> print_string "Fin.\n"
  | (x,y,z)::a -> 
    print_string ("( "^", "^", "^")\n");
    print_config a

(*retourne une transition possible, ou rien*)
let rec get_transition etat stack lettre transis =
  match transis with
  | [] -> None
  | (a,b,c,d,e)::l ->
    if (a = etat) then (
      if (b = lettre) then (
        if (c = stack) then
          Some(a,b,c,d,e)
        else 
          get_transition etat stack lettre l  
      ) else get_transition etat stack lettre l  
    ) else
      get_transition etat stack lettre l  

let rec print_liste l =
  match l with
  | [] -> print_string "\n"
  | a::b -> print_string (a^" ") ; print_liste b

(*fonction principale*)
let interprete st stk tr1 mt = 

  let rec action m state stack trans configs = 
    if (List.length stack != 0) then 
      (
        if List.length m = 0 then
          print_string "Mot vide mais pile non vide.\n"
        else 
          (
            let letter = List.hd m in
            let pile = List.hd stack in
            let tr = get_transition state pile letter trans in
            match tr with
            | None -> (print_string "Pas de transition applicable.\nListe stack : \n";print_liste stack )
            | Some (a,b,c,d,e) -> 
              (
                let mm = List.tl m in
                let stck = List.append e (List.tl stack) in
                action mm d stck trans ( (d,stck,mm)::configs )
              )
          )
      )
    else
      (
        if List.length m = 0 then
          print_config (List.rev configs)
        else 
          print_string "Pile vide mais mot non vide.\n"
      ) 
  in

  let mot = List.map (fun x -> Char.escaped x) (List.init (String.length mt) (String.get mt)) in
  let debconf = (st,stk,mot)::[] in
  action mot st stk tr1 debconf


(* retourne la pile*)
let getStck x =
  match x with
  | Stack(Nonemptystack(a)) -> a
  | Epsilon -> ""::[]

(* retourne une lettre ou rien *)
let getLetterOuVide x =
  match x with
  | LETTER(a) -> a
  | Epsilon -> " "

(* retoune la liste des transitions *)
let rec getTransitions l trans =
  match l with
  | [] -> trans
  | Transition(a,b,c,d,e)::x -> (
    let st = getStck e in
    let b2 = getLetterOuVide b in
    getTransitions x ((a,b2,c,d,st)::trans) )

(* retourne la pile initiale *)
let getStack a = 
  match a with 
  | Initialstack(x) -> x

(* retourne l'etat initial *)
let getState a = 
  match a with 
  | Initialstate(x) -> x


(*fonction principal d'appel*)
let autom (dcl,trs) mot = 
  print_string mot;
  match dcl with
  | Declarations(a,b,c,d,e) -> 
    match trs with 
    | Transitions(t) -> 
      let stck = getStack e in
      let ste = getState d in
      let tr = getTransitions t [] in
    interprete ste (stck::[]) tr mot