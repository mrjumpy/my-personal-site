var access_token = "";

angular.module('instanoad', ['ngRoute', 'commentsFilters', 'instagramService', 'smoothScrollToService'])
  .value('authCode', 1)
  .run(function(authCode, $http, instagramService) {


  })
  .controller('loginCtrl', function($filter, instagramService, authCode, $rootScope, $scope, $location, $http) {

    $.ajax({
      type: "POST",
      url: 'https://api.instagram.com/v1/subscriptions/?client_id=369c6cd0f2254df6acfaf3045ddf78b5&client_secret=0e199dc46b9248b28dd387056e72d377&object=user&callback_url=https://instanoad-mrjumpy.c9.io/url&aspect=media',
      dataType: "jsonp",

      success: function(data) {
        console.log(data);
      }
    });

    var allComments;
    $scope.isDetailView = false;

    $scope.data = [];
    instagramService.listPics().then(function(response) {
      $scope.data = response;
      $scope.$apply();
    });

    $scope.comments = [];

    $scope.gotoDetail = function(id) {

      $.ajax({
        type: "GET",
        url: '/getComments?id=' + id,
        success: function(data) {
          $scope.comments = data;
          $scope.$apply();
          return data;
        }
      });


      $scope.isDetailView = true;


    };

    $scope.filterStr = "";

    $scope.submitFilters = function() {
      $scope.comments = $filter('comment')(allComments, $scope.filterStr);
    };

  });

angular.module('instagramService', []).factory('instagramService', function($http, $q) {
  var service = {};

  service.listPics = function() {

    var promise = $.ajax({
      type: "GET",
      url: '/getPics',
      success: function(data) {
        return data;
      }
    });
    return promise;
  };


  return service;
});