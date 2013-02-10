use "../assert.sml";
use "hw3provided.sml";

(*Problem1 test*)

assert(true,fn () => only_capitals(["asd","bdsA","cF"]) = [] ,"problem1 test1");
assert(true,fn () => only_capitals(["Some","real","value"]) = ["Some"] ,"problem1 test2");
assert(true,fn () => only_capitals(["Some","Real","Value"]) = ["Some","Real","Value"] ,"problem1 test3");



(*Problem2 test*)

assert(true,fn () => longest_string1(["asd","bdsA","cF"]) = "bdsA" ,"problem2 test1");
assert(true,fn () => longest_string1(["Some","real","value"]) = "value" ,"problem2 test2");
assert(true,fn () => longest_string1(["Someasd","Real","Value"]) = "Someasd" ,"problem2 test3");
assert(true,fn () => longest_string1([]) = "" ,"problem2 test4");
assert(true,fn () => longest_string1(["Some","real","val"]) = "Some" ,"problem2 test5");
assert(true,fn () => longest_string1(["Some"]) = "Some" ,"problem2 test6");
assert(true,fn () => longest_string1(["Some","cool","stuf"]) = "Some" ,"problem2 test7");


(*Problem3 test*)

assert(true,fn () => longest_string2(["asd","bdsA","cF"]) = "bdsA" ,"problem3 test1");
assert(true,fn () => longest_string2(["Some","real","value"]) = "value" ,"problem3 test2");
assert(true,fn () => longest_string2(["Someasd","Real","Value"]) = "Someasd" ,"problem3 test3");
assert(true,fn () => longest_string2([]) = "" ,"problem3 test4");
assert(true,fn () => longest_string2(["Some","real","val"]) = "real" ,"problem3 test5");
assert(true,fn () => longest_string2(["Some"]) = "Some" ,"problem3 test6");
assert(true,fn () => longest_string2(["Some","cool","stuf"]) = "stuf" ,"problem3 test7");
assert(true,fn () => longest_string2(["Some","cool","stuff"]) = "stuff" ,"problem3 test8");


(*Problem 4 test*)

assert(true,fn () => longest_string3(["asd","bdsA","cF"]) = "bdsA" ,"problem4 test1");
assert(true,fn () => longest_string3(["Some","real","value"]) = "value" ,"problem4 test2");
assert(true,fn () => longest_string3(["Someasd","Real","Value"]) = "Someasd" ,"problem4 test3");
assert(true,fn () => longest_string3([]) = "" ,"problem4 test4");
assert(true,fn () => longest_string3(["Some","real","val"]) = "Some" ,"problem4 test5");
assert(true,fn () => longest_string3(["Some"]) = "Some" ,"problem4 test6");
assert(true,fn () => longest_string3(["Some","cool","stuf"]) = "Some" ,"problem4 test7");
assert(true,fn () => longest_string4(["asd","bdsA","cF"]) = "bdsA" ,"problem4 test8");
assert(true,fn () => longest_string4(["Some","real","value"]) = "value" ,"problem4 test9");
assert(true,fn () => longest_string4(["Someasd","Real","Value"]) = "Someasd" ,"problem4 test10");
assert(true,fn () => longest_string4([]) = "" ,"problem4 test11");
assert(true,fn () => longest_string4(["Some","real","val"]) = "real" ,"problem4 test12");
assert(true,fn () => longest_string4(["Some"]) = "Some" ,"problem4 test13");
assert(true,fn () => longest_string4(["Some","cool","stuf"]) = "stuf" ,"problem4 test14");
assert(true,fn () => longest_string4(["Some","cool","stuff"]) = "stuff" ,"problem4 test15");


(*Problem 5 test*)
assert(true,fn () => longest_capitalized(["asd","bdsA","cF"]) = "" ,"problem5 test1");
assert(true,fn () => longest_capitalized(["Some","real","value"]) = "Some" ,"problem5 test2");
assert(true,fn () => longest_capitalized(["Someasd","Real","Value"]) = "Someasd" ,"problem5 test3");
assert(true,fn () => longest_capitalized([]) = "" ,"problem5 test4");
assert(true,fn () => longest_capitalized(["Some"]) = "Some" ,"problem5 test6");
assert(true,fn () => longest_capitalized(["Some","cool","Stuff"]) = "Stuff" ,"problem5 test8");

(*Problem 6 test*)
assert(true,fn () => rev_string("asddsa") = "asddsa" ,"problem6 test1");
assert(true,fn () => rev_string("123456") = "654321" ,"problem6 test2");
assert(true,fn () => rev_string("") = "" ,"problem6 test3");


(*Problem 7 test*)

assert(true,fn () => first_answer (fn(x) => if x = 5 then SOME 5 else NONE)  [1,2,3,4,5]  = 5 ,"problem7 test1");
assert(true,fn () => (first_answer (fn(x) => if x = 6 then SOME 6 else NONE)  [1,2,3,4,5]
					handle NoAnswer => ~1 ) = ~1 ,"problem7 test2");

(*Problem 8 test*)

assert(true,fn () => all_answers (fn(x) => if x = 5 then SOME [5] else NONE)  []  =SOME [] ,"problem8 test1");
assert(true,fn () => all_answers (fn(x) => if x = 5 then SOME [5] else NONE)  [1,2,3,4,5]  = NONE ,"problem8 test2");
assert(true,fn () => all_answers (fn(x) => if x = 5 then SOME [5] else NONE)  [5]  = SOME [5] ,"problem8 test3");
assert(true,fn () => all_answers (fn(x) => if x = 5 then SOME [5] else NONE)  [5,5]  = SOME [5,5] ,"problem8 test4");


(*Problem 9a test*)

assert(true,fn () => count_wildcards Wildcard   = 1 ,"problem9a test1");
assert(true,fn () => count_wildcards (TupleP ([Wildcard]))   = 1 ,"problem9a test2");
assert(true,fn () => count_wildcards (TupleP ([Wildcard,Wildcard]))   = 2 ,"problem9a test3");
assert(true,fn () => count_wildcards (TupleP ([Wildcard,ConstP(1)]))  = 1 ,"problem9a test4");
assert(true,fn () => count_wildcards (TupleP ([Wildcard,Wildcard,Wildcard,ConstP(1)]))  = 3 ,"problem9a test5");
assert(true,fn () => count_wildcards (TupleP ([ConstP(1),ConstP(1)]))  = 0 ,"problem9a test6");

(*Problem 9b test*)
assert(true,fn () => count_wild_and_variable_lengths (TupleP ([Wildcard,Wildcard,Wildcard]))  = 3 ,"problem9b test1");
assert(true,fn () => count_wild_and_variable_lengths (TupleP ([Wildcard,Wildcard,Variable("hi")]))  = 4 ,"problem9b test2");
assert(true,fn () => count_wild_and_variable_lengths (TupleP ([Variable("hi")]))  = 2 ,"problem9b test3");
assert(true,fn () => count_wild_and_variable_lengths (TupleP ([Variable("hi"),Variable"world",Wildcard,Wildcard]))  = 9 ,"problem9b test4");

(*Problem 9c test*)
assert(true,fn () => count_some_var("hi", (TupleP ([Variable("hi")])))  = 1 ,"problem9c test1");
assert(true,fn () => count_some_var("hi", (TupleP ([Variable("hi"),Variable("hi"),Variable("h1")])))  = 2 ,"problem9c test2");
assert(true,fn () => count_some_var("hi2", (TupleP ([Variable("hi"),Variable("hi"),Variable("h1")])))  = 0 ,"problem9c test3");


(*Problem10 test*)
assert(true,fn () => check_pat((TupleP ([Variable("")])))  = true ,"problem10 test1");
assert(true,fn () => check_pat((TupleP ([Variable("hi")])))  = true ,"problem10 test1");
assert(true,fn () => check_pat((TupleP ([Variable("hi"),Variable("hi"),Variable("h1")])))  = false ,"problem10 test2");
assert(true,fn () => check_pat( (TupleP ([Variable("hi1"),Variable("hi2"),Variable("hi3")])))  = true ,"problem10 test3");

(*Problem11 test*)

val z = match( Tuple ([Const 1, Unit, Constructor("asd", Const 1), Constructor("dsa",Const 2)]), 
			   TupleP([Variable("dsa1"), UnitP , Variable("dsa2") ,Variable("dsa3") ]));  
			   

assert(true,fn () => match( Const 1,TupleP ([Variable("")]))  = NONE ,"problem11 test1");
assert(true,fn () => match( Const 1,ConstP 1)  = SOME [] ,"problem11 test2");
assert(true,fn () => match( Tuple[ (Const 1), Unit,Constructor("asd", Const 1), Constructor("dsa",Const 2)], 
							TupleP ([ConstP 1,UnitP,ConstructorP ("asd", ConstP 1),ConstructorP("dsa",ConstP 2) ]))  
								  = SOME [] ,"problem11 test3");
assert(true,fn () => match( Tuple[ (Const 1), Unit,Constructor("asd", Const 1), Constructor("dsa",Const 2)], 
							TupleP ([Variable("dsa1"), UnitP , Variable("dsa2") ,Variable("dsa3")]))  
								  = SOME [("dsa3",Constructor("dsa",Const 2)),("dsa2",Constructor("asd", Const 1)),
								           ("dsa1",Const 1)] ,"problem11 test4");

assert(true,fn () => match(Const 1,Variable("dsa1")) = SOME [("dsa1",Const 1)] ,"problem11 test5");
assert(true,fn () => match(Tuple ([Const 1,Const 2]),Variable("dsa1")) = SOME [("dsa1",Tuple ([Const 1,Const 2]))] ,"problem11 test6");
assert(true,fn () => match(Const 1,UnitP) = NONE ,"problem11 test7");
assert(true,fn () => match(Constructor("dsa",Const 1),ConstructorP("dsa",Variable("z"))) =SOME [("z",Const 1)] ,"problem11 test8");

(*Problem12 test*)

assert(true,fn () => first_match (Constructor("dsa",Const 1)) ([UnitP,ConstP 1]) = NONE ,"problem12 test1");
assert(true,fn () => first_match (Const 1) ([UnitP,Variable("z")]) =SOME [("z",Const 1)] ,"problem12 test2");
assert(true,fn () => first_match (Const 1) ([Variable("z"),Variable("z1")]) =SOME [("z",Const 1)] ,"problem12 test2");
