'use strict';

angular.module('timetrackerApp')
  .controller('LoginController', function($scope, simpleLogin, $location) {
    $scope.pass = null;
    $scope.err = null;
    $scope.email = null;
    $scope.confirm = null;
    $scope.createMode = false;
    $scope.loginPassword = function(cb) {
      $scope.err = null;
      if( !$scope.email ) {
        $scope.err = 'Please enter an email address';
      }
      else if( !$scope.pass ) {
        $scope.err = 'Please enter a password';
      }
      else {
        simpleLogin.loginPassword($scope.email, $scope.pass, function(err, user) {
          $scope.err = err? err + '' : null;
          if( !err && cb ) {
            cb(user);
          }
        });
      }
    };

    $scope.logout = simpleLogin.logout;

    $scope.createAccount = function() {
      function assertValidLoginAttempt() {
        if( !$scope.email ) {
          $scope.err = 'Please enter an email address';
        }
        else if( !$scope.pass ) {
          $scope.err = 'Please enter a password';
        }
        else if( $scope.pass !== $scope.confirm ) {
          $scope.err = 'Passwords do not match';
        }
        return !$scope.err;
      }

      $scope.err = null;
      if( assertValidLoginAttempt() ) {
        simpleLogin.createAccount($scope.email, $scope.pass, function(err, user) {
          if( err ) {
            $scope.err = err? err + '' : null;
          }
          else {
            // must be logged in before I can write to my profile
            $scope.login(function() {
              simpleLogin.createProfile(user.uid, user.email);
              $location.path('/account');
            });
          }
        });
      }
    };

  });
