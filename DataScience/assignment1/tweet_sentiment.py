
import sys

def hw():
    print 'Hello, world!'

def afinnParser(fp):
    afinnDict = dict()
    for line in fp.readlines():
        splitted = line.strip().split()
        afinnDict[splitted[0]] = splitted[1]
    return afinnDict


def lines(fp):
    print str(len(fp.readlines()))

def main():
    sent_file = open(sys.argv[1])
    tweet_file = open(sys.argv[2])
    hw()
    lines(sent_file)
    lines(tweet_file)

if __name__ == '__main__':
    # main()
   sent_file = open(sys.argv[1])
   for item in afinnParser(sent_file).items():
       print str(item[0])+"="+str(item[1])