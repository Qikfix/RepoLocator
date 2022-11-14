#!/bin/bash

# hammer --csv repository list > /tmp/repolist.txt
# hammer --csv content-view list > /tmp/cv_list.txt
REPO="/tmp/repolist.txt"
CV_LIST="/tmp/cv_list.txt"

FULL=$(cat $REPO | cut -d, -f1,2 | sed '1d')
ID=$(cat $REPO | cut -d, -f1 | sed '1d')

for b in $ID
do
  echo - "Repo ID ....: $b"
  echo - "Repo Name ..: $(echo "$FULL" | grep ^$b, | cut -d, -f2)"
  cat $CV_LIST | grep -E "(\"$b,| $b,| $b\")" | cut -d, -f1,2
  echo
done
