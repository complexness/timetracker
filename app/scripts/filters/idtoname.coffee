'use strict'

angular.module('timetrackerApp')
  .filter 'IDToName', ($firebase, FBURL, userService, taskService, taskCategoryService) ->
    (objectID, objectType) ->
        if not objectID
            return ''
        switch objectType
            when 'task'
                out = taskService.getName objectID
            when 'taskCategory'
                out = taskCategoryService.getName objectID
            when 'user'
                out = userService.getName objectID
            else
                out = objectID
        return out