<?php

session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/Authentication.php';
include_once $rootDir.'/app/ErrorResponse.php';
include_once $rootDir.'/app/admin/Contacts.php';

$authen = new Authentication();
if ($authen->IsLogged()){    
    $contacts = new Contacts();
    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, $contacts->Get()));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>


