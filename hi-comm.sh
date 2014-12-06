LC_ALL=hi_IN.utf8 sort hi-dict-words.txt | uniq >tmp1.txt
LC_ALL=hi_IN.utf8 sort hi-ne.txt | uniq > tmp2.txt
LC_ALL=hi_IN.utf8 comm -23 tmp1.txt tmp2.txt >hi-dict-clean.txt

#LC_ALL=hi_IN.utf8 sort hi_5000_unmunched.txt |uniq >tmp4.txt
#LC_ALL=hi_IN.utf8 comm -23 tmp4.txt tmp1.txt >tmp5.txt
#LC_ALL=hi_IN.utf8 comm -23 tmp1.txt tmp4.txt >tmp6.txt