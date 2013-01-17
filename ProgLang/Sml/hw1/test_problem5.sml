use "../assert.sml";
use "hw1.sml";

(*Problem4 test *)

assert(true,fn () => dates_in_month( [(2011,11,8),(2013,1,8)] ,1) = [(2013,1,8)],"problem4 test1");
assert(true,fn () => dates_in_month( [(2011,11,8),(2012,11,8)] , 11 ) = [(2011,11,8),(2012,11,8)],"problem4 all match test");
assert(true,fn () => dates_in_month([(2011,11,8),(2013,1,8),(2013,1,8)] , 2) = [],"problem4 no match test");
assert(true,fn () => dates_in_month([(2011,11,8),(2013,1,8),(2013,12,8),(2011,6,8),(2013,2,8),(2013,12,1)] , 12) = [(2013,12,8),(2013,12,1)],"problem4 two match");
assert(true,fn () => dates_in_month([(2011,1,8),(2013,2,8),(2013,3,8),(2011,4,8),(2013,5,8),(2013,6,8)],5)  = [(2013,5,8)],"problem4 one match");


(*Problem5 test *)

assert(true,fn () => dates_in_months( [(2011,11,8),(2013,1,8)] ,[1]) = [(2013,1,8)],"problem5 test1");
assert(true,fn () => dates_in_months( [(2011,11,8),(2012,11,8)] , [11] ) = [(2011,11,8),(2012,11,8)],"problem5 all match test");
assert(true,fn () => dates_in_months([(2011,11,8),(2013,1,8),(2013,2,8)] , [2,1]) = [(2013,2,8), (2013,1,8)],"problem5 no match test");
assert(true,fn () => dates_in_months([(2011,11,8),(2013,1,8),(2013,12,8),(2011,6,8),(2013,2,8),(2013,12,1)] , [12]) = [(2013,12,8),(2013,12,1)],"problem5 two match");
assert(true,fn () => dates_in_months([(2011,1,8),(2013,2,8),(2013,3,8),(2011,4,8),(2013,5,8),(2013,6,8)], [1,2,3,4,5,6])  = [(2011,1,8),(2013,2,8),(2013,3,8),(2011,4,8),(2013,5,8),(2013,6,8)],"problem5 all match");
