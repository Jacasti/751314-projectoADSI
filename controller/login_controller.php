<?php

	$realname=$_POST['realname'];
	$mail=$_POST['nick'];
	$pass= $_POST['pass'];
	$rpass=$_POST['rpass'];

	require("login_class.php");
	$checkemail=mysql_query("SELECT * FROM usuarios WHERE email='$use_correo'");
	$check_mail=mysql_num_rows($checkemail);
		if($pass==$rpass){
			if($check_mail>0){
				echo ' <script language="javaScript">alert("Atencion, ya existe el mail designado para un usuario, verifique sus datos");</script> ';
			}else{
				
				//require("connect_db.php");
				mysql_query("INSERT INTO usuarios VALUES('','$usu_username','$usu_password','$usu_correo','')");
				//echo 'Se ha registrado con exito';
				echo ' <script language="javaScript">alert("Usuario registrado con éxito");</script> ';
				mysql_close($link);
			}
			
		}else{
			echo 'Las contraseñas son incorrectas';
		}

	
?>