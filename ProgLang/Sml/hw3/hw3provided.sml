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
  longest_string1. Still use foldl and String.size. *)
fun longest_string2 str_list = 
      List.foldl (fn(x,y) => if (String.size(x) < String.size(y)) then y else x) "" str_list;
              
	
(*Problem 4 
   Write functions longest_string_helper, longest_string3, and longest_string4 such that:
     -- longest_string3 has the same behavior as longest_string1 and longest_string4 has the
 	    same behavior as longest_string2.
     -- longest_string_helper has type (int * int -> bool) -> string list -> string
		(notice the currying). This function will look a lot like longest_string1 and longest_string2
		but is more general because it takes a function as an argument.
	 -- longest_string3 and longest_string4 are dened with val-bindings and partial applications
		of longest_string_helper.*)


fun longest_string_helper f  = List.foldl (fn(x,y) => if f(String.size (x),String.size (y)) then y else x) ""
val longest_string3 =  longest_string_helper ( fn(x,y) => if (x <= y) then true else false) 
val longest_string4 =  longest_string_helper ( fn(x,y) => if (x < y) then true else false) 



(*Problem 5 
  Write a function longest_capitalized that takes a string list and returns the longest string in
  the list that begins with an uppercase letter (or "" if there are no such strings). Use a val-binding
  and the ML library's o operator for composing functions. Resolve ties like in problem 2.
  *)
val longest_capitalized  = longest_string1 o only_capitals


(*Problem 6
  Write a function rev_string that takes a string and returns the string that is the same characters in
  reverse order. Use ML's o operator, the library function rev for reversing lists, and two library functions
  in the String module. (Browse the module documentation to nd the most useful functions.)
 *)

val rev_string =  String.implode o List.rev o  String.explode
fun rev_string =  String.implode o List.rev o  String.explode
   

(*Problem 7
  Write a function first_answer of type ('a -> 'b option) -> 'a list -> 'b (notice the 2 argu-
  ments are curried). The rst argument should be applied to elements of the second argument in order
  until the rst time it returns SOME v for some v and then v is the result of the call to first_answer.
  If the rst argument returns NONE for all list elements, then first_answer should raise the exception
  NoAnswer. Hints: Sample solution is 5 lines and does nothing fancy.
*)

fun first_answer f ls=  
    case ls of
    [] => raise NoAnswer
    | x::xs => case f(x) of
                NONE=>first_answer f ls
               |SOME v => v 

  
(*Problem 8
  Write a function all_answers of type ('a -> 'b list option) -> 'a list -> 'b list option
  (notice the 2 arguments are curried). The rst argument should be applied to elements of the second
   argument. If it returns NONE for any element, then the result for all_answers is NONE. Else the
   calls to the rst argument will have produced SOME lst1, SOME lst2, ... SOME lstn and the result of
   all_answers is SOME lst where lst is lst1, lst2, ..., lstn appended together (order doesn't matter).
   Hints: The sample solution is 8 lines. It uses a helper function with an accumulator and uses @. Note
   all_answers f [] should evaluate to SOME [].)
*)

fun all_answers f ls=  
    case ls of
    [] => raise NoAnswer
    | x::xs => case f(x) of
                NONE=>first_answer f ls
               |SOME v => v 




