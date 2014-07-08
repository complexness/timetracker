'use strict'

angular.module('timetrackerApp')
    .factory 'userService', ($firebase, FBURL, roleService) ->
    
        # Private variables
        users = $firebase new Firebase "#{FBURL}users"
        list = []
        users.$on 'loaded', (snapshot) ->
            list = snapshot

        # Private methods
        setPriority = (user, priority) ->
            userID = user.userID
            users.$child("#{userID}").$priority = priority
            users.$save userID

        # Public API
        {
            users: users
            add: (user) ->
                users.$add(user)
                .then (reference) ->
                    # update firebase user object to include firebase-generated userID
                    userID = reference.name()
                    user = users.$child userID
                    user.$update 'userID': userID
                    # use email as priority for sorting
                    user.$priority = loginEmail
                    users.$save userID
                    # denormalize: add reference to users in roles
                    roles.$child("#{user.roleID}/users/#{userID}").$set true
            child: (userID) ->
                roles.$child userID
            getName: (userID) ->
                "#{list[userID].name.first} #{list[userID].name.last}"
            remove: (user) ->
                users.$remove user.userID
                roles.$child("#{user.role}/users/").$remove user.userID
            update: (user, userData) ->
                if roleID in userData
                    roles.$child("#{user.roleID}/users/").$remove user.userID
                    roles.$child("#{userData.roleID}/users/#{user.userID}").$set true
                users.$child(user.userID).$update userData
        }