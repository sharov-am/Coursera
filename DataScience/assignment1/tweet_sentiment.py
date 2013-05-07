import json
import sys


def hw ():
    print 'Hello, world!'


def afinnParser(fp):
    afinnDict=dict()
    for line in fp.readlines():
        splitted=line.strip().split('\t')
        afinnDict[splitted[0]]=splitted[1]
    return afinnDict


def twitsParser(fp):
    data=[]
    for line in fp:
        t=json.loads(line.strip())
        if t.has_key("text"):
            data.append(t["text"])
    return data


def sentimentCounter(twits, sents):
    for twit in twits:
        counter=0
        splittedTwit=twit.strip().split()
        for word in splittedTwit:
            if sents.has_key(word):
                counter+=int(sents[word])
        print str(counter)


def main():
    twit_file=open(sys.argv[2])
    sent_file=open(sys.argv[1])
    twits=twitsParser(twit_file)
    sents=afinnParser(sent_file)
    sentimentCounter(twits, sents)


if __name__ == '__main__':
    main()
