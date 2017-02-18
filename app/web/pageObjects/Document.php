<?php

class Document {
    
    public $title;
    public $file;
    public $order;
    
    public function __construct($dbResult) {
        $this->file = $dbResult->file;
        $this->title = $dbResult->title;
        $this->order = $dbResult->order;
    }
}

?>