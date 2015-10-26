<?
session_start();

?>
<!DOCTYPE html>

<html>	
  <head>
     <meta charset="UTF-8">
	<title> MI PRIMER LOGIN </title>
       <link rel="stylesheet" href="estilo.css">
  </head>
<body align="center">
    <h1 align="center">INICIA SESSION PROYECTO ADSI </h1>
	<form name="frm_Login" action="controller/login_controller.php?solicitud=validalogin" method="POST" autocomplete="off">
            <table class="fondo" align="center" id="frm-table">
              <tr>
		<td>
	          <tr>
		    <td>
                       <nav>
			<td cols="">Escoga una opcion :</td>
			<td><select name="cboSeleccionRol" align="center">
			<option value="Seleccion Su Rol O tipo de Usuario" size="25" maxlength="25">Seleccione su rol<br></option>
			<option value="Usuario">Usuario</option>
			<option value="Tecnico">Tecnico</option>
			<option value="Administrador">Administrador</option>
			<option value="Invitado">Invitado</option>
			</select>
			</td><br>
			</nav>				
			</td>			
                    </tr><br>
            <tr>
                <td>
                    <div>
                    <td cols="">Ingrese Su Usuario:</td>
                    <td><input type="text" class="txt-login" name="txtUsername" placeholder="Nombre de Usuario"  size="20 maxlength="25"><br></td>
                    </div>
		</td>
            </tr>
            <tr>
              <td>
		<div>
		<td cols="">Ingrese Su Contraseña:</td>
		<td><input type="password" class="txt-login" name="txtPassword" placeholder="Su Contraseña " size="20" maxlength="25"><br></td>
		</div><br>
            </td>
            </tr>
            <tr align="right">
              <td>
		<td><input type="submit"  name="btnLogin" id="btn-login" value="Ingresar"></td>
	      </td>
	     </tr>
	    </td>
	   </tr>	
	</table>	
     </form>
</body>



</html>

	