#!/usr/bin/env bats

setup() {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures
}

@test "Insert final newline if missing. No whitespace fixes, no redundant EOL fixes." {
  run php tidy.php --insert-final-newline --no-backup -f -q tests/tidy/tmp-fixtures/final-newline
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/final-newline -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/final-newline/$base)" = "" ]
  done
}
