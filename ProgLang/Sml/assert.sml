(*assertion fucntion for testing purposes*)

fun assert (expected, func, msg) =
    if ((func ()) = expected)
        then print ("PASS: " ^ msg ^ "\n")
        else print("FAILED: " ^ msg ^ "\n")

