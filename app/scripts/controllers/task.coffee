'use strict'

angular.module('timetrackerApp')
    .controller 'TaskCtrl', ($scope, taskService, taskCategoryService) ->

        $scope.tasks            = taskService.tasks
        $scope.taskCategories   = taskCategoryService.taskCategories

        # Firebase communication
        $scope.addTask = ->
            taskService.add
                taskID: $scope.taskID
                taskCategoryID: $scope.taskCategoryID
                name: $scope.name
            $scope.taskCategories.$child($scope.taskCategoryID + '/tasks/' + $scope.taskID).$set true
            # reset form
            $scope.taskID = 0
            $scope.taskCategoryID = $scope.description = ''
        $scope.deleteTask = (task) ->
            $scope.tasks.$remove task.taskID
            $scope.taskCategories.$child(task.taskCategoryID + '/tasks/').$remove task.taskID
        $scope.toggleTaskActive = (task) ->
            task = $scope.tasks.$child(task.taskID)
            if task.active
                task.$update active: false
            else
                task.$update active: true
