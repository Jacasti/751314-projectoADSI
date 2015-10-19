<?php

class conexion {
    
    
    private $db;
    private $usuario;
    private $servidor ;
    private $password ; 
    private $conect;
    private $encad; 
 
    public function conexion (){

    $this->db = "proyecto_adsi";
    $this->usuario = "root";
    $this->servidor = "localhost";
    $this->password = ""; 
    
        
    


    }
    
    
    public  function conectar(){
        
        $this->conect = mysql_connect($this->servidor, $this->usuario, $this->password) or die ("problemas con tratar de conectar con el servidor");
        return $this->conect; 
       
    }
    
    public function seleccion_db(){
        
    mysql_select_db($this->db , $this->conect) or die ("problemas al tratar de conectar con la base de datos");
    
        
        
    }
    
  
}

?>

