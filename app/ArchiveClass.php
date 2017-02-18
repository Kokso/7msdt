<?php

class ArchiveClass {
    
    public $id;
    public $archiveName;
    
    public function __construct($dbResult) {
        $this->id = $dbResult->id;
        $this->archiveName = $dbResult->name;
    }
}
