'use strict'

angular.module('timetrackerApp')
    .factory 'taskCategoryService', ($filter, $firebase, FBURL) ->

        # Private variables
        taskCategories = $firebase new Firebase "#{FBURL}taskCategories"
        list = []
        taskCategories.$on 'loaded', (snapshot) ->
            list = snapshot

        # Private methods
        setPriority: (taskCategory, priority) ->
            taskCategoryID = taskCategory.taskCategoryID
            taskCategories.$child("#{taskCategoryID}").$priority = priority
            taskCategories.$save taskCategoryID

        # Public API
        {
            taskCategories: taskCategories
            add: (taskCategory) ->
                taskCategories.$add(taskCategory)
                .then (reference) ->
                    # update firebase object to include firebase-generated ID
                    taskCategoryID = reference.name()
                    tc = taskCategories.$child taskCategoryID
                    tc.$update 'taskCategoryID': taskCategoryID
                    # use email as priority for sorting
                    tc.$priority = taskCategory.name
                    tc.$save taskCategoryID
                    # denormalize: add to task category from parent and children
                    if taskCategory.parentID?
                        taskCategories.$child("#{taskCategory.parentTaskCategoryID}/children/#{taskCategory.taskCategoryID}").$set true
            child: (taskCategoryID) ->
                taskCategories.$child taskCategoryID
            getName: (taskCategoryID) ->
                # default
                if list[taskCategoryID]
                    name = list[taskCategoryID].name
                else
                    return ''
                # add parent name
                parentTaskCategoryID = list[taskCategoryID].parentTaskCategoryID
                if parentTaskCategoryID
                    name = "#{$filter('IDToName')(parentTaskCategoryID, 'taskCategory')} - #{name}"
                return name

            remove: (taskCategory) ->
                taskCategories.$remove taskCategory.taskCategoryID
            update: (taskCategory, data) ->
                taskCategories.$child("#{taskCategory.taskCategoryID}").$update data
        }

