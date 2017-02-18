<?php

session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/libs/Json.php';
include_once $rootDir . '/app/Authentication.php';
include_once $rootDir . '/app/ErrorResponse.php';
include_once $rootDir . '/app/admin/DAL/EventDal.php';
include_once $rootDir . '/app/admin/Image.php';

$authen = new Authentication();
if ($authen->IsLogged()) {
    $response = Json::Receive();

    $eventDal = new EventDal();
    $image = $eventDal->GetImage($response->id);
    $eventDal->DeleteImage($response->id);
    Image::DeleteFile("../.." . $image[0]->file);
    Image::DeleteFile("../.." . $image[0]->thumb);
    Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, ""));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>