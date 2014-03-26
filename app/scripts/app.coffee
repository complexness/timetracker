'use strict'

angular.module('timetrackerApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'firebase'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/tasks',
        templateUrl: 'views/tasks.html'
        controller: 'TasksCtrl'
      .otherwise
        redirectTo: '/'
