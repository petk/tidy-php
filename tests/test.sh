#!/bin/sh

files=`ls tests/tidy | grep "\.sh$"`
i=0

for file in $files; do
  echo "=============================="
  echo "testing $file"
  echo "=============================="
  ./tests/tidy/$file || i=$((i+1))
  echo
done

exit $i;
