fun is_older (date1: int * int * int, date2: int * int * int) =
    (#1 date1) < (#1 date2) orelse
    ((#1 date1)= (#1 date2) andalso (#2 date1) < (#2 date2)) orelse
    ((#1 date1) = (#1 date2) andalso (#2 date1) = (#2 date2) andalso (#3 date1) < (#3 date2))


fun number_in_month (datelist :(int * int * int) list, mn: int) = 
    if null datelist
    then 0
    else if (#2 (hd datelist)) = mn
    then 1 + number_in_month (tl datelist, mn)
    else number_in_month (tl datelist, mn)
               
fun number_in_months (datelist: (int * int * int) list, mns: int list) =
    if null mns
    then 0
    else number_in_month (datelist, hd mns)  + number_in_months (datelist, tl mns)

fun dates_in_month (datelist: (int * int * int)  list, mn: int) = 
    if null datelist
    then [] 
    else if (#2 (hd datelist)) = mn
    then (hd datelist) :: dates_in_month (tl datelist, mn)
    else dates_in_month (tl datelist, mn)
    
fun dates_in_months (datelist: (int * int * int) list, mns: int list) =
    if null mns
    then []
    else dates_in_month (datelist, hd mns) @ dates_in_months (datelist, tl mns)

fun get_nth ( strlist: string list, n: int) =
    if null strlist orelse n < 1
    then ""
    else if n = 1
    then hd strlist
    else get_nth (tl strlist, n-1)

fun date_to_string (dt: int * int * int) =
  let  val mth = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  in get_nth (mth, #2 dt) ^ " " ^Int.toString(#3 dt) ^", "^ Int.toString (#1 dt)
  end
   

fun number_before_reaching_sum (sum: int, numlist: int list) = 
    if null numlist orelse (sum - hd numlist <=  0)
    then 0 
    else 1 + number_before_reaching_sum (sum - hd numlist, tl numlist)

fun what_month (day: int) = 
    let val mth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in number_before_reaching_sum (day, mth) + 1
    end

fun month_range(day1: int, day2 : int) = 
    if (day2 < day1)
    then []
    else [what_month(day1)]@ month_range (day1+1, day2)
   
fun oldest (dtlist:(int * int * int) list) = 
    if null dtlist
    then NONE
    else let  fun oldest_nonempty (dtlist: (int * int * int) list) =
      if null (tl dtlist)
      then (hd dtlist)
      else let val dtoldest = oldest_nonempty (tl dtlist)
     in 
         if is_older(hd dtlist, dtoldest)
         then hd dtlist
         else dtoldest
     end
    in
  SOME(oldest_nonempty (dtlist))
       end


      

                 
    

   




