'use strict'

angular.module('timetrackerApp')
    .factory 'roleService', ($firebase, FBURL) ->

        # Private variables
        roles = $firebase new Firebase "#{FBURL}roles"
        list = []
        roles.$on 'loaded', (snapshot) ->
            list = snapshot

        # Private methods
        setPriority: (role, priority) ->
            roleID = role.roleID
            roles.$child("#{roleID}").$priority = priority
            roles.$save roleID

        # Public API
        {
            roles: roles
            add: (role) ->
                roles.$child("#{role.roleID}/roleID/").$set "#{role.roleID}"
                roles.$child("#{role.roleID}/name/").$set "#{role.name}"
            child: (ID) ->
                #
            getName: (roleID) ->
                "#{list[roleID].name}"
            remove: (role) ->
                # TODO for every user in roles/{roleID}/user/{userID}
                # set user.role to default role
                roles.$remove role.roleID
            update: (object, data) ->
                # remove references if changed
                # update object
        }
