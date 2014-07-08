'use strict'

describe 'Service: taskService', ->

  # load the service's module
  beforeEach module 'timetrackerApp'

  # instantiate service
  taskService = {}
  beforeEach inject (_taskService_) ->
    taskService = _taskService_

  it 'should do something', ->
    expect(!!taskService).toBe true
