#!/usr/bin/env bats

setup() {
  load fixtures
}

@test "Exit codes - Whitespace checking" {
  run php tidy.php -w --no-backup -q tests/tidy/tmp-fixtures/whitespace
  [ "$status" -eq 1 ]
  [ "$output" = "" ]
}

@test "Exit codes - EOL checking, no whitespace checking" {
  run php tidy.php -N --no-backup -q tests/tidy/tmp-fixtures/eol
  [ "$status" -eq 1 ]
  [ "$output" = "" ]
}

@test "Exit codes - Fix all" {
  run php tidy.php -w -n -N --no-backup -q -f tests/tidy/tmp-fixtures/eol
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}
