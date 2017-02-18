<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/admin/DAL/DocumentDal.php';
include_once $rootDir . '/app/admin/File.php';
include_once $rootDir . '/app/db.php';

class Document {

    private $documentDal;

    function __construct() {
        $this->documentDal = new DocumentDal();
    }

    /**
     * Save Document to DB
     * @param type $doc JSON class object
     */
    public function Save($doc) {
        if ((int) $doc->id > 0) {
            $this->UpdateDocument($doc);
        } else {
            $this->AddDocument($doc);
        }
    }

    private function UpdateDocument($doc) {
        $arr = $this->DocUpdateToArray($doc);
        $this->documentDal->UpdateDoc($arr);
    }

    private function AddDocument($doc) {
        $arr = $this->DocToArray($doc);
        return $this->documentDal->InsertDoc($arr);
    }

    private function DocToArray($doc) {
        $arr = array(
            'id' => $doc->id,
            'title' => $doc->title,
            'file' => $doc->file,
            'type' => $doc->type,
            'order' => $doc->order
        );

        return $arr;
    }

    private function DocUpdateToArray($doc) {
        $arr = array(
            'id' => $doc->id,
            'title' => $doc->title,
            'order' => $doc->order
        );

        return $arr;
    }

    public function Delete($docId) {
        $file = "../.." . $this->documentDal->GetDocFile($docId);
        $this->documentDal->DeleteDoc($docId);
        File::DeleteFile($file);
    }

    public function Get($docId) {
        $doc = $this->documentDal->GetDoc($docId);

        return $doc;
    }

}

?>