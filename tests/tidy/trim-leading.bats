#!/usr/bin/env bats

setup() {
  load fixtures
}

@test "Trim final newlines and leave 3 if present. No whitespace fixes" {
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
