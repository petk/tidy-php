#!/bin/sh

red="\e[31m"
green="\e[32m"
default="\e[39m"

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# Whitespace checking
php tidy.php -w --no-backup -q tests/tidy/tmp-fixtures/whitespace
OUT=$?

if test "$OUT" = 1; then
  echo "${green}PASS${default}: Exit codes test 1"
else
  echo "${red}FAIL${default}: Exit codes test 1"
fi

# EOL checking, no whitespace checking
php tidy.php -N --no-backup -q tests/tidy/tmp-fixtures/eol
OUT=$?

if test "$OUT" = 1; then
  echo "${green}PASS${default}: Exit codes test 2"
else
  echo "${red}FAIL${default}: Exit codes test 2"
fi

# Fix all
php tidy.php -w -n -N --no-backup -q -f tests/tidy/tmp-fixtures/eol
OUT=$?

if test "$OUT" = 0; then
  echo "${green}PASS${default}: Exit codes test 3"
else
  echo "${red}FAIL${default}: Exit codes test 3"
fi
