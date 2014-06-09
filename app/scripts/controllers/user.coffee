'use strict'

angular.module('timetrackerApp')
    .controller 'UserCtrl', ($scope, $firebase, FBURL) ->
        $scope.roles = [
            {name: 'root'},
            {name: 'admin'},
            {name: 'standard'}
        ]
        $scope.users = $firebase(new Firebase(FBURL + 'users'))
        $scope.addUser = ->
            user = $scope.users.$child('1')
            user.$set
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
                role: $scope.role
            $scope.nameFirst = $scope.nameLast = ''
            $scope.loginEmail = $scope.loginPassword = ''
            $scope.jobDescription = ''
            $scope.jobStartDate = ''
            $scope.payRatePerHour = 0
        $scope.deleteUser = (user) ->
            $scope.users.$remove(user.nickname)
        $scope.toggleUserActive = (user) ->
            user = $scope.users.$child(user.nickname)
            if user.active
                user.$update active: false
            else
                user.$update active: true
        $scope.updateUserRole = (user, r) ->
            user = $scope.users.$child(user.nickname)
            user.$update role: r