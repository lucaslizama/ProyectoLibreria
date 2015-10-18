<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
    </head>
    <body>
        <%
            if(request.getParameter("usuarioActual") != null){
        %>
        
        <%
            }else{//Fin hay usuario loggeado.
        %>
        <script>
            window.location = "index.jsp";
        </script>
        <%
            }//Fin no hay usuario loggeado.
        %>
    </body>
</html>
