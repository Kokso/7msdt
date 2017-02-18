<?php
session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/Authentication.php';
include_once $rootDir.'/app/ErrorResponse.php';
include_once $rootDir.'/app/admin/Note.php';

$authen = new Authentication();
if ($authen->IsLogged()){
    $response = Json::Receive();
    
    $note = new Note();
    $note->Delete($response->id);
    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, "Oznam bol zmazaný."));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>