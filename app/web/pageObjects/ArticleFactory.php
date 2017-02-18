<?php

include_once 'BigArticle.php';
include_once 'MediumArticle.php';
include_once 'SmallArticle.php';

class ArticleFactory {

    /**
     * Create article objects based on article type
     * @param type $dbResult - db row from table ms_articles
     * @param int $classId - class ID in case class page is displayed
     * @param int $archiveId - archive ID in case archive page is displayed
     */
    public static function CreateArticle($dbResult, $classId, $archiveId) {
        $article = NULL;
        switch ($dbResult->type) {
            case 0:
                $article = new BigArticle($dbResult, $classId, $archiveId);
                break;
            case 1:
                $article = new MediumArticle($dbResult);
                break;
            case 2:
                $article = new SmallArticle($dbResult);
                break;
        }
        return $article;
    }
}

?>