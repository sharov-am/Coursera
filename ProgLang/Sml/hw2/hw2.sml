(*use "hw2provided.sml";*)

fun same_string(s1 : string, s2 : string) =
    s1 = s2


fun all_except_option(str:string,str_l:string list)=
  		let fun has_string(sl:string list) =
		       case sl of
				[] => []
				| x::xs=> if same_string(x,str)
						  then   true
						  else   has_string(xs))  
		let fun get_string(xs:string list) =
		       case xs of
				[] => []
				| x::xs=> if same_string(x,str)
						  then   xs
						  else   x::(has_string(xs))  
  			in
  	   			if has_string(str_l)
  	   			then SOME get_string(str_l)
  	   			else NONE
    		end


