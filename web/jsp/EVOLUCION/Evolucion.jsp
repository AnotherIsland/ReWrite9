<%-- 
    Document   : Evolucion
    Created on : 17/11/2018, 07:03:07 AM
    Author     : Axolotech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="../../css/materialize.css"  media="screen,projection"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="../../favicon.ico"/>
  <title>ReWrite - Evolución</title>
</head>
<body>
    <%
        HttpSession sesi = request.getSession();
        if (sesi.getAttribute("ID") != null) {
        %>
<div class="" name="header">
  <nav>
    <div class="nav-wrapper ">
      <a href="../../index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="../../img/logoT.png"></a>
      <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/index.jsp">Cerrar Sesión</a></li>
        <li><a class=" text-accent-4" href="../MISOBRAS/MisObras.jsp">Mis Obras</a></li>
        <li><a class=" text-accent-4" href="../CREAR/Crear.jsp">Crear</a></li>
        <li><a class=" text-accent-4" href="../AJUSTES/Ajustes.jsp">Ajustes</a></li>
        <li><a class=" text-accent-4" href="../EVOLUCION/Evolucion.jsp">Evolución</a></li>
      </ul>
      <ul class="sidenav" id="mobile-demo">
        <li><a class=" text-accent-4" href="../Login.jsp">Cerrar Sesión</a></li>
        <li><a class=" text-accent-4" href="../MISOBRAS/MisObras.jsp">Mis Obras</a></li>
        <li><a class=" text-accent-4" href="../CREAR/Crear.jsp">Crear</a></li>
        <li><a class=" text-accent-4" href="../AJUSTES/Ajustes.jsp">Ajustes</a></li>
        <li><a class=" text-accent-4" href="../EVOLUCION/Evolucion.jsp">Evolución</a></li>
      </ul>
    </div>
  </nav>
</div>
<div class="container">
  <div class="section white col s10 m10 l10 xl10 offset-s1 offset-l1 offset-m1 offset-xl1 z-depth-3" >
    <h4 class="center">Evolución</h4>
    <span class="grey-text">Aquí podrás encontrar gráficas que se actualizan dependiendo el número de obras que hayas realizado. 
        También puedes revisar las correciones que se hayan hecho a tus escritos a lo largo de algunos meses.</span>
  </div>
  <!--Aparecen los datos anteriormente guardados en el input para que el usuario vea que va a modifixar-->
  <div class="section grey z-depth-3">
          <div class="row">
            <h5 class="white-text">Obras realizadas</h5><hr class="blue lighten-1">
            <div class="col s12 m12 l12 xl12 " >
                <div class="center"><img class="responsive-img" src="../../img/graph1.png"></div>
            </div>
          </div>
          <div class="row">
            <h5 class="white-text">Correciones</h5><hr class="blue lighten-1">
            <div class="col s12 m12 l12 xl12 " >
                <div class="center"><img src="../../img/graph2.png"></div>
            </div>
          </div>
  </div><br><br>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="../../js/materialize.min.js"></script>
<script type="text/javascript" src="../../js/init.js"></script>
<% } 
    else {
    RequestDispatcher rd = request.getRequestDispatcher("../Login.jsp");
                rd.forward(request, response);
}%>
</body>
</html>

