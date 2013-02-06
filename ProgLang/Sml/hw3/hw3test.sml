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
