#!/usr/bin/env bats

setup() {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures
}

@test "Trim final newlines and leave 3 if present. No whitespace fixes" {
  run php tidy.php --trim-final-newlines=3 --no-backup -f -q tests/tidy/tmp-fixtures/eol-3
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/eol-3 -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/eol-3/$base)" = "" ]
  done
}

@test "Trim final newlines and leave 0 final newlines. No whitespace fixes" {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

  run php tidy.php --trim-final-newlines=0 --no-backup -f -q tests/tidy/tmp-fixtures/eol-0

  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/eol-0 -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/eol-0/$base)" = "" ]
  done
}
