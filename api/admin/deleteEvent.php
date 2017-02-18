<?php

session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/libs/Json.php';
include_once $rootDir . '/app/Authentication.php';
include_once $rootDir . '/app/ErrorResponse.php';
include_once $rootDir . '/app/admin/Event.php';
include_once $rootDir . '/app/admin/DAL/EventDal.php';
include_once $rootDir . '/app/admin/Image.php';

$authen = new Authentication();
if ($authen->IsLogged()) {
    $response = Json::Receive();

    $event = new Event();
    $eventDal = new EventDal();
    $imageList = $eventDal->GetGallery($response->id);
    $event->Delete($response->id);

    foreach ($imageList as $image) {
        Image::DeleteFile("../.." . $image->file);
        Image::DeleteFile("../.." . $image->thumb);
    }

    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, "Podujatie bolo zmazané."));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>