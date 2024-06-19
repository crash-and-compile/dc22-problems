#! /usr/bin/python2
import sys
import random

#From http://stackoverflow.com/questions/2267362/convert-integer-to-a-string-in-a-given-numeric-base-in-python
def baseconvert(n, base):
    """convert positive decimal integer n to equivalent in another base (2-36)"""

    digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

    try:
        n = int(n)
        base = int(base)
    except:
        return ""

    if n < 0 or base < 2 or base > 36:
        return ""

    s = ""
    while 1:
        r = n % base
        s = digits[r] + s
        n = n / base
        if n == 0:
            break

    return s

pfile = open(sys.argv[1], 'w')
sfile = open(sys.argv[2], 'w')
for i in xrange(0, random.randint(150, 250)):
  in_number = random.randint(1000000, 4000000000) 
  in_base = random.randint(2, 36)
  out_base = random.randint(2, 36)
  pfile.write(baseconvert(in_number, in_base))
  pfile.write("\t")
  pfile.write(str(in_base))
  pfile.write("\t")
  pfile.write(str(out_base))
  pfile.write("\n")

  sfile.write(baseconvert(in_number, out_base))
  sfile.write("\n")
