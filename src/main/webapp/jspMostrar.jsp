<%-- 
    Document   : jspMostrar
    Created on : 4 jul. 2020, 10:23:05
    Author     : Juan
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.progra2.jpa.Usuario"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="com.progra2.jpa.UsuarioJpaController"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("my_persistence_unit");
    UsuarioJpaController controler = new UsuarioJpaController(emf);
    List<Usuario> lista = new ArrayList< Usuario>();
    lista = controler.findUsuarioEntities();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registros</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <style>
            .box{
                padding: 2%;
            }
            h1{
                text-align: center;
            }
        </style> 
    </head>
    <body>
        <div class="box">
            <h1>Usuarios Registrados</h1>
            <br>
            <h4>Agregar nuevos usuarios: </h4>
            <a href="index.jsp"><button class="btn btn-success">Agregar</button></a>
            <br>
            <br>
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Email</th>
                        <th scope="col">Password</th>
                        <th scope="col">Administrar datos</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Usuario us : lista) {
                    %>
                    <tr>
                        <th scope="row"><%=us.getId()%></th>
                        <td><%=us.getNombre()%> </td>
                        <td><%=us.getCorreo()%></td>
                        <td><%=us.getContrasenia()%></td>
                        <td><a href="ServletEliminar?id=<%=us.getId()%>"><button class="btn btn-danger">Eliminar</button></a></td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
        </div>
    </body>
</html>
