'use strict'

angular.module('myapp', [
  'ui.bootstrap'
]).controller 'fibCtrl', ['$scope','$http', ($scope, $http) ->

  $scope.fibSize=0
  $scope.flg="normal"

  $http.get("/dispFlg/").success((data, status, headers, config) ->
      $scope.dispFlg = data
    )

  $scope.size = ->
    $http.get("/fibSize/" + $scope.fibSize).success((data, status, headers, config) ->
      $scope.fibs = data
    ).error (data, status, headers, config) ->
      $scope.fibs = ""
]