<?php

# Get archives for drop down menu

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/app/db.php';
include_once $rootDir.'/libs/Json.php';
include_once $rootDir.'/app/ArchiveClass.php';

$result = dibi::query("SELECT id, name FROM ms_archive");

$archiveList = array();
foreach ($result as $res) {
    array_push($archiveList,new ArchiveClass($res));
}

Json::Send($archiveList);

?>