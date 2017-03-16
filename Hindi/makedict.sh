#!/bin/bash
./expand-all.sh
LC_ALL=hi_IN.utf8   cat  blank.dic \
hi-adj.dic  blank.dic \
hi-adverb.dic  blank.dic \
hi-freq.dic  blank.dic \
hi-hyphen.dic  blank.dic \
hi-misc.dic  blank.dic \
hi-nouns.dic  blank.dic \
hi-num.dic  blank.dic \
hi-prefix.dic blank.dic \
hi-verbs.dic  blank.dic \
hi-alphabet.dic  blank.dic \
hi-CLDR.dic  blank.dic \
hi-angrezi.dic  blank.dic \
 > tmp5 
LC_ALL=hi_IN.utf8   sort tmp5 > tmp6
LC_ALL=hi_IN.utf8   uniq tmp6 >tmp7
cat head.dic tmp7 > hi_IN.dic
../tools/unmunchit.sh hi_IN
rm tmp*
cp hi_IN.dic /mnt/c/Users/User/AppData/Roaming/Notepad++/plugins/config/Hunspell
cp hi_IN.aff /mnt/c/Users/User/AppData/Roaming/Notepad++/plugins/config/Hunspell

