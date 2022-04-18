
type token =
    LETTER of string 
  | DINSY
  | DSTSY
  | DSTAT
  | DINST
  | DINSS
  | PARG
  | PARD
  | VIRG
  | EOF


let to_string = function
    LETTER i -> i^" "
  | DINSY -> "input symobls : "
  | DSTSY -> "\nstack symobls : "
  | DSTAT -> "\nstates : "
  | DINST -> "\ninitial state: "
  | DINSS -> "\nintial stack symbol: "
  | PARG -> "("
  | PARD -> ")"
  | VIRG -> ","
  | EOF -> "EOF"
              
