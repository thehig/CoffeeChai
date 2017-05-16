require('./beforeEach')

describe 'Coffeescript Tests', ->
  it 'true == true', -> expect(true).to.be.true
  it 'true == false to throw', -> expect( -> expect(true).to.be.false).to.throw