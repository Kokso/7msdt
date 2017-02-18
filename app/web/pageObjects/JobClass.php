<?php

class JobClass {
    
    public $image;
    public $name;
    public $empTitle;
    public $employees;
    public $order;
    
    public function __construct($dbResult) {
        $this->image = "www/images/personal/".$dbResult->image.".png";
        $this->name = $dbResult->name;
        $this->empTitle = $dbResult->empTitle;
        $this->order = $dbResult->order;
        $this->element = "/view/web/elements/jobClass.html";
        $this->employees = $this->GetEmployees($dbResult->id);
    }
    
    private function GetEmployees($classId){
        $employeeList = array();
        $result = dibi::query("SELECT name FROM ms_employees WHERE idClass = %i", $classId);
        foreach ($result as $res) {
            array_push($employeeList, $res->name);
        }
        
        return $employeeList;
    }
}

?>