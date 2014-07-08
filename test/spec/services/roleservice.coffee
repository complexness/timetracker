'use strict'

describe 'Service: roleService', ->

  # load the service's module
  beforeEach module 'timetrackerApp'

  # instantiate service
  roleService = {}
  beforeEach inject (_roleService_) ->
    roleService = _roleService_

  it 'should do something', ->
    expect(!!roleService).toBe true
