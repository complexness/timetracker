'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach module 'timetrackerApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  it 'contains spec with an expectation', () ->
    expect(true).toBe true
