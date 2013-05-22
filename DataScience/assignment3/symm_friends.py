from collections import defaultdict


__author__='user'


import MapReduce
import json
import sys



mr=MapReduce.MapReduce()
# Map function
# mr - MapReduce object
# data - json object formatted as a string
def mapper2(mr, data):
    data = json.loads(data)
    key1 = data[0]
    key2 = data[1]
    mr.emit_intermediate(key1, key2)
    mr.emit_intermediate(key2, key1)


def mapper(data):
    key1 = data[0]
    key2 = data[1]
    mr.emit_intermediate(key1, key2)
    mr.emit_intermediate(key2, key1)




# Reduce function
# mr - MapReduce object
# key - key generated from map phse, associated to list_of_values
# list_of_values - values generated from map phase, associated to key
def reducer2 (mr, key, list_of_values):
    friends=dict()
    for val in list_of_values:
        if friends.has_key(val): #and friends[val] == 1:
            friends[val]+=1
        else:
            friends[val]=1
    for k, v in friends.items():
        if key == k: continue
        if v == 1:
            mr.emit((key, k))


def reducer (key, list_of_values):
    friends=dict()
    for val in list_of_values:
        if friends.has_key(val):#and friends[val] == 1:
            friends[val]+=1
        else:
            friends[val]=1
    for k, v in friends.items():
        if key == k: continue
        if v == 1:
            mr.emit((key, k))


def main():
    # Assumes first argument is a file of json objects formatted as strings,
    #one per line.
    MapReduce.execute(open(sys.argv[1]), mapper2, reducer2)

if __name__ == '__main__':
    main()

