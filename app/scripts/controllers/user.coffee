'use strict'

angular.module('timetrackerApp')
    .controller 'UserCtrl', ($scope, $firebase, FBURL) ->
        $scope.roles = $firebase(new Firebase(FBURL + 'roles'))
        $scope.users = $firebase(new Firebase(FBURL + 'users'))
        $scope.addUser = ->
            $scope.users.$add
                name:
                    first: $scope.nameFirst
                    last: $scope.nameLast
                login:
                    email: $scope.loginEmail
                    password: $scope.loginPassword
                job:
                    description: $scope.jobDescription
                    startDate: $scope.jobStartDate
                    payRatePerHour: $scope.jobPayRatePerHour
                role: $scope.role.roleID
            .then (reference) ->
                # add userID to user
                userID = reference.name()
                user = $scope.users.$child(userID)
                user.$update 'userID': userID
                user.$priority = $scope.loginEmail
                $scope.users.$save(userID)
                # add reference to users in roles
                $scope.roles.$child($scope.role.roleID + '/users/' + userID).$set true
            # blank form
            $scope.nameFirst = $scope.nameLast = ''
            $scope.loginEmail = $scope.loginPassword = ''
            $scope.jobDescription = ''
            $scope.jobStartDate = ''
            $scope.payRatePerHour = 0
        $scope.deleteUser = (user) ->
            $scope.users.$remove(user.userID)
            $scope.roles.$child(user.role + '/users/').$remove(user.userID)
        $scope.updateUserRole = (user, roleDst) ->
            roleSrc = user.role
            $scope.users.$child(user.userID).$update role: roleDst
            $scope.roles.$child(roleSrc + '/users/').$remove(user.userID)
            $scope.roles.$child(roleDst + '/users/' + user.userID).$set true