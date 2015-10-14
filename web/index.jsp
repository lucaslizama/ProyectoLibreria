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
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-6">
                <p id="txtBienvenida" class="navbar-text">Bienvenido</p>
                <form name="botones-header" action="" method="get">
                    <button id="btnLogin" class="btn btn-default btn-lg navbar-btn" 
                                name="btnHeader" type="submit" value="btnIniciarSession">Iniciar Sesión</button>
                    <button id="btnCerrarSesion" class="btn btn-default btn-lg navbar-btn" type="submit"
                                name="btnHeader" value="btnCerrarSesion">Cerrar Session</button>
                    <button id="btnPerfil" class="btn btn-default btn-lg navbar-btn" name="btnHeader"
                            type="submit" value="btnPerfil">Perfil</button>
                </form>
            </div>
        </nav>
        <div id="cuerpo" class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 bg-success">
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
            <div class="row">
                
            </div>
        </div>
    </body>
</html>
