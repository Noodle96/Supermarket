<%-- 
    Document   : register
    Created on : 03/12/2018, 12:53:55 PM
    Author     : russel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Registration</title>
    </head>
    <body>
        <center>
        <h1>Register Usuario</h1>
        <br>
        <hr>
        <br>
        <form action="serverusuario.do"method="POST">
            <input type="text" name="txtname" placeholder="Nombre" /> <br>
            <input type="text" name="txtlastname" placeholder="LastName" /> <br>
            <input type="email" name="txtemail" placeholder="Email" /> <br>
            <input type="password" name="txtpassword" placeholder="password" /> <br>
            <input type="submit" name="btnRegister" value="Register" /><br>
            <a href="index.jsp">Home</a>
            <a href="loginuser.jsp">Iniciar Session </a>
        </form>
    </center>
    </body>
</html>
