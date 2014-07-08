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
            authService.changePassword $scope.oldPassword, $scope.newPassword
            $scope.oldPassword = $scope.newPassword = ''
            # TODO notify user that password was changed
        $scope.createUser = ->
            authService.createUser $scope.loginEmail, $scope.loginPassword
            userService.add
                name:
                    first: $scope.nameFirst
                    last: $scope.nameLast
                email: $scope.loginEmail
                roleID: 'standard'
                job:
                    description: defaultJobDescription
                    payRatePerHour: californiaMinimumWage
                    startDate: new Date().setHours(0, 0, 0, 0)
            # redirect to login
            $location.path '/'
        $scope.removeUser = ->
            authService.removeUser $scope.loginPassword
            $location.path '/'
        $scope.sendPasswordResetEmail = ->
            authService.sendPasswordResetEmail $scope.loginEmail
            # TODO notify user that password was reset
            $location.path '/'