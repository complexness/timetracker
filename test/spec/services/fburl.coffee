'use strict'

describe 'Service: FBURL', ->

  # load the service's module
  beforeEach module 'timetrackerApp'

  # instantiate service
  FBURL = {}
  beforeEach inject (_FBURL_) ->
    FBURL = _FBURL_

  it 'should do something', ->
    expect(!!FBURL).toBe true
