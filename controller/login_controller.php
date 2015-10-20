<?php
session_start();
require_once '../model/login_class.php';

$proceso = $_REQUEST['petition'];
$instancia = new login_controller($_REQUEST['txtUsername'],$_REQUEST['txtPassword']);

switch ($proceso) {
    case("validalogin"):
        $instancia->validalogin();
        break;
    case("logout"):
        $instancia->logout();
        break;
}

class login_controller {
    private $username;
    private $password;
    private $login;
            
    function __construct($username,$password) {
        $this->username = $username;
        $this->password = $password;
        $this->login = new login_class();
    }

    public function validalogin() {
        $validacion = $this->login->login($this->username,  $this->password);
        
        if (!$validacion) {
            echo "<script>alert('El usuario y contrasena son incorrectas')</script>";
            echo '<meta http-equiv="refresh" content="0; url=../index.php" />';
        } else {
            $_SESSION['username'] = $this->username;
            $_SESSION['password'] = $this->password;
            $_SESSION['fullname'] = $validacion["usu_primer_nombre"].$validacion["usu_primer_apellido"];
            echo "<script>alert('Bienvenido a Help Desk ".$validacion["usu_primer_nombre"]."')</script>";
            header("Location: ../index.php");
        }
    }

    public function logout() {
        session_destroy();
        header("Location: ../index.php");   
    }
}
