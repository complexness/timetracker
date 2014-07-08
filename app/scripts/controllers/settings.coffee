'use strict'

angular.module('timetrackerApp')
  .controller 'SettingsCtrl', ($scope, $firebase, FBURL, authService) ->
    $scope.loginEmail
