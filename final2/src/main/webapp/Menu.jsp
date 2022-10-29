<%@ page import="edu.umg.dao.noticiasDao" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.umg.model.noticias" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Andres
  Date: 25/10/2022
  Time: 7:20 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <Style>
        .contenedor{
            display: flex;
            justify-content: center;
            margin-top: 5px;
            background-color: #1c1c9e;
        }


    </Style>

</head>
<body>
<%
    String usuario = request.getParameter("nombre");
    String motivo = request.getParameter("motivo");

%>


<nav>
    <div class="nav-wrapper blue darken-1">
        <a href="#" class="brand-logo center">Bienvenido <% out.print(usuario);

        %>
        </a>
        <ul id="nav-mobile" class="left hide-on-med-and-down">
        </ul>
    </div>

</nav>

     <div class="contenedor">
    <img src="https://cdn.abcotvs.com/dip/images/12375869_102622-wabc-sandy-watch-live-img.png?w=660&r=16%3A9"   height="250px" width="400px"/>
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-NI3fo7Xg1hDA3qKK3SAfq8jzWWyFsSL8sXWUOHq4U5nUyCYNWP9XapwoX0F3MpiYf2I&usqp=CAU"   height="250px" width="400px"/>
         <img src="https://cdn.abcotvs.com/dip/images/11493289_012022-WABC-24x7-generic-meta-img.png"   height="250px" width="400px"/>
             <img src="https://i.ytimg.com/vi/QEmRAxi9EXU/maxresdefault.jpg"   height="250px" width="400px"/>

</div>



</script>

<table  class="striped blue lighten-4" >
    <thead>
    <tr>
        <th>titulo</th>
        <th>firma</th>


    </tr>

    </thead>

    <tbody>
    <%
        List<noticias> noticiasDao = new noticiasDao().json2();

        int  numero = 0;
        ResultSet rs = null;

        noticiasDao NoticiasDao = new noticiasDao();
        List<noticias> noticias =NoticiasDao.getAllDB();
        for (noticias noticia : noticias){
    %>
    <tr>
        <td><a href="mostrar.jsp?titulo=<%= noticia.getTitulo()%>&resumen=<%= noticia.getResumen()%>&resumen=<%= noticia.getResumen()%>&firma=<%= noticia.getFirma()%>&url=<%= noticia.getUrl()%>"><%= noticia.getTitulo() %></a></td>
        <td><%=  noticia.getFirma()%></td>




        <td>  <form class="col s12" method="get" action="mostrar.jsp">

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
    <form class="col s12" method="post" action="inicio.html.jsp">
        <button class="btn waves-effect cyan lighten-2" type="submit" name="action">REGRESAR
            <i class="material-icons right">send</i>
        </button>
    </form>
</div>

<div class="row">
    <form class="col s12" method="post" action="Menu.jsp">
        <button class="btn waves-effect cyan lighten-2" type="submit" name="action">SUBIR
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
