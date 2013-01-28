(*
Problem 1

Lecturer question: I would have liked to have looped through the tuple indices,
but the # operator seems to be a static environment macro
e.g. in pseudo code a helper function like:

is_older(date1, date2, n) =
   n > 0 andalso
   (#n date1 < #n date2 orelse
   is_older(date1, date2, n-1))

but #n didn't seem to work, as per limitation.

*)

fun is_older(date1: int*int*int, date2:int*int*int) =
    (* date is year*month*day, so compare each value in sequence *)
    (#1 date1) < (#1 date2)
    orelse (#2 date1) < (#2 date2)
    orelse  (#3 date1) < (#3 date2)

(* problem 2 *)
fun number_in_month(dates: (int * int * int) list, month:int) =
    if null dates
    then 0
    else
        (* extract a variable for the applying to the tail of the list, for readability *)
  let val tail_number =  number_in_month(tl dates, month)
  in
      if ((#2 (hd dates)) = month) 
      then
    (* add 1 *) 
    1 + tail_number
      else 
    tail_number 
  end

(* problem 3 *)
fun number_in_months(dates: (int * int * int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* problem 4 *)
fun dates_in_month(dates: (int * int * int) list, month:int) =
    if null dates
    then []
    else let
  val head =  hd dates
        (* extract a variable for the applying to the tail of the list, for readability *)
  val tail_dates  = dates_in_month(tl dates, month)
    in
  if #2 head = month
  then head :: tail_dates
  else tail_dates
    end

(* problem 5 *)
fun dates_in_months(dates : (int * int * int) list, months: int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* problem 6 *)
fun get_nth(strings: string list, n: int) =
    if n = 1
    then hd strings
    else get_nth(tl strings, n-1)

(* problem 7 *)
fun date_to_string(date: int*int*int) =
    let
  (* extract variable, purely for readability
       but it's likely in the 'real world' there would be some sort of
       helper function to get the month names in, say, German or French *)
  val month_names = ["January", "February", "March", "April",
         "May", "June", "July", "August", "September", "October", "November", "December"]
    in
  (* (2013, 1, 20) -> January 20, 2013) *)
  get_nth(month_names, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end

(* problem 8 *)
fun number_before_reaching_sum(sum : int, ints : int list) =
    let val subtraction = sum - (hd ints)
    in 
  if subtraction > 0 
  then 1 +  number_before_reaching_sum(subtraction, tl ints)
  else 0
    end

(* a list of ints representing the lengths of months in a non leap-year
   declaring this list outside of the problem 7. what_month function
   because it is reused for challenge problem 13 below
 *)
val month_lengths = [31,28,31,30,31,30,31,31,30,31,30,31]

(* problem 9 *)
fun what_month(day_of_year: int) =
    1 + number_before_reaching_sum(day_of_year, month_lengths)


(* problem 10 *)
fun month_range(day1 : int, day2: int) =
    if day1 > day2
    then []
    else what_month(day1) :: month_range(day1+1, day2)


(* problem 11 *)
fun oldest(dates: (int * int * int) list) =
    if null dates
    then NONE
    else 
  let 
      fun oldest_nonempty(dates :  (int * int * int) list) =
    let
        (* as per video, not a performance concern but neater *)
        val head = hd dates
        val tail = tl dates
    in 
        if null tail
        then head
        else let val tail_oldest = oldest_nonempty(tail)
       in
           if is_older(head, tail_oldest)
           then head
           else tail_oldest
       end
    end
  in
      SOME(oldest_nonempty dates) 
  end


(* challenge: remove duplicate months - a function to return unique elements from a non-empty list *)
fun remove_duplicates_challenge (xs: int list) =
    if null (tl xs) then [hd xs]
    else (* have both tail and head *)
  let
      (* A function to check existence of an int in a non-empty list *) 
      fun exists(x: int, xs:int list) =
    (* either the head element is the one we're looking for
     or the tail is non empty and contains it *)
    hd xs = x orelse
      (not (null(tl xs)) andalso exists(x, tl xs))

      (* call on tail *)
      val tail_remove_duplicates_challenge = remove_duplicates_challenge(tl xs)
  in
      if exists(hd xs, tl xs)
      then tail_remove_duplicates_challenge
      else hd xs :: tail_remove_duplicates_challenge
  end

(* challenge: function to remove duplicate months before applying number_in_months *)
fun number_in_months_challenge(dates: (int * int * int) list, months: int list) =
    (* as with the original problem, handle empty months gracefully.
       but don't increase complexity of remove_duplicates_challenge utility function *)
    if null months
    then 0
    else number_in_months(dates, remove_duplicates_challenge(months))

(*  challenge: function to remove duplicate months before applying dates_in_months *)
fun dates_in_months_challenge(dates : (int * int * int) list, months: int list) =
    (* as with the original problem, handle empty months gracefully.
       but don't increase complexity of remove_duplicates_challenge utility function *)
    if null months
    then []
    else dates_in_months(dates, remove_duplicates_challenge(months))


(* define a helper function to get the nth month length 
   NB: this logic is identical to the solution for problem 6 but it uses ints instead of strings
   Implementation Note: As not used elsewhere, I could have defined this as a privated nested function inside
   reasonable_date but for consistency, I am providing unit test equivalents for this function, as per problem 6.

   So this is a question of implementation: how can we define list operations regardless of data type?
   Dr Dan mentioned an alpha type 'a but declaring xs: a' list doesn't work

 *)
fun get_nth_int(ints: int list, n: int) =
    if n = 1
    then hd ints
    else get_nth_int(tl ints, n-1)


(*  challenge: check whether a date is valid in the common era (CE ~ AD), using Gregorian Calendar *)
fun reasonable_date(date: int * int * int) =

    (* declare variables up front for clarity *)
    let
  val year = #1 date
  val month = #2 date
  val day = #3 date
         
  (* nested funtion to get the # of days in a month
           like is_leap_year() this is called lazily through andalso clause *)
  fun days_in_month() =
      let 
    val non_leap_length = get_nth_int(month_lengths, month)
    (* function to evaluate whether the date represents a leap year
                   declaring as a function because is called via andalso
                   i.e. lazy evaluation if not February *)
    fun is_leap_year() =
        year mod 400 = 0 orelse
        (year mod 100 > 0 andalso year mod 4 = 0)
      in
    if (month = 2 andalso is_leap_year()) 
    then non_leap_length + 1
    else non_leap_length
      end
    in
  year > 0 andalso
  month > 0 andalso
  day > 0 andalso
  (* number of months hard coded to 12 - but could read length of month_lengths list dynamically
          e.g. to support lunar 13-month calendars *)
  month <= 12 andalso
  day <= days_in_month()
    end
