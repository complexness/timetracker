'use strict'

describe 'Controller: TaskCtrl', () ->

  # load the controller's module
  beforeEach module 'timetrackerApp'

  TaskCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TaskCtrl = $controller 'TaskCtrl', {
      $scope: scope
    }

  it 'contains spec with an expectation', () ->
    expect(true).toBe true
