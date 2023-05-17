#!/bin/sh

# Build Docker image
docker build -t petk/tidy-tests -f ./tests/Dockerfile . || exit 1

BATS="docker run -i -v `pwd`:/opt/app -w /opt/app petk/tidy-tests:latest bats"

$BATS tests/tidy
