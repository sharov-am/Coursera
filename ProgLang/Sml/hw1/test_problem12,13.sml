use "../assert.sml";
use "hw1.sml";


(*Problem12 test *)

assert(true,fn () => number_in_months_challenge( [(2011,11,8),(2013,1,8)] , [11,11]) = 1,"problem3 test1");
assert(true,fn () => number_in_months_challenge( [(2011,11,8),(2013,1,8)] , [9,9,8] ) = 0,"problem3 test no match");
assert(true,fn () => number_in_months_challenge([(2011,11,8),(2013,1,8),(2013,1,8)] , [1,11,1]) = 3,"problem3 test3");
assert(true,fn () => number_in_months_challenge([(2011,11,8),(2013,1,8),(2013,12,8),(2011,6,8),(2013,2,8),(2013,12,8)] , [12,6,2,2,2,6,6]) = 4,"problem3 test4");
assert(true,fn () => number_in_months_challenge([(2011,1,8),(2013,2,8),(2013,3,8),(2011,4,8),(2013,5,8),(2013,6,8)],[1,2,3,4,5,6,1,2])  = 6,"problem3 all match");
assert(true,fn () => number_in_months_challenge([(2011,1,8),(2013,1,8),(2013,1,8),(2011,1,8),(2013,1,8),(2013,1,8)],[1,1])  = 6,"problem3 all match");



assert(true,fn () => dates_in_months_challenge( [(2011,11,8),(2013,1,8)] ,[1,1,1]) = [(2013,1,8)],"problem5 test1");
assert(true,fn () => dates_in_months_challenge( [(2011,11,8),(2012,11,8)] , [11,1,1,11] ) = [(2011,11,8),(2012,11,8)],"problem5 all match test");
assert(true,fn () => dates_in_months_challenge([(2011,11,8),(2013,1,8),(2013,2,8)] , [2,1,1,2]) = [(2013,2,8), (2013,1,8)],"problem5 no match test");
assert(true,fn () => dates_in_months_challenge([(2011,11,8),(2013,1,8),(2013,12,8),(2011,6,8),(2013,2,8),(2013,12,1)] , [12]) = [(2013,12,8),(2013,12,1)],"problem5 two match");
assert(true,fn () => dates_in_months_challenge([(2011,1,8),(2013,2,8),(2013,3,8),(2011,4,8),(2013,5,8),(2013,6,8)], [1,2,3,4,5,6])  = [(2011,1,8),(2013,2,8),(2013,3,8),(2011,4,8),(2013,5,8),(2013,6,8)],"problem5 all match");


