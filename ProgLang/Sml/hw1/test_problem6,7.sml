use "../assert.sml";
use "hw1.sml";


(*Problem6 test *)

assert(true,fn () => get_nth( ["a","b" ,"c" ],1) = "a" ,"problem6 test1");
assert(true,fn () => get_nth( ["a","b" ,"c", "d"], 2) = "b" ,"problem6 test1");
assert(true,fn () => get_nth( ["a","b" ,"c", "d"], 4) = "d" ,"problem6 test1");

(*Problem7 test *)

assert(true,fn () => date_to_string(2012,1, 7) = "January 7, 2012" ,"problem7 test1");
assert(true,fn () => date_to_string(2012,12,25) = "December 25, 2012" ,"problem7 test2");

