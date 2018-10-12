#!/bin/sh

red="\e[31m"
green="\e[32m"
default="\e[39m"

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# Fix end of lines. No whitespace fixes, no redundant EOL fixes, no missing final new lines added.
php tidy.php --eol --no-backup -f -q tests/tidy/tmp-fixtures/end-of-line

# Compare
files=`find tests/tidy/expected-fixtures/end-of-line -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/end-of-line/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done

# Fix end of lines using manual EOL. No whitespace fixes, no redundant EOL fixes, no missing final new lines added.
php tidy.php --eol=CRLF --no-backup -f -q tests/tidy/tmp-fixtures/end-of-line-overriden-crlf

# Compare
files=`find tests/tidy/expected-fixtures/end-of-line-overriden-crlf -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/end-of-line-overriden-crlf/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done

# Fix end of lines using manual EOL. No whitespace fixes, no redundant EOL fixes, no missing final new lines added.
php tidy.php -e=LF --no-backup -f -q tests/tidy/tmp-fixtures/end-of-line-overriden-lf

# Compare
files=`find tests/tidy/expected-fixtures/end-of-line-overriden-lf -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/end-of-line-overriden-lf/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done
