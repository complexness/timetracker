'use strict'

angular.module('timetrackerApp')
    .controller 'TaskCtrl', ($scope, $firebase, FBURL) ->
        $scope.tasks = $firebase(new Firebase(FBURL + 'tasks'))
        $scope.addTask = ->
            task = $scope.tasks.$child($scope.number)
            task.$set({
                number: $scope.number,
                category: $scope.category,
                description: $scope.description,
                active: true
            })
            $scope.number = 0
            $scope.category = ''
            $scope.description = ''
        $scope.deleteTask = (task) ->
            $scope.tasks.$remove(task.number)
        $scope.toggleTaskActive = (task) ->
            task = $scope.tasks.$child(task.number)
            if task.active
                task.$update({active: false})
            else
                task.$update({active: true})
