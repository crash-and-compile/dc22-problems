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
  in_base = random.randint(2, 62)
  out_base = random.randint(2, 62)
  in_conv = baseconvert(in_number, in_base)
  out_conv = baseconvert(in_number, out_base)
  # validate lowest base
  for i in xrange(in_base-1, 1, -1):
    intest = baseconvert(in_number, i)
    for j in xrange(out_base-1, 1, -1):
      if i != j and intest == baseconvert(in_number, j):
        in_base = i
        out_base = j
        print conflict
      

  pfile.write(baseconvert(in_number, in_base))
  pfile.write("\t")
  pfile.write(baseconvert(in_number, out_base))
  pfile.write("\n")

  sfile.write(str(in_base))
  sfile.write("\t")
  sfile.write(str(out_base))
  sfile.write("\n")
