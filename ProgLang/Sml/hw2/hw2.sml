(*use "hw2provided.sml";*)

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
    	    
