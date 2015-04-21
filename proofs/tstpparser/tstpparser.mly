
%{
open Proof

let theoryToString thr = match thr with
  | FOF -> "fof"
  | CNF -> "cnf"
  | THF -> "thf"
  | TFF -> "tff"
  | TPI -> "tpi"

let proof_dag = DAG.create () ;;

%}

%token THF TFF FOF CNF TPI
%token AXIOM CONJECTURE NEG_CONJECTURE PLAIN
%token ER PM SPM EF APPLY_DEF INTRODUCED_DEF RW SR CSR AR CN 
       CONDENSE ASSUME_NEGATION FOF_NNF SHIFT_QUANTORS VARIABLE_RENAME
       SKOLEMIZE DISTRIBUTE SPLIT_CONJUNCT FOF_SIMPLIFICATION	
%token <string> ATOM
%token FILE INFERENCE STATUS
       OR NOT AND IMP FORALL EXISTS EQ NEQ FALSE TRUE
       LPAREN RPAREN COMMA DOT COLON LBRACKET RBRACKET
       FILEPATH
       THM CTH 
%token <string> WORD VAR
%token <int> INTEGER

%start proof /* the entry point */
%type <Proof.DAG.t> proof

%%

proof:
| theory LPAREN name COMMA role COMMA formula COMMA annotation RPAREN DOT {
  match $1 with
    | FOF | CNF -> 
      let name = $3 in
      let formula = $7 in
      let (inference, parents) = match $9 with
	| (AXIOM, []) -> if $5 = "axiom" then (AXIOM, [])
	  else if $5 = "conjecture" then (CONJECTURE, [])
	  else failwith ("Unexpected role: \'" ^ $5 ^ "\' for leaf.")
	| _ -> $9
      in
      print_string ("\nName: " ^ $3 ^ "\nRole: " ^ $5 ^ "\nFormula: " ^ $7 ^ "\nParents: " ^ List.fold_left (fun acc p -> p ^ ", " ^ acc) "" parents);
      DAG.insert proof_dag name formula inference parents;
      proof_dag
    | _ -> failwith ("Unsupported theory: " ^ (theoryToString $1))
}
/* The last inference seems to have one extra argument */
| theory LPAREN name COMMA role COMMA formula COMMA annotation COMMA LBRACKET WORD RBRACKET RPAREN DOT {
  match $1 with
    | FOF | CNF -> 
      let name = $3 in
      let formula = $7 in
      let (inference, parents) = match $9 with
	| (AXIOM, []) -> if $5 = "axiom" then (AXIOM, [])
	  else if $5 = "conjecture" then (CONJECTURE, [])
	  else failwith ("Unexpected role: \'" ^ $5 ^ "\' for leaf.")
	| _ -> $9
      in
      print_string ("\nLAST RULE\nName: " ^ $3 ^ "\nRole: " ^ $5 ^ "\nFormula: " ^ $7 ^ "\nParents: " ^ List.fold_left (fun acc p -> p ^ ", " ^ acc) "" parents);
      DAG.insert proof_dag name formula inference parents;
      proof_dag
    | _ -> failwith ("Unsupported theory: " ^ (theoryToString $1))
}

theory:
| FOF { FOF }
| CNF { CNF }
| THF { THF }
| TFF { TFF }
| TPI { TPI }

name:
| WORD	  { $1 }
| INTEGER { string_of_int $1 }

role:
| AXIOM		 { "axiom" }
| CONJECTURE	 { "conjecture" }
| NEG_CONJECTURE { "neg_conjecture" }
| PLAIN		 { "plain" }

/* TODO: print the formulas correctly */
formula:
| LPAREN formula RPAREN 			{ $2 }
| term EQ term		  			{ "p eq(" ^ $1 ^ ", " ^ $3 ^ ")" }
| term NEQ term		  			{ "n eq(" ^ $1 ^ ", " ^ $3 ^ ")" }
| atom						{ "p " ^ $1 }
| NOT atom					{ "n " ^ $2 }
/* TODO treat this properly */
| NOT formula					{ failwith "Not in NNF." }
| formula AND formula   			{ $1 ^ " &+& " ^ $3 }
| formula OR formula				{ $1 ^ " !-! " ^ $3 }
| formula IMP formula				{ $1 ^ " arr " ^ $3 }
| FORALL LBRACKET var RBRACKET COLON formula 	{ "(all (" ^ $3 ^ "\\ " ^ $6 ^ ")) " }
| EXISTS LBRACKET var RBRACKET COLON formula 	{ "(some (" ^ $3 ^ "\\ " ^ $6 ^ ")) " }
| FALSE						{ "f-" }
| TRUE 						{ "t+" }

atom:
| WORD LPAREN args RPAREN { $1 ^ "(" ^ $3 ^ ")"}
| WORD 			  { $1 }

args:
| term		  { $1 }
| term COMMA args { $1 ^ ", " ^ $3 }

term:
| VAR 			  { $1 }
| WORD			  { $1 } 
| WORD LPAREN args RPAREN { $1 ^ "(" ^ $3 ^ ")"}

/* TODO: policy for variable syntax in the certificates? */
var:
| VAR	{ $1 }

annotation: 
| file_info 	 { (AXIOM, []) }
| inference_info { $1 }

file_info:
| FILE LPAREN FILEPATH COMMA name RPAREN { "" }

inference_info:
| INFERENCE LPAREN inf_name COMMA status COMMA antecedents RPAREN {
  ($3, $7)
}

inf_name:
| ER 			{ ER }
| PM			{ PM }
| SPM			{ SPM }
| EF			{ EF }
| APPLY_DEF		{ APPLY_DEF }
| INTRODUCED_DEF	{ INTRODUCED_DEF }
| RW			{ RW }
| SR			{ SR }
| CSR			{ CSR }
| AR			{ AR }
| CN			{ CN }
| CONDENSE		{ CONDENSE }
| ASSUME_NEGATION	{ ASSUME_NEGATION }
| FOF_NNF		{ FOF_NNF }
| SHIFT_QUANTORS	{ SHIFT_QUANTORS }
| VARIABLE_RENAME	{ VARIABLE_RENAME }
| SKOLEMIZE		{ SKOLEMIZE }
| DISTRIBUTE		{ DISTRIBUTE }
| SPLIT_CONJUNCT	{ SPLIT_CONJUNCT }
| FOF_SIMPLIFICATION	{ FOF_SIMPLIFICATION }

/* Ignoring the status for now */
status:
| LBRACKET STATUS LPAREN status_type RPAREN RBRACKET { "" }

status_type:
| THM { "thm" }
| CTH { "cth" }

/* It looks like e-prover specifies always at most 2 antecedents */
antecedents:
| LBRACKET ant RBRACKET		  { $2 }
| LBRACKET ant COMMA ant RBRACKET { $2 @ $4 }

ant:
| name		 { [$1] }
| inference_info { match $1 with (_, ant) -> ant }

