'use strict'

describe 'Filter: idToName', ->

  # load the filter's module
  beforeEach module 'timetrackerApp'

  # initialize a new instance of the filter before each test
  idToName = {}
  beforeEach inject ($filter) ->
    idToName = $filter 'idToName'

  it 'should return the input prefixed with "idToName filter:"', ->
    text = 'angularjs'
    expect(idToName text).toBe ('idToName filter: ' + text)
