use "assert.sml";




fun contains(values:int list, value:int) =
    if null values
    then false
    else 
        if value = (hd values)
        then true
        else contains(tl values,value)



fun remove_duplicate(m:int list,z: int list) = 
     if null m
     then []
     else 
         if contains(z,hd m) 
         then remove_duplicate(tl m,z)
         else (hd m) :: remove_duplicate(tl m,hd m::z)










val z = contains([1,2,3,4,5],6);
val z = contains([1,2,3,4,5],2);
val z = contains([1,2,3,3,3],3);


val z = remove_duplicate([1,2,3,3,5],[]);
val z = remove_duplicate([1,2,3,4,5],[]);
val z = remove_duplicate([1,2,3,3,3],[]);
val z = remove_duplicate([1,2,3,3,3,2,1,2,0,0],[]);


