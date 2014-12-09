cat hi-misc0.dic hi-misc1.dic hi-misc2.dic hi-misc3.dic hi-misc9.dic>hi-misc.dic
LC_ALL=hi_IN.utf8  ./unmunch.sh hi-misc.dic hi-misc.aff | LC_ALL=hi_IN.utf8 sort | uniq >hi-misc.txt
