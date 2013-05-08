import json
import sys


def afinnParser (fp):
    afinnDict=dict()
    for line in fp.readlines():
        splitted=line.strip().split('\t')
        afinnDict[splitted[0]]=splitted[1]
    return afinnDict


def twitsParser (fp):
    data=[]
    for line in fp:
        t=json.loads(line.strip())
        if t.has_key("text"):
            data.append(t["text"])
    return data


def happiestState(fp):
    stateToSentiment = dict()
    for line in fp:
        t=json.loads(line.strip())
        if t.has_key("place") and  t["place"] is not None:
            if t["place"]["country_code"] == "US":
               state = t["place"]["full_name"].split(",")[1].strip()
               if stateToSentiment.has_key(state):
                   stateToSentiment[state] += twitSentimentCounter(t["text"])
               else:
                   stateToSentiment[state] = twitSentimentCounter(t["text"])
    print list(sorted(stateToSentiment, key=stateToSentiment.__getitem__, reverse=True))[0]


def twitSentimentCounter (twit):
     counter=0
     splittedTwit=twit.strip().split()
     for word in splittedTwit:
          if sents.has_key(word):
              counter+=int(sents[word])
     return counter


def main ():
    global sents
    twit_file=open(sys.argv[2])
    sent_file=open(sys.argv[1])
    sents = afinnParser(sent_file)
    happiestState(twit_file)
#   sentimentCounter(twits, sents)


if __name__ == '__main__':
    main()
