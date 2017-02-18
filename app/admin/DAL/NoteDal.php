<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/db.php';

class NoteDal {

    /**
     * Get list of notes (basic data for class admin page)
     * @return array
     */
    public function GetNotes() {
        $noteList = array();
        $result = dibi::query("SELECT `id`, `title`, `order` FROM ms_notes ORDER BY `order`");
        foreach ($result as $res) {
            array_push($noteList, (object) array('id' => $res->id, 'order' => $res->order, 'title' => $res->title));
        }

        return $noteList;
    }

    /**
     * Insert reference to note to ms_elements table
     * @param type $arr
     * @throws Exception
     */
    public function InsertNoteToElements($arr) {
        $insCount = dibi::query('INSERT INTO [ms_elements]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of note to elements table failed");
        }
    }

    /**
     * Insert new record of note to ms_notes table
     * @param type $arr
     * @return int id of inserted note
     * @throws Exception
     */
    public function InsertNote($arr) {
        $insCount = dibi::query('INSERT INTO [ms_notes]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of note failed");
        }
        return dibi::insertId();
    }

    public function GetNote($noteId) {
        $result = dibi::query("SELECT * FROM `ms_notes` WHERE `id`=%i", $noteId);
        $res = $result->fetchAll();
        return (object) array(
                    'id' => $res[0]->id,
                    'title' => $res[0]->title,
                    'content' => $res[0]->content,
                    'color' => (string) $res[0]->color,
                    'order' => $res[0]->order
        );
    }

    /**
     * Update record of note in ms_notes table
     * @param type $arr
     * @throws Exception
     */
    public function UpdateNote($arr) {
        dibi::query('UPDATE `ms_notes` SET ', $arr, 'WHERE `id`=%i', $arr['id']);
    }

    public function DeleteNote($noteId) {
        $delCount = dibi::query("DELETE FROM ms_notes WHERE `id`=%i", $noteId);
        if ($delCount != 1) {
            throw new Exception("Delete of note failed");
        }
    }

    public function DeleteNoteFromElements($noteId) {
        $delCount = dibi::query("DELETE FROM ms_elements WHERE `idNote` = %i", $noteId);
        if ($delCount != 1) {
            throw new Exception("Delete of note element failed");
        }
    }

    public function ReorderNotes($notes) {
        foreach ($notes as $note) {
            $arr = array(
                'id' => $note->id,
                'order' => $note->order
            );
            dibi::query('UPDATE `ms_notes` SET ', $arr, 'WHERE `id`=%i', $arr['id']);
        }
    }

}

?>