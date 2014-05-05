'use strict'

describe 'Controller: UserCtrl', () ->

  # load the controller's module
  beforeEach module 'timetrackerApp'

  UserCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    UserCtrl = $controller 'UserCtrl', {
      $scope: scope
    }

  it 'contains spec with an expectation', () ->
    expect(true).toBe true
