'use strict'

describe 'Service: defaultJobDescription', ->

  # load the service's module
  beforeEach module 'timetrackerApp'

  # instantiate service
  defaultJobDescription = {}
  beforeEach inject (_defaultJobDescription_) ->
    defaultJobDescription = _defaultJobDescription_

  it 'should do something', ->
    expect(!!defaultJobDescription).toBe true
