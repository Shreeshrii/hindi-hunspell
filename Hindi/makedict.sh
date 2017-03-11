LC_ALL=hi_IN.utf8   cat  blank.txt \
hi-adj.dic  blank.txt \
hi-adverb.dic  blank.txt \
hi-alphabet.dic  blank.txt \
hi-freq.dic  blank.txt \
hi-hyphen.dic  blank.txt \
hi-misc.dic  blank.txt \
hi-num.dic  blank.txt \
hi-prefix.dic blank.txt \
hi-verbs.dic  blank.txt \
hi-nouns.dic  blank.txt \
 > tmp 
sed -e 's/^[0-9]//g' tmp   > tmp1
sed -e 's/^[0-9]//g' tmp1 > tmp2
sed -e 's/^[0-9]//g' tmp2 > tmp3
sed -e 's/^[0-9]//g' tmp3 > tmp4
sed -e '/^$/d' tmp4>tmp5
LC_ALL=hi_IN.utf8   sort tmp5 > tmp6
LC_ALL=hi_IN.utf8   uniq tmp6 >tmp7
cat head.dic tmp7 > hi_IN.dic
./unmunchit.sh hi_IN
rm tmp*