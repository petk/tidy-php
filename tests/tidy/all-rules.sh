#!/bin/sh

red="\e[31m"
green="\e[32m"
default="\e[39m"

# Prepare fixtures
rm -rf tests/tidy/tmp-fixtures
cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

# All fixes as default behavior
php tidy.php --no-backup -f -q tests/tidy/tmp-fixtures/all

# Compare
files=`find tests/tidy/expected-fixtures/all -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/all/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done


# All fixes with all basic rules options enabled (should be the same as above)
php tidy.php -w -n -N --no-backup -f -q tests/tidy/tmp-fixtures/all

# Compare
files=`find tests/tidy/expected-fixtures/all -type f \
  ! -path '*/\.git*'`

for file in $files; do
  base=$(basename $file)

  if cmp -s "$file" "tests/tidy/tmp-fixtures/all/$base"; then
    echo "${green}PASS${default}: $file"
  else
    echo "${red}FAIL${default}: $file"
  fi
done
