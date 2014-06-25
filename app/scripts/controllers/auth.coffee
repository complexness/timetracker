'use strict'

###*
 # @ngdoc function
 # @name timetrackerApp.controller:AuthCtrl
 # @description
 # # AuthCtrl
 # Controller of the timetrackerApp
###
angular.module('timetrackerApp')
  .controller 'AuthCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
