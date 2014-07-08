'use strict'

describe 'Service: taskCategoryService', ->

  # load the service's module
  beforeEach module 'timetrackerApp'

  # instantiate service
  taskCategoryService = {}
  beforeEach inject (_taskCategoryService_) ->
    taskCategoryService = _taskCategoryService_

  it 'should do something', ->
    expect(!!taskCategoryService).toBe true
