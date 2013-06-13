chai = require 'chai'
chai.should()

collector = require '../lib'

describe 'collector', ->
  it 'should work :)', -> # TODO: better tests
    collector1 = collector()
    func1 = ->
      collector1.collect 'collected1'
      'returned1'
    func2 = ->
      collector1.collect 'collected2'
      'returned2'
    func1 = collector1.attach func1
    func2 = collector1.attach func2
    func1().join(' ').should.equal 'collected1 returned1'
    func2().join(' ').should.equal 'collected2 returned2'