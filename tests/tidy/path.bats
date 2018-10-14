#!/usr/bin/env bats

setup() {
  load fixtures
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
  run php tidy.php -w
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: missing path
Try 'php tidy.php --help' for more info." ]
}

@test "Testing missing path 4" {
  run php tidy.php -q this-path-does-not-exist-foo-bar
  [ "$status" -eq 1 ]
  [ "$output" = "tidy.php: missing path
Try 'php tidy.php --help' for more info." ]
}
