<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/db.php';

class VideoGalleryDal {
    
    public function AddVideo($arr) {
        $insCount = dibi::query('INSERT INTO [ms_videogallery]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of video failed");
        }
        return dibi::insertId();
    }
    
    public function GetGallery($eventId) {
        $videoList = array();
        $result = dibi::query("SELECT * FROM `ms_videoGallery` WHERE `idEvent`=%i ORDER BY id", $eventId);
        foreach ($result as $res) {
            array_push($videoList, (object) array('id' => $res->id, 'link' => $res->link));
        }

        return $videoList;
    }
}
