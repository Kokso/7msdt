<?php

include_once 'BaseArticle.php';
include_once 'Note.php';
include_once 'Event.php';
include_once 'Document.php';
include_once 'Contact.php';
include_once 'JobClass.php';
include_once 'ArchiveClassMenu.php';

class BigArticle extends BaseArticle {

    public static $archiveMenuArticleId = 22; # special case of article used for archives as menu
    public $titleImage;
    public $notes;
    public $events;
    public $documents;
    public $jobsClasses;
    public $archiveClassMenu;

    public function __construct($dbResult, $classId, $archiveId) {
        parent::__construct($dbResult);

        $this->class = "big_a";
        $this->element = "/view/web/elements/bigArticle.html";
        $this->titleImage = $dbResult->title_image;
        $this->notes = $this->GetNotes();
        $this->events = $this->GetEvents($classId, $archiveId);
        $this->documents = $this->GetDocuments();
        $this->contacts = $this->GetContacts();
        $this->jobsClasses = $this->GetJobsClasses();

        if ($classId != -1) {
            $this->SetEventTitle($classId);
        }

        if ($this->id == BigArticle::$archiveMenuArticleId) {
            $this->archiveClassMenu = $this->GetArchiveClasses($archiveId);
            $this->title = "Archív - " . $this->GetArchiveName($archiveId);
        }
    }

    private function SetEventTitle($classId) {
        $result = dibi::query("SELECT name FROM `ms_classes` WHERE `id`=%i", $classId);
        $name = $result->fetchSingle();
        $this->title = $this->title . " - " . $name;
    }

    private function GetNotes() {
        $notesList = array();
        $result = dibi::query("SELECT n.title, n.content, n.color, n.order FROM ms_elements as e JOIN ms_notes as n ON e.idNote = n.id WHERE e.idArticle = %i AND e.idNote IS NOT NULL ORDER BY n.order", $this->id);
        foreach ($result as $res) {
            array_push($notesList, new Note($res));
        }

        return $notesList;
    }

    private function GetEvents($classId, $archiveId) {
        $eventsList = array();
        $result = dibi::query("SELECT ev.id, ev.title, ev.content FROM ms_elements as e JOIN ms_events as ev ON e.idEvent = ev.id WHERE e.idArticle = %i AND e.idEvent IS NOT NULL AND ev.classId = " . $classId . " " . $this->GetArchiveCondition($archiveId) . " ORDER BY ev.order", $this->id);
        foreach ($result as $res) {
            array_push($eventsList, new Event($res));
        }

        return $eventsList;
    }

    private function GetArchiveCondition($archiveId) {
        $condition = "";
        if ($archiveId == -1) {
            $condition = "AND ev.archiveId IS NULL";
        } else {
            $condition = "AND ev.archiveId = $archiveId";
        }
        return $condition;
    }

    private function GetDocuments() {
        $docList = array();
        $result = dibi::query("SELECT `title`, `file`, `order` FROM ms_documents WHERE type = %i ORDER BY `order`", $this->id);
        foreach ($result as $res) {
            array_push($docList, new Document($res));
        }

        return $docList;
    }

    private function GetContacts() {
        $contactList = array();
        $result = dibi::query("SELECT c.adName, c.street, c.city, c.content FROM ms_contact as c JOIN ms_elements as e ON c.id = e.idContact WHERE e.idArticle = %i", $this->id);
        foreach ($result as $res) {
            array_push($contactList, new Contact($res));
        }

        return $contactList;
    }

    private function GetJobsClasses() {
        $classList = array();
        $result = dibi::query("SELECT jc.id, jc.image, jc.name, jc.empTitle, jc.order FROM ms_classes as jc JOIN ms_elements as e ON jc.id = e.idClass WHERE e.idArticle = %i ORDER BY jc.order", $this->id);
        foreach ($result as $res) {
            array_push($classList, new JobClass($res));
        }

        return $classList;
    }

    private function GetArchiveClasses($archiveId) {
        $result = dibi::query("SELECT classId, name, $archiveId as archiveId FROM ms_archivedclasses WHERE archiveId = $archiveId");

        $archiveList = array();
        foreach ($result as $res) {
            array_push($archiveList, new ArchiveClassMenu($res));
        }

        return $archiveList;
    }

    private function GetArchiveName($archiveId) {
        $result = dibi::query("SELECT name FROM ms_archive WHERE id = $archiveId");
        $res = $result->fetchAll();

        return $res[0]->name;
    }

}

?>