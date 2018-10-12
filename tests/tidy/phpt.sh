#!/bin/sh

title="Proper output if file is not a test"
me=`basename "$0"`
red="\e[31m"
green="\e[32m"
default="\e[39m"

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# php tests fixes
php tidy.php --trim-trailing-whitespace --no-backup -f -q tests/tidy/tmp-fixtures/phpt-w

# Compare
files=`find tests/tidy/expected-fixtures/phpt-w -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/phpt-w/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done

# not a test
output="$(php tidy.php --trim-trailing-whitespace --no-backup -f -y tests/tidy/tmp-fixtures/phpt-w/not-a-test.phpt)"

valid="*FAIL *tests/tidy/tmp-fixtures/phpt-w/not-a-test.phpt: invalid PHP test*"

case "$output" in
  $valid)
    echo "${green}PASS${default}: $me: $title"
  ;;
  *)
    echo "${red}FAIL${default}: $me: $title"
  ;;
esac

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# php tests fixes with newlines
php tidy.php -n -N --trim-trailing-whitespace --no-backup -f -q tests/tidy/tmp-fixtures/phpt-w-n

# Compare
files=`find tests/tidy/expected-fixtures/phpt-w-n -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/phpt-w-n/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# php tests fixes with newlines and conversions
php tidy.php -w -n -N -e -l --no-backup -f -q tests/tidy/tmp-fixtures/phpt-w-n-e

# Compare
files=`find tests/tidy/expected-fixtures/phpt-w-n-e -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/phpt-w-n-e/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# php tests fixes with newlines and conversions
php tidy.php -s --no-backup -f -q tests/tidy/tmp-fixtures/phpt-s

# Compare
files=`find tests/tidy/expected-fixtures/phpt-s -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/phpt-s/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done
