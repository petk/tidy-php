#!/usr/bin/env bats

setup() {
  load fixtures
}

@test "Fix end of lines. No whitespace fixes, no redundant EOL fixes, no missing final new lines added." {
  run php tidy.php --eol --no-backup -f -q tests/tidy/tmp-fixtures/end-of-line
  [ "$status" -eq 0 ]
  [ "$output" = "" ]

  files=`find tests/tidy/expected-fixtures/end-of-line -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/end-of-line/$base)
    [ "$out" = "" ]
  done
}

@test "Fix end of lines using manual EOL. No whitespace fixes, no redundant EOL fixes, no missing final new lines added." {
  load fixtures

  run php tidy.php --eol=CRLF --no-backup -f -q tests/tidy/tmp-fixtures/end-of-line-overriden-crlf
  [ "$status" -eq 0 ]
  [ "$output" = "" ]

  files=`find tests/tidy/expected-fixtures/end-of-line-overriden-crlf -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/end-of-line-overriden-crlf/$base)
    [ "$out" = "" ]
  done
}

@test "Fix end of lines using manual EOL short option syntax. No whitespace fixes, no redundant EOL fixes, no missing final new lines added." {
  load fixtures

  run php tidy.php -e=LF --no-backup -f -q tests/tidy/tmp-fixtures/end-of-line-overriden-lf
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
  
  files=`find tests/tidy/expected-fixtures/end-of-line-overriden-lf -type f`

  for file in $files; do
    base=$(basename $file)

    out=$(cmp $file tests/tidy/tmp-fixtures/end-of-line-overriden-lf/$base)
    [ "$out" = "" ]
  done
}
