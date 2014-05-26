angular.module('myapp', [
  'ui.bootstrap'
])

@fibCtrl = ($scope, $http) ->
  $scope.normalFlg=true
  $scope.numberFlg=false
  $scope.colorFlg=false
  $scope.fibSize=0
  $scope.size = ->
    url = "/fibSize=" + $scope.fibSize
    $http.get(url).success((data, status, headers, config) ->
      $scope.fibs = data
    ).error (data, status, headers, config) ->
      $scope.fibs = ""
  $scope.noml = ->
    $scope.dispFlg("normalFlg")
  $scope.numl = ->
    $scope.dispFlg("numberFlg")
  $scope.tabl = ->
    $scope.dispFlg("colorFlg")
  $scope.dispFlg = (flg) ->
    url = "/dispFlg=" + flg
    $http.get(url).success((data, status, headers, config) ->
      $scope.normalFlg=data[0]
      $scope.numberFlg=data[1]
      $scope.colorFlg=data[2]
    ).error (data, status, headers, config) ->
      
