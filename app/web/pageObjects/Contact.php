<?php

class Contact {
    
    public $adName;
    public $street;
    public $city;
    public $content;
    public $image = "../www/images/stamp.png";
    public $element = "/view/web/elements/contact.html";
    
    public function __construct($dbResult) {
        $this->adName = $dbResult->adName;
        $this->street = $dbResult->street;
        $this->city = $dbResult->city;
        $this->content = $dbResult->content;
    }   
}

?>