import MapReduce
import json
import sys



mr=MapReduce.MapReduce()
# Map function
# mr - MapReduce object
# data - json object formatted as a string
def mapper2(mr, data):
    js = json.loads(data)
    key = js[0]
    value = js[1]
    # output (key, value) pair (only for mapper)
    mr.emit_intermediate(key, 1)


def mapper(data):
    key1 = data[0]
    mr.emit_intermediate(key1, 1)




# Reduce function
# mr - MapReduce object<
# key - key generated from map phse, associated to list_of_values
# list_of_values - values generated from map phase, associated to key
def reducer2(mr, key, list_of_values):
    mr.emit((key,len(list_of_values)))


def reducer(key, list_of_values):
    mr.emit((key,len(list_of_values)))



def main():
    # Assumes first argument is a file of json objects formatted as strings, 
    #one per line.
    MapReduce.execute(open(sys.argv[1]), mapper, reducer)

if __name__ == '__main__':
    main()
