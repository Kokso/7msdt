<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/db.php';

class DocumentDal {

    /**
     * Get list of documents (basic data for documents admin page)
     * @return array
     */
    public function GetDocuments($type) {
        $docList = array();
        $result = dibi::query("SELECT `id`, `title`, `order` FROM ms_documents WHERE `type`=%i ORDER BY `id`", $type);
        foreach ($result as $res) {
            array_push($docList, (object) array('id' => $res->id, 'title' => $res->title, 'order' => $res->order));
        }

        return $docList;
    }

    /**
     * Insert new record of document to ms_documents table
     * @param type $arr
     * @return int id of inserted doc
     * @throws Exception
     */
    public function InsertDoc($arr) {
        $insCount = dibi::query('INSERT INTO [ms_documents]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of document failed");
        }
        return dibi::insertId();
    }

    public function GetDocFile($docId) {
        $result = dibi::query("SELECT `file` FROM ms_documents WHERE `id`=%i", $docId);
        return $result->fetchSingle();
    }

    public function DeleteDoc($docId) {
        $delCount = dibi::query("DELETE FROM ms_documents WHERE `id`=%i", $docId);
        if ($delCount != 1) {
            throw new Exception("Delete of document failed");
        }
    }

    public function GetDoc($docId) {
        $result = dibi::query("SELECT * FROM `ms_documents` WHERE `id`=%i", $docId);
        $res = $result->fetchAll();
        return (object) array(
                    'id' => $res[0]->id,
                    'title' => $res[0]->title,
                    'order' => $res[0]->order,
        );
    }

    public function UpdateDoc($arr) {
        dibi::query('UPDATE `ms_documents` SET ', $arr, 'WHERE `id`=%i', $arr['id']);
    }

    public function ReorderDocs($docs) {
        foreach ($docs as $doc) {
            $arr = array(
                'id' => $doc->id,
                'order' => $doc->order
            );
            dibi::query('UPDATE `ms_documents` SET ', $arr, 'WHERE `id`=%i', $arr['id']);
        }
    }
}

?>