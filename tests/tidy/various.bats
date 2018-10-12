#!/usr/bin/env bats

setup() {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures
}

@test "Whitespace fixes, no EOL fixes" {
  run php tidy.php --trim-trailing-whitespace --no-backup -f -q tests/tidy/tmp-fixtures/whitespace
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/whitespace -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/whitespace/$base)" = "" ]
  done
}

@test "EOL fixes, no whitespace fixes" {
  run php tidy.php --trim-final-newlines --no-backup -f -q tests/tidy/tmp-fixtures/eol
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/eol -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/eol/$base)" = "" ]
  done
}
