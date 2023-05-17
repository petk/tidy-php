#!/bin/sh

# Build Docker image
docker build -t petk/tidy-tests -f ./tests/Dockerfile . || exit 1

FIXER="docker run -it -v `pwd`:/opt/app petk/tidy-tests:latest php-cs-fixer"

$FIXER --dry-run -v fix tidy.php
