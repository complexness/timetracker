'use strict'

describe 'Controller: TasksCtrl', () ->

  # load the controller's module
  beforeEach module 'timetrackerApp'

  TasksCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TasksCtrl = $controller 'TasksCtrl', {
      $scope: scope
    }

  it 'contains spec with an expectation', () ->
    expect(true).toBe true
