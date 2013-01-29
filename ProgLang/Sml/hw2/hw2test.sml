use "../assert.sml";
use "hw2.sml";


exception MyException  ;

(*Problem1 a test*)

(*val z = all_except_option("c",["a","b","c"]);*)

assert(true,fn () => all_except_option("a",["a","b","c"]) = SOME ["b","c"] ,"problem_a test1");
assert(true,fn () => all_except_option("c",["a","b","c"]) = SOME ["a","b"],"problem_a test2");
assert(true,fn () => all_except_option("b",["a","b","c"]) = SOME ["a","c"],"problem_a test3");
assert(true,fn () => all_except_option("a",["a"]) = SOME [],"problem_a test4");
assert(true,fn () => all_except_option("d",["a","b","c"]) = NONE,"problem_a test5");
assert(true,fn () => all_except_option("d",["a"]) = NONE,"problem_a test6");

(*Problem1 b test*)
assert(true,fn () => get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred") =
["Fredrick","Freddie","F"],"problem_b test1");

assert(true,fn () => get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") =
["Jeffrey","Geoff","Jeffrey"],"problem_b test2");

assert(true,fn () => get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"some") = [],"problem_b test3");

(*Problem1 c test*)
assert(true,fn () => get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred") =
["Fredrick","Freddie","F"],"problem_c test1");

assert(true,fn () => get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") =
["Jeffrey","Geoff","Jeffrey"],"problem_c test2");

assert(true,fn () => get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"some") = [],"problem_c test3");

(*Problem1 d test*)

assert(true,fn () => similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
{first="Fred", middle="W", last="Smith"}) = [{first="Fred", last="Smith", middle="W"},
{first="Fredrick", last="Smith", middle="W"},
{first="Freddie", last="Smith", middle="W"},
{first="F", last="Smith", middle="W"}],"problem_d test1");


assert(true,fn () => similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
{first="A", middle="W", last="Smith"}) = [{first="A", middle="W", last="Smith"}],"problem_d test2");


(*Problem2 c test*)

assert(true,fn () => remove_card( [(Clubs,Jack), (Clubs,King) ,(Spades,Num 1)] ,(Clubs,King) ,MyException) = [(Clubs,Jack),(Spades,Num 1)] ,"problem2_c test1");
assert(true,fn () => (remove_card( [(Clubs,Jack), (Clubs,King) ,(Spades,Num 1)] ,(Clubs,Num 9) ,MyException) 
				     handle MyException => []) = []  ,"problem2_c test2");
assert(true,fn () => remove_card( [(Clubs,Jack), (Clubs,King) ,(Spades,Num 1),(Clubs,Jack)] ,(Clubs,Jack) ,MyException) = [(Clubs,King) ,(Spades,Num 1),(Clubs,Jack)] ,"problem2_c test3");
assert(true,fn () => remove_card( [(Clubs,Jack), (Clubs,King) ,(Spades,Num 1),(Clubs,King),(Clubs,Jack)] ,(Clubs,King) ,MyException) = [(Clubs,Jack), (Spades,Num 1),(Clubs,King),(Clubs,Jack)] ,"problem2_c test4");

(*Problem2 d test*)
assert(true,fn () => all_same_color( [(Clubs,Jack), (Clubs,King) ,(Spades,Num 1),(Spades,King),(Clubs,Jack)] ) = true ,"problem2_d test1");
assert(true,fn () => all_same_color( [(Clubs,Jack)] )= true ,"problem2_d test2");
assert(true,fn () => all_same_color( [(Clubs,Jack), (Hearts,King) ,(Spades,Num 1),(Clubs,King),(Clubs,Jack)]) = false ,"problem2_d test3");
assert(true,fn () => all_same_color( [(Diamonds,Jack), (Hearts,King) ]) = false ,"problem2_d test4");