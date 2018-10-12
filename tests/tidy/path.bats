#!/usr/bin/env bats

setup() {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures
}

@test "Testing missing path 1" {
  run php tidy.php -q
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: missing path
Try 'php tidy.php --help' for more info." ]
}

@test "Testing missing path 2" {
  run php tidy.php --no-colors
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: missing path
Try 'php tidy.php --help' for more info." ]
}

@test "Testing missing path 3" {
  run php tidy.php --no-backup
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: missing path
Try 'php tidy.php --help' for more info." ]
}

@test "Testing missing path 4" {
  run php tidy.php -q --no-backup this-path-does-not-exist-foo-bar
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: missing path
Try 'php tidy.php --help' for more info." ]
}
