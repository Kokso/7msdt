<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/db.php';

class ClassDal {

    /**
     * Insert reference to class to ms_elements table
     * @param type $arr
     * @throws Exception
     */
    public function InsertClassToElements($arr) {
        $insCount = dibi::query('INSERT INTO [ms_elements]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of jobClass to elements table failed");
        }
    }

    /**
     * Insert new record of class to ms_classes table
     * @param type $arr
     * @return int id of inserted class
     * @throws Exception
     */
    public function InsertClass($arr) {
        $insCount = dibi::query('INSERT INTO [ms_classes]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of jobClass failed");
        }
        return dibi::insertId();
    }
    
    /**
     * Update record of class in ms_classes table
     * @param type $arr
     * @throws Exception
     */
    public function UpdateClass($arr) {
        dibi::query('UPDATE `ms_classes` SET ', $arr, 'WHERE `id`=%i', $arr['id']);
    }

    /**
     * Insert new record of employee to ms_employees table
     * @param type $arr
     * @throws Exception
     */
    public function InsertEmployee($arr) {
        $insCount = dibi::query('INSERT INTO [ms_employees]', $arr);
        if ($insCount != 1) {
            throw new Exception("Insert of employee failed");
        }
    }
    
    /**
     * Update record of employee in ms_employees table
     * @param type $arr
     * @throws Exception
     */
    public function UpdateEmployee($arr) {
        dibi::query('UPDATE `ms_employees` SET ', $arr, 'WHERE `id`=%i', $arr['id']);
    }

    /**
     * Get array of emplyees assigned to specified class
     * @param int $classId
     * @return array
     */
    public function GetEmployees($classId) {
        $employeeList = array();
        $result = dibi::query("SELECT id, name FROM ms_employees WHERE idClass = %i", $classId);
        $fResult = $result->fetchAll();
        foreach ($fResult as $res) {
            array_push($employeeList, (object) array('id' => $res->id, 'name' => $res->name));
        }

        return $employeeList;
    }

    public function GetClass($classId) {
        $result = dibi::query("SELECT * FROM `ms_classes` WHERE `id`=%i", $classId);
        $res = $result->fetchAll();
        return (object) array(
                    'id' => $res[0]->id,
                    'name' => $res[0]->name,
                    'empTitle' => $res[0]->empTitle,
                    'image' => $res[0]->image,
                    'order' => $res[0]->order
        );
    }

    /**
     * Get list of classes (basic data for class admin page)
     * @return array
     */
    public function GetClasses() {
        $classList = array();
        $result = dibi::query("SELECT `id`, `order`, `name`, `empTitle` FROM ms_classes ORDER BY `order`");
        foreach ($result as $res) {
            array_push($classList, (object) array('id' => $res->id, 'order' => $res->order, 'name' => $res->name, 'empTitle' => $res->empTitle));
        }

        return $classList;
    }

    public function DeleteClass($classId){
        $delCount = dibi::query("DELETE FROM ms_classes WHERE `id`=%i", $classId);
        if ($delCount != 1) {
            throw new Exception("Delete of class failed");
        }
    }
    
    public function DeleteEmployees($classId){
        $delCount = dibi::query("DELETE FROM ms_employees WHERE `idClass` = %i", $classId);
        if ($delCount != 2) {
            throw new Exception("Delete of employees failed");
        }
    }
    
    public function DeleteClassFromElements($classId){
        $delCount = dibi::query("DELETE FROM ms_elements WHERE `idClass` = %i", $classId);
        if ($delCount != 1) {
            throw new Exception("Delete of class element failed");
        }
    }
    
    public function ReorderClasses($classes) {
        foreach ($classes as $c) {
            $arr = array(
                'id' => $c->id,
                'order' => $c->order
            );
            dibi::query('UPDATE `ms_classes` SET ', $arr, 'WHERE `id`=%i', $arr['id']);
        }
    }
}

?>