'use strict'

angular.module('timetrackerApp')
    .controller 'UserCtrl', ($scope, userService, roleService) ->

        $scope.roles = roleService.roles
        $scope.users = userService.users

        $scope.addUser = ->
            userService.add
                email: $scope.loginEmail
                name:
                    first: $scope.nameFirst
                    last: $scope.nameLast
                roleID: $scope.role.roleID
                job:
                    description: $scope.jobDescription
                    startDate: $scope.jobStartDate
                    payRatePerHour: $scope.jobPayRatePerHour
            # reset form
            $scope.nameFirst = $scope.nameLast = ''
            $scope.loginEmail = ''
            $scope.jobDescription = ''
            $scope.jobStartDate = ''
            $scope.payRatePerHour = 0
            # TODO tell user that update is successful
        $scope.deleteUser = (user) ->
            userService.remove(user)
            # TODO tell user that deletion is successful
        $scope.updateUser = (user, roleDst) ->
            userService.update(user, userData)
            # TODO tell user that update is successful