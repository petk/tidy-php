#!/bin/sh

red="\e[31m"
green="\e[32m"
default="\e[39m"
me=`basename "$0"`

output="$(php tidy.php)"

valid="  NAME
    tidy.php - tidy whitespace and end of lines

  SYNOPSIS
    php tidy.php [OPTION...] input-path

  DESCRIPTION
"

case "$output" in
  "$valid"*)
    echo "${green}PASS${default}: $me: Usage output test 1"
  ;;
  *)
    echo "${red}FAIL${default}: $me: Usage output test 1"
  ;;
esac

output="$(php tidy.php -h)"
case "$output" in
  "$valid"*)
    echo "${green}PASS${default}: $me: Usage output test 2"
  ;;
  *)
    echo "${red}FAIL${default}: $me: Usage output test 2"
  ;;
esac

output="$(php tidy.php --help)"
case "$output" in
  "$valid"*)
    echo "${green}PASS${default}: $me: Usage output test 3"
  ;;
  *)
    echo "${red}FAIL${default}: $me: Usage output test 3"
  ;;
esac

output="$(php tidy.php --help -q)"
case "$output" in
  "$valid"*)
    echo "${green}PASS${default}: $me: Usage output test 4"
  ;;
  *)
    echo "${red}FAIL${default}: $me: Usage output test 4"
  ;;
esac
