<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/app/db.php';

class Projects {
    
    private static $articleId = 18;
    
    public function Get() {
        $result = dibi::query("SELECT content FROM `ms_articles` WHERE `id`=%i", Projects::$articleId);
        return $result->fetchSingle();
    }
    
    public function Save($text) {
        $arr = array(
            'content' => $text
        );
        dibi::query("UPDATE `ms_articles` SET", $arr, "WHERE `id`=%i", Projects::$articleId);
    }
}

?>
