(*Problem 1*)

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

(*Problem 2*)

fun number_in_month(dates:(int*int*int) list, month:int) =
   if null dates
   then 0
   else
      if (#2 (hd dates)) = month 
      then
           1 + number_in_month((tl dates),month)
      else
           number_in_month((tl dates),month)



(*Problem 3*)

fun number_in_months(dates:(int*int*int) list, months:int list) =
    if null months
    then 0
    else
        number_in_month(dates,hd months) + number_in_months(dates, tl months)
        
(*Problem 4*)

fun dates_in_month( dates:(int*int*int) list, month:int) =
    if null dates
    then []
    else 
         if #2 (hd dates) = month
         then 
            hd dates :: dates_in_month (tl dates, month)  
         else 
            dates_in_month (tl dates, month)  


(*Problem 5*)

fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then []
    else 
        dates_in_month(dates,hd months) @  dates_in_months(dates,tl months) 
      

(*Problem6*)           

fun get_nth(str_list:string list, num:int) =
   if num = 1
   then 
        hd str_list
   else
      get_nth(tl str_list, num - 1)


(*Problem 7*)

fun date_to_string(date: int*int*int) =
     let 
         val  month = ["January", "February", "March", "April","May", "June", "July", "August", "September", "October", "November","December"]
     in
          get_nth(month,#2 date) ^ " " ^ Int.toString(#3 date) ^ "," ^ " " ^ Int.toString(#1 date)
     end     

(*Problem 8*)     

fun number_before_reaching_sum(sum:int,numbers: int list) =
    let 
       
       fun help_sum(psum:int, numbers: int list,index:int) = 
           if   psum < sum
           then
                help_sum(psum + hd numbers, tl numbers,index + 1)
           else
                index - 1
    in
         help_sum(0, numbers, 0)
    end   


(*Problem 9*)     

fun what_month(day: int) =
    number_before_reaching_sum(day, [31,28,31,30,31,30,31,31,30,31,30,31])


(*Problem 10*)     

fun month_range(day1:int, day2:int)=
     if day1 > day2
     then []
     else what_month(day1)::month_range(day1 + 1, day2)


(*Problem 11*)     
fun oldest(dates:(int*int*int) list)=
   let 
       fun helper(dates:(int*int*int) list, older:int*int*int) =
           if null dates
           then 
                older
           else
                if is_older(older, hd dates)
                then
                     helper(tl dates, older)
                else
                     helper(tl dates,hd dates)
    in
      if null dates
      then NONE
      else SOME (helper(dates,hd dates))
    end


 




