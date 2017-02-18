<?php

# Get classes for drop down menu

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/app/db.php';
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/MenuClass.php';

// type 1 means classes, any other type means anything else
$result = dibi::query("SELECT id, name FROM ms_classes WHERE type=1");

$classList = array();
foreach ($result as $res) {
    array_push($classList,new MenuClass($res));
}

Json::Send($classList);

?>