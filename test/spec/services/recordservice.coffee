'use strict'

describe 'Service: recordService', ->

  # load the service's module
  beforeEach module 'timetrackerApp'

  # instantiate service
  recordService = {}
  beforeEach inject (_recordService_) ->
    recordService = _recordService_

  it 'should do something', ->
    expect(!!recordService).toBe true
