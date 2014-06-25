'use strict'

describe 'Controller: AuthCtrl', ->

  # load the controller's module
  beforeEach module 'timetrackerApp'

  AuthCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AuthCtrl = $controller 'AuthCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
