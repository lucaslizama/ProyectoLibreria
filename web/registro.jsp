<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" type="text/css" href="js/libs/bootstrap-3.3.5-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="js/libs/jquery-ui-1.11.4/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="recursos/estilos/estilos.css">
        <script type="text/javascript" src="js/libs/jquery/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="js/libs/jquery-ui-1.11.4/jquery-ui.js"></script>
        <script type="text/javascript" src="js/libs/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
    </head>
    <body>
        <%
            if (session.getAttribute("usuarioActual") == null) {
                if(request.getParameter("error") == null){
        %>
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-5">
                <p id="txtBienvenida" class="navbar-text"></p>
            </div>
            <div class="col-lg-offset-10">
                <button id="btnHeaderLogin" class="btn btn-default btn-lg navbar-btn" 
                        name="btnHeader" type="button" value="btnIniciarSession">Iniciar Sesión</button>
                <script>
                    $("#btnHeaderLogin").click(function(){
                       window.location = "index.jsp?btnHeader=login"; 
                    });
                </script>
            </div>
        </nav>
        <div class="container">
            <fieldset class="col-lg-offset-3">
                <form id="formRegistro" class="form-horizontal col-lg-7 well" action="Registro" method="get">
                    <legend>Registro</legend>
                    <div class="form-group">
                        <label for="txtNombre" class="col-lg-5 control-label">Nombre</label>
                        <div class="col-lg-6">
                            <input id="txtNombre" type="text" class="form-control" name="nombre"
                                   placeholder="Nombre" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtSegundoNombre" class="col-lg-5 control-label">Segundo Nombre</label>
                        <div class="col-lg-6">
                            <input id="txtSegundoNombre" type="text" class="form-control" name="segundoNombre"
                                   placeholder="Segundo Nombre" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtApellidoPaterno" class="col-lg-5 control-label">Apellido Paterno</label>
                        <div class="col-lg-6">
                            <input id="txtApellidoPaterno" type="text" class="form-control" name="apellidoPaterno"
                                   placeholder="Apellido Paterno" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtApellidoMaterno" class="col-lg-5 control-label">Apellido Materno</label>
                        <div class="col-lg-6">
                            <input id="txtApellidoMaterno" type="text" class="form-control" name="apellidoMaterno"
                                   placeholder="Apellido Materno" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dpFechaNacimiento" class="col-lg-5 control-label">Fecha Nacimiento</label>
                        <div class="col-lg-6">
                            <input id="dpFechaNacimiento" type="text" class="form-control" name="fechaNacimiento"
                                   required="true" placeholder="Fecha Nacimiento">
                            <script>
                                $("#dpFechaNacimiento").datepicker({
                                   dateFormat: "yy-mm-dd" 
                                });
                            </script>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtUsername" class="col-lg-5 control-label">Username</label>
                        <div class="col-lg-6">
                            <input id="txtUsername" type="text" class="form-control" name="username"
                                   placeholder="Username" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword" class="col-lg-5 control-label">Contraseña</label>
                        <div class="col-lg-6">
                            <input id="txtPassword" type="password" class="form-control" name="password"
                                   placeholder="Contraseña" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtRepetirPassword" class="col-lg-5 control-label">Reingrese Contraseña</label>
                        <div class="col-lg-6">
                            <input id="txtRepetirPassword" type="password" class="form-control" name="repetirPassword"
                                   placeholder="Reingrese Contraseña" required="true">
                        </div>
                    </div>
                    <label id="lblErrorCampo" class="text-danger"></label>
                    <div class="col-lg-offset-4 col-lg-10">
                        <button id="btnRegistro" class="btn btn-default btn-lg"
                                type="button" name="btnRegistro">Registrarse</button>
                    </div>
                    <script>
                        function isEmpty(texto){
                            if(texto){
                                return false;
                            }else{
                                return true;
                            }
                        } 
                        
                        $("#btnRegistro").click(function(){
                            if(isEmpty($("#txtNombre").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu nombre");
                                return;
                            }
                            
                            if(isEmpty($("#txtSegundoNombre").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu segundo nombre");
                                return;
                            }
                            
                            if(isEmpty($("#txtApellidoPaterno").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu apellido paterno");
                                return;
                            }
                            
                            if(isEmpty($("#txtApellidoMaterno").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu apellido materno");
                                return;
                            }
                            
                            if(!$("#dpFechaNacimiento").val()){
                                $("#lblErrorCampo").text("Ingrese su fecha de nacimiento");
                                return;
                            }
                            
                            if(isEmpty($("#txtUsername").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu username");
                                return;
                            }
                            
                            if(isEmpty($("#txtPassword").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu password");
                                return;
                            }
                            
                            if(isEmpty($("#txtRepetirPassword").val())){
                                $("#lblErrorCampo").text("Debes reingresar tu password");
                                return;
                            }
                            
                            if($("#txtPassword").val() === $("#txtRepetirPassword").val()){
                                $("#formRegistro").submit();
                            }else{
                                $("#lblErrorCampo").text("Lass passwords ingresadas no son iguales");
                                return;
                            }
                        });
                    </script>
                </form>
            </fieldset>
        </div>
        <%
                }else{
                    if(request.getParameter("error").equals("crearUsuario")){
                        
        %>
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-5">
                <p id="txtBienvenida" class="navbar-text"></p>
            </div>
            <div class="col-lg-offset-10">
                <button id="btnHeaderLogin" class="btn btn-default btn-lg navbar-btn" 
                        name="btnHeader" type="button" value="btnIniciarSession">Iniciar Sesión</button>
                <script>
                    $("#btnHeaderLogin").click(function(){
                       window.location = "index.jsp?btnHeader=login"; 
                    });
                </script>
            </div>
        </nav>
        <div class="container">
            <fieldset class="col-lg-offset-3">
                <form id="formRegistro" class="form-horizontal col-lg-7 well" action="Registro" method="get">
                    <legend>Registro</legend>
                    <div class="form-group">
                        <label for="txtNombre" class="col-lg-5 control-label">Nombre</label>
                        <div class="col-lg-6">
                            <input id="txtNombre" type="text" class="form-control" name="nombre"
                                   placeholder="Nombre" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtSegundoNombre" class="col-lg-5 control-label">Segundo Nombre</label>
                        <div class="col-lg-6">
                            <input id="txtSegundoNombre" type="text" class="form-control" name="segundoNombre"
                                   placeholder="Segundo Nombre" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtApellidoPaterno" class="col-lg-5 control-label">Apellido Paterno</label>
                        <div class="col-lg-6">
                            <input id="txtApellidoPaterno" type="text" class="form-control" name="apellidoPaterno"
                                   placeholder="Apellido Paterno" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtApellidoMaterno" class="col-lg-5 control-label">Apellido Materno</label>
                        <div class="col-lg-6">
                            <input id="txtApellidoMaterno" type="text" class="form-control" name="apellidoMaterno"
                                   placeholder="Apellido Materno" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dpFechaNacimiento" class="col-lg-5 control-label">Fecha Nacimiento</label>
                        <div class="col-lg-6">
                            <input id="dpFechaNacimiento" type="text" class="form-control" name="fechaNacimiento"
                                   required="true" placeholder="Fecha Nacimiento">
                            <script>
                                $("#dpFechaNacimiento").datepicker({
                                   dateFormat: "yy-mm-dd" 
                                });
                            </script>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtUsername" class="col-lg-5 control-label">Username</label>
                        <div class="col-lg-6">
                            <input id="txtUsername" type="text" class="form-control" name="username"
                                   placeholder="Username" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword" class="col-lg-5 control-label">Contraseña</label>
                        <div class="col-lg-6">
                            <input id="txtPassword" type="password" class="form-control" name="password"
                                   placeholder="Contraseña" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtRepetirPassword" class="col-lg-5 control-label">Reingrese Contraseña</label>
                        <div class="col-lg-6">
                            <input id="txtRepetirPassword" type="password" class="form-control" name="repetirPassword"
                                   placeholder="Reingrese Contraseña" required="true">
                        </div>
                    </div>
                    <label id="lblErrorCampo" class="text-danger">El nombre de usuario que ingreso ya existe</label>
                    <div class="col-lg-offset-4 col-lg-10">
                        <button id="btnRegistro" class="btn btn-default btn-lg"
                                type="button" name="btnRegistro">Registrarse</button>
                    </div>
                    <script>
                        function isEmpty(texto){
                            if(texto){
                                return false;
                            }else{
                                return true;
                            }
                        } 
                        
                        $("#btnRegistro").click(function(){
                            if(isEmpty($("#txtNombre").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu nombre");
                                return;
                            }
                            
                            if(isEmpty($("#txtSegundoNombre").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu segundo nombre");
                                return;
                            }
                            
                            if(isEmpty($("#txtApellidoPaterno").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu apellido paterno");
                                return;
                            }
                            
                            if(isEmpty($("#txtApellidoMaterno").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu apellido materno");
                                return;
                            }
                            
                            if(!$("#dpFechaNacimiento").val()){
                                $("#lblErrorCampo").text("Ingrese su fecha de nacimiento");
                                return;
                            }
                            
                            if(isEmpty($("#txtUsername").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu username");
                                return;
                            }
                            
                            if(isEmpty($("#txtPassword").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu password");
                                return;
                            }
                            
                            if(isEmpty($("#txtRepetirPassword").val())){
                                $("#lblErrorCampo").text("Debes reingresar tu password");
                                return;
                            }
                            
                            if($("#txtPassword").val() === $("#txtRepetirPassword").val()){
                                $("#formRegistro").submit();
                            }else{
                                $("#lblErrorCampo").text("Lass passwords ingresadas no son iguales");
                                return;
                            }
                        });
                    </script>
                </form>
            </fieldset>
        </div>
        <%
                    }else if(request.getParameter("error").equals("crearUsuario")){
        %>
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-5">
                <p id="txtBienvenida" class="navbar-text"></p>
            </div>
            <div class="col-lg-offset-10">
                <button id="btnHeaderLogin" class="btn btn-default btn-lg navbar-btn" 
                        name="btnHeader" type="button" value="btnIniciarSession">Iniciar Sesión</button>
                <script>
                    $("#btnHeaderLogin").click(function(){
                       window.location = "index.jsp?btnHeader=login"; 
                    });
                </script>
            </div>
        </nav>
        <div class="container">
            <fieldset class="col-lg-offset-3">
                <form id="formRegistro" class="form-horizontal col-lg-7 well" action="Registro" method="get">
                    <legend>Registro</legend>
                    <div class="form-group">
                        <label for="txtNombre" class="col-lg-5 control-label">Nombre</label>
                        <div class="col-lg-6">
                            <input id="txtNombre" type="text" class="form-control" name="nombre"
                                   placeholder="Nombre" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtSegundoNombre" class="col-lg-5 control-label">Segundo Nombre</label>
                        <div class="col-lg-6">
                            <input id="txtSegundoNombre" type="text" class="form-control" name="segundoNombre"
                                   placeholder="Segundo Nombre" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtApellidoPaterno" class="col-lg-5 control-label">Apellido Paterno</label>
                        <div class="col-lg-6">
                            <input id="txtApellidoPaterno" type="text" class="form-control" name="apellidoPaterno"
                                   placeholder="Apellido Paterno" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtApellidoMaterno" class="col-lg-5 control-label">Apellido Materno</label>
                        <div class="col-lg-6">
                            <input id="txtApellidoMaterno" type="text" class="form-control" name="apellidoMaterno"
                                   placeholder="Apellido Materno" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dpFechaNacimiento" class="col-lg-5 control-label">Fecha Nacimiento</label>
                        <div class="col-lg-6">
                            <input id="dpFechaNacimiento" type="text" class="form-control" name="fechaNacimiento"
                                   required="true" placeholder="Fecha Nacimiento">
                            <script>
                                $("#dpFechaNacimiento").datepicker({
                                   dateFormat: "yy-mm-dd" 
                                });
                            </script>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtUsername" class="col-lg-5 control-label">Username</label>
                        <div class="col-lg-6">
                            <input id="txtUsername" type="text" class="form-control" name="username"
                                   placeholder="Username" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword" class="col-lg-5 control-label">Contraseña</label>
                        <div class="col-lg-6">
                            <input id="txtPassword" type="password" class="form-control" name="password"
                                   placeholder="Contraseña" required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtRepetirPassword" class="col-lg-5 control-label">Reingrese Contraseña</label>
                        <div class="col-lg-6">
                            <input id="txtRepetirPassword" type="password" class="form-control" name="repetirPassword"
                                   placeholder="Reingrese Contraseña" required="true">
                        </div>
                    </div>
                    <label id="lblErrorCampo" class="text-danger">Error al crear usuario, intente otra vez</label>
                    <div class="col-lg-offset-4 col-lg-10">
                        <button id="btnRegistro" class="btn btn-default btn-lg"
                                type="button" name="btnRegistro">Registrarse</button>
                    </div>
                    <script>
                        function isEmpty(texto){
                            if(texto){
                                return false;
                            }else{
                                return true;
                            }
                        } 
                        
                        $("#btnRegistro").click(function(){
                            if(isEmpty($("#txtNombre").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu nombre");
                                return;
                            }
                            
                            if(isEmpty($("#txtSegundoNombre").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu segundo nombre");
                                return;
                            }
                            
                            if(isEmpty($("#txtApellidoPaterno").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu apellido paterno");
                                return;
                            }
                            
                            if(isEmpty($("#txtApellidoMaterno").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu apellido materno");
                                return;
                            }
                            
                            if(!$("#dpFechaNacimiento").val()){
                                $("#lblErrorCampo").text("Ingrese su fecha de nacimiento");
                                return;
                            }
                            
                            if(isEmpty($("#txtUsername").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu username");
                                return;
                            }
                            
                            if(isEmpty($("#txtPassword").val())){
                                $("#lblErrorCampo").text("Debes ingresar tu password");
                                return;
                            }
                            
                            if(isEmpty($("#txtRepetirPassword").val())){
                                $("#lblErrorCampo").text("Debes reingresar tu password");
                                return;
                            }
                            
                            if($("#txtPassword").val() === $("#txtRepetirPassword").val()){
                                $("#formRegistro").submit();
                            }else{
                                $("#lblErrorCampo").text("Lass passwords ingresadas no son iguales");
                                return;
                            }
                        });
                    </script>
                </form>
            </fieldset>
        </div>
        <%
                    }
                }
        } else {
        %>
        <script>
            window.location = "index.jsp";
        </script>
        <%
        }   
        %>
    </body>
</html>
