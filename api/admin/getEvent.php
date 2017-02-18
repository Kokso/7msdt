<?php
session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/app/admin/Event.php';
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/Authentication.php';
include_once $rootDir.'/app/ErrorResponse.php';

$authen = new Authentication();
if ($authen->IsLogged()){
    $response = Json::Receive();
    
    $event = new Event();   
    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, $event->Get($response->id)));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>