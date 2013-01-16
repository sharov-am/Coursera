use "../assert.sml";
use "hw1.sml";


(*Problem2 test *)

assert(true,fn () => number_in_month( [(2011,11,8),(2013,1,8)] , 11) = 1,"problem2 test1");
assert(false,fn () => number_in_month( [(2011,11,8),(2013,1,8)] , 9) = 1,"problem2 test2");
assert(true,fn () => number_in_month( [(2011,11,8),(2013,1,8),(2013,1,8)] , 1) = 2,"problem2 test2");
assert(true,fn () => number_in_month( [(2011,11,8),(2013,1,8),(2013,12,8),(2011,6,8),(2013,2,8),(2013,12,8)] , 12) = 2,"problem2 test2");