<?php


class Image {
    
    public $imagePath;
    public $thumbPath;
    
    public function __construct($dbResult) {
        $this->imagePath = $dbResult->file;
        $this->thumbPath = $dbResult->thumb;
    }
}

?>