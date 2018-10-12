#!/usr/bin/env bats

setup() {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures
}

@test "Trim final newlines and leave 3 if present. No whitespace fixes" {
  run php tidy.php --trim-leading-newlines --no-backup -f -q tests/tidy/tmp-fixtures/leading-newlines
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/leading-newlines -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/leading-newlines/$base)" = "" ]
  done
}
