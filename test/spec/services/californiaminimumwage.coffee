'use strict'

describe 'Service: californiaMinimumWage', ->

  # load the service's module
  beforeEach module 'timetrackerApp'

  # instantiate service
  californiaMinimumWage = {}
  beforeEach inject (_californiaMinimumWage_) ->
    californiaMinimumWage = _californiaMinimumWage_

  it 'should do something', ->
    expect(!!californiaMinimumWage).toBe true
