<?php

session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/Authentication.php';
include_once $rootDir.'/app/ErrorResponse.php';
include_once $rootDir.'/app/admin/Onas.php';

$authen = new Authentication();
if ($authen->IsLogged()){    
    $oNas = new Onas();
    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, $oNas->Get()));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>


