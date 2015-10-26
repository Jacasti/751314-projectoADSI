<?php
require_once 'conexion_class.php';

class login_class {
    private $conexion;

    public function __construct() {
        $this->conexion = new conexion_class();
        $this->conexion->conexion();
    }

    public function login($username, $password) {
        $sql = "SELECT * FROM USUARIOS WHERE usu_username = '".$username."' AND usu_password = '".$password."';";
        $query = $this->conexion->consultarQuery($sql);

        return $query;
    }
}
