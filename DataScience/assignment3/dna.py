import MapReduce
import json
import sys



# Map function
# mr - MapReduce object
# data - json object formatted as a string

mr=MapReduce.MapReduce()

def mapper2(mr, data):
    data = json.loads(data)
    seq_id = data[0]
    nucl = data[1]
    if len(nucl) < 10:
         nucl_val = nucl
    else:
         nucl_val = nucl[0:len(nucl) - 10]
    mr.emit_intermediate(nucl_val,seq_id)




def mapper( data):
    seq_id = data[0]
    nucl = data[1]
    if len(nucl) < 10:
         nucl_val = nucl
    else:
         nucl_val = nucl[0:len(nucl) - 10]
    mr.emit_intermediate(nucl_val,seq_id)


# Reduce function
# mr - MapReduce object
# key - key generated from map phse, associated to list_of_values
# list_of_values - values generated from map phase, associated to key
def reducer(key, list_of_values):
    #if len(list_of_values) == 1:
      mr.emit(key)



def reducer2(mr, key, list_of_values):
    #if len(list_of_values) == 1:
      mr.emit(key)



def main():
    # Assumes first argument is a file of json objects formatted as strings,
    #one per line.
    MapReduce.execute(open(sys.argv[1]), mapper2, reducer2)

if __name__ == '__main__':
    main()

