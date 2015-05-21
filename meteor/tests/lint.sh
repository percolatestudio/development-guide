#!/bin/bash
# Runs eslint
#
# usage: lint.sh [additional eslint arguments]

BASE_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

# Will exit with status 1 for errors, 0 for pass and warnings
exec eslint $BASE_DIR/ $@
