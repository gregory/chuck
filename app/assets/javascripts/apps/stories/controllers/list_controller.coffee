angular.module('stories').controller 'listController', ['$scope', ($scope) ->
  $scope.devs = {}
  $scope.hide_commits_for_dev = (dev) ->
    dev.hide_commits = !dev.hide_commits
]
