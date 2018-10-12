#!/bin/sh

red="\e[31m"
green="\e[32m"
default="\e[39m"

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# clean spaces before tabs
php tidy.php --clean-space-before-tab --no-backup -f -q tests/tidy/tmp-fixtures/space-before-tab

# Compare
files=`find tests/tidy/expected-fixtures/space-before-tab -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/space-before-tab/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done
