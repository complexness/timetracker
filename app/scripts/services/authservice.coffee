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
                # TODO proper logging!!
                console.log 'Login success: ', user
            , (error) ->
                # TODO proper error logging...
                console.log 'Login failed: ', error
        logout: ->
            auth.$logout()
        changePassword: (email, oldPassword, newPassword) ->
            auth.$getCurrentUser()
            .then (user) ->
                auth.$changePassword email, oldPassword, newPassword
        createUser: (loginEmail, loginPassword) ->
            auth.$createUser loginEmail, loginPassword, true
        removeUser: (email, password) ->
            auth.$removeUser email, password
        sendPasswordResetEmail: (email) ->
            auth.$sendPasswordResetEmail email
    }
