<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/admin/DAL/NoteDal.php';
include_once $rootDir . '/app/db.php';

class Note {
    
    private static $NoteArticleId = 2;
    
    private $noteDal;

    function __construct() {
        $this->noteDal = new NoteDal();
    }
    
    /**
     * Save Note to DB
     * @param type $note JSON class object
     */
    public function Save($note) {
        if ((int) $note->id > 0) {
            $this->UpdateNote($note);
        } else {
            $noteId = $this->AddNote($note);
            $this->AddNoteToElements($noteId);
        }
    }
    
    /**
     * Update Note in DB
     * @param type $note JSON class object
     */
    private function UpdateNote($note) {
        $arr = $this->NoteToArray($note);
        $this->noteDal->UpdateNote($arr);
    }
    
    private function AddNoteToElements($noteId) {
        $arr = array('idNote' => $noteId, 'idArticle' => Note::$NoteArticleId);
        $this->noteDal->InsertNoteToElements($arr);
    }

    private function AddNote($note) {
        $arr = $this->NoteToArray($note);
        return $this->noteDal->InsertNote($arr);
    }
    
    private function NoteToArray($note) {
        $arr = array(
            'id' => $note->id,
            'title' => $note->title,
            'content' => $note->content,
            'order' => $note->order,
            'color' => $note->color
        );

        return $arr;
    }
    
    public function Get($noteId) {
        $note = $this->noteDal->GetNote($noteId);

        return $note;
    }
    
    public function Delete($noteId){
        $this->noteDal->DeleteNote($noteId);
        $this->noteDal->DeleteNoteFromElements($noteId);
    }
}

?>