import json
import sys



def topTenHashTags(fp):
    hashTagToCount = dict()
    for line in fp:
        t=json.loads(line.encode("utf-8").strip())
        if t.has_key("entities") and t["entities"] is not None:
            if t["entities"]["hashtags"] is not None and len(t["entities"]["hashtags"]) > 0:
                for hashTagItem in t["entities"]["hashtags"]:
                    hashTagText=hashTagItem["text"].lower()
                    if hashTagToCount.has_key(hashTagText):
                        hashTagToCount[hashTagText] += 1.0
                    else:
                        hashTagToCount[hashTagText] = 1.0
    z=sorted(hashTagToCount, key=hashTagToCount.__getitem__, reverse=True)

    for i in range(0, 10):
        item=z[i]
        print str(item).encode("utf-8") + " " + str(float(hashTagToCount[item]))


def main ():
    twit_file=open(sys.argv[1])
    topTenHashTags(twit_file)


if __name__ == '__main__':
    main()
