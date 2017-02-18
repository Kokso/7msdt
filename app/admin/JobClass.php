<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/admin/DAL/ClassDal.php';
include_once $rootDir . '/app/db.php';

class JobClass {

    // types of class
    private static $ClassType = 1; // regular class
    private static $OtherType = 0; // other types, like Veduca...
    private static $ClassArticleId = 6;
    private $classDal;

    function __construct() {
        $this->classDal = new ClassDal();
    }

    /**
     * Save JobClass to DB
     * @param type $jClass JSON class object
     */
    public function Save($jClass) {
        if ((int) $jClass->id > 0) {
            $this->UpdateClass($jClass);
            $this->UpdateEmployees($jClass);
        } else {
            $classId = $this->AddClass($jClass);
            $this->AddEmployee($jClass, $classId);
            $this->AddClassToElements($classId);
        }
    }

    public function Delete($classId) {
        $this->classDal->DeleteClass($classId);
        $this->classDal->DeleteEmployees($classId);
        $this->classDal->DeleteClassFromElements($classId);
    }

    /**
     * Update JobClass in DB
     * @param type $jClass JSOM class object
     */
    private function UpdateClass($jClass) {
        $arr = $this->ClassToArray($jClass);
        $this->classDal->UpdateClass($arr);
    }

    private function UpdateEmployees($jClass) {
        $arr = $this->EmptToArrayUpdate($jClass);

        foreach ($arr as $empArr) {
            $this->classDal->UpdateEmployee($empArr);
        }
    }

    private function AddClassToElements($classId) {
        $arr = array('idClass' => $classId, 'idArticle' => JobClass::$ClassArticleId);
        $this->classDal->InsertClassToElements($arr);
    }

    private function AddClass($jClass) {
        $arr = $this->ClassToArray($jClass);
        return $this->classDal->InsertClass($arr);
    }

    private function AddEmployee($jClass, $classId) {
        $arr = $this->EmptToArray($jClass, $classId);

        foreach ($arr as $empArr) {
            $this->classDal->InsertEmployee($empArr);
        }
    }

    private function ClassToArray($jClass) {
        $arr = array(
            'id' => $jClass->id,
            'empTitle' => $jClass->empTitle,
            'name' => $jClass->name,
            'order' => $jClass->order,
            'image' => $jClass->image,
            'type' => $jClass->image == "i_23teacher" ? JobClass::$ClassType : JobClass::$OtherType
        );

        return $arr;
    }

    private function EmptToArray($jClass, $classId) {
        $arr = array(
            array('name' => $jClass->emp1->name, 'idClass' => $classId),
            array('name' => $jClass->emp2->name, 'idClass' => $classId),
        );

        return $arr;
    }

    private function EmptToArrayUpdate($jClass) {
        $arr = array(
            array('name' => $jClass->emp1->name, 'id' => $jClass->emp1->id),
            array('name' => $jClass->emp2->name, 'id' => $jClass->emp2->id),
        );

        return $arr;
    }

    public function Get($classId) {
        if ($classId == -1) {
            return (object) array(
                        'id' => $classId,
                        'name' => "Spoločné",
                        'empTitle' => "",
                        'image' => "",
                        'order' => 0
            );
        }

        $class = $this->classDal->GetClass($classId);
        $class->employees = $this->classDal->GetEmployees($classId);

        return $class;
    }

}

?>