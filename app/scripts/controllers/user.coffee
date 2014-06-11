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
                role: $scope.role.name
            .then (reference) ->
                userID = reference.name()
                user = $scope.users.$child(userID)
                user.$update 'userID': userID
                user.$priority = $scope.loginEmail
                $scope.users.$save(userID)
                $scope.roles.$child($scope.role.name).$add reference.name(): true
            # blank form
            $scope.nameFirst = $scope.nameLast = ''
            $scope.loginEmail = $scope.loginPassword = ''
            $scope.jobDescription = ''
            $scope.jobStartDate = ''
            $scope.payRatePerHour = 0
        $scope.deleteUser = (user) ->
            $scope.users.$remove(user.userID)
        $scope.updateUserRole = (user, r) ->
            user = $scope.users.$child(user.userID)
            user.$update role: r