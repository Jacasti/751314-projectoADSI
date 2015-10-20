<?php

require 'constants.php'; // se incluyen las constantes para poder establecer la conexion con la BD

class conexion_class{
    
    private $conexion; // Se declara la variable privada de conexion
    
    public function conexion(){
        // se valida si existe una conexion 
        if(!isset($this->conexion)){
            //se valia si existe un error al conectar con al bd, si exite se retorna dentro del cathc
               try {
                   $this->conexion = (mysql_connect(SERVIDOR,USUARIO,PASSWORD,PORT)) or die (mysql_error());
                   mysql_select_db(DATABASE, $this->conexion) or die (mysql_error());
                   
                   // se retorna la conexion 
                   
                   return $this->conexion;
                   
            } catch (Exception $exc) {
                echo $exc->getMessage();
            }
                    
        }
        
    }
    // Metodo para insertar, actualizar, borrar datos en la DB.
    public function ejecutarQuery($sql){
        // se valida si sucede un error al procesar la peticion
        try {
            $resultado = mysql_query($sql, $this->conexion);
            if(!$resultado){
                
                echo 'MySQL Error: ' . mysql_error();
                exit;
                
            }
            return $resultado;
            
        } catch (Exception $exc) {
            echo $exc->getMessage();
        }
          mysql_close($this->conexion);   
    }
    // Metodo para obtener los resultados de una consulta en la DB.
    public function consultarQuery($sql) {
        // se valida si sucede un error al procesar la peticion
        try {
            // se ejecuta la consulta en la base de datos
            $consulta = mysql_query($sql, $this->conexion);
            // se valida si ocurre un error en la consulta
            if (!$consulta) {
                // se retorna el error que ocurrio al realizar la consulta
                return "MYSQL Error:" . mysql_error($consulta);
            } else { 
                return mysql_fetch_assoc($consulta);
            }
        } catch (Exception $e) {
            return $e->getMessage();
        }
        mysql_close($this->conexion);
    }
}

