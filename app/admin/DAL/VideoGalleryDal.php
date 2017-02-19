<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/db.php';

class VideoGalleryDal {
    
    function AddVideo($arr) {
        $insCount = dibi::query('INSERT INTO [ms_videogallery]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of video failed");
        }
        return dibi::insertId();
    }
}
