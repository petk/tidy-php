#!/bin/sh

title="Check if script is working for a single file"
me=`basename "$0"`
red="\e[31m"
green="\e[32m"
default="\e[39m"
i=0

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# php tests fixes
output=`php tidy.php --trim-trailing-whitespace --eol --no-backup -f -q tests/tidy/tmp-fixtures/phpt-w/test_2.phpt`
exitCode=$?

# Compare
file="tests/tidy/expected-fixtures/phpt-w/test_2.phpt"
base=$(basename $file)
if cmp -s "$file" "tests/tidy/tmp-fixtures/phpt-w/$base"; then
  echo "${green}PASS${default}: $file"
else
  echo "${red}FAIL${default}: $file"
  i=$((i+1))
fi

if test "$exitCode" = 0; then
  echo "${green}PASS${default}: Exit code test 1"
else
  echo "${red}FAIL${default}: Exit code test 1"
  i=$((i+1))
fi

exit $i
