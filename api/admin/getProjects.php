<?php

session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/Authentication.php';
include_once $rootDir.'/app/ErrorResponse.php';
include_once $rootDir.'/app/admin/Projects.php';

$authen = new Authentication();
if ($authen->IsLogged()){    
    $projects = new Projects();
    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, $projects->Get()));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>


