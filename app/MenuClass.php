<?php

class MenuClass {
    
    public $id;
    public $className;
    
    public function __construct($dbResult) {
        $this->id = $dbResult->id;
        $this->className = $dbResult->name;
    }
}

?>