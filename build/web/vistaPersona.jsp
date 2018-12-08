<%-- 
    Document   : vistaPersona
    Created on : 03/12/2018, 12:38:17 AM
    Author     : russel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Uml.Persona"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.DAOPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    HttpSession ses = request.getSession();
    String emailUsuario = null;
    String tipoUsuario = null;
    if(ses.getAttribute("emailM") != null  && ses.getAttribute("tipoM") != null && ses != null ){
        emailUsuario = (String)ses.getAttribute("emailM");
        tipoUsuario = (String)ses.getAttribute("tipoM");
    }else{
        response.sendRedirect("index.jsp");
    }
%>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styes.css"/>
        <title>Vista Persona</title>
    </head>
    <%
        DAOPersona dao = new DAOPersona();
        List<Persona> datos = new ArrayList();
    %>
    <body padding>
        <pre>
            Bienvenido <%=emailUsuario%> | Nivel Administrador Humanidades | <a href="index.jsp?cerrar=true">Cerrar Sesion</a><hr>
        </pre>
        
        <nav class="menuCSS3 vista">
		<ul>
                    <li><a href="#">Tienda</a></li>
                    <li><a href="#">Estacionamiento</a></li>
                    <li><a href="#">Agregar Personal Especifico</a>
                        <ul>
                            <li><a href="#">Administrador Hum</a></li>
                            <li><a href="#">Administrador Rec</a></li>
                            <li><a href="#">Personal </a></li>
                            <li><a href="#">Mercaderista</a></li>
                        </ul>
                    </li>
                        
                    <li><a href="#">Almacen</a>
                            <ul>
                                    <li><a href="#">Interno</a></li>
                                    <li><a href="#">Externo</a></li>
                            </ul>
                    </li>
                    <li><a href="#">Contrato</a></li>
                    <li><a href="#">Sistema Previsional</a></li>
		</ul>
	</nav>
    
        <center>
            <h1>Persona</h1>
            <form action="serverpersona.do" method="POST">
                <input type="text" name="txtdnipersona" placeholder="dni Persona" /><br>
                <input type="text" name="txtname" placeholder="nombre Persona" /><br>
                <input type="text" name="txtapellido1" placeholder="Apellido 1 Persona" /><br>
                <input type="text" name="txtapellido2" placeholder="Apellido 2 Persona" /><br>
                <input type="email" name="txtemail" placeholder="email" /><br>
                <input type="text" name="txttelefono" placeholder="telefono" /><br>
                <input type="text" name="txtfechaInicioC" placeholder="fechaInicioContrato" /><br>
                <input type="text" name="txtfechaNacimiento" placeholder="fecha Nacimiento" /><br>
                <input type="text" name="txtdireccion" placeholder="Direccion" /><br>
                <input type="text" name="txtsexo" placeholder="sexo" /><br>
                <input type="text" name="txtidtienda" placeholder="idTienda" /><br>
                <input type="submit" name="btninsertar" value="Insertar"/>
                <input type="submit" name="btnmodificar" value="Modificar"/>
                <input type="submit" name="btneliminar" value="Eliminar"/><br>
                <br>
            </form>
        </center>
    <br>
        <hr>
        <center>
            <table border="1">
            <thead>
                <tr>
                    <th>Dni</th>
                    <th>Nombre</th>
                    <th>Image</th>
                    <th>Apellido1</th>
                    <th>Apellido2</th>
                    <th>Email</th>
                    <th>IsWorking</th>
                    <th>Telefono</th>
                    <th>FechaInicioContrato</th>
                    <th>FechaFinalContrato</th>
                    <th>FechaNacimiento</th>
                    <th>Direccion</th>
                    <th>Sexo</th>
                    <th>idTienda</th>
                </tr>
            </thead>
            <tbody>
                <%
                    //hacer un recorrido sobre el resultado
                    // de la consulta
                    datos = dao.consultar();
                    for(Persona p : datos){
                        %>
                        <tr>
                            <td><%= p.getDniPersona() %>  </td>
                            <td> <%= p.getNames() %> </td>
                            <td> <%= p.getImage() %>  </td>
                            <td> <%= p.getApellido1() %>  </td>
                            <td> <%=p.getApellido2() %>  </td>
                            <td> <%= p.getEmail() %> </td>
                            <td> <%= p.isIsWorking() %>  </td>
                            <td> <%= p.getTelefono() %>  </td>
                            <td> <%= p.getFechaInicioCon() %>  </td>
                            <td> <%= p.getFechaFinalCon() %>  </td>
                            <td> <%= p.getFechaNacimiento() %>  </td>
                            <td> <%= p.getDireccion() %>  </td>
                            <td> <%= p.getSexo() %>  </td>
                            <td> <%= p.getIdTienda() %>  </td>
                        </tr>
                        <%
                    }
                %>
            </tbody>
        </table>
        </center>

    </body>
</html>
