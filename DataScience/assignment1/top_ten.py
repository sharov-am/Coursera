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


def topTenHashTags (fp):
    hashTagToCount=dict()

    for line in fp:
        t=json.loads(line.encode("utf-8").strip())
        if t.has_key("entities") and t["entities"] is not None:
            if t["entities"]["hashtags"] is not None and len(t["entities"]["hashtags"]) > 0:
                for hashTagItem in t["entities"]["hashtags"]:
                    hashTagText=hashTagItem["text"]
                    if hashTagToCount.has_key(hashTagText):
                        hashTagToCount[hashTagText]+=1
                    else:
                        hashTagToCount[hashTagText]=0
    z=sorted(hashTagToCount, key=hashTagToCount.__getitem__, reverse=True)

    for i in range(0, 10):
        item=z[i]
        print item + " " + str(float(hashTagToCount[item]))


def main ():
    twit_file=open(sys.argv[1])
    topTenHashTags(twit_file)


if __name__ == '__main__':
    main()
