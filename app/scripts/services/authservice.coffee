'use strict'

angular.module('timetrackerApp')
  .factory 'authService', ($rootScope, $firebase, $firebaseSimpleLogin, FBURL) ->
    
    firebaseReference = new Firebase FBURL
    auth = $firebaseSimpleLogin firebaseReference
    
    # Wrappers on $firebaseSimpleLogin methods defined at
    # https://www.firebase.com/docs/angular/reference.html#firebasesimplelogin
    {
        auth: auth
        getCurrentUser: ->
            auth.$getCurrentUser()
        login: (loginEmail, loginPassword) ->
            auth.$login 'password',
                email: loginEmail
                password: loginPassword
            .then (user) ->
                # TODO proper logging
                console.log 'Login success: ', user
            , (error) ->
                # TODO proper logging
                console.log 'Login failure: ', error
        logout: ->
            auth.$logout()
        changePassword: (oldPassword, newPassword) ->
            auth.$getCurrentUser()
            .then (user) ->
                auth.$changePassword user.email, oldPassword, newPassword
        createUser: (loginEmail, loginPassword) ->
            auth.$createUser loginEmail, loginPassword, true
        removeUser: (password) ->
            auth.$getCurrentUser()
            .then (user) ->
                auth.$removeUser user.email, password
        sendPasswordResetEmail: (email) ->
            auth.$sendPasswordResetEmail email
    }
