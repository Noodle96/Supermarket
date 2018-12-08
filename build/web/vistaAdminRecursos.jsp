<%-- 
    Document   : vistaAdminRecursos
    Created on : 08/12/2018, 12:31:11 PM
    Author     : russel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    HttpSession sess = request.getSession();
    String emailUsuario = null;
    String tipoUsuario = null;
    if(sess.getAttribute("emailM") != null  && sess.getAttribute("tipoM") != null && sess != null ){
        emailUsuario = (String)sess.getAttribute("emailM");
        tipoUsuario = (String)sess.getAttribute("tipoM");
    }else{
        response.sendRedirect("index.jsp");
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <pre>
            Bienvenido <%=emailUsuario%> | Nivel Administrador Recursos | <a href="index.jsp?cerrar=true">Cerrar Sesion</a><hr>
        </pre>
        <h1>Hello World!</h1>
    </body>
</html>
