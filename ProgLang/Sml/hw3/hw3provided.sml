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


fun longest_string_helper f  = List.foldr (fn(x,y) => if f( String.size(x), String.size (y) ) then y else x) ""
val longest_string3 =  longest_string_helper ( fn(x,y) => if ( x < y) then true else false) 
val longest_string4 =  longest_string_helper ( fn(x,y) => if ( x <=  y) then true else false) 





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
                NONE=> first_answer f xs
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

 
fun all_answers f lst=  
    let 
      val has_none = List.exists (fn x=> f(x) = NONE)
       (*assumed that it won't be called if NONE present*)
      val final_result = List.foldl (fn(x,acc)  => (case f(x) of SOME v => v@acc ))
    in 
    case lst of
      [] => SOME []
      |_=>if has_none lst 
          then NONE
          else SOME (final_result [] lst)
    end             
               
    
(*Problem 9a
 Use g to deffine a function count_wildcards that takes a pattern and returns how many Wildcard
 patterns it contains.
*)

val count_wildcards = g (fn _ => 1)(fn _ =>0)

(*Problem 9b
 Use g to dene a function count_wild_and_variable_lengths that takes a pattern and returns
 the number of Wildcard patterns it contains plus the sum of the string lengths of all the variables
 in the variable patterns it contains. (Use String.size. We care only about variable names; the
 constructor names are not relevant.)
*)

val count_wild_and_variable_lengths = g (fn _ => 1)(fn str => String.size str);
         
(*Problem 9c
  Use g to dene a function count_some_var that takes a string and a pattern (as a pair) and
  returns the number of times the string appears as a variable in the pattern. We care only about
  variable names; the constructor names are not relevant.
*)    

fun count_some_var (x,p) = g  (fn _ => 0)(fn str =>if x = str then 1 else 0) p ;

(*Problem 10
Write a function check_pat that takes a pattern and returns true if and only if all the variables
appearing in the pattern are distinct from each other (i.e., use dierent strings). The constructor
names are not relevant. Hints: The sample solution uses two helper functions. The rst takes a
pattern and returns a list of all the strings it uses for variables. Using foldl with a function that
uses append is useful in one case. The second takes a list of strings and decides if it has repeats.
List.exists may be useful. Sample solution is 15 lines. These are hints: We are not requiring foldl
and List.exists here, but they make it easier.
)
*)

fun check_pat p = 
  let 
      fun get_str_list p = 
         case p of
            Variable x => [x] 
           |TupleP ps  => List.foldl (fn (r,i) => get_str_list(r)@i) [] ps
           | _ => []

      fun do_same_exists x = List.exists(fn y => x = y ) 
    
      fun check_uniqueness lst =
       case lst of
        [] => true
        | x::xs =>   if (do_same_exists x xs)
                     then false
                     else check_uniqueness xs
  in
    check_uniqueness ( get_str_list p)
  end 


(*Problem 11
  Write a function match that takes a valu * pattern and returns a (string * valu) list option,  
  namely NONE if the pattern does not match and SOME lst where lst is the list of bindings if it does.
  Note that if the value matches but the pattern has no patterns of the form Variable s, then the result
  is SOME []. Hints: Sample solution has one case expression with 7 branches. The branch for tuples
  2
   uses all_answers and ListPair.zip. Sample solution is 13 lines. Remember to look above for the
   rules for what patterns match what values, and what bindings they produce. These are hints: We are
  not requiring all_answers and ListPair.zip here, but they make it easier.
 *)



fun match (v,p)   =
     case (v,p) of  
      (_,Wildcard) => SOME []
     |(Const v1,ConstP p1) =>if v1 = p1 then SOME [] else NONE
     |(Unit,UnitP) =>SOME []
     |(Constructor (s ,v1),ConstructorP (s1, p1) ) => if s = s1 then match(v1,p1) else NONE
     |(Tuple vs,TupleP ps) => if List.length vs = List.length ps 
                              then case all_answers match (ListPair.zip(vs,ps))  of
                                    SOME v2=>SOME v2
                                   |_ => NONE
                              else NONE
     |(_, Variable s ) => SOME [(s,v)]
     |(_,_) => NONE




(*Problem 12
  Write a function first_match that takes a value and a list of patterns and returns a
  (string * valu) list option, namely NONE if no pattern in the list matches or SOME lst where
  lst is the list of bindings for the rst pattern in the list that matches. Use first_answer and a
  handle-expression. Hints: Sample solution is 3 lines.
 *)

fun first_match v p =
    SOME (first_answer (fn x => match(v,x)) p)
    handle NoAnswer =>NONE


(*(Challenge Problem) Write a function typecheck_patterns that \type-checks" a pattern list. Types
for our made-up pattern language are dened by:
datatype typ = Anything 
| UnitT 
| IntT 
| TupleT of typ list 
| Datatype of string 
typecheck_patterns should have type ((string * string * typ) list) * (pattern list) -> typ option.
The rst argument contains elements that look like ("foo","bar",IntT), which means constructor foo
makes a value of type Datatype "bar" given a value of type IntT. Assume list elements all have dierent
rst elds (the constructor name), but there are probably elements with the same second eld (the datatype
name). Under the assumptions this list provides, you \type-check" the pattern list to see if there exists
some typ (call it t) that all the patterns in the list can have. If so, return SOME t, else return NONE.
You must return the \most lenient" type that all the patterns can have. For example, given patterns
TupleP[Variable("x"),Variable("y")] and TupleP[Wildcard,Wildcard], return TupleT[Anything,Anything]
even though they could both have type TupleT[IntT,IntT]. As another example, if the only patterns
are TupleP[Wildcard,Wildcard] and TupleP[Wildcard,TupleP[Wildcard,Wildcard]], you must return
TupleT[Anything,TupleT[Anything,Anything]].)
*)



(*NOTE. Well, I got total points 107 for this final task but it seems that it is not an ideal solution
  as a style of programming (it could be written in much elegant way) and also it seems that it is not
  semantically correct. To pass stupid grader tests and to write correct program are slightly different things.
  So, I would be really thankful for any comments on my solution and missed test cases.*)


fun get_pattern_type (type_data ,pattern) =
  let 
 
   (*used to check constructor types*)
   fun check_type_data (type_data1, datatype_str,cons_type)  =
               case type_data1 of
                  []=> raise NoAnswer
                  |(x,y,z)::xs => if x = datatype_str andalso cons_type = z
                                  then Datatype y
                                  else check_type_data(xs, datatype_str,cons_type)

 (*just helper funxtion to handle Tuple pattern*)
   fun helper ptn =
     case  ptn of
      [] => []  
     |x::xs  => (get_pattern_type(type_data, x))::helper xs
  in
  
  case pattern of
    Wildcard => Anything
   |UnitP => UnitT
   |ConstP v => IntT
   |TupleP v =>  TupleT(helper v)
   |Variable v1 =>Anything
   |ConstructorP(s,v)=>check_type_data (type_data, s, get_pattern_type(type_data,v)) 
end


 fun get_most_lenient  (typ1 ,typ2) =
        let 
          
          (*just helper funxtion to handle Tuple type*)
          fun helper typelst =
              case  typelst of
                    ([],[]) => []  
                   |(x::xs,y::ys)  => (get_most_lenient  (x,y))::helper(xs,ys)
                   |_ => raise NoAnswer
        in
                 case (typ1,typ2) of
                    (Anything,_)=>typ2
                   |(Datatype s1,Datatype s2) => if s1 = s2 then typ1 (*typ1 == typ2*) else raise NoAnswer
                   |(IntT,IntT)=>IntT
                   |(UnitT,UnitT)=>UnitT
                   |(TupleT v1,TupleT v2) => TupleT(helper(v1,v2))
                   |(_, Anything) =>typ1
                   |(_,_)=> raise NoAnswer
        end


fun typecheck_patterns (type_data, pattern_list) =
            
        SOME (List.foldl (fn(x,acc) => get_most_lenient ( get_pattern_type(type_data, x),acc) ) Anything pattern_list)
        handle NoAnswer => NONE


 
