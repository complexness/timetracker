'use strict'

describe 'Controller: TaskcategoryCtrl', ->

  # load the controller's module
  beforeEach module 'timetrackerApp'

  TaskcategoryCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TaskcategoryCtrl = $controller 'TaskcategoryCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
