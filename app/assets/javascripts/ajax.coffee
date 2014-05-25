angular.module('myapp', [
  'ui.bootstrap'
])

@fibCtrl = ($scope, $http) ->
  $scope.size = ->
    url = "/fibSize=" + $scope.fibSize
    $http.get(url).success((data, status, headers, config) ->
      $scope.fibs = data
    ).error (data, status, headers, config) ->
      $scope.fibs = ""
  $scope.noml = ->
    $scope.dispFlg("nomlFlg")
  $scope.numl = ->
    $scope.dispFlg("numlFlg")
  $scope.tabl = ->
    $scope.dispFlg("tablFlg")
  $scope.dispFlg = (flg) ->
    url = "/dispFlg=" + flg
    $http.get(url).success((data, status, headers, config) ->
      console.log(data)
      $scope.nomlFlg=data[0]
      $scope.numlFlg=data[1]
      $scope.tablFlg=data[2]
    ).error (data, status, headers, config) ->
      $scope.nomlFlg=true
      
