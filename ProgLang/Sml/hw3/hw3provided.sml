(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)


(*Problem 1
  Write a function only_capitals that takes a string list and returns a string list that has only
  the strings in the argument that start with an uppercase letter. Assume all strings have at least 1
  character. Use List.filter, Char.isUpper, and String.sub to make a 1-2 line solution.*)
fun only_capitals str_list =  List.filter(fn x => Char.isUpper(String.sub(x,0))) (str_list)



(*Problem 2
  Write a function longest_string1 that takes a string list and returns the longest string in the
  list. If the list is empty, return "". In the case of a tie, return the string closest to the beginning of the
  list. Use foldl, String.size, and no recursion (other than the implementation of foldl is recursive).*)
fun longest_string1 str_list = 
      List.foldl (fn(x,y) => if (String.size(x) <= String.size(y)) then y else x) "" str_list;



(*Problem 3
  Write a function longest_string2 that is exactly like longest_string1 except in the case of ties
  it returns the string closest to the end of the list. Your solution should be almost an exact copy of
  longest_string1. Still use foldl and String.size.*)
fun longest_string2 str_list = 
      List.foldl (fn(x,y) => if (String.size(x) < String.size(y)) then y else x) "" str_list;
              
	
