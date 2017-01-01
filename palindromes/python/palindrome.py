#! python3
import sys
import re

def isPalindrome(line):
    p = re.compile('\W')

    lineLower = line.lower()
    lineRegEx = p.sub('', lineLower)
    lineReverse = lineRegEx[::-1]

    print(lineRegEx == lineReverse)
    return    

def usage():
    print("Usage: palindrome \"Test String\"")
    return    

def isOption(arg):
    return {
        "?" : True,
        "-?" : True,
        "-h" : True,
        "-H" : True,
        "/?" : True,
        "/h" : True,
        "/H" : True,
        "--help" : True
        }.get(arg, False)


if len(sys.argv) != 2:
    usage()
    exit()

script, line = sys.argv

if isOption(line):
    usage()
    exit()

isPalindrome(line)
exit()




