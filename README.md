Development Guide
=================

A set of (best?) practices that we follow at Percolate Studio.

## Linting

For pure javascript projects, grab `.eslintrc-percolate` and rename to `.eslintrc`. For other environments, copy `.eslintrc-percolate` and rename the appropriate environment specific file to `.eslintrc` .

To run the linter, either install eslint (`npm install -g eslint`) and run `eslint`, install an eslint extension to your editor, or rely on pre-commit hooks to run the linting.
