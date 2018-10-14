#!/usr/bin/env bats

setup() {
  load fixtures
}

@test "Trim final newlines and leave 3 if present. No whitespace fixes" {
  run php tidy.php --trim-final-newlines=3 -f -q tests/tidy/tmp-fixtures/eol-3
  [ "$status" -eq 0 ]
  [ "$output" = "" ]

  files=`find tests/tidy/expected-fixtures/eol-3 -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/eol-3/$base)
    [ "$out" = "" ]
  done
}

@test "Trim final newlines and leave 0 final newlines. No whitespace fixes" {
  load fixtures

  run php tidy.php --trim-final-newlines=0 -f -q tests/tidy/tmp-fixtures/eol-0

  [ "$status" -eq 0 ]
  [ "$output" = "" ]

  files=`find tests/tidy/expected-fixtures/eol-0 -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/eol-0/$base)
    [ "$out" = "" ]
  done
}
