<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/admin/DAL/EventDal.php';
include_once $rootDir . '/app/db.php';

class Event {
    
    private static $EventArticleId = 3;
    
    private $EventDal;

    function __construct() {
        $this->EventDal = new EventDal();
    }
    
    /**
     * Save Event to DB
     * @param type $event JSON class object
     */
    public function Save($event) {
        if ((int) $event->id > 0) {
            $this->UpdateEvent($event);
        } else {
            $eventId = $this->AddEvent($event);
            $this->AddEventToElements($eventId);
        }
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