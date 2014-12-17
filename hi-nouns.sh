cat hi-noun2.dic hi-noun3.dic hi-noun3a.dic  hi-noun4.dic hi-noun4a.dic hi-noun5.dic hi-noun6.dic    hi-noun8.dic hi-noun8a.dic hi-noun8b.dic  hi-noun8c.dic>hi-nouns.dic
LC_ALL=hi_IN.utf8  ./unmunch.sh hi-nouns.dic hi-nouns.aff | LC_ALL=hi_IN.utf8 sort | uniq >hi-nouns.txt
