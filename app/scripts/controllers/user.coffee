'use strict'

angular.module('timetrackerApp')
    .controller 'UserCtrl', ($scope, $firebase, FBURL) ->
        $scope.users = $firebase(new Firebase(FBURL + 'users'))
        $scope.addUser = ->
            user = $scope.users.$child($scope.nickname)
            user.$set
                nickname: $scope.nickname
                name:
                    first: $scope.first
                    last: $scope.last
                email: $scope.email
                startDate: $scope.startDate
                salaryPerHour: $scope.salaryPerHour
                role: 'standard'
                active: true
            $scope.first = $scope.last = $scope.email = $scope.startDate = ''
            $scope.salaryPerHour = 0
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