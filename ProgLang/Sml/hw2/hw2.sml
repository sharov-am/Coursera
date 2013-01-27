(*use "hw2provided.sml";*)

fun same_string(s1 : string, s2 : string) =
    s1 = s2


 fun all_except_option(str,str_l)=
  		let fun helper(sl,sl2) =
		       case sl of
				[] => (false, [])
				| x::xs=> if same_string(x,str)
						  then   (true,  sl2@xs)
						  else   helper(xs,sl2@[x])
  		in
  	       case helper(str_l,[]) of 
  	   	   (true, t) => SOME t
  	   	   |_=> NONE
  	    end 



(*
fun get_substitutions1(sll:string list list,str:string) =
    
    case sll of
    	[] => []
    	| x::xs => *)
    	    
