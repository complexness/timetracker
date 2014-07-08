'use strict'

angular.module('timetrackerApp')
    .factory 'taskService', ($filter, $firebase, FBURL, taskCategoryService) ->

        # Private variables
        tasks = $firebase new Firebase "#{FBURL}tasks"
        list = []
        tasks.$on 'loaded', (snapshot) ->
            list = snapshot

        # Private methods
        setPriority = (task, priority) ->
            taskID = task.taskID
            tasks.$child("#{taskID}").$priority = priority
            tasks.$save taskID

        # Public API
        {
            tasks: tasks
            add: (task) ->
                tasks.$child(task.taskID).$set
                    taskID: task.taskID
                    taskCategoryID: task.taskCategoryID
                    name: task.name
                    active: true
            child: (ID) ->
            getName: (taskID) ->
                "#{taskID} - #{$filter('IDToName')(list[taskID].taskCategoryID, 'taskCategory')} - #{list[taskID].name}"
            remove: (object) ->
                # delete object from Firebase
                # delete object references
            update: (object, data) ->
                # remove references if changed
                # update object
        }
