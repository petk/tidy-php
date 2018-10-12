#!/bin/sh

red="\e[31m"
green="\e[32m"
default="\e[39m"

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# Insert final newline if missing. No whitespace fixes, no redundant EOL fixes.
php tidy.php --insert-final-newline --no-backup -f -q tests/tidy/tmp-fixtures/final-newline

# Compare
files=`find tests/tidy/expected-fixtures/final-newline -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/final-newline/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done
