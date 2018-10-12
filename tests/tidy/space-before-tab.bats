#!/usr/bin/env bats

setup() {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures
}

@test "Clean spaces before tabs" {
  run php tidy.php --clean-space-before-tab --no-backup -f -q tests/tidy/tmp-fixtures/space-before-tab
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/space-before-tab -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/space-before-tab/$base)" = "" ]
  done
}
