use "hw1.sml";


(*assertion fucntion for testing purposes*)
fun assert (expected, func, msg) =
    if ((func ()) = expected)
        then print ("PASS: " ^ msg ^ "\n")
        else print("FAILED: " ^ msg ^ "\n")
;




(*Problem1 test *)
assert(false,fn () => is_older((2012,7,2),(2012,7,1)),"test1");
assert(true,fn () => is_older((2012,7,2),(2012,7,3)),"test2");

assert(true,fn () => is_older((2012,5,8),(2012,7,3)),"test3");
assert(false,fn () => is_older((2012,11,8),(2012,7,3)),"test4");

assert(true,fn () => is_older((2011,11,8),(2012,7,3)),"test5");
assert(false,fn () => is_older((2013,11,8),(2012,7,3)),"test6");

assert(false,fn () => is_older((2013,11,8),(2013,11,8)),"test7");

(*Problem2 test *)

assert(true,fn () => number_in_month( [(2011,11,8),(2013,1,8)] , 11) = 1,"problem2 test1");
assert(false,fn () => number_in_month( [(2011,11,8),(2013,1,8)] , 9) = 1,"problem2 test2");
assert(true,fn () => number_in_month( [(2011,11,8),(2013,1,8),(2013,1,8)] , 1) = 2,"problem2 test3");
assert(true,fn () => number_in_month( [(2011,11,8),(2013,1,8),(2013,12,8),(2011,6,8),(2013,2,8),(2013,12,8)] , 12) = 2,"problem2 test4");


(*Problem3 test *)

assert(true,fn () => number_in_months( [(2011,11,8),(2013,1,8)] , [11]) = 1,"problem3 test1");
assert(true,fn () => number_in_months( [(2011,11,8),(2013,1,8)] , [9] ) = 0,"problem3 test no match");
assert(true,fn () => number_in_months([(2011,11,8),(2013,1,8),(2013,1,8)] , [1,11]) = 3,"problem3 test3");
assert(true,fn () => number_in_months([(2011,11,8),(2013,1,8),(2013,12,8),(2011,6,8),(2013,2,8),(2013,12,8)] , [12,6,2]) = 4,"problem3 test4");
assert(true,fn () => number_in_months([(2011,1,8),(2013,2,8),(2013,3,8),(2011,4,8),(2013,5,8),(2013,6,8)],[1,2,3,4,5,6])  = 6,"problem3 all match");
assert(true,fn () => number_in_months([(2011,1,8),(2013,1,8),(2013,1,8),(2011,1,8),(2013,1,8),(2013,1,8)],[1])  = 6,"problem3 all match");



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


(*Problem6 test *)

assert(true,fn () => get_nth( ["a","b" ,"c" ],1) = "a" ,"problem6 test1");
assert(true,fn () => get_nth( ["a","b" ,"c", "d"], 2) = "b" ,"problem6 test1");
assert(true,fn () => get_nth( ["a","b" ,"c", "d"], 4) = "d" ,"problem6 test1");

(*Problem7 test *)

assert(true,fn () => date_to_string(2012,1, 7) = "January 7, 2012" ,"problem7 test1");
assert(true,fn () => date_to_string(2012,12,25) = "December 25, 2012" ,"problem7 test2");

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


(*Problem 12 test *)

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


(*Problem 13 test *)


assert(true,fn () => reasonable_date((2013,7,2)) = true," problem13 test1");
assert(true,fn () => reasonable_date((2012,2,29)) = true," problem13 leap test");
assert(true,fn () => reasonable_date((2013,2,29)) = false," problem13 test2");
assert(true,fn () => reasonable_date((2013,3,29)) = true," problem13 test3");
assert(true,fn () => reasonable_date((2013,2,32)) = false," problem13 test4");
assert(true,fn () => reasonable_date((1000,2,75)) = false," problem13 test5");
assert(true,fn () => reasonable_date((1450,13,75)) = false," problem13 test6");




