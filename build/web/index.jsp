<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Libreria Pagina Principal</title>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="js/libs/bootstrap-3.3.5-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="recursos/estilos/estilos.css">
        <script type="text/javascript" src="js/libs/jquery/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="js/libs/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
    </head>
    <body>
        <%  
            if (session.getAttribute("usuarioActual") == null) {
                if (request.getParameter("btnHeader") == null 
                        && request.getParameter("login") == null) {
        %>
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-5">
                <p id="txtBienvenida" class="navbar-text"></p>
            </div>
            <div class="col-lg-offset-9">
                <form id="header-form" action="index.jsp" method="get">
                    <button id="btnHeaderLogin" class="btn btn-default btn-lg navbar-btn" 
                            name="btnHeader" type="submit" value="login">Iniciar Sesión</button>
                    <button id="btnPerfil" class="btn btn-default btn-lg navbar-btn" name="btnHeader"
                            type="submit" value="btnPerfil">Perfil</button>
                </form>
            </div>
        </nav>
        <div id="cuerpo" class="container">
            <div class="row center-block">
                <div class="col-lg-8 col-lg-offset-2 well">
                    <form class="form-horizontal" action="index.jsp" method="get">
                        <div class="form-group col-lg-3">
                            <select id="ddlBusqueda" class="btn btn-default btn-md form-control" name="ddlBusqueda">
                                <option value="isbn">Isbn</option>
                                <option value="autor">Autor</option>
                                <option value="titulo">Titulo</option>
                                <option value="palabraClave">Palabra Clave</option>
                            </select>
                        </div>
                        <div class="form-group col-lg-9">
                            <input type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default btn-md ">Buscar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%
                } else {
                    if (request.getParameter("btnHeader") != null) {
                        if (request.getParameter("btnHeader").equals("login") 
                                || request.getParameter("btnHeader").equals("perfil")){
                    
        %>
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-9">
                <form id="header-form" action="index.jsp" method="get">
                    <button id="btnHeaderLogin" class="btn btn-default btn-lg navbar-btn" 
                            name="btnHeader" type="submit" value="login">Iniciar Sesión</button>
                    <button id="btnPerfil" class="btn btn-default btn-lg navbar-btn" name="btnHeader"
                            type="submit" value="btnPerfil">Perfil</button>
                </form>
            </div>
        </nav>
        <div class="container">
            <fieldset class="col-lg-offset-3">
                <form class="form-horizontal col-lg-6 well" action="Login" method="get">
                    <legend>Login</legend>
                    <div class="form-group">
                        <label for="txtUsername" class="col-lg-5 control-label">Nombre de Usuario</label>
                        <div class="col-lg-6">
                            <input id="txtUsername" type="text" class="form-control" name="username"
                                   placeholder="Usuario">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword" class="col-lg-5 control-label">Contraseña</label>
                        <div class="col-lg-6">
                            <input id="txtPassword" type="password" class="form-control" name="password"
                                   placeholder="Contraseña">
                        </div>
                    </div>
                    <div class="col-lg-offset-2 col-lg-10">
                        <button id="btnLogin" class="btn btn-default btn-lg" 
                                type="submit" name="btnLogin" 
                                value="login">Ingresar</button>
                        <button id="btnRegistroRedirect" class="btn btn-default btn-lg"
                                type="button" name="btnRegistroRedirect">Registrarse</button>
                    </div>
                    <script>
                        $("#btnRegistroRedirect").click(function(){
                            window.location = "registro.jsp";
                        });
                    </script>
                </form>
            </fieldset>
        </div>       
        <%
                        }
                    }else {
        %>
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-9">
                <form id="header-form" action="index.jsp" method="get">
                    <button id="btnHeaderLogin" class="btn btn-default btn-lg navbar-btn" 
                            name="btnHeader" type="submit" value="login">Iniciar Sesión</button>
                    <button id="btnPerfil" class="btn btn-default btn-lg navbar-btn" name="btnHeader"
                            type="button" value="btnPerfil">Perfil</button>
                </form>
            </div>
        </nav>
        <div class="container">
            <label id="lblWarning" class="h3 text-danger">Username o contraseña incorrectos</label>
        </div>
        <div class="container">
            <fieldset class="col-lg-offset-3">
                <form class="form-horizontal col-lg-6 well" action="Login" method="get">
                    <legend>Login</legend>
                    <div class="form-group">
                        <label for="txtUsername" class="col-lg-5 control-label">Nombre de Usuario</label>
                        <div class="col-lg-6">
                            <input id="txtUsername" type="text" class="form-control" name="username"
                                   placeholder="Usuario">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword" class="col-lg-5 control-label">Contraseña</label>
                        <div class="col-lg-6">
                            <input id="txtPassword" type="password" class="form-control" name="password"
                                   placeholder="Contraseña">
                        </div>
                    </div>
                    <div class="col-lg-offset-4 col-lg-1">
                        <button id="btnLogin" class="btn btn-default btn-lg" 
                                type="submit" name="btnLogin" 
                                value="login">Ingresar</button>
                    </div>
                </form>
            </fieldset>
            <script>
                var warning = $("#lblWarning");
                $("#txtUsername").click(function(){
                    warning.text("");
                });
                $("#txtPassword").click(function(){
                    warning.text("");
                });
            </script>
        </div> 
        <% 
                    }
                }
        } else {//Fin PostBack
                Usuario actual = (Usuario)session.getAttribute("usuarioActual");
        %>
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-6">
                <p id="txtBienvenida" class="navbar-text">Bienvenido <%=actual.getUsername()%></p>
            </div>
            <div class="col-lg-offset-9">
                <form id="header-form" class="col-lg-4" action="Logout" method="get">
                    <button id="btnHeaderLogout" class="btn btn-default btn-lg navbar-btn" 
                            name="btnHeader" type="submit" value="logout">Cerrar Sesión</button>
                </form>
                <button id="btnPerfil" class="btn btn-default btn-lg navbar-btn col-lg-4 col-lg-offset-3" name="btnHeader"
                            type="button" value="btnPerfil">Perfil</button>
                <script>
                    $("#btnPerfil").click(function(){
                        window.location = "perfil.jsp";
                    });
                </script>
            </div>
        </nav>
        <div id="cuerpo" class="container">
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 well">
                    <select id="ddlBusqueda" class="btn btn-default btn-md col-lg-2">
                        <option>Isbn</option>
                        <option>Autor</option>
                        <option>Titulo</option>
                        <option>Palabra Clave</option>
                    </select>
                    <input type="text" class="form-control-static col-lg-8">
                    <button type="submit" class="btn btn-default btn-md ">Buscar</button>
                </div>
            </div>
        </div>
        <%
                }//Fin else PostBack
        %>
    </body>
</html>
