<%-- 
    Document   : index
    Created on : 03/12/2018, 12:43:42 PM
    Author     : russel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styes.css"/>
        <title>Pagina de Inicio Supermarket</title>
    </head>
    <body> <br><br><br><br>
    
    <center>
        <h1>Pagina de Acceso Administrador</h1>
        <hr><br>
        <form action="serverpersona.do" method="POST">
            <input type="email" name="txtemailuser" placeholder="email user"  /><br>
            <input type="password" name="txtpass" placeholder="password"  /><br>
            <input type="submit" value="iniciarsesion"name="btnIniciarSesion" /><br>
        </form>
        <a href="registerUser.jsp" class = "user">User</a><br>
        <a href="registerPersona.jsp" class="user">RegisterPersona</a>
    </center>
    
    <%
        HttpSession sesion = request.getSession();
        if(request.getAttribute("Fail") != null){
            out.print("<script>alert('No hay Acceso')</script>");
        }
        if(request.getAttribute("emailO") != null  && request.getAttribute("tipoAdminO") != null ){
            String em = (String)request.getAttribute("emailO");
            String tipo = (String)request.getAttribute("tipoAdminO");
            sesion.setAttribute("emailM", em);
            sesion.setAttribute("tipoM", tipo);
            //"adminRecursos";"adminHumanidades"
            if(tipo == "adminRecursos"){
                response.sendRedirect("vistaAdminRecursos.jsp");
            }else if(tipo == "adminHumanidades"){
                response.sendRedirect("vistaPersona.jsp");
            }
            
        }
        
        if(request.getParameter("cerrar") != null){
            sesion.invalidate();
            response.sendRedirect("index.jsp");
        }



    %>
    
    
        
    </body>
</html>
