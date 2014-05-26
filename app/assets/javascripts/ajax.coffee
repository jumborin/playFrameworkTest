angular.module('myapp', [
  'ui.bootstrap'
])
@dispFlg = -> [this.normal,this.number,this.color]
@dispFlg.normal = -> [this.normalFlg,this.numberFlg,this.colorFlg]
@dispFlg.number = -> [this.normalFlg,this.numberFlg,this.colorFlg]
@dispFlg.color = -> [this.normalFlg,this.numberFlg,this.colorFlg]

@fibCtrl = ($scope, $http) ->
　　$http.get("/dispFlg/normalFlg").success((data, status, headers, config) ->
      dispFlg.normal.normalFlg=data[0]
      dispFlg.normal.numberFlg=data[1]
      dispFlg.normal.colorFlg=data[2]
      $scope.dispFlg = dispFlg.normal
    )
  $http.get("/dispFlg/numberFlg").success((data, status, headers, config) ->
      dispFlg.number.normalFlg=data[0]
      dispFlg.number.numberFlg=data[1]
      dispFlg.number.colorFlg=data[2]
      $scope.dispFlg = dispFlg.number
    )
  $http.get("/dispFlg/colorFlg").success((data, status, headers, config) ->
      dispFlg.color.normalFlg=data[0]
      dispFlg.color.numberFlg=data[1]
      dispFlg.color.colorFlg=data[2]
      $scope.dispFlg = dispFlg.color
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

