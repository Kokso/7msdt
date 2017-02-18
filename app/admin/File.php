<?php

class File {

    protected $file;
    protected $name;
    protected $tmpName;
    protected $filePath = NULL;
    // File error codes
    public static $ErrFileType = 0;
    public static $ErrSave = 1;

    public function __construct($file) {
        $this->file = $file;
        $this->name = $file['name'];
        $this->tmpName = $file['tmp_name'];
    }
    
    public function GetName(){
        return $this->name;
    }

    /**
     * Save file to target path
     * @param type $targetPath path without file name
     */
    public function Save($targetPath, $fileName = NULL, $fileType = array()) {
        if ($fileName === NULL) {
            $fileName = $this->name;
        }

        $this->name = $this->ReplaceWhiteChars($fileName);

        if (count($fileType) > 0) {
            $this->VerifyFileType($fileType, $fileName);
        }

        $this->RenameIfAlreadyExists($targetPath);
        
        $this->SaveFile($targetPath);
    }
    
    protected function SaveFile($targetPath){
        if (!move_uploaded_file($this->tmpName, $targetPath . $this->name)){
            throw new Exception("File save failed", File::$ErrSave);
        }
        $this->filePath = $targetPath . $this->name;
    }

    protected function ReplaceWhiteChars($str) {
        $newStr = preg_replace('/\s+/', '_', $str);
        return $newStr;
    }
    
    /**
     * @param type $filePath path to file including file itself
     */
    public static function DeleteFile($filePath){
        if (file_exists($filePath)){
            unlink($filePath);
        }
    }

    protected function RenameIfAlreadyExists($filePath) {
        $count = 0;
        $newFname = $this->name;
        while (file_exists($filePath . $newFname)) {
            $count++;
            $newFname = "(" . $count . ")" . $this->name;
        }

        $this->name = $newFname;
    }

    /**
     * @param type $fileType array of types
     */
    protected function VerifyFileType($fileType, $fileName) {
        foreach ($fileType as $fType) {
            $end = ".".$fType;
            if (strpos($fileName, $end, strlen($fileName) - strlen($end)) !== false) {
                return;
            }
        }

        throw new Exception("Incorrect file format", File::$ErrFileType);
    }
}

?>