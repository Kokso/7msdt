<?php
session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/app/admin/DAL/ClassDal.php';
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/Authentication.php';
include_once $rootDir.'/app/ErrorResponse.php';

$authen = new Authentication();
if ($authen->IsLogged()){
    $classDal = new ClassDal();
    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, $classDal->GetClasses()));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}


?>

