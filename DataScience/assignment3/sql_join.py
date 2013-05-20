import json


__author__='ASharov'

import sys
import MapReduce
import json

mr=MapReduce.MapReduce()
# Map function
# mr - MapReduce object
# data - json object formatted as a string
def mapper (data):
    key = data[1]
    mr.emit_intermediate(key, data)

# Reduce function
# mr - MapReduce object
# key - key generated from map phse, associated to list_of_values
# list_of_values - values generated from map phase, associated to key

def reducer (key, list_of_values):
    orderItem=None
    for row in list_of_values:
        if row[0] == "order" and row[1] == key:
            orderItem = row
            continue
        else:
            if row[0] == "line_item" and row[1] == key:
                mr.emit(orderItem + row)

def mapper2 (mr, data):
    js = json.loads(data)
    key = js[1]
    mr.emit_intermediate(key, data)



def reducer2 (mr,key, list_of_values):
    orderItem=None
    items=[]
    for row in list_of_values:
        jsRow = json.loads(row)
        if jsRow[0] == "order" and jsRow[1] == key:
            orderItem = row
            continue
        else:
            if jsRow[0] == "line_item" and jsRow[1] == key:
                mr.emit(orderItem + row)


def main ():
    # Assumes first argument is a file of json objects formatted as strings,
    #one per line.
    MapReduce.execute(open(sys.argv[1]), mapper2, reducer2)


if __name__ == '__main__':
    main()
