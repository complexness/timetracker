'use strict'

angular.module('timetrackerApp')
  .controller 'AuthCtrl', ($scope, $location, authService, userService, defaultJobDescription, californiaMinimumWage) ->
    $scope.auth = authService.auth
    $scope.getCurrentUser = ->
        authService.getCurrentUser()
    $scope.login = ->
        authService.login $scope.loginEmail, $scope.loginPassword
    $scope.logout = ->
        authService.logout()
        $location.path '/'
    $scope.changePassword = ->
        user = authService.getCurrentUser()
        authService.changePassword user.email, $scope.oldPassword, $scope.newPassword
        $scope.oldPassword = $scope.newPassword = ''
    $scope.createUser = ->
        authService.createUser $scope.loginEmail, $scope.loginPassword
        userService.addUser
            name:
                first: $scope.nameFirst
                last: $scope.nameLast
            email: $scope.loginEmail
            roleID: 'standard'
            job:
                description: defaultJobDescription
                payRatePerHour: californiaMinimumWage
                startDate: new Date().setHours(0, 0, 0, 0)
        $scope.nameFirst = $scope.nameLast = $scope.loginEmail = $scope.loginPassword = ''
        $location.path '/'
    $scope.removeUser = ->
        authService.removeUser $scope.loginEmail, $scope.loginPassword
    $scope.sendPasswordResetEmail = ->
        authService.sendPasswordResetEmail $scope.loginEmail
        $scope.loginEmail = ''
