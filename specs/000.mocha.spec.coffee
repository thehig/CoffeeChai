require('./beforeEach')
addition = require('../src/index').addition

describe 'Coffeescript Tests', ->
  it 'true == true', -> expect(true).to.be.true

  describe 'errors when', ->
    expectError = (testItem, index) ->
      it '(' + index + ') ' + testItem.description, ->
        testItem.preTest && testItem.preTest() # Only call pretest if supplied
        expect( -> testItem.test()).to.throw(testItem.expectedError)

    expectError(item, i) for item, i in [
      {
        description: 'true to be false',
        test: -> expect(true).to.be.false,
        expectedError: 'expected true to be false'
      },
      {
        description: '2+2=5',
        test: -> expect(2+2).to.equal(5),
        expectedError: 'expected 4 to equal 5'
      },
    ]

  describe 'addition', ->
    it 'is not null', -> expect(addition).to.not.be.null
    it 'is a function', -> expect(addition).to.be.a.function
    
    expectOutput = (testItem, index) ->
      it '(' + index + ') ' + testItem.description, ->
        testItem.preTest && testItem.preTest() # Only call pretest if supplied
        expect(testItem.test()).to.equal(testItem.result)
    
    expectOutput(item, i) for item, i in [
      { description: '1+1=2', result: 2, test:->addition(1, 1) }
      { description: '-1+-1=-2', result: -2, test:->addition(-1, -1) }
      { description: '5+-5=0', result: 0, test:->addition(5, -5) }
    ]


