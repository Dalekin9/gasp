
type token =
    LETTER of string 
  | DINSY
  | DSTSY
  | DSTAT
  | DINST
  | DINSS
  | TRANS
  | PARG
  | PARD
  | VIRG
  | PVIRG
  | EOF


let to_string = function
    LETTER i -> i
  | DINSY -> "input symobls : "
  | DSTSY -> "\nstack symobls : "
  | DSTAT -> "\nstates : "
  | DINST -> "\ninitial state: "
  | DINSS -> "\nintial stack symbol: "
  | TRANS -> "\n\ntransitions: \n"
  | PARG -> "("
  | PARD -> ")\n"
  | VIRG -> ", "
  | PVIRG -> "; "
  | EOF -> "EOF"
              
