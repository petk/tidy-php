#!/usr/bin/env bats

setup() {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures
}

@test "Proper output if file is not a test" {
  run php tidy.php --trim-trailing-whitespace --no-backup -f -q tests/tidy/tmp-fixtures/phpt-w
  [ "$status" -eq 1 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/phpt-w -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/phpt-w/$base)" = "" ]
  done
}

@test "Testing invalid PHP test file" {
  run php tidy.php --trim-trailing-whitespace --no-backup -f -y tests/tidy/tmp-fixtures/phpt-w/not-a-test.phpt
  [ "$status" -eq 1 ]
  [[ "$output" == *"FAIL"*"phpt-w/not-a-test.phpt: invalid PHP test"* ]]
}

@test "php tests fixes with newlines" {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

  run php tidy.php -n -N --trim-trailing-whitespace --no-backup -f -q tests/tidy/tmp-fixtures/phpt-w-n
  [ "$status" -eq 1 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/phpt-w-n -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/phpt-w-n/$base)" = "" ]
  done
}

@test "php tests fixes with newlines and EOL conversions" {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

  run php tidy.php -w -n -N -e -l --no-backup -f -q tests/tidy/tmp-fixtures/phpt-w-n-e
  [ "$status" -eq 1 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/phpt-w-n-e -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/phpt-w-n-e/$base)" = "" ]
  done
}

@test "php tests fixes with basic fixing rules" {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

  run php tidy.php -s --no-backup -f -q tests/tidy/tmp-fixtures/phpt-s
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/phpt-s -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/phpt-s/$base)" = "" ]
  done
}