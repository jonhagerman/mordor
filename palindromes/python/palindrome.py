#! python3
import sys
import re

script, line = sys.argv

lineLower = line.lower()

p = re.compile('\W')

lineRegEx = p.sub('', lineLower)

lineReverse = lineRegEx[::-1]

print(lineRegEx == lineReverse)

