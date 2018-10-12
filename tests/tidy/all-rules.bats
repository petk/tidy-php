#!/usr/bin/env bats

setup() {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures
}

@test "testing tidy.php with all basic rules enabled" {
  run php tidy.php --no-backup -f -q tests/tidy/tmp-fixtures/all
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/all -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/all/$base)" = "" ]
  done
}

@test "testing tidy.php with all basic rules options enabled (should be the same as previous test above)" {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

  run php tidy.php -w -n -N -e --no-backup -f -q tests/tidy/tmp-fixtures/all
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/all -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/all/$base)" = "" ]
  done
}
