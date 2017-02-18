<?php

include_once 'BaseArticle.php';

class MediumArticle extends BaseArticle {
    
    public $image;
    
    public function __construct($dbResult) {
        parent::__construct($dbResult);
        
        $this->class = "small_a";
        $this->element = "/view/web/elements/mediumArticle.html";
        $this->image = $dbResult->image;
    }
}

?>