#!/usr/bin/env bats

@test "Testing usage 1" {
  run php tidy.php
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "  NAME" ]
  [ "${lines[1]}" = "    tidy.php - tidy whitespace and end of lines" ]
  [ "${lines[2]}" = "  SYNOPSIS" ]
  [ "${lines[3]}" = "    php tidy.php [OPTION...] input-path" ]
  [ "${lines[4]}" = "  DESCRIPTION" ]
}

@test "Testing usage 2" {
  run php tidy.php -h
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "  NAME" ]
  [ "${lines[1]}" = "    tidy.php - tidy whitespace and end of lines" ]
  [ "${lines[2]}" = "  SYNOPSIS" ]
  [ "${lines[3]}" = "    php tidy.php [OPTION...] input-path" ]
  [ "${lines[4]}" = "  DESCRIPTION" ]
}

@test "Testing usage 3" {
  run php tidy.php -h
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "  NAME" ]
  [ "${lines[1]}" = "    tidy.php - tidy whitespace and end of lines" ]
  [ "${lines[2]}" = "  SYNOPSIS" ]
  [ "${lines[3]}" = "    php tidy.php [OPTION...] input-path" ]
  [ "${lines[4]}" = "  DESCRIPTION" ]
}

@test "Testing usage 4" {
  run php tidy.php --help
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "  NAME" ]
  [ "${lines[1]}" = "    tidy.php - tidy whitespace and end of lines" ]
  [ "${lines[2]}" = "  SYNOPSIS" ]
  [ "${lines[3]}" = "    php tidy.php [OPTION...] input-path" ]
  [ "${lines[4]}" = "  DESCRIPTION" ]
}

@test "Testing usage 5" {
  run php tidy.php --help -q
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "  NAME" ]
  [ "${lines[1]}" = "    tidy.php - tidy whitespace and end of lines" ]
  [ "${lines[2]}" = "  SYNOPSIS" ]
  [ "${lines[3]}" = "    php tidy.php [OPTION...] input-path" ]
  [ "${lines[4]}" = "  DESCRIPTION" ]
}
