<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        // put your code here
        session_start();
        include_once 'view/frame/paths.php';
        if(!isset($_SESSION['username'])){
            include_once 'view/forms/frm_login.php';
        }else{
            include_once 'view/frame/layout.php';
        }
        
        
        ?>
    </body>
</html>
