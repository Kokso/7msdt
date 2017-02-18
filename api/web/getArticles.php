<?php
# Get all articles for given site

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir.'/app/db.php';
include_once $rootDir.'/libs/Json.php';

include_once $rootDir.'/app/web/pageObjects/ArticleFactory.php';



$siteParam = filter_input(INPUT_GET, 'site');
$classId = filter_input(INPUT_GET, 'classId');
$archiveId = filter_input(INPUT_GET, 'archiveId');
if (!empty($siteParam)) {
    
    $articlesList = array();
    
    # Exclude "Archive menu article" if it is not archive page
    $archiveCondition = "";
    if ($archiveId == -1){
        $archiveCondition = "AND id != " . BigArticle::$archiveMenuArticleId;
    }
    
    $result = dibi::query("SELECT * FROM `ms_articles` WHERE `site`=%s $archiveCondition", $siteParam);
    foreach ($result as $res) {
        array_push($articlesList, ArticleFactory::CreateArticle($res, $classId, $archiveId));
    }

    Json::Send($articlesList);
}

?>