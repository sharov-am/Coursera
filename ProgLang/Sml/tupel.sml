<<<<<<< HEAD
signature COUNTER =
sig
    type t
    val newCounter : int -> int
    val increment : t -> t
    val first_larger : t * t -> bool
end

structure NoNegativeCounter :> COUNTER = 
struct

exception InvariantViolated

type t = int

fun newCounter i = if i <= 0 then 1 else i

fun increment i = i + 1

fun first_larger (i1,i2) =
    if i1 <= 0 orelse i2 <= 0
    then raise InvariantViolated
    else (i1 - i2) > 0

end

val z = NoNegativeCounter.first_larger(NoNegativeCounter.newCounter(1) ,NoNegativeCounter.newCounter(~2));

=======
(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 4: Modules for Namespace Management *)

signature MATHLIB =
sig
val fact : int -> int
val half_pi : real
(* val doubler : int -> int *) (* can hide bindings from clients *)
end

structure MyMathLib :> MATHLIB =
struct
fun fact x =
    if x=0
    then 1
    else x * fact (x - 1)

val half_pi = Math.pi / 2.0

fun doubler y = y + y
end
>>>>>>> 72ff49a61560b46db3dd16ed4fb2429d61881295
