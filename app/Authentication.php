<?php

$rootDir = $_SERVER['DOCUMENT_ROOT'];
include_once $rootDir . '/app/db.php';

class Authentication {

    private $timeout = 1800;

    public function LogIn($username, $password) {
        if (!$this->IsLogged()) {
            $result = dibi::query('SELECT * FROM `ms_users` WHERE `login`=%s AND `password`=%s', $username, $password);
            if ($result->count() > 0) {
                $this->SetSession();
                return true;
            } else {
                return false;
            }
        }

        return true;
    }

    public function LogOut() {
        if (session_id() == '') {
            session_start();
        }
        session_destroy();
        session_start();
    }

    public function IsLogged() {
        if (session_id() == '') {
            session_start();
        }

        $isLogged = isset($_SESSION['login']) && (time() - (int) $_SESSION['login']) < $this->timeout;
        if ($isLogged) {
            $this->SetSession();
        }

        return $isLogged;
    }

    private function SetSession() {
        if (session_id() == '') {
            session_start();
        }
        $_SESSION['login'] = time();
    }

}

?>