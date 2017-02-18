<?php

abstract class BaseArticle {

    protected $id;
    public $title;
    public $content;
    public $order = -1;
    public $class;
    public $element;

    public function __construct($dbResult) {
        $this->id = (int) $dbResult->id;
        $this->title = $dbResult->title;
        $this->content = $dbResult->content;
        $this->order = (int) $dbResult->order;
    }

}

?>