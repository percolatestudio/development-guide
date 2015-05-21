#!/bin/bash
# Runs linting then tests. Fails on non-zero exit codes and passes them through.
#
# usage: run-all.sh

BASE_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

# Lint
$BASE_DIR/lint.sh

STATUS=$?

if [[ "$STATUS" != 0 ]]; then
  exit $STATUS
fi

# Test
exec $BASE_DIR/test.sh
