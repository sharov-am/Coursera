
datatype z = Some of int | Str of string | Day;

fun test (z) =
    case z of
     Day =>1
    | Some t =>t+5
    | Str i => 1  

val z = Day;
val z1 = test(z);