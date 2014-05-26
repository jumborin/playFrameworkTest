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
  $scope.getNormalFlg = ->
    $scope.getDispFlg("normalFlg")
  $scope.getNumberFlg = ->
    $scope.getDispFlg("numberFlg")
  $scope.getColorFlg = ->
    $scope.getDispFlg("colorFlg")
  $scope.getDispFlg = (flg) ->
    url = "/dispFlg=" + flg
    $http.get(url).success((data, status, headers, config) ->
      $scope.normalFlg=data[0]
      $scope.numberFlg=data[1]
      $scope.colorFlg=data[2]
    )

