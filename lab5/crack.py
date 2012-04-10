import itertools
import hashlib
import sys
import random

TARGETHASH = "6a782c47eb6ab5a540c5af74453b57b4"
SALT = "C7pvYV"
alphanumeric = list("abcdefghijklmnopqrstuvwxyz")

random.shuffle(alphanumeric)

for i,a in enumerate(alphanumeric):
    for j,b in enumerate(alphanumeric):
        print str((i*26+j)/float(26**2)) + " Completed"
        for c in alphanumeric:
            for d in alphanumeric:
                for e in alphanumeric:
                    for f in alphanumeric:
                        s = str(SALT+a+b+c+d+e+f)
                        if (hashlib.md5(s).hexdigest() == TARGETHASH):
                            print "*************"
                            print s
                            sys.exit(0)

print "Completed."
