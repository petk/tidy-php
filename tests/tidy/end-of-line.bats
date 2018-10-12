#!/usr/bin/env bats

setup() {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures
}

@test "Fix end of lines. No whitespace fixes, no redundant EOL fixes, no missing final new lines added." {
  run php tidy.php --eol --no-backup -f -q tests/tidy/tmp-fixtures/end-of-line
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/end-of-line -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/end-of-line/$base)" = "" ]
  done
}

@test "Fix end of lines using manual EOL. No whitespace fixes, no redundant EOL fixes, no missing final new lines added." {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

  run php tidy.php --eol=CRLF --no-backup -f -q tests/tidy/tmp-fixtures/end-of-line-overriden-crlf
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/end-of-line-overriden-crlf -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/end-of-line-overriden-crlf/$base)" = "" ]
  done
}

@test "Fix end of lines using manual EOL short option syntax. No whitespace fixes, no redundant EOL fixes, no missing final new lines added." {
  rm -rf tests/tidy/tmp-fixtures
  cp -r tests/tidy/source-fixtures tests/tidy/tmp-fixtures

  run php tidy.php -e=LF --no-backup -f -q tests/tidy/tmp-fixtures/end-of-line-overriden-lf
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/end-of-line-overriden-lf -type f`

  for file in $files; do
    base=$(basename $file)

    [ "$(cmp $file tests/tidy/tmp-fixtures/end-of-line-overriden-lf/$base)" = "" ]
  done
}
