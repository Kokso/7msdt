<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/admin/DAL/VideoGalleryDal.php';

class Video {

    private $videoGalleryDal;

    function __construct() {
        $this->videoGalleryDal = new VideoGalleryDal();
    }

    /**
     * Save video to DB
     * @param type $video JSON class object
     */
    public function Save($video) {     
        $arr = $this->VideoToArray($video);
        return $this->videoGalleryDal->AddVideo($arr);
    }
    
    private function VideoToArray($video) {
        $arr = array(
            'idEvent' => $video->eventId,
            'link' => $video->link
        );

        return $arr;
    }
}
