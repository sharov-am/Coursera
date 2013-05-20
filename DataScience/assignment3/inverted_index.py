import json
import sys
import MapReduce


__author__='user'
# Part 1

mr=MapReduce.MapReduce()

# Part 2
def mapper (record):
    for word in str(record[1]).split():
        mr.emit_intermediate(word, record[0])


def mapper3 (record):
    js=json.loads(record)
    # print js.keys()[0]
    #print str(js.values())
    value=js.keys()[0]
    for word in str(js.values()).split():
        mr.emit_intermediate(word, value)


def mapper2 (record):
    js=json.loads(record)
    # print js.keys()[0]
    print str(js.values())
    value=js.keys()[0]
    for words in js.values():
        if type(words) is list:
            for words in words:
                for word in words.split():
                    mr.emit_intermediate(word, value)
        else:
            for word in words.split():
                mr.emit_intermediate(word, value)


# Part 3
def reducer (key, list_of_values):
    docs=[]
    for v in list_of_values:
        if not docs.__contains__(v):
            docs.append(v)
    mr.emit((key, docs))

# Part 4
# if __name__ == '__main__':
inputdata=open(sys.argv[1])
mr.execute(inputdata, mapper, reducer)


