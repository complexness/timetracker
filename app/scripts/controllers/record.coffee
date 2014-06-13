'use strict'

angular.module('timetrackerApp')
  .controller 'RecordCtrl', ($scope, $firebase, FBURL) ->
        $scope.records = $firebase(new Firebase(FBURL + 'records'))
        $scope.tasks = $firebase(new Firebase(FBURL + 'tasks'))
        $scope.users = $firebase(new Firebase(FBURL + 'users'))

        # load (once) task categories for task lists
        taskCategories = []
        $firebase(new Firebase(FBURL + 'taskCategories')).$on "loaded", (snapshot) ->
            taskCategories = snapshot
        # load (once) tasks for ID-names conversion
        tasks = []
        $scope.tasks.$on "loaded", (snapshot) ->
            tasks = snapshot
        # load (once) users for ID-names conversion
        users = []
        $scope.users.$on "loaded", (snapshot) ->
            users = snapshot

        $scope.taskCategoryName = (taskCategoryID) ->
            return taskCategories[taskCategoryID].name
        $scope.taskName = (taskID) ->
            return taskID + ' - ' + $scope.taskCategoryName(tasks[taskID].taskCategoryID) + ' - ' +  tasks[taskID].name
        $scope.userName = (userID) ->
            return users[userID].name.first + ' ' + users[userID].name.last

        # Firebase communication
        $scope.addRecord = ->
            console.log(Math.abs(new Date($scope.end) - new Date($scope.start))/1000/60/60)
            maxDuration = Math.max(Math.abs(new Date($scope.end) - new Date($scope.start))/1000/60/60, $scope.duration)
            console.log('Duration: ' + maxDuration)
            $scope.records.$add
                userID: $scope.user.userID,
                taskID: $scope.task.taskID,
                timeInterval:
                    start: $scope.start,
                    end: $scope.end,
                    duration: maxDuration
            .then (reference) ->
                # add userID to user
                recordID = reference.name()
                record = $scope.records.$child(recordID)
                record.$update 'recordID': recordID
                record.$priority = $scope.userID
                $scope.records.$save(recordID)
                # add reference to record in user
                $firebase(new Firebase(FBURL + 'users')).$child($scope.user.userID + '/records/' + recordID).$set true
        $scope.deleteRecord = (record) ->
            $scope.records.$remove record.recordID
            $firebase(new Firebase(FBURL + 'users')).$child(record.userID + '/records/').$remove record.recordID