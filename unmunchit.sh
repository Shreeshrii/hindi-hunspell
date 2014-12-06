cat hi-common.aff $1.aff >tmp.aff
LC_ALL=hi_IN.utf8  ./unmunch.sh $1.dic tmp.aff | sort | uniq > $1.txt
