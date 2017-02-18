<?php

/*
 * Response class for admin API
 */
class ErrorResponse {
    
    /*
     * Error types:
     * 1 - authentication error
     * 2 - access denied
     * 3 - operation error
     */
    public static $SuccessErr = 0;
    public static $AuthErr = 1;
    public static $AccessDeniedErr = 2;
    public static $OperationErr = 3;
    
    public static $SuccessMessage = "Zmeny boli uložené.";
    public static $ErrorMessage = "Zmeny sa nepodarilo uložiť.";
    
    public $error;
    public $message;
    
    public function __construct($error, $message) {
        $this->error = $error;
        $this->message = $message;
    }
}

?>