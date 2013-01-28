fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

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


fun get_substitutions1(sll:string list list,str:string) =
     case sll of
    	[] => []
    	| x::xs => case all_except_option(str,x) of
  	    	         NONE => get_substitutions1(xs,str)
    	           | SOME lst =>lst@get_substitutions1(xs,str)


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

fun card_color card =
  case card of
    (Clubs,_)  => Black
   |(Spades,_) => Black
   | _ => Red

fun card_value card = 
  case card of
   (_, Num v) => v
  |(_, Ace) => 11
  |(_,_) => 10



