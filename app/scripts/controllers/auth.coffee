'use strict'

angular.module('timetrackerApp')
  .controller 'AuthCtrl', ($scope, $firebase, $firebaseSimpleLogin, FBURL) ->
    ref = new Firebase(FBURL)
    $scope.auth = $firebaseSimpleLogin(ref)
    $scope.changePassword = ->
        $scope.auth.$getCurrentUser()
        .then (user) ->
            console.log 'Updating', user.email
            $scope.auth.$changePassword user.email, $scope.oldPassword, $scope.newPassword
            $scope.oldPassword = $scope.newPassword = ''
            console.log 'Password updated'
    $scope.createUser = ->
        $scope.auth.$createUser $scope.loginEmail, $scope.loginPassword, true
        $scope.nameFirst = $scope.nameLast = $scope.loginEmail = $scope.loginPassword = ''
        console.log 'User created'
    $scope.login = ->
        $scope.auth.$login 'password',
            email: $scope.loginEmail
            password: $scope.loginPassword
        .then (user) ->
            console.log 'Logged in as: ', user.email
        , (error) ->
            console.log 'Login failed: ', error
    $scope.sendPasswordResetEmail = ->
        $scope.auth.$sendPasswordResetEmail $scope.loginEmail
        $scope.loginEmail = ''
        console.log 'New password sent'