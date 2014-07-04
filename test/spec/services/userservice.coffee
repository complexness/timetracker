'use strict'

describe 'Service: userService', ->

  # load the service's module
  beforeEach module 'timetrackerApp'

  # instantiate service
  userService = {}
  beforeEach inject (_userService_) ->
    userService = _userService_

  it 'should do something', ->
    expect(!!userService).toBe true
