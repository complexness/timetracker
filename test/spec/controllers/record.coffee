'use strict'

describe 'Controller: RecordCtrl', () ->

  # load the controller's module
  beforeEach module 'timetrackerApp'

  RecordCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RecordCtrl = $controller 'RecordCtrl', {
      $scope: scope
    }

  it 'contains spec with an expectation', () ->
    expect(true).toBe true
