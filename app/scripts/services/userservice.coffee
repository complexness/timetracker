'use strict'

angular.module('timetrackerApp')
  .factory 'userService', ($firebase, FBURL) ->
    roles = $firebase(new Firebase(FBURL + 'roles'))
    users = $firebase(new Firebase(FBURL + 'users'))
    # Public API here
    {
        users: users
        roles: roles
        addUser: (user) ->
            users.$add
                email: user.email
                name:
                    first: user.name.first
                    last: user.name.last
                roleID: user.roleID
                job:
                    description: user.job.description
                    startDate: user.job.startDate
                    payRatePerHour: user.job.payRatePerHour
            .then (reference) ->
                # update firebase user object to include firebase-generated userID
                userID = reference.name()
                user = users.$child(userID)
                user.$update 'userID': userID
                # use email as priority for sorting
                user.$priority = loginEmail
                users.$save(userID)
                # denormalize: add reference to users in roles
                roles.$child(user.roleID + '/users/' + userID).$set true
        deleteUser: (user) ->
            users.$remove user.userID
            roles.$child(user.role + '/users/').$remove user.userID
        updateUserRole: (userID, roleDst) ->
            roleSrc = user.role
            users.$child(user.userID).$update role: roleDst
            roles.$child(roleSrc + '/users/').$remove user.userID
            roles.$child(roleDst + '/users/' + user.userID).$set true
    }
