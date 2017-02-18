<?php

if(session_id() == '') {
    session_start();
}

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/libs/Json.php';
include_once $rootDir . '/app/Authentication.php';
include_once $rootDir . '/app/ErrorResponse.php';

$authen = new Authentication();
if ($authen->IsLogged()) {
    Json::Send(new ErrorResponse(NULL, NULL));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>

