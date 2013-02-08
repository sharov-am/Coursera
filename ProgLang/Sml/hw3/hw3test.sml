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