<?php
error_reporting(-1);
ini_set('display_errors', 'On');
session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/Authentication.php';
include_once $rootDir.'/app/ErrorResponse.php';
include_once $rootDir.'/app/admin/Document.php';

$authen = new Authentication();
if ($authen->IsLogged()){
    $response = Json::Receive();
    
    $doc = new Document();
    $doc->Save($response);
    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, ErrorResponse::$SuccessMessage));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>