#!/bin/bash

if [[ -z $NUM_OF_CHECKS ]]; then
  NUM_OF_CHECKS=10
fi

echo "Running Readiness Checks";
echo "------------------------";

for ((n=0;n<NUM_OF_CHECKS;n++)); do
  exitCode=0
  numLines=0
  for file in "$1"/*.sh; do
    ((numLines=numLines+1));
    if [[ -f $file ]]; then
      out=$($file);
      if [[ "$?" == "1" ]]; then
        printf "\e[K%-60s%-12s\n" "$file" "[ Not Ready ]";
        exitCode=1;
        continue 1;
      fi
      printf "\e[K%-60s%-12s\n" "$file" "[ Ready ]";
    fi
  done

  if [[ $n -lt $(echo $NUM_OF_CHECKS-1) ]] && [[ $exitCode == 1 ]]; then
    sleep 1;
    printf "\e[%sA" "$numLines"
  fi

  if [[ $exitCode == 0 ]]; then
    break;
  fi

done

if [[ $exitCode == 0 ]]; then
  "${@:2}"
fi

exit $exitCode
