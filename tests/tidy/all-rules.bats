#!/usr/bin/env bats

setup() {
  load fixtures
}

@test "testing tidy.php with all rules enabled" {
  run php tidy.php --no-backup -f -q tests/tidy/tmp-fixtures/all
  [ "$status" -eq 0 ]
  [ "$output" = "" ]

  files=`find tests/tidy/expected-fixtures/all -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/all/$base)
    [ "$out" = "" ]
  done
}

@test "testing tidy.php with all rules options enabled (should be the same as previous test above)" {
  load fixtures

  run php tidy.php -w -n -N -e --no-backup -f -q tests/tidy/tmp-fixtures/all
  [ "$status" -eq 0 ]
  [ "$output" = "" ]

  files=`find tests/tidy/expected-fixtures/all -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/all/$base)
    [ "$out" = "" ]
  done
}
