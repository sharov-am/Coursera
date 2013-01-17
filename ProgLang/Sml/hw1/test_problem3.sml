use "../assert.sml";
use "hw1.sml";
(*Problem3 test *)

assert(true,fn () => number_in_months( [(2011,11,8),(2013,1,8)] , [11]) = 1,"problem3 test1");
assert(true,fn () => number_in_months( [(2011,11,8),(2013,1,8)] , [9] ) = 0,"problem3 test no match");
assert(true,fn () => number_in_months([(2011,11,8),(2013,1,8),(2013,1,8)] , [1,11]) = 3,"problem3 test3");
assert(true,fn () => number_in_months([(2011,11,8),(2013,1,8),(2013,12,8),(2011,6,8),(2013,2,8),(2013,12,8)] , [12,6,2]) = 4,"problem3 test4");
assert(true,fn () => number_in_months([(2011,1,8),(2013,2,8),(2013,3,8),(2011,4,8),(2013,5,8),(2013,6,8)],[1,2,3,4,5,6])  = 6,"problem3 all match");
assert(true,fn () => number_in_months([(2011,1,8),(2013,1,8),(2013,1,8),(2011,1,8),(2013,1,8),(2013,1,8)],[1])  = 6,"problem3 all match");
