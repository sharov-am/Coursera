use "../assert.sml";
use "hw1.sml";


(*Problem 10 test*)   

assert(true,fn () => month_range(1,31 ) = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] ,"problem10 test1");
assert(true,fn () => month_range(335,365) =  [12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12] ,"problem10 test2");
assert(true,fn () => month_range(3,3) = [1] ,"problem10 test3");
assert(true,fn () => month_range(85,145) = [3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5] ,"problem10 test3");
assert(true,fn () => month_range(31,32) = [1,2] ,"problem10 test3");


(*Problem 11 test*)   

assert(true,fn () => oldest([(2010,1,1),(2012,3,4)]) = SOME (2010,1,1) ,"problem11 test3");
assert(true,fn () => oldest([(2012,3,4)]) = SOME(2012,3,4) ,"problem11 test3");
assert(true,fn () => oldest([]) = NONE ,"problem11 test3");
