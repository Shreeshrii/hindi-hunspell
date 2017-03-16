#LC_ALL=hi_IN.utf8  ./unmunch.sh hi-verbs.dic hi-verbs.aff | sort | uniq > hi-verbs.txt
LC_ALL=hi_IN.utf8  ../tools/unmunch.sh \
$1.dic \
../Hindi/hi_IN.aff  \
> $1.txt
