'use strict'

angular.module('timetrackerApp')
    .factory 'recordService', ($firebase, FBURL, taskService, userService) ->

        # Private variables
        records = $firebase new Firebase "#{FBURL}records"
        tasks   = taskService.tasks
        users   = userService.users

        # Private methods
        setPriority: (record, priority) ->
            recordID = record.recordID
            records.$child("#{recordID}").$priority = priority
            records.$save recordID

        # Public API
        {
            records: records
            add: (record) ->
                records.$add(record)
                .then (reference) ->
                    # add recordID to record
                    recordID = reference.name()
                    record = records.$child recordID
                    record.$update 'recordID': recordID
                    # set priority to userID
                    record.$priority = record.userID
                    records.$save recordID
                    # add to task and user
                    tasks.$child("#{record.taskID}/records/#{recordID}").$set true
                    users.$child("#{record.userID}/records/#{recordID}").$set true
            child: (ID) ->
                #
            getName: (ID) ->
                "Record: #{ID}"
            remove: (record) ->
                records.$remove record.recordID
                tasks.$child("#{record.taskID}/records").$remove record.recordID
                users.$child("#{record.userID}/records").$remove record.recordID
            update: (object, data) ->
                # remove references if changed
                # update object
        }
