import MapReduce
import json
import sys

# Map function
# mr - MapReduce object
# data - json object formatted as a string

mr=MapReduce.MapReduce()


def mapper2 (mr, data):
    data=json.loads(data)
    matr_name=data[0]
    row=data[1]
    col=data[2]
    val=data[3]
    if matr_name == 'a':
        mr.emit_intermediate(row, (row, col, val))
    else:
        mr.emit_intermediate(col, (row, col, val))


def mapper (data):
    matr_name=data[0]
    row=data[1]
    col=data[2]
    val=data[3]
    if matr_name == 'a':
        mr.emit_intermediate(row, (row, col, val))
    else:
        mr.emit_intermediate(col, (row, col, val))


# Reduce function
# mr - MapReduce object
# key - key generated from map phse, associated to list_of_values
# list_of_values - values generated from map phase, associated to key
def reducer (key, list_of_values):
#if len(list_of_values) == 1:
    mr.emit(key)


def reducer2 (mr, key, list_of_values):
#if len(list_of_values) == 1:
    mr.emit(key)


def main ():
    # Assumes first argument is a file of json objects formatted as strings,
    #one per line.
    MapReduce.execute(open(sys.argv[1]), mapper2, reducer2)


if __name__ == '__main__':
    main()





