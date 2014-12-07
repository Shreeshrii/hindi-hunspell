cat hi-misc0.dic hi-misc1.dic hi-misc2.dic >tmp1.txt
LC_ALL=hi_IN.utf8  sed -f sed-normalize.txt tmp1.txt >hi-misc.dic
LC_ALL=hi_IN.utf8  ./unmunch.sh hi-misc.dic hi-misc.aff | LC_ALL=hi_IN.utf8 sort | uniq >hi-misc.txt