import json
import sys



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


def counterFrequency(twits):
    twitWords = dict()
    totalCounter = 0
    for twit in twits:

        splittedTwit = twit.encode("utf-8").strip().split()

        for word in splittedTwit:
            totalCounter += 1
            if twitWords.has_key(word):
                twitWords[word] += 1
            else:
                twitWords[word] = 1

    for key, value in twitWords.items():
         print str(key) + " " + str(float(value)/totalCounter)



def main():
    twit_file=open(sys.argv[1])
    twits=twitsParser(twit_file)
    counterFrequency(twits)


if __name__ == '__main__':
    main()
