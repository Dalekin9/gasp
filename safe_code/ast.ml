type expression =
  | Var of string
  | True
  | False
  | Or of expression * expression
  | And of expression * expression
  | Let of expression * expression * expression

let rec as_string = function
  | Var x -> x
  | True -> "true"
  | False -> "false"
  | Or (l, r) -> apply "\\/" l r
  | And (l, r) -> apply "/\\" l r
  | Let (x, l, r) -> build x l r

and apply op l r = 
  "(" ^ as_string l ^ ") " ^ op ^ " (" ^ as_string r ^ ")"

and build o l r = 
  "let " ^ as_string o ^ " = " ^ as_string l ^ " in " ^ as_string r
