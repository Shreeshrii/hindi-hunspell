LC_ALL=hi_IN.utf8 sort hi-verbs-addl1.txt | uniq >tmp1.txt
LC_ALL=hi_IN.utf8 sort hi-verb2.dic | uniq > tmp2.txt
LC_ALL=hi_IN.utf8 comm -23 tmp1.txt tmp2.txt >hi-verb2.txt

