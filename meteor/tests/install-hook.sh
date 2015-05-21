#!/bin/bash
# Installs a pre-push hook that won't allow a commit failing tests to push
# to devel or master

BASE_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

ln -fs $BASE_DIR/pre-push $BASE_DIR/../.git/hooks