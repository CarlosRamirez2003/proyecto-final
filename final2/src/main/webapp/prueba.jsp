<%@ page import="edu.umg.dao.noticiasDao" %>
<%@ page import="edu.umg.model.noticias" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="edu.umg.utils.VariablesGlobales" %>

<%--
  Created by IntelliJ IDEA.
  User: Andres
  Date: 27/10/2022
  Time: 3:01 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>

<%

    String nombre =request.getParameter("nombre");
    String comentario =request.getParameter("comentario");



    Statement st = VariablesGlobales.conn.createStatement();

    String query = "INSERT INTO comentarios(nombre,comentario)VALUES('" + nombre + "','" + comentario + "')";

    st.executeUpdate(query);

%>


<div class="row">
    <form class="col s12" method="post" action="Menu.jsp">
        COMENTARIO GUARADATO

        <button class="btn waves-effect waves-light" type="submit" name="action">
            <i class="material-icons right">REGRESAR</i>
        </button>
    </form>
</div>



</body>
</html>
