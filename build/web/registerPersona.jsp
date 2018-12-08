<%-- 
    Document   : registerPersona
    Created on : 03/12/2018, 01:04:32 PM
    Author     : russel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Register Persona</h1>
        <br>
        <hr>
        <br>
        <form action="serverpersona.do"method="POST">
            <input type="text" name="txtdni" placeholder="Dni" /> <br>
            <input type="text" name="txtnames" placeholder="Nombres" /> <br>
            <input type="text" name="txtfirstA" placeholder="Apellido1" /> <br>
            <input type="text" name="txtsecondA" placeholder="Apellido2" /> <br>
            <input type="text" name="txtemail" placeholder="Email" /> <br>
            <input type="password" name="txtpass" placeholder="Password" /><br>
            <input type="text" name="txtsexo" placeholder="Sexo" /><br>
            <input type="submit" name="btnRegister" value="Register" /><br>
            <a href="index.jsp">Home</a>
        </form>
    </center>
    </body>
</html>
