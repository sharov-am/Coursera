(*Problem1*)

fun is_older(date1:int*int*int, date2:int*int*int) =
    let 
      val year1 =  #1 date1 
    	val year2 =  #1 date2
   		val month1 = #2 date1
   		val month2 = #2 date2
   		val day1 =   #3 date1
   		val day2 =   #3 date2
    in
       if year1 = year2
       then   
 			      if  month2 = month1
 		        then 
                day1 < day2
            else 
                month1 < month2
       
       else
            year1 < year2
    end   		

(*Problem2*)

fun number_in_month(dates:(int*int*int) list, month:int) =
   if null dates
   then 0
   else
      if (#2 (hd dates)) = month 
      then
           1 + number_in_month((tl dates),month)
      else
           number_in_month((tl dates),month)



(*Problem6*)           


fun get_nth(str_list:string list, num:int) =
   if num = 1
   then 
        hd str_list
   else
      get_nth(tl str_list, num - 1)



