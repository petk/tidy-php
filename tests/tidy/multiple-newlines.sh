#!/bin/sh

red="\e[31m"
green="\e[32m"
default="\e[39m"

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# Trim final newlines and leave 3 if present. No whitespace fixes
php tidy.php --trim-final-newlines=3 --no-backup -f -q tests/tidy/tmp-fixtures/eol-3

# Compare
files=`find tests/tidy/expected-fixtures/eol-3 -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/eol-3/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done


# Trim final newlines and leave 0 final newlines. No whitespace fixes
php tidy.php --trim-final-newlines=0 --no-backup -f -q tests/tidy/tmp-fixtures/eol-0

# Compare
files=`find tests/tidy/expected-fixtures/eol-0 -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/eol-0/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done
