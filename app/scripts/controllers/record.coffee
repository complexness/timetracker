'use strict'

angular.module('timetrackerApp')
    .controller 'RecordCtrl', ($scope, recordService, taskService, userService) ->

        $scope.records = recordService.records
        $scope.tasks = taskService.tasks
        $scope.users = userService.users

        # Firebase communication
        $scope.addRecord = ->
            # TODO delete this after debugging
            console.log(Math.abs(new Date($scope.end) - new Date($scope.start))/1000/60/60)
            maxDuration = Math.max(Math.abs(new Date($scope.end) - new Date($scope.start))/1000/60/60, $scope.duration)
            # TODO delete this after debugging
            console.log('Duration: ' + maxDuration)

            recordService.add
                userID: $scope.userID
                taskID: $scope.taskID
                timeInterval:
                    start: $scope.start
                    end: $scope.end
                    duration: $scope.maxDuration
        $scope.removeRecord = (record) ->
            recordService.remove record