
(* you may assume that Num is always used with values 2, 3, ..., 9
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)


fun same_string(s1 : string, s2 : string) =
    s1 = s2

(*Problem1 a *)
 fun all_except_option(str,str_list)=
  		let fun helper(sl,str_list2) =
		       case sl of
				[] => (false, [])
				| x::xs=> if same_string(x,str)
						  then   (true,  str_list2@xs)
						  else   helper(xs,str_list2@[x])
  		in
  	       case helper(str_list,[]) of 
  	   	   (true, t) => SOME t
  	   	   |_=> NONE
  	    end 

(*Problem1 b *)
fun get_substitutions1(sll:string list list,str:string) =
     case sll of
    	[] => []
    	| x::xs => case all_except_option(str,x) of
  	    	         NONE => get_substitutions1(xs,str)
    	           | SOME lst =>lst@get_substitutions1(xs,str)

(*Problem1 c *)
fun get_substitutions2(sll:string list list,str:string) =
     let fun helper(sll_1) = 
         case sll_1 of
         [] => [] 
         | x::xs => case all_except_option(str,x) of 
         				 NONE => helper(xs)
         				 |SOME lst => lst@helper(xs)
     in
		helper(sll)
     end

(*Problem1 d *)
fun similar_names(sll,full_name:{first:string, last:string, middle:string})=
    let  fun substitute(sll_1,fio:{first:string,last:string,middle:string}) = 
           case sll_1 of
           [] => []
           | x::xs => case fio of
                       {first = a,last = b,middle = c}  => {first = x, last = b, middle = c}::substitute(xs,fio)
    in
       case full_name of
        {first = l,last = k, middle = m} => {first =l,last = k,middle = m}::
        									substitute( get_substitutions1(sll,l),{first = l, last = k, middle = m})
    end

(*Problem2 a *)

fun card_color card =
  case card of
    (Clubs,_)  => Black
   |(Spades,_) => Black
   | _ => Red

(*Problem2 b *)
fun card_value card = 
  case card of
   (_, Num v) => v
  |(_, Ace) => 11
  |(_,_) => 10


(*Problem2 c *)
fun remove_card(cs, c, e) = 
   let fun helper(cs_1,acc)=
        case cs_1 of 
        []=>raise e
        | x::xs => if x=c 
                   then acc@xs
                   else helper(xs,x::acc)

    in
        helper(cs,[]) 
       
    end


(*Problem2 d *)
fun all_same_color cs =
  case cs  of
   [] => true
   | x :: xs => case xs of 
                [] => true
                | y::ys => if card_color(x) = card_color(y)
                         then all_same_color(xs)
                         else false

(*Problem2 e *)
fun sum_cards cs =
   let fun helper(cs_1) =
       case cs_1 of 
       []=>0
       | x::xs => card_value(x) + helper(xs)
   in
       helper cs
   end  

(*Problem2 f *)
fun score(cs, goal) =
   let 
       fun calc_score() =
           let 
              val sum = sum_cards cs              
           in 
             case (sum > goal) of
              true  => 3*(sum - goal)
             |false => (goal - sum)
           end
   in
      case (all_same_color cs) of 
        true  => calc_score() div 2
       |false => calc_score()
   end





(*Problem2 g *)
fun officiate(card_list,move_list,goal) =
    let fun helper(card_list2,held_list,move_list2) =
             case move_list2 of
                  [] => score(held_list,goal)
                  |x::xs => case x of
        	                 Draw => (case card_list2 of 
        	               		 	 	   [] => score(held_list,goal) 
        	               			 	   |y::ys => if sum_cards(y::held_list) > goal
        	                        			     then score(y::held_list,goal)
        	                        		   		 else helper(ys,y::held_list,xs)) 
        	                 |Discard card => helper(card_list2,remove_card(held_list,card,IllegalMove),xs)
         
     in     
           helper(card_list,[],move_list)	       
     end      


(*Problem3 a*)


fun score_challenge(cs, goal) =
   let 
       fun card_value_1(card,a) = 
          case card of
          (_, Num v) => v
         |(_, Ace) => a
         |(_,_) => 10
       
       fun sum_cards_1(cs,a) =
          let fun helper_1(cs_1) =
              case cs_1 of 
              []=>0
              | x::xs => card_value_1(x,a) + helper_1(xs)
          in
              helper_1 cs
          end           


       fun calc_score(a) =
           let 
              val sum = sum_cards_1(cs,a)
           in 
             case (sum > goal) of
              true  => 3*(sum - goal)
             |false => (goal - sum)
           end

       fun get_best_score() =
         let 
              val score1 = calc_score(1)
              val score2 = calc_score(11)
         in 
           if score1 < score2
           then score1
           else score2
         end   

   in
     case (all_same_color cs) of 
      true  => get_best_score() div 2
     |false => get_best_score()
   end



fun officiate_challenge(card_list,move_list,goal) =
    let fun helper(card_list2,held_list,move_list2) =
             case move_list2 of
                  [] => score_challenge(held_list,goal)
                  |x::xs => case x of
                           Draw => (case card_list2 of 
                                   [] => score_challenge(held_list,goal) 
                                   |y::ys => if sum_cards(y::held_list) > goal
                                             then score_challenge(y::held_list,goal)
                                             else helper(ys,y::held_list,xs)) 
                           |Discard card => helper(card_list2,remove_card(held_list,card,IllegalMove),xs)
         
     in     
           helper(card_list,[],move_list)        
     end      






(*Problem3 b*)

fun possible_to_discard2(held_card,check_list,card,goal) =
            case check_list of
             [] => (false, (Clubs, Num 10)) 
             |x::xs => if score(card::remove_card(held_card, x, IllegalMove), goal) = 0
                       then (true,x)
                       else possible_to_discard2(held_card,xs,card,goal)

fun careful_player(card_list,goal) = 
    
    let 
        fun possible_to_discard(held_card,check_list,card) =
            case check_list of
             [] => (false, (Clubs, Num 10)) 
             |x::xs => if score(card::remove_card(held_card, x, IllegalMove), goal) = 0
                       then (true,x)
                       else possible_to_discard(held_card,xs,card)
   
        fun make_move(held_list,card_list,move_list) =
            if score(held_list,goal) = 0
            then move_list
            else  
                 case card_list of
                      [] => move_list
                      |x::xs => case held_list of 
                                     [] => make_move(x::held_list,xs,move_list@[Draw])
                                    |y::ys => case  possible_to_discard(held_list,held_list,x) of
                                                    (true,x1) => move_list@[(Discard x1),Draw]
                                                   |_ => if ((goal - sum_cards(held_list) > 10) orelse
                                                             (sum_cards(x::held_list) <= goal))
                                                         then 
                                                               make_move(x::held_list,xs,move_list@[Draw])
                                                         else
                                                               make_move(x::held_list,xs,move_list@[Discard y])
    in                                                             
        make_move([],card_list,[])
    end    
