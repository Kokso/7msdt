/* global angular */

var app = angular.module('app', ['ngRoute', 'ngResource', 'ngSanitize']);

app.config(['$routeProvider', function ($routeProvider) {
        $rootDir = ''; // /7msdt.netspace.sk
        $routeProvider.
                when('/', {
                    templateUrl: $rootDir + '/view/web/welcome.html',
                    controller: 'firstCtrl'}).
                when('/:site', {
                    templateUrl: $rootDir + '/view/web/articles.html',
                    controller: 'articlesCtrl'}).
                when('/:site/Trieda/:class', {
                    templateUrl: $rootDir + '/view/web/articles.html',
                    controller: 'articlesCtrl'}).
                when('/:site/Archiv/:archive/', {
                    templateUrl: $rootDir + '/view/web/articles.html',
                    controller: 'articlesCtrl'}).
                when('/:site/Archiv/:archive/Trieda/:class', {
                    templateUrl: $rootDir + '/view/web/articles.html',
                    controller: 'articlesCtrl'}).
                otherwise({redirectTo: '/'});
    }]);

app.directive('msheader', function () {
    return {
        restrict: 'E', //This means that it will be used as an attribute and NOT as an element.
        replace: true,
        templateUrl: "/view/web/header.html",
        controller: ['$scope', '$http', function ($scope, $http) {
                $scope.loadSubMenus = function () {
                    $http.post("/api/getMenuClasses.php")
                            .success(function (response) {
                                $scope.classes = response;
                            });
                    $http.post("/api/getMenuArchives.php")
                            .success(function (response) {
                                $scope.archives = response;
                            });      
                };
                
                $scope.loadSubMenus();
            }]
    };
});

app.filter('sanitize', function ($sce) {
    return $sce.trustAsHtml;
});

app.config(function($sceDelegateProvider) {
  $sceDelegateProvider.resourceUrlWhitelist([
    'self',
    'https://www.youtube.com/**'
  ]);
});