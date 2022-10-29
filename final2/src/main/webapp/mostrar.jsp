<%@ page import="edu.umg.utils.VariablesGlobales" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sound.midi.Soundbank" %>
<%@ page import="edu.umg.model.noticias" %>
<%@ page import="edu.umg.dao.noticiasDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static edu.umg.utils.VariablesGlobales.conn" %>
<%@ page import="edu.umg.model.comentario" %><%--
  Created by IntelliJ IDEA.
  User: Andres
  Date: 28/10/2022
  Time: 11:18 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MOSTRAR</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<nav>
    <div class="nav-wrapper blue darken-1">
        <a href="#" class="brand-logo center">Bienvenido al apartado de Comentarios<%request.getParameter("titulo");
        %>
        </a>
        <ul id="nav-mobile" class="left hide-on-med-and-down">
        </ul>
    </div>

</nav>

<div class="nav-wrapper teal lighten-4">

<h2>Articulo: </h2>

<h2><%= request.getParameter("titulo") %></h2>

<h4><%= request.getParameter("resumen") %></h4>
<h4><%= request.getParameter("firma") %></h4>
<h4><%= request.getParameter("url") %></h4>

<img src="<%= request.getParameter("url")%>"   height="250px" width="400px"/>

    <div class="nav-wrapper black">

<a href=”<%= request.getParameter("url")%>”>IMAGEN</a>
    </div>

</div>

    <h3>Comentarios: </h3>

<%
    Statement st = VariablesGlobales.conn.createStatement();
    String sql = "select * from comentarios";
    ResultSet rs = st.executeQuery(sql);

%>
<table  class="striped blue lighten-4" >
    <thead>
    <tr>
        <th>Nombre</th>
        <th>Comentario</th>


    </tr>
    <%
        while (rs.next()){
    %>
    <tr>

        <td><%= rs.getString("nombre")%></td>
        <td><%= rs.getString("comentario")%></td>



        </form>
        </td>
    </tr>

    <%
        }
    %>
    <tr>
    </tbody>
</table>


<div class="row">
    <form class="col s12" method="post" action="prueba.jsp">
        <div class="row">
            <div class="input-field col s6">
                <input id="user_name" name="nombre" type="text" class="validate">
                <label for="user_name">Nombre</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <input id="come" name="comentario" type="text" class="validate">
                <label for="come">comentario</label>
            </div>
        </div>
        <button class="btn waves-effect cyan lighten-2" type="submit" name="action">subir
            <i class="material-icons right">send</i>
        </button>
    </form>
</div>

<div class="row">
    <form class="col s12" method="post" action="Menu.jsp">
        <button class="btn waves-effect cyan lighten-2" type="submit" name="action">REGRESAR
            <i class="material-icons right">send</i>
        </button>
    </form>
</div>










<footer class="page-footer  blue-grey lighten-1">
    <div class="container">
        <div class="row">
            <div class="col l5 s12">
                <h5 class="white-text">Creador:</h5>
                <p class="grey-text text-lighten-4">Carlos Andres Ramirez Garcia </p>
            </div>
            <div class="col l5 offset-l2 s12">
                <h5 class="white-text">Universidad Mariano Galvez de Guatemala</h5>
                <ul>

                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            <h5 class="white-text">Fecha Actual</h5>

            <script>
                date = new Date().toLocaleDateString();
                document.write(date);
            </script>
        </div>
    </div>
</footer>

</body>
</html>
