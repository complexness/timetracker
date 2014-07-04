'use strict'

angular.module('timetrackerApp')
    .controller 'UserCtrl', ($scope, userService) ->
        $scope.roles = userService.roles
        $scope.users = userService.users
        $scope.addUser = ->
            userService.addUser
                email: $scope.loginEmail
                name:
                    first: $scope.nameFirst
                    last: $scope.nameLast
                roleID: $scope.role.roleID
                job:
                    description: $scope.jobDescription
                    startDate: $scope.jobStartDate
                    payRatePerHour: $scope.jobPayRatePerHour
            # blank form
            $scope.nameFirst = $scope.nameLast = ''
            $scope.loginEmail = $scope.loginPassword = ''
            $scope.jobDescription = ''
            $scope.jobStartDate = ''
            $scope.payRatePerHour = 0
            # TODO tell user that update is successful
        $scope.deleteUser = (user) ->
            userService.remove(user)
            # TODO tell user that deletion is successful
        $scope.updateUserRole = (user, roleDst) ->
            userService.updateUserRole(user, roleDst)
            # TODO tell user that update is successful