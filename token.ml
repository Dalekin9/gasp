
type token =
    CHAR of string 
  | DINSY
  | PARG
  | PARD
  | VIRG
  | EOF


let to_string = function
    CHAR i -> i^" "
  | DINSY -> "input symobls : "
  | PARG -> "("
  | PARD -> ")"
  | VIRG -> ","
  | EOF -> "EOF"
              
