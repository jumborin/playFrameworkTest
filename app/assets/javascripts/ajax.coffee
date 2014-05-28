'use strict'

angular.module('myapp', [
  'ui.bootstrap'
]).controller 'fibCtrl', ['$scope','$http', ($scope, $http) ->
  dispFlg = -> [this.normal,this.number,this.color]
  dispFlg.normal = -> [this.normalFlg,this.numberFlg,this.colorFlg]
  dispFlg.number = -> [this.normalFlg,this.numberFlg,this.colorFlg]
  dispFlg.color = -> [this.normalFlg,this.numberFlg,this.colorFlg]
  $scope.fibSize=0

  $http.get("/dispFlg/").success((data, status, headers, config) ->
      dispFlg = data
      $scope.dispFlg = dispFlg.normal
    )

  $scope.size = ->
    url = "/fibSize/" + $scope.fibSize
    $http.get(url).success((data, status, headers, config) ->
      $scope.fibs = data
    ).error (data, status, headers, config) ->
      $scope.fibs = ""

  $scope.getNormalFlg = ->
    $scope.dispFlg = dispFlg.normal

  $scope.getNumberFlg = ->
    $scope.dispFlg = dispFlg.number

  $scope.getColorFlg = ->
    $scope.dispFlg = dispFlg.color
]