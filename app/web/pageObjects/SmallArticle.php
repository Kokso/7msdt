<?php

include_once 'BaseArticle.php';

class SmallArticle extends BaseArticle {
    
    public function __construct($dbResult) {
        parent::__construct($dbResult);
        
        $this->class = "smaller_a";
        $this->element = "/view/web/elements/smallArticle.html";
    }
}

?>