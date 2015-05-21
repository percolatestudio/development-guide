# Testing and Linting

## Lint

Install eslint with `npm install -g eslint` then run `./tests/lint.sh`

## Test

Run `./tests/test.sh` to run the project's tests.

## Pre-commit hook

To enable the tinytest and eslint enabled pre-commit hook, copy this `tests` directory into the root of your Meteor project, then run `./tests/install-hook.sh`.
