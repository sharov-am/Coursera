
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


(* better: returns an int option *)
fun max1 (xs : int list) =
    if null xs
    then NONE
    else 
  let val tl_ans = max1(tl xs)
  in if isSome tl_ans andalso valOf tl_ans > hd xs
     then tl_ans
     else SOME (hd xs)
  end

val z = isSome(max1([]));
