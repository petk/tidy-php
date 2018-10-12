#!/usr/bin/env bats

setup() {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures
}

@test "testing tidy.php tidying a single file" {
  run php tidy.php --trim-trailing-whitespace --eol --no-backup -f -q tests/tidy/tmp-fixtures/phpt-w/test_2.phpt
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  [ "$(cmp tests/tidy/expected-fixtures/phpt-w/test_2.phpt tests/tidy/tmp-fixtures/phpt-w/test_2.phpt)" = "" ]
}
