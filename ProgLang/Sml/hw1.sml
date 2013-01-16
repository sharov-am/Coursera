
fun swap (pr : int*bool) =
    (#2 pr, #1 pr)

fun swap (pr : int*bool) =
    (#2 pr, #1 pr)

fun sort_tuple(test : int*int) =
     if (#1 test < #2 test) then test
     			  else (#2 test ,#1 test)	


(*val z = swap((100,true))*)

val z1 = sort_tuple((1,2));
val z1 = sort_tuple((200,100))
val z1 = sort_tuple((100,2))

fun is_older(date1:int*int*int, date2:int*int*int) =
    let 
        val year1 = #1 date1 
    	val year2 = #1 date2
   		val month1 = #2 date1
   		val month2 = #2 date2
   		val day1 = #3 date1
   		val day2 = #date2
    in
       if year1 = year2
           
       then   
 			if  month2 = month1
 			     then
 			        day1 < day2

       else

    end   		

[];
