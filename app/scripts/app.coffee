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
        authRequired: false
      .when '/passwordforgot',
        templateUrl: 'views/passwordforgot.html'
        controller: 'AuthCtrl'
        authRequired: false
      .when '/record',
        templateUrl: 'views/record.html'
        controller: 'RecordCtrl'
        authRequired: true
      .when '/settings',
        templateUrl: 'views/settings.html'
        controller: 'AuthCtrl'
        authRequired: true
      .when '/start',
        templateUrl: 'views/start.html'
        controller: 'AuthCtrl'
      .when '/task',
        templateUrl: 'views/task.html'
        controller: 'TaskCtrl'
        authRequired: true
      .when '/user',
        templateUrl: 'views/user.html'
        controller: 'UserCtrl'
        authRequired: true
      .otherwise
        redirectTo: '/'

    # remove hash from URLs ('domain/#/path' to 'domain/path')
    $locationProvider.html5Mode true