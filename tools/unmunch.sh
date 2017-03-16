#!/bin/bash
# version 1.0 (nemeth at ooo)
MESSAGE="unmunch.sh - unmunch for simpler Hunspell dictionaries\n
Usage: unmunch.sh dictionary.dic dictionary.aff >words.txt"

case $# in
[01]) echo -e $MESSAGE >/dev/stdin; exit 1;
esac

set_encoding() {
	utf=`awk 'BEGIN{utf=0}/^SET/&&/UTF-8/{utf=1}END{print utf}' $1`
	test $utf == 1 || export LC_ALL=C
}

set_encoding $2

awk '
function split_flag_vector(st) {
  if(fltype=="num") st2 = st ",";
  else if(fltype=="long") st2 = gensub("..","&,","g",st);
  else st2 = gensub(".","&,","g",st);
  return split(st2, f, ",") - 1;
}
function form(word, flag, num) {
  if (xtype[flag]=="S") {
    if (word !~ xc[flag, num]"$") return 0;
    if(xs[flag, num] > 0) wf = substr(word, 1, length(word)-xs[flag, num]) x[flag, num]
    else wf = word x[flag,num]
    print wf
    if (cont == 1 && xf[flag, num] != "") continuated[wf] = xf[flag, num]
  } else {
    if (word !~ "^" xc[flag, num]) return 0;
    if(xs[flag, num] > 0) wf = x[flag, num] substr(word, 1 + xs[flag, num])
    else wf = x[flag,num] word
    print wf
    if (xcom[flag] == 1) combined[wf] = 1;
  }
}
function generate(word,flag) {
  fcn = xnum[flag]
  for (k = 1; k <= fcn; k++) form(word, flag, k)
}
FILENAME~/.aff$/&&/FLAG/{fltype=$2;next}
FILENAME~/.aff$/&&/[PS]FX/&&NF==4 {
    xtype[$2]=substr($1,1,1)
    xcom[$2] = ($3=="Y") ? 1 : 0;
    xnum[$2] = $4
    n = 1;
    next;
}
FILENAME~/.aff$/&&/[PS]FX/&&NF>4{
    xs[$2,n]=($3=="0")?0:length($3)
    if($4~"/") { # secondary affix flags
	split($4, a, "/")
	x[$2,n]=a[1]
	xf[$2,n]=a[2]
    } else x[$2,n]=$4
    xc[$2,n]=$5
    n++
    next
}
FILENAME~/.dic$/&&NR>1{n=split($1,a,"/"); w[a[1]]=a[2]}
END{
for (i in w) {
  print i
  cont = 1
  fn = split_flag_vector(w[i])
  delete combined
  delete continuated
  for (j = 1; j <= fn; j++) generate(i, f[j])
  for (c in combined) {
    for (j = 1; j <= fn; j++)
      if (xtype[f[j]] == "S" && xcom[f[j]] == 1) generate(c, f[j])
  }
  cont = 0
  for (c in continuated) {
    fn = split_flag_vector(continuated[c])
    delete combined
    for (j = 1; j <= fn; j++) generate(c, f[j])
    for (d in combined) {
      for (j = 1; j <= fn; j++)
        if (xtype[f[j]] == "S" && xcom[f[j]] == 1) generate(d, f[j])
    }
  }
}
}
' $1 $2
