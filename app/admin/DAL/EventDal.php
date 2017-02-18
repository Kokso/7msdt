<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/db.php';

class EventDal {
    
    /**
     * Get list of events (basic data for class admin page)
     * @return array
     */
    public function GetEvents($classId) {
        $eventList = array();
        $result = dibi::query("SELECT `id`, `title`, `classId`, `order` FROM ms_events WHERE classId = %i AND archiveId IS NULL ORDER BY `order`", $classId);
        foreach ($result as $res) {
            array_push($eventList, (object) array('id' => $res->id, 'title' => $res->title, 'classId' => $res->classId, 'order' => $res->order));
        }

        return $eventList;
    }
    
    /**
     * Insert reference to event to ms_elements table
     * @param type $arr
     * @throws Exception
     */
    public function InsertEventToElements($arr) {
        $insCount = dibi::query('INSERT INTO [ms_elements]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of event to elements table failed");
        }
    }

    /**
     * Insert new record of event to ms_events table
     * @param type $arr
     * @return int id of inserted event
     * @throws Exception
     */
    public function InsertEvent($arr) {
        $insCount = dibi::query('INSERT INTO [ms_events]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of event failed");
        }
        return dibi::insertId();
    }
    
    public function GetEvent($eventId) {
        $result = dibi::query("SELECT * FROM `ms_events` WHERE `id`=%i", $eventId);
        $res = $result->fetchAll();
        return (object) array(
                    'id' => $res[0]->id,
                    'title' => $res[0]->title,
                    'content' => $res[0]->content,
                    'classId' => $res[0]->classId,
                    'order' => $res[0]->order
        );
    }
    
    /**
     * Update record of event in ms_events table
     * @param type $arr
     * @throws Exception
     */
    public function UpdateEvent($arr) {
        dibi::query('UPDATE `ms_events` SET ', $arr, 'WHERE `id`=%i', $arr['id']);
    }
    
    public function DeleteEvent($eventId){
        $delCount = dibi::query("DELETE FROM ms_events WHERE `id`=%i", $eventId);
        if ($delCount != 1) {
            throw new Exception("Delete of event failed");
        }
    }
    
    public function DeleteEventFromElements($eventId){
        $delCount = dibi::query("DELETE FROM ms_elements WHERE `idEvent` = %i", $eventId);
        if ($delCount != 1) {
            throw new Exception("Delete of event element failed");
        }
    }
    
    public function InsertImg($img, $thumb, $eventId) {
        $arr = $this->ImgToArray($img, $thumb, $eventId);
        
        $insCount = dibi::query('INSERT INTO [ms_gallery]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of image failed");
        }
    }
    
    private function ImgToArray($img, $thumb, $eventId){
        $arr = array(
            'file' => $img,
            'thumb' => $thumb,
            'idEvent' => $eventId
        );

        return $arr;
    }
    
    public function GetGallery($eventId) {
        $imgList = array();
        $result = dibi::query("SELECT * FROM `ms_gallery` WHERE `idEvent`=%i ORDER BY id", $eventId);
        foreach ($result as $res) {
            array_push($imgList, (object) array('id' => $res->id, 'thumb' => $res->thumb, 'file' => $res->file));
        }

        return $imgList;
    }
    
    public function GetImage($id) {
        $result = dibi::query("SELECT * FROM `ms_gallery` WHERE `id`=%i", $id);
        return $result->fetchAll();
    }
    
    public function DeleteImage($id){
        $delCount = dibi::query("DELETE FROM ms_gallery WHERE `id`=%i", $id);
        if ($delCount != 1) {
            throw new Exception("Delete of image failed");
        }
    }
    
    public function DeleteImageForEvent($eventId){
        dibi::query("DELETE FROM ms_gallery WHERE `idEvent`=%i", $eventId);
    }
    
    public function ReorderEvents($events) {
        foreach ($events as $event) {
            $arr = array(
                'id' => $event->id,
                'order' => $event->order
            );
            dibi::query('UPDATE `ms_events` SET ', $arr, 'WHERE `id`=%i', $arr['id']);
        }
    }
}

?>