#!/bin/sh

red="\e[31m"
green="\e[32m"
default="\e[39m"

output="$(php tidy.php -k)"

valid="tidy.php: invalid option(s) '-k'
Try 'php tidy.php --help' for more info."

case "$output" in
  $valid*)
    echo "${green}PASS${default}: Test for invalid option"
  ;;
  *)
    echo "${red}FAIL${default}: Test for invalid option"
  ;;
esac


output="$(php tidy.php -Q0 -w tests/tidy/tmp-fixtures)"

valid="tidy.php: invalid option(s) '-Q0'
Try 'php tidy.php --help' for more info."

case "$output" in
  $valid*)
    echo "${green}PASS${default}: Test for invalid option 2"
  ;;
  *)
    echo "${red}FAIL${default}: Test for invalid option 2"
  ;;
esac


output="$(php tidy.php -Q=0 -w tests/tidy/tmp-fixtures)"

valid="tidy.php: invalid option(s) '-Q=0'
Try 'php tidy.php --help' for more info."

case "$output" in
  $valid*)
    echo "${green}PASS${default}: Test for invalid option 2"
  ;;
  *)
    echo "${red}FAIL${default}: Test for invalid option 2"
  ;;
esac


output="$(php tidy.php --trim-trailing-newlines=0 -w tests/tidy/tmp-fixtures)"

valid="tidy.php: invalid option(s) '--trim-trailing-newlines=0'
Try 'php tidy.php --help' for more info."

case "$output" in
  $valid*)
    echo "${green}PASS${default}: Test for invalid option 2"
  ;;
  *)
    echo "${red}FAIL${default}: Test for invalid option 2"
  ;;
esac
