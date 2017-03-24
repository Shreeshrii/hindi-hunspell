 # save various commands to use on wordlists 
 # expand dic and aff to txt
 bash ../tools/unmunchsame.sh hi_IN
 
 echo "match aspell affix.dat to hi_IN.aff"
 
 sed -i -f ../tools/nukta-combine.sed hi_IN.txt
 
# munch word lists to .dic using the affix.dat file of aspell
LC_ALL=hi_IN.utf8   aspell munch-list keep   -l hi < hi_IN.txt > hi_IN.dic

 sed -i -f ../tools/nukta-combine.sed hi_IN.dic
 
 echo "Sort, Unique and then Add 500000 to top of .dic file"
 
  aspell -l hi expand 3 <hi_IN.dic >hi_IN-expand.txt

  cut -d ' ' -f2 hi_IN-expand.txt > hi-In-2.txt

   sed -i -f ../tools/nukta-combine.sed hi-In-2.txt
   
   LC_ALL=hi_IN.utf8   aspell munch-list keep   -l hi < hi-In-2.txt > hi_IN.dic
       
 echo "Sort, Unique and then Add 500000 to top of .dic file"
   
    sed -i -f ../tools/nukta-combine.sed hi_IN.dic
 