/* eslint-disable */

// Phantomjs script to run tests and collect output
//
// Linting is disabled to keep file as close as possible to the original
// from: meteor/packages/test-in-console/runner.js
//
// Modified to retry loading the page rather than relying on the dodgy sleep
// in run.sh
var page = require('webpage').create();
var system = require('system');
var platform = system.args[1] || "local";
console.log("Running Meteor tests in PhantomJS... " + system.env.URL);
page.onConsoleMessage = function (message) {
  console.log(message);
};

function openPage() {
  page.open(system.env.URL + platform, function(status) {
    if (status === 'success')
      startCheckingTests();
    else
      setTimeout(openPage, 3000);
  });
}

function startCheckingTests() {
  setInterval(function () {
    var done = page.evaluate(function () {
      if (typeof TEST_STATUS !== 'undefined')
        return TEST_STATUS.DONE;
      return typeof DONE !== 'undefined' && DONE;
    });
    if (done) {
      var failures = page.evaluate(function () {
        if (typeof TEST_STATUS !== 'undefined')
          return TEST_STATUS.FAILURES;
        if (typeof FAILURES === 'undefined') {
          return 1;
        }
        return 0;
      });
      phantom.exit(failures ? 1 : 0);
    }
  }, 500);
}

openPage();

