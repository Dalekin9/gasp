all :
	ocamllex lexer2.mll
	ocamlc token.ml
	ocamlc lexer2.ml
	ocamlc -o main lexer2.cmo token.cmo main.ml

clean:
	rm -fr a.out main parser.mli parser.ml lexer2.ml *.cmo parser *.cmi *~ *.automaton *.conflicts