'use strict'

angular.module('timetrackerApp')
  .controller 'AuthCtrl', ($scope, $firebase, $firebaseSimpleLogin, FBURL) ->
    ref = new Firebase(FBURL)
    $scope.auth = $firebaseSimpleLogin(ref) # $firebaseSimpleLogin has only 1 argument (2014 June 25)
    $scope.login = ->
        $scope.auth.$login 'password',
            email: $scope.loginEmail
            password: $scope.loginPassword
        .then (user) ->
            console.log('Logged in as: ', user.email)
        , (error) ->
            console.log('Login failed: ', error)