use "../assert.sml";
use "hw1.sml";


(*Problem8 test *)
val Z =number_before_reaching_sum(1,   [0,0,0,0,1,0,0]);
assert(true,fn () => number_before_reaching_sum(4,   [1,2,3,4,5,6,8]) = 2 ,"problem8 test1");
assert(true,fn () => number_before_reaching_sum(14,  [1,2,3,4,5,6,8]) = 4 ,"problem8 test2");
assert(true,fn () => number_before_reaching_sum(15,  [1,2,3,4,5,6,8]) = 4 ,"problem8 test3");
assert(true,fn () => number_before_reaching_sum(3,   [1,0,0,0,1,0,2]) = 6 ,"problem8 test4");
assert(true,fn () => number_before_reaching_sum(1,   [0,0,0,0,1,0,0]) = 4 ,"problem8 test5");
assert(true,fn () => number_before_reaching_sum(123, [1,2,3,4,5,6,8]) = 1 ,"problem8 exception");



