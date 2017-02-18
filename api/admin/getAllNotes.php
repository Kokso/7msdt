<?php
session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/app/admin/DAL/NoteDal.php';
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/Authentication.php';
include_once $rootDir.'/app/ErrorResponse.php';

$authen = new Authentication();
if ($authen->IsLogged()){
    $noteDal = new NoteDal();
    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, $noteDal->GetNotes()));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>


