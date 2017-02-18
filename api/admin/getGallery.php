<?php
session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/app/admin/DAL/EventDal.php';
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/Authentication.php';
include_once $rootDir.'/app/ErrorResponse.php';

$authen = new Authentication();
if ($authen->IsLogged()){
    $response = Json::Receive();
    
    $eventDal = new EventDal();
    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, $eventDal->GetGallery($response->eventId)));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>