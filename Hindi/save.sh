 bash ../tools/unmunchsame.sh hi
 echo "match aspell affix.dat to hi_IN.aff"
  sed -i -f ../tools/nukta-combine.sed hi_IN.txt
 LC_ALL=hi_IN.utf8   aspell munch-list keep   -l hi < hi_IN.txt > hi_IN.dic

