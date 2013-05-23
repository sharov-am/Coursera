import MapReduce
import json
import sys

# Map function
# mr - MapReduce object
# data - json object formatted as a string

mr=MapReduce.MapReduce()



def mapper (data):
    matr_name=data[0]
    row=data[1]
    col=data[2]
    val=data[3]
    if matr_name == "a":
        for i in range(0, 11):
            mr.emit_intermediate((row, i), (col, val))
    else:
        for i in range(0, 11):
            mr.emit_intermediate((i, col), (row, val))




def mapper2 (mr, data):
    data=json.loads(data)
    matr_name=data[0]
    row=data[1]
    col=data[2]
    val=data[3]
    if matr_name == 'a':
        for i in range(0, 5):
            mr.emit_intermediate((row, i), ( col, val))
    else:
        for i in range(0, 5):
            mr.emit_intermediate((i, col), (row, val))


# Reduce function
# mr - MapReduce object
# key - key generated from map phse, associated to list_of_values
# list_of_values - values generated from map phase, associated to key
def reducer (key, list_of_values):
    vals = dict()
    for i in list_of_values:
        if not vals.has_key(i[0]):
            vals[i[0]] = (i[1],1)
        else:
            tup = vals[i[0]]
            vals[i[0]] =(tup[0]*i[1],2)
    sum = 0
    for val in  vals.values():
        if val[1] > 1:
          sum += val[0]
    mr.emit((key[0], key[1], sum))



def reducer2 (mr, key, list_of_values):
    vals = dict()
    for i in list_of_values:
        if not vals.has_key(i[0]):
            vals[i[0]] = (i[1],1)
        else:
            tup = vals[i[0]]
            vals[i[0]] =(tup[0]*i[1],2)
    sum = 0
    for val in  vals.values():
        if val[1] > 1:
          sum += val[0]
    mr.emit((key[0], key[1], sum))





def main ():
    # Assumes first argument is a file of json objects formatted as strings,
    #one per line.
    MapReduce.execute(open(sys.argv[1]), mapper2, reducer2)


if __name__ == '__main__':
    main()





