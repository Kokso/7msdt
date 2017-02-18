<?php

/**
 * Class handling JSON communication
 */
class Json {

    /**
     * Send JSON response
     * @param type $obj object to be send as JSON
     */
    public static function Send($obj) {
        $json = json_encode($obj, JSON_HEX_QUOT | JSON_HEX_TAG);
        header('Content-type: application/json');
        echo $json;
    }
    
    /**
     * Recieve JSON response
     * @param type $json received JSON
     */
    public static function Receive() {
        $json = file_get_contents('php://input');
        $obj = json_decode($json);
        return $obj;
    }
}

?>