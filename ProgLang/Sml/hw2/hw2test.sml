use "../assert.sml";
use "hw2.sml";


exception MyException  ;

(*Problem1 a test*)

(*val z = all_except_option("c",["a","b","c"]);*)

assert(true,fn () => all_except_option("a",["a","b","c"]) = SOME ["b","c"] ,"problem1_a test1");
assert(true,fn () => all_except_option("c",["a","b","c"]) = SOME ["a","b"],"problem1_a test2");
assert(true,fn () => all_except_option("b",["a","b","c"]) = SOME ["a","c"],"problem1_a test3");
assert(true,fn () => all_except_option("a",["a"]) = SOME [],"problem1_a test4");
assert(true,fn () => all_except_option("d",["a","b","c"]) = NONE,"problem1_a test5");
assert(true,fn () => all_except_option("d",["a"]) = NONE,"problem1_a test6");

(*Problem1 b test*)
assert(true,fn () => get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred") =
["Fredrick","Freddie","F"],"problem1_b test1");

assert(true,fn () => get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") =
["Jeffrey","Geoff","Jeffrey"],"problem1_b test2");

assert(true,fn () => get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"some") = [],"problem1_b test3");

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
assert(true,fn () => all_same_color( [(Diamonds,Jack), (Hearts,King) ]) = true ,"problem2_d test4");
assert(true,fn () => all_same_color( [(Diamonds,Jack), (Clubs,King) ]) = false ,"problem2_d test5");


(*Problem2 e test*)

assert(true,fn () => sum_cards( [(Spades,Num 1), (Spades,Num 1) ,(Spades,Num 1)]) = 3 ,"problem2_e test1");
assert(true,fn () => sum_cards( [(Spades,Num 1), (Spades,Num 2) ,(Spades,Num 3)]) = 6 ,"problem2_e test2");
assert(true,fn () => sum_cards( [(Spades,Jack), (Spades,King) ]) = 20 ,"problem2_e test3");
assert(true,fn () => sum_cards( [(Spades,Ace) ]) = 11 ,"problem2_e test4");
assert(true,fn () => sum_cards( []) = 0 ,"problem2_e test5");

(*Problem2 f test*)
assert(true,fn () => score( [(Spades,Num 1), (Diamonds,Num 1) ,(Spades,Num 1)],3 ) = 0 ,"problem2_f test1");
assert(true,fn () => score( [(Spades,Num 1), (Spades,Num 2) ,(Spades,Num 3)],3) = 4 ,"problem2_f test2");
assert(true,fn () => score( [(Spades,Num 1), (Diamonds,Num 1)],4) = 2 ,"problem2_f test3");
assert(true,fn () => score( [(Spades,Ace)],3) = 12 ,"problem2_f test4");
assert(true,fn () => score( [(Spades,Num 1), (Diamonds,Num 2) ,(Spades,Num 3)],3) = 9 ,"problem2_f test5");

val z = careful_player([(Spades,Num 7),(Hearts,King),(Clubs,Ace),(Diamonds,Num 2)],18);
val z = careful_player([(Spades,Num 7),(Hearts,King),(Clubs,Ace),(Diamonds,Num 2)],17);
val z =  careful_player([(Clubs,Ace),(Spades,Ace),(Diamonds,Ace),(Hearts,Ace),(Clubs, Num 10),(Spades, Num 10)], 42);
val z = careful_player([(Spades,Num 7)],8);

