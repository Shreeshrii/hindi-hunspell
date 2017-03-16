#!/bin/bash
#set -vx
cat head.dic $1.dic > tmp.dic
../tools/unmunchit.sh tmp
LC_ALL=hi_IN.utf8  sort tmp.txt  | uniq > tmp1.txt
mv tmp1.txt $1.txt
rm tmp*
