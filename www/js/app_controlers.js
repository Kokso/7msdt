/* global angular */

var app = angular.module('app');

// Welcome page controler
app.controller('firstCtrl', function ($scope) {

});

// The rest of pages controlers
app.controller('articlesCtrl', function ($scope, $http, $routeParams, $sce) {
    $scope.loadArticles = function () {
        var classId = -1;
        if ($routeParams.class !== undefined){
            classId = $routeParams.class;
        }
        
        var archiveId = -1;
        if ($routeParams.archive !== undefined){
            archiveId = $routeParams.archive;
        }
        
        $http.post("/api/web/getArticles.php?site="+$routeParams.site+"&classId="+classId+"&archiveId="+archiveId)
                .success(function (response) {
                    $scope.articles = response;
                });
    };
    
    $scope.loadArticles();
});

