<?php
error_reporting(-1);
ini_set('display_errors', 'On');
session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/libs/Json.php';
include_once $rootDir . '/app/Authentication.php';
include_once $rootDir . '/app/ErrorResponse.php';
include_once $rootDir . '/app/admin/File.php';

$authen = new Authentication();
if ($authen->IsLogged()) {
    if (count($_FILES) == 1) {
        $file = new File($_FILES['file']);
        try {
            $targetPath = '/www/data/others/';
            $file->Save($rootDir.$targetPath, NULL, array());
            
            Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, (object) array('filePath' => $targetPath . $file->GetName())));
        } catch (Exception $ex) {
            switch ($ex->getCode()) {
                case File::$ErrSave:
                    Json::Send(new ErrorResponse(ErrorResponse::$OperationErr, "Súbor sa nepodarilo uložiť"));
                    break;
                default:
                    Json::Send(new ErrorResponse(ErrorResponse::$OperationErr, "Neznáma chyba pri práci so súborom"));
                    break;
            }
        }
    } else {
        Json::Send(new ErrorResponse(ErrorResponse::$OperationErr, "Súbor sa nepodarilo prijať !"));
    }
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>