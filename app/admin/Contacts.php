<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/app/db.php';

class Contacts {
    
    private static $articleId = 1;
    
    public function Get() {
        $result = dibi::query("SELECT * FROM `ms_contact` WHERE `id`=%i", Contacts::$articleId);
        $res =  $result->fetchAll();
        
        return (object) array(
            'name' => $res[0]->adName,
            'street' => $res[0]->street,
            'city' => $res[0]->city,
            'content' => $res[0]->content
        );
    }
    
    public function Save($address) {
        $arr = array(
            'adName' => $address->name,
            'street' => $address->street,
            'city' => $address->city,
            'content' => $address->content
        );
        dibi::query("UPDATE `ms_contact` SET", $arr, "WHERE `id`=%i", Contacts::$articleId);
    }
}

?>