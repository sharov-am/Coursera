use "../assert.sml";
use "hw1.sml";


(*Problem6 test *)

assert(true,fn () => get_nth( ["a","b" ,"c" ],1) = "a" ,"problem6 test1");
assert(true,fn () => get_nth( ["a","b" ,"c", "d"], 2) = "b" ,"problem6 test1");
assert(true,fn () => get_nth( ["a","b" ,"c", "d"], 4) = "d" ,"problem6 test1");
