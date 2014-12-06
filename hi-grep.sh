LC_ALL=hi_IN.utf8 grep ा$ hi-nane.txt >hi-ne.txt
LC_ALL=hi_IN.utf8 sort hi-nane.txt | uniq >tmp1.txt
LC_ALL=hi_IN.utf8 sort hi-ne.txt | uniq > tmp2.txt
LC_ALL=hi_IN.utf8 comm -23 tmp1.txt tmp2.txt >hi-na.txt

