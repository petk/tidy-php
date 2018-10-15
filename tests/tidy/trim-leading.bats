#!/usr/bin/env bats

setup() {
  load fixtures
}

@test "Trim leading newlines. No whitespace fixes" {
  run php tidy.php --trim-leading-newlines -f -q tests/tidy/tmp-fixtures/leading-newlines
  [ "$status" -eq 0 ]
  [ "$output" = "" ]

  files=`find tests/tidy/expected-fixtures/leading-newlines -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/leading-newlines/$base)
    [ "$out" = "" ]
  done
}

@test "Trim leading newlines and final new lines with max 2. No whitespace fixes" {
  run php tidy.php -l -N=2 -f -q tests/tidy/tmp-fixtures/leading-newlines-2
  [ "$status" -eq 0 ]
  [ "$output" = "" ]

  files=`find tests/tidy/expected-fixtures/leading-newlines-2 -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/leading-newlines-2/$base)
    [ "$out" = "" ]
  done
}
