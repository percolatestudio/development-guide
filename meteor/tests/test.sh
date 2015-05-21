#!/bin/bash
# Runs tests from console (requires phantomjs)
#
# usage: run.sh [packages]
# 
# Passes packages through to test-packages 
#
# Modified from: meteor/packages/test-in-console/run.sh

# specify packages to test, or test all if unspecified
PACKAGES="$@"

# run that shit
BASE_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

export URL='http://localhost:4096/'

meteor test-packages $PACKAGES --driver-package test-in-console -p 4096 &
METEOR_PID=$!

phantomjs $BASE_DIR/runner.js
STATUS=$?

kill $METEOR_PID
exit $STATUS

