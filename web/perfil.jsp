<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="js/libs/bootstrap-3.3.5-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="js/libs/jquery-ui-1.11.4/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="js/libs/DataTables-1.10.9/media/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="js/libs/DataTables-1.10.9/extensions/Select/css/select.jqueryui.css">
        <link rel="stylesheet" type="text/css" href="recursos/estilos/estilos.css">
        <script type="text/javascript" src="js/libs/jquery/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="js/libs/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
        <script type="text/javascript" src="js/libs/jquery-ui-1.11.4/jquery-ui.js"></script>
        <script type="text/javascript" src="js/libs/DataTables-1.10.9/media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/libs/DataTables-1.10.9/extensions/Select/js/dataTables.select.js"></script>
        <title>Perfil</title>
    </head>
    <body>
        <%
            if (session.getAttribute("usuarioActual") != null) {
                Usuario actual = (Usuario) session.getAttribute("usuarioActual");
                if (actual.isAdministrador()) {
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
                    $("#btnPerfil").click(function () {
                        window.location = "perfil.jsp";
                    });
                </script>
            </div>
        </nav>
        <div class="container">
            <div id="tabs">
                <ul>
                    <li><a href="#tab-administrador">Administrador</a></li>
                    <li><a href="#tab-perfil">Perfil</a></li>
                </ul>
                <div id="tab-administrador">
                    <table id="tabla-usuarios">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Primer Nombre</th>
                                <th>Segundo Nombre</th>
                                <th>Apellido Paterno</th>
                                <th>Apellido Materno</th>
                                <th>Fecha Nacimiento</th>
                                <th>Administrador</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Usuario aux = new Usuario();
                                List<Usuario> usuarios = aux.buscarUsuarios();
                                StringBuilder sb = new StringBuilder();
                                for (Usuario user : usuarios) {
                                    sb.append(
                                            "<tr>" +
                                                "<td>" + user.getUsername() + "</td>" +
                                                "<td>" + user.getPassword() + "</td>" +
                                                "<td>" + user.getPrimerNombre() + "</td>" +
                                                "<td>" + user.getSegundoNombre() + "</td>" +
                                                "<td>" + user.getApellidoPaterno() + "</td>" +
                                                "<td>" + user.getApellidoMaterno() + "</td>" +
                                                "<td>" + user.getFechaNacimiento() + "</td>" +
                                                "<td>" + user.isAdministrador() + "</td>" +
                                            "</tr>"
                                    );
                                }
                            %>
                            <%=sb.toString()%>
                        </tbody>
                    </table>
                </div>
                <div id="tab-perfil">
                    <p>TODO Perfil del usuario Administrador</p>
                </div>
            </div>
        </div>
        <script>
            $("#tabs").tabs();
            $("#tabla-usuarios").DataTable({
                select: true
            });
        </script>
        <%
        } else {//Fin usuario es administrador.
        %>

        <%
            }//Fin usuario no es administrador.
        } else {//Fin hay usuario loggeado.
        %>
        <script>
            window.location = "index.jsp";
        </script>
        <%
            }//Fin no hay usuario loggeado.
%>
    </body>
</html>
