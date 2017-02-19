<?php

include_once 'Image.php';

class Event {
    
    private $id;
    public $title;
    public $content;
    public $element;
    public $galery;
    public $videoGalery;
    
    public function __construct($dbResult) {
        $this->id = $dbResult->id;
        $this->title = $dbResult->title;
        $this->content = $dbResult->content;
        $this->element = "/view/web/elements/event.html";
        $this->galery = $this->GetGalery();
        $this->videoGalery = $this->GetVideoGalery();
    }
    
    private function GetGalery() {
        $imageList = array();
        $result = dibi::query("SELECT file, thumb FROM ms_gallery WHERE idEvent = %i", $this->id);
        foreach ($result as $res) {
            array_push($imageList, new Image($res));
        }
        
        return $imageList;
    }
    
    private function GetVideoGalery() {
        $videoList = array();
        $result = dibi::query("SELECT link FROM `ms_videogallery` WHERE idEvent = %i", $this->id);
        foreach ($result as $res) {
            array_push($videoList, $res->link);
        }
        
        return $videoList;
    }
}

?>