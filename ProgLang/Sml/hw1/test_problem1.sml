use "../assert.sml";
use "hw1.sml";

(*Problem1 test *)
assert(false,fn () => is_older((2012,7,2),(2012,7,1)),"test1");
assert(true,fn () => is_older((2012,7,2),(2012,7,3)),"test2");

assert(true,fn () => is_older((2012,5,8),(2012,7,3)),"test3");
assert(false,fn () => is_older((2012,11,8),(2012,7,3)),"test4");

assert(true,fn () => is_older((2011,11,8),(2012,7,3)),"test5");
assert(false,fn () => is_older((2013,11,8),(2012,7,3)),"test6");

assert(true,fn () => is_older((2013,11,8),(2013,11,8)),"test6");


(*Problem2 test *)

assert(true,fn () => is_older([(2013,11,8),(2013,11,8)),"problem2 test1");





