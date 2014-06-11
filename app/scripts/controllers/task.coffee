'use strict'

angular.module('timetrackerApp')
    .controller 'TaskCtrl', ($scope, $firebase, FBURL) ->
        $scope.tasks = $firebase(new Firebase(FBURL + 'tasks'))
        $scope.taskCategories = $firebase(new Firebase(FBURL + 'taskCategories'))

        # Display values
        taskCategories = []
        $scope.taskCategories.$on "loaded", (snapshot) ->
            taskCategories = snapshot
        $scope.taskCategoryName = (taskCategoryID) ->
            return taskCategories[taskCategoryID].name

        # Firebase communication
        $scope.addTask = ->
            $scope.tasks.$child($scope.taskID).$set
                taskID: $scope.taskID,
                taskCategoryID: $scope.taskCategory.taskCategoryID,
                name: $scope.name,
                active: true
            $scope.taskCategories.$child($scope.taskCategory.taskCategoryID + '/tasks/' + $scope.taskID).$set true
            # reset form
            $scope.number = 0
            $scope.category = $scope.description = ''
        $scope.deleteTask = (task) ->
            $scope.tasks.$remove task.taskID
            $scope.taskCategories.$child(task.taskCategoryID + '/tasks/').$remove task.taskID
        $scope.toggleTaskActive = (task) ->
            task = $scope.tasks.$child(task.taskID)
            if task.active
                task.$update active: false
            else
                task.$update active: true
