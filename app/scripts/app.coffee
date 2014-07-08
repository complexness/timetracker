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
        controller: 'AuthCtrl'
      .when '/passwordforgot',
        templateUrl: 'views/passwordforgot.html'
        controller: 'AuthCtrl'
      .when '/record',
        templateUrl: 'views/record.html'
        controller: 'RecordCtrl'
      .when '/settings',
        templateUrl: 'views/settings.html'
        controller: 'AuthCtrl'
      .when '/start',
        templateUrl: 'views/start.html'
        controller: 'AuthCtrl'
      .when '/task',
        templateUrl: 'views/task.html'
        controller: 'TaskCtrl'
      .when '/user',
        templateUrl: 'views/user.html'
        controller: 'UserCtrl'
      .when '/taskCategories',
        templateUrl: 'views/taskcategories.html'
        controller: 'TaskCategoryCtrl'
      .otherwise
        redirectTo: '/'

    # remove hash from URLs (from 'domain/#/path' to 'domain/path')
    $locationProvider.html5Mode true