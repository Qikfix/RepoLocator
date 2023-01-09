#!/bin/bash

REPO="/tmp/repolocator.repolist.txt"
CV="/tmp/repolocator.cvlist.txt"

#Cleanup from prior runs
for i in $REPO $CV ; do
  if [ -f $i ] ; then
    /bin/rm $i || exit $?
  fi
done

#Extract needed info
/usr/bin/hammer --csv repository list > $REPO || exit $?
/usr/bin/hammer --csv content-view list > $CV || exit $?


FULL=$(cat $REPO | cut -d, -f1,2 | sed '1d')
ID=$(cat $REPO | cut -d, -f1 | sed '1d')

for b in $ID
do
  echo - "Repo ID ....: $b"
  echo - "Repo Name ..: $(echo "$FULL" | grep ^$b, | cut -d, -f2)"
  cat $CV | grep -E "(\"$b,| $b,| $b\")" | cut -d, -f1,2
  echo
done

/bin/rm $REPO $CV
