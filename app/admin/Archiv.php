<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/admin/DAL/ArchivDal.php';
include_once $rootDir . '/app/db.php';

class Archiv {
     
    private $ArchivDal;

    function __construct() {
        $this->ArchivDal = new ArchivDal();
    }
    
    /**
     * Save Event to DB
     * @param type $archive JSON class object
     */
    public function DoArchivation($archive) {
        $archiveId = $this->CreateArchive($archive->name);
        $this->ArchiveClasses($archiveId);
        $this->ArchiveEvents($archiveId);
    }
    
    private function CreateArchive($archiveName){
        $arr = array(
            'name' => $archiveName
        );
        return $this->ArchivDal->InsertArchive($arr);
    }
    
    private function ArchiveClasses($archiveId){
        $this->ArchivDal->CopyClasses($archiveId);
    }
    
    private function ArchiveEvents($archiveId){
        $this->ArchivDal->UpdateClasses($archiveId);
    }
    
    /**
     * Update Event in DB
     * @param type $event JSON class object
     */
    private function UpdateEvent($event) {
        $arr = $this->EventToArray($event);
        $this->EventDal->UpdateEvent($arr);
    }
    
    private function AddEventToElements($eventId) {
        $arr = array('idEvent' => $eventId, 'idArticle' => Event::$EventArticleId);
        $this->EventDal->InsertEventToElements($arr);
    }

    private function AddEvent($event) {
        $arr = $this->EventToArray($event);
        return $this->EventDal->InsertEvent($arr);
    }
    
    private function EventToArray($event) {
        $arr = array(
            'id' => $event->id,
            'title' => $event->title,
            'content' => $event->content,
            'classId' => $event->classId,
            'order' => $event->order
        );

        return $arr;
    }
    
    public function Get($eventId) {
        $event = $this->EventDal->GetEvent($eventId);

        return $event;
    }
    
    public function Delete($eventId){
        $this->EventDal->DeleteEvent($eventId);
        $this->EventDal->DeleteEventFromElements($eventId);
        $this->EventDal->DeleteImageForEvent($eventId);
    }
}

?>