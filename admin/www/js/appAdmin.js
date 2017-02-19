/* global angular */

var appAdmin = angular.module('appAdmin', ['ngRoute', 'ngResource', 'ngSanitize', 'dndLists']);

appAdmin.config(function ($logProvider) {
    $logProvider.debugEnabled(false);
});

appAdmin.config(['$routeProvider', '$logProvider', function ($routeProvider, $logProvider) {
        $rootDir = ''; // /7msdt.netspace.sk
        $routeProvider.
                when('/', {
                    templateUrl: $rootDir + '/view/admin/login.html',
                    controller: 'loginCtrl'}).
                when('/Administracia', {
                    templateUrl: $rootDir + '/view/admin/administration.html',
                    controller: 'adminCtrl'}).
                when('/Onas', {
                    templateUrl: $rootDir + '/view/admin/onas.html',
                    controller: 'onasCtrl'}).
                when('/Rada', {
                    templateUrl: $rootDir + '/view/admin/rada.html',
                    controller: 'radaCtrl'}).
                when('/Projekty', {
                    templateUrl: $rootDir + '/view/admin/projekty.html',
                    controller: 'projektyCtrl'}).
                when('/Triedy', {
                    templateUrl: $rootDir + '/view/admin/triedy.html',
                    controller: 'triedyCtrl'}).
                when('/Oznamy', {
                    templateUrl: $rootDir + '/view/admin/oznamy.html',
                    controller: 'oznamyCtrl'}).
                when('/Kontakty', {
                    templateUrl: $rootDir + '/view/admin/kontakty.html',
                    controller: 'kontaktyCtrl'}).
                when('/Podujatia/Trieda/:class', {
                    templateUrl: $rootDir + '/view/admin/podujatia.html',
                    controller: 'podujatiaCtrl'}).
                when('/Podujatia/Archiv', {
                    templateUrl: $rootDir + '/view/admin/archiv.html',
                    controller: 'archivCtrl'}).
                when('/Zverejnovanie/:type', {
                    templateUrl: $rootDir + '/view/admin/zverejnovanie.html',
                    controller: 'zverejnovanieCtrl'}).
                otherwise({redirectTo: '/'});
        $logProvider.debugEnabled(true);
    }]);

appAdmin.config(function($sceDelegateProvider) {
  $sceDelegateProvider.resourceUrlWhitelist([
    'self',
    'https://www.youtube.com/**'
  ]);
});

appAdmin.directive('adminHeader', ['$http', '$location', 'AuthError', function ($http, $location, AuthError) {
        return {
            restrict: 'E', //This means that it will be used as an attribute and NOT as an element.
            templateUrl: "/view/admin/header.html",
            link: function (scope) {
                scope.logout = function () {
                    $http.post("/api/admin/logout.php")
                            .success(function () {
                                $location.path("/");
                            });
                };

                scope.isLogged = function () {
                    $http.post("/api/admin/isLogged.php")
                            .success(function ($response) {
                                // Redirect to login page
                                if (!scope.isLoginPage && $response.error === 2) {
                                    AuthError.error = $response.message;
                                    $location.path('/');
                                }

                                // Redirect to 1st page of administration
                                if (scope.isLoginPage && $response.error === null) {
                                    $location.path('/Administracia');
                                }
                            });
                };

                scope.loadClasses = function () {
                    $http.post("/api/getMenuClasses.php")
                            .success(function (response) {
                                scope.classes = response;
                            });
                };

                scope.isLoginPage = $location.path() === "/";
                scope.isLogged();

                scope.$on('$routeChangeStart', function (next, current) {
                    scope.isLoginPage = $location.path() === "/";
                    scope.isLogged();
                });

                scope.loadClasses();
            }
        };
    }]);

appAdmin.directive('adminNavigation', ['$http', '$location', function ($http, $location) {
        return {
            restrict: 'E', //This means that it will be used as an attribute and NOT as an element.
            templateUrl: "/view/admin/navigation.html",
            link: function (scope) {
                scope.isLoginPage = $location.path() === "/";

                scope.$on('$routeChangeStart', function (next, current) {
                    scope.isLoginPage = $location.path() === "/";
                });
            }
        };
    }]);

appAdmin.filter('sanitize', function ($sce) {
    return $sce.trustAsHtml;
});

appAdmin.directive('tooltip', function(){
    return {
        restrict: 'A',
        link: function(scope, element, attrs){
            $(element).hover(function(){
                // on mouseenter
                $(element).tooltip('show');
            }, function(){
                // on mouseleave
                $(element).tooltip('hide');
            });
        }
    };
});