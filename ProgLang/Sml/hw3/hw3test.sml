use "../assert.sml";
use "hw3provided.sml";

(*Problem1 test*)

assert(true,fn () => only_capitals(["asd","bdsA","cF"]) = [] ,"problem1 test1");
assert(true,fn () => only_capitals(["Some","real","value"]) = ["Some"] ,"problem1 test2");
assert(true,fn () => only_capitals(["Some","Real","Value"]) = ["Some","Real","Value"] ,"problem1 test3");
