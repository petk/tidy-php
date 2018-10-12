#!/usr/bin/env bats

@test "invoking tidy with invalid option -X" {
  run php tidy.php -X
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: invalid option(s) '-X'
Try 'php tidy.php --help' for more info." ]
}

@test "invoking tidy with invalid option -Q0" {
  run php tidy.php -Q0 -w tests/tidy/tmp-fixtures
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: invalid option(s) '-Q0'
Try 'php tidy.php --help' for more info." ]
}

@test "invoking tidy with invalid option -Q=0" {
  run php tidy.php -Q=0 -w tests/tidy/tmp-fixtures
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: invalid option(s) '-Q=0'
Try 'php tidy.php --help' for more info." ]
}

@test "invoking tidy with invalid option --trim-trailing-newlines=0" {
  run php tidy.php --trim-trailing-newlines=0 -w tests/tidy/tmp-fixtures
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: invalid option(s) '--trim-trailing-newlines=0'
Try 'php tidy.php --help' for more info." ]
}

@test "invoking tidy with long invalid options" {
  run php tidy.php --non-existent-option --second-non-existent-option -w tests/tidy/tmp-fixtures
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: invalid option(s) '--non-existent-option, --second-non-existent-option'
Try 'php tidy.php --help' for more info." ]
}
