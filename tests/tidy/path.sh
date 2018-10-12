#!/bin/sh

red="\e[31m"
green="\e[32m"
default="\e[39m"

output="$(php tidy.php -q)"

valid="tidy.php: missing path
Try 'php tidy.php --help' for more info."

case "$output" in
  "$valid"*)
    echo "${green}PASS${default}: Path test 1"
  ;;
  *)
    echo "${red}FAIL${default}: Path test 1"
  ;;
esac

output="$(php tidy.php --no-colors)"
case "$output" in
  "$valid"*)
    echo "${green}PASS${default}: Path test 2"
  ;;
  *)
    echo "${red}FAIL${default}: Path test 2"
  ;;
esac

output="$(php tidy.php --no-backup)"
case "$output" in
  "$valid"*)
    echo "${green}PASS${default}: Path test 3"
  ;;
  *)
    echo "${red}FAIL${default}: Path test 3"
  ;;
esac

output="$(php tidy.php -q --no-backup this-path-does-not-exist-foo-bar)"
case "$output" in
  "$valid"*)
    echo "${green}PASS${default}: Path test 4"
  ;;
  *)
    echo "${red}FAIL${default}: Path test 4"
  ;;
esac
