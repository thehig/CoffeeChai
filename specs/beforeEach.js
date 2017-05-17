/* eslint-disable */
beforeEach(function(){
  process.env.NODE_ENV = 'test';
  expect = require('chai').expect;
  l = console.log
  j = JSON.stringify
  nope = expect.fail
});
/* eslint-enable */
