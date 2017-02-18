<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/libs/php_image_magician.php';
include_once $rootDir . '/app/admin/File.php';

class Image extends File {

    private $thumbPath = NULL;
    
    /**
     * Save image to target path
     * @param type $targetPath path without file name
     */
    public function Save($targetPath, $fileName = NULL, $fileType = array()) {
        if ($fileName === NULL) {
            $fileName = $this->name;
        }

        $this->name = $this->ReplaceWhiteChars($fileName);

        //$this->VerifyImageType();

        $this->RenameIfAlreadyExists($targetPath);

        $this->SaveFile($targetPath);
    }
    
    protected function VerifyImageType() {
        if (exif_imagetype($this->tmpName) == IMAGETYPE_GIF ) {
            return;
        }
        if (exif_imagetype($this->tmpName) == IMAGETYPE_PNG ) {
            return;
        }
        if (exif_imagetype($this->tmpName) == IMAGETYPE_BMP ) {
            return;
        }
        if (exif_imagetype($this->tmpName) == IMAGETYPE_JPEG ) {
            return;
        }
        
        throw new Exception("Incorrect file format", File::$ErrFileType);
    }
    
    public function SaveThumb($targetPath){
        $image = new imageLib($this->filePath);
        $image->resizeImage(NULL, 150, 'portrait');
        $image->saveImage($targetPath.$this->name);
    }
}

?>