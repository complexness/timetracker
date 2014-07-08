'use strict'

angular.module('timetrackerApp')
  .controller 'TaskCategoryCtrl', ($scope, $firebase, FBURL, taskCategoryService) ->
        # $scope.taskCategories = taskCategoryService.taskCategories
        $ $scope.taskCategories = $firebase new Firebase "#{FBURL}taskCategories"

        $scope.addTaskCategory = ->
            console.log $scope.parentTaskCategoryID
            taskCategoryService.add
                taskCategoryID: $scope.taskCategoryID
                parentTaskCategoryID: $scope.parentTaskCategoryID
                name: $scope.name
            # reset form
            $scope.taskCategory = $scope.description = ''
        $scope.deleteTaskCategory = (taskCategory) ->
            taskCategoryService.remove taskCategory.taskCategoryID
        $scope.toggleTaskCategoryActive = (taskCategory) ->
            taskCategory = taskCategoryService.child(taskCategory.taskCategoryID)
            if taskCategory.active
                taskCategory.$update active: false
            else
                taskCategory.$update active: true