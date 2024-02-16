#!/bin/bash

check_hammer(){
  # exit out the script if not login to registry.redhat.io
  timeout --foreground -k 1 5 hammer organization list > /dev/null 2>&1 
  if [ $? != 0 ] 
  then
    echo "Please check hammer login is valid."
    exit 1
  fi
}

complete()
{

  REPO="/tmp/repolocator.repolist.txt"
  CV="/tmp/repolocator.cvlist.txt"
  OUTPUT="/tmp/repolocator-output.txt"

  #remove any preivous repolocator-output.txt files
  > $OUTPUT

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
    echo - "Repo ID ....: $b" >> $OUTPUT
    echo - "Repo Name ..: $(echo "$FULL" | grep ^$b, | cut -d, -f2)" >> $OUTPUT
    cat $CV | grep -E "(\"$b,| $b,| $b\")" | cut -d, -f1,2 >> $OUTPUT
    echo >> $OUTPUT
  done

  echo "Please upload $OUTPUT"

  /bin/rm $REPO $CV

}

check_hammer
complete
