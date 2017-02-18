<?php
session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/Authentication.php';
include_once $rootDir.'/app/ErrorResponse.php';


$user = Json::Receive();

$authen = new Authentication();
if ($authen->LogIn($user->username, $user->password)) {
    Json::Send(new ErrorResponse(NULL, NULL));
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AuthErr, "Nesprávne meno alebo heslo !"));
}

?>