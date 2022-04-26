open Syntaxe

type config = int * string list * string list

(* nos variables *)
let inputsymbols = ref []
let stacksymbols = ref []
let states = ref []
let initialstate = ref ""
let initialstack = ref []
let trans = ref [] 
let configs = ref []

(*affiche letat actuel sur le terminal*)
let rec print_config l =
  match l with
  | (x,y,z)::a -> 
    print_string ("( "^", "^", "^")\n");
    print_config a
  | _ -> print_string "Fin.\n"

(*retourne une transition possible, ou rien*)
let get_transition etat stack lettre =
  (*
  retourne some transition si exist
  sinon none   
  *)
  


(*fonction principale*)
let interprete = 
  let s = "vree" in
  let mot = List.init (String.length s) (String.get s) in
  let rec action mot =
    (*
    si stack non vide
      recuperer la 1ere lettre du mot
      si vide et que stack vide
        print config
      sinon erreur
        recuperer une transition possible
        si transition  
          creer config puis add a la liste
        sinon
          erreur
    sinon
      erreur
    *)


(**  
Initialisation des variables
**)

(*initialise l'intial stack*)
let setinitialstack a =
  match a with 
  | Initialstack(x) -> initialstack := x::[]


(*initialise l'intial state*)
let setinitialstate a =
  match a with 
  | Initialstate(x) -> initialstate := x


(*initialise les states*)
let setstates a =
  match a with 
  | States(x) -> states := x


(*initialise les stacks symbols*)
let setstacksymbols a =
  match a with 
  | Stacksymbols(x) -> stacksymbols := x


(* initialise les input symbols*)
let setinputsymbols a =
  match a with 
  | Inputsymbols(x) -> inputsymbols := x


(*fonction pour les declarations*)
let declarations dcl = 
  match dcl with
  | Declarations(a,b,c,d,e) -> 
    setinputsymbols a;
    setstacksymbols b;
    setstates c;
    setinitialstate d;
    setinitialstack e;
  

(*initialise les transitions*)
let transitions trs =
  match trs with
  | Transitions(t) -> 
    trans := t
  


(*fonction principal d'appel*)
let autom (dcl,trs) = 
  declarations dcl
  transitions trs
  interprete