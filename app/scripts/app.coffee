'use strict'

angular.module('timetrackerApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'firebase'
])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/tasks',
        templateUrl: 'views/tasks.html'
        controller: 'TasksCtrl'
      .otherwise
        redirectTo: '/'
    # remove hash from URLs ('domain/#/path' to 'domain/path')
    $locationProvider.html5Mode(true)
  .constant('FBURL', 'https://complexness-time.firebaseio.com/')
