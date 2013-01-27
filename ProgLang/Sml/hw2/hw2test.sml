use "../assert.sml";
use "hw2.sml";

(*Problem a test*)

(*val z = all_except_option("c",["a","b","c"]);*)

assert(true,fn () => all_except_option("a",["a","b","c"]) = SOME ["b","c"] ,"test1");
assert(true,fn () => all_except_option("c",["a","b","c"]) = SOME ["a","b"],"test2");
assert(true,fn () => all_except_option("b",["a","b","c"]) = SOME ["a","c"],"test3");
assert(true,fn () => all_except_option("a",["a"]) = SOME [],"test4");
assert(true,fn () => all_except_option("d",["a","b","c"]) = NONE,"test5");
assert(true,fn () => all_except_option("d",["a"]) = NONE,"test6");

