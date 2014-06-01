'use strict'

angular.module('myapp', [
  'ui.bootstrap'
]).controller 'fibCtrl', ['$scope','$http', ($scope, $http) ->
  dispFlg = -> [
    (this.normal　= -> [this.normalFlg,this.numberFlg,this.colorFlg]),
    (this.number　= -> [this.normalFlg,this.numberFlg,this.colorFlg]),
    (this.color　= -> [this.normalFlg,this.numberFlg,this.colorFlg])]
  
  $scope.fibSize=0

  $http.get("/dispFlg/").success((data, status, headers, config) ->
      dispFlg = data
      $scope.dispFlg = dispFlg.normal
    )

  $scope.size = ->
    $http.get("/fibSize/" + $scope.fibSize).success((data, status, headers, config) ->
      $scope.fibs = data
    ).error (data, status, headers, config) ->
      $scope.fibs = ""

  $scope.getDispFlg = (flg)->
    $scope.dispFlg = dispFlg[flg]

]