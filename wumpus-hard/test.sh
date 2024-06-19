#!/bin/bash

failed=0
for n in {0..1000}
do
  ./generate.pl test3 test4
#  cat test3 | ./w.py > test4b
  cat test3 | ./w64.py > test4
  cat test3 | ./w64.py > test4b
  if diff test4 test4b
  then
    echo -n
  else
    failed=$((failed+1))
    cp test3 $n.prob.txt
    cp test4 $n.sol.txt
    cp test4b $n.sol2.txt
  fi
  echo -n .
done
echo
echo $failed
