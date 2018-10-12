#!/usr/bin/env bats

setup() {
  load fixtures
}

@test "Insert final newline if missing. No whitespace fixes, no redundant EOL fixes." {
  run php tidy.php --insert-final-newline --no-backup -f -q tests/tidy/tmp-fixtures/final-newline
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/final-newline -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/final-newline/$base)
    [ "$out" = "" ]
  done
}

@test "Set maximum newlines to zero and insert final newline if missing - edge case." {
  load fixtures

  run php tidy.php --insert-final-newline --trim-final-newlines=0 --no-backup -f -q tests/tidy/tmp-fixtures/final-newline-2
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/final-newline-2 -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/final-newline-2/$base)
    [ "$out" = "" ]
  done
}
