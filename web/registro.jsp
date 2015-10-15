<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" type="text/css" href="js/libs/bootstrap-3.3.5-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="recursos/estilos/estilos.css">
        <script type="text/javascript" src="js/libs/jquery/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="js/libs/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
    </head>
    <body>
        <%
            if (session.getAttribute("usuarioActual") == null) {
        %>
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-5">
                <p id="txtBienvenida" class="navbar-text"></p>
            </div>
            <div class="col-lg-offset-8">
                <button id="btnHeaderLogin" class="btn btn-default btn-lg navbar-btn" 
                        name="btnHeader" type="submit" value="btnIniciarSession">Iniciar Sesión</button>
                <button id="btnCerrarSesion" class="btn btn-default btn-lg navbar-btn" type="submit"
                        name="btnHeader" value="btnCerrarSesion">Cerrar Session</button>
                <button id="btnPerfil" class="btn btn-default btn-lg navbar-btn" name="btnHeader"
                        type="submit" value="btnPerfil">Perfil</button>
            </div>
        </nav>
        <%
        } else {
        %>
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-6">
                <div class="col-lg-offset-5">
                    <p id="txtBienvenida" class="navbar-text"></p>
                </div>
                <button id="btnHeaderLogin" class="btn btn-default btn-lg navbar-btn" 
                        name="btnHeader" type="submit" value="btnIniciarSession">Iniciar Sesión</button>
                <button id="btnCerrarSesion" class="btn btn-default btn-lg navbar-btn" type="submit"
                        name="btnHeader" value="btnCerrarSesion">Cerrar Session</button>
                <button id="btnPerfil" class="btn btn-default btn-lg navbar-btn" name="btnHeader"
                        type="submit" value="btnPerfil">Perfil</button>
            </div>
        </nav>
        <%
            }
        %>
    </body>
</html>
