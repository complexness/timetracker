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
      .when '/task',
        templateUrl: 'views/task.html'
        controller: 'TaskCtrl'
      .when '/user',
        templateUrl: 'views/user.html'
        controller: 'UserCtrl'
      .when '/record',
        templateUrl: 'views/record.html'
        controller: 'RecordCtrl'
      .otherwise
        redirectTo: '/'
    # remove hash from URLs ('domain/#/path' to 'domain/path')
    $locationProvider.html5Mode(true)
  .constant('FBURL', 'https://complexness-time.firebaseio.com/')
