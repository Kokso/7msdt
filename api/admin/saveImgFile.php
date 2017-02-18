<?php

session_start();

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/libs/Json.php';
include_once $rootDir . '/app/Authentication.php';
include_once $rootDir . '/app/ErrorResponse.php';
include_once $rootDir . '/app/admin/Image.php';
include_once $rootDir . '/app/admin/DAL/EventDal.php';

$authen = new Authentication();
if ($authen->IsLogged()) {
    if (count($_FILES) == 1) {
        $file = new Image($_FILES['file']);
        $eventId = filter_input(INPUT_POST, 'eventId');
        try {
            $targetPath = '/www/data/gallery/';
            $thumbTargetPath = '/www/data/gallery/thumbs/';
            $file->Save($rootDir.$targetPath);
            $file->SaveThumb($rootDir.$thumbTargetPath);
            
            $eventDal = new EventDal();
            $eventDal->InsertImg($targetPath.$file->GetName(), $thumbTargetPath.$file->GetName(), $eventId);
            
            Json::Send(new ErrorResponse(ErrorResponse::$SuccessErr, ""));
        } catch (Exception $ex) {
            switch ($ex->getCode()) {
                case File::$ErrFileType:
                    Json::Send(new ErrorResponse(ErrorResponse::$OperationErr, "Nepodporovaný formát obrázku"));
                    break;
                case File::$ErrSave:
                    Json::Send(new ErrorResponse(ErrorResponse::$OperationErr, "Obrázok sa nepodarilo uložiť"));
                    break;
                default:
                    Json::Send(new ErrorResponse(ErrorResponse::$OperationErr, "Neznáma chyba pri práci s obrázkom"));
                    break;
            }
        }
    } else {
        Json::Send(new ErrorResponse(ErrorResponse::$OperationErr, "Obrázok sa nepodarilo prijať !"));
    }
} else {
    Json::Send(new ErrorResponse(ErrorResponse::$AccessDeniedErr, "Nepovolený prístup. Nie ste prihlásený !"));
}

?>