#!/bin/sh

red="\e[31m"
green="\e[32m"
default="\e[39m"

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# Whitespace fixes, no EOL fixes
php tidy.php --trim-trailing-whitespace --no-backup -f -q tests/tidy/tmp-fixtures/whitespace

# Compare
files=`find tests/tidy/expected-fixtures/whitespace -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/whitespace/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done


# EOL fixes, no whitespace fixes
php tidy.php --trim-final-newlines --no-backup -f -q tests/tidy/tmp-fixtures/eol

# Compare
files=`find tests/tidy/expected-fixtures/eol -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/eol/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done
