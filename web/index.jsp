<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Libreria Pagina Principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="js/libs/bootstrap-3.3.5-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="recursos/estilos/estilos.css">
        <script type="text/javascript" src="js/libs/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-default container">
            <p class="navbar-text h2">Proyecto Libreria</p>
            <div class="col-lg-offset-6">
                <p id="txtBienvenida" class="navbar-text">Bienvenido</p>
                <button id="btnLogin" class="btn btn-default btn-lg navbar-btn" 
                            name="btnLogin" type="submit" value="btnLogin">Iniciar Sesión</button>
                <button id="btnCerrarSesion" class="btn btn-default btn-lg navbar-btn" type="submit"
                            name="btnCerrarSesion" value="btnCerrarSesion">Cerrar Session</button>
                <button id="btnPerfil" class="btn btn-default btn-lg navbar-btn" name="btnPerfil"
                        type="submit" value="btnPerfil">Perfil</button>
            </div>
        </nav>
        <div id="cuerpo" class="container">
            <div class="row">
                <div class="col-lg-2 bg-primary">
                    
                </div>
                <div class="col-lg-9 bg-primary col-lg-offset-1">
                    
                </div>
            </div>
        </div>
    </body>
</html>
