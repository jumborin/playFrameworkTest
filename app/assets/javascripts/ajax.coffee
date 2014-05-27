angular.module('myapp', [
  'ui.bootstrap'
])
@dispFlg = -> [this.normal,this.number,this.color]
@dispFlg.normal = -> [this.normalFlg,this.numberFlg,this.colorFlg]
@dispFlg.number = -> [this.normalFlg,this.numberFlg,this.colorFlg]
@dispFlg.color = -> [this.normalFlg,this.numberFlg,this.colorFlg]

@fibCtrl = ($scope, $http) ->
　　$http.get("/dispFlg/normalFlg").success((data, status, headers, config) ->
      dispFlg.normal=data
      $scope.dispFlg = dispFlg.normal
    )
  $http.get("/dispFlg/numberFlg").success((data, status, headers, config) ->
      dispFlg.number=data
    )
  $http.get("/dispFlg/colorFlg").success((data, status, headers, config) ->
      dispFlg.color=data
    )
  $scope.fibSize=0
  
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

