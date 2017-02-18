<?php

class Note {
    
    public $title;
    public $content;
    public $colorClass;
    public $order;
    public $element;
    
    private $noteColorClasses = array('red_note', '', 'green_note', 'blue_note');
    
    public function __construct($dbResult) {
        $this->title = $dbResult->title;
        $this->content = $dbResult->content;
        $this->colorClass = $this->noteColorClasses[$dbResult->color];
        $this->order = (int) $dbResult->order;
        $this->element = "/view/web/elements/note.html";
    }
}

?>