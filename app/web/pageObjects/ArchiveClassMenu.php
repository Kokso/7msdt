<?php

class ArchiveClassMenu {
    
    public $archiveId;
    public $name;
    public $classId;
    public $element;
    
    public function __construct($dbResult) {
        $this->archiveId = $dbResult->archiveId;
        $this->name = $dbResult->name;
        $this->classId = $dbResult->classId;
        $this->element = "/view/web/elements/archiveClassMenu.html";
    }
}
