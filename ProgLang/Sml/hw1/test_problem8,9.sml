use "../assert.sml";
use "hw1.sml";


(*Problem8 test *)
val Z =number_before_reaching_sum(1,   [0,0,0,0,1,0,0]);
assert(true,fn () => number_before_reaching_sum(4,   [1,2,3,4,5,6,8]) = 2 ,"problem8 test1");
assert(true,fn () => number_before_reaching_sum(14,  [1,2,3,4,5,6,8]) = 4 ,"problem8 test2");
assert(true,fn () => number_before_reaching_sum(15,  [1,2,3,4,5,6,8]) = 4 ,"problem8 test3");
assert(true,fn () => number_before_reaching_sum(3,   [1,0,0,0,1,0,2]) = 6 ,"problem8 test4");
assert(true,fn () => number_before_reaching_sum(1,   [0,0,0,0,1,0,0]) = 4 ,"problem8 test5");



(*Problem 9 test*)   

assert(true,fn () => what_month(1) = 1 ,"problem9 test1");
assert(true,fn () =>  what_month(123) = 5 ,"problem9 test2");
assert(true,fn () =>  what_month(365) = 12 ,"problem9 test3");
assert(true,fn () =>  what_month(31) = 1 ,"problem9 test4");
assert(true,fn () =>  what_month(32) = 2 ,"problem9 test5");
assert(true,fn () =>  what_month(58) = 2 ,"problem9 test6");
assert(true,fn () =>  what_month(84) = 3 ,"problem9 test7");
assert(true,fn () =>  what_month(125) = 5 ,"problem9 test8");

