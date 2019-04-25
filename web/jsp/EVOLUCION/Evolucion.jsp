<%-- 
    Document   : Evolucion
    Created on : 17/11/2018, 07:03:07 AM
    Author     : Axolotech
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Database.DataBase"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>
  <title>ReWrite - Evolución</title>
</head>
<body>
    <% 
        HttpSession sesi = request.getSession();
        String idUs = sesi.getAttribute("idUsuario").toString();
        /*if (sesi.getAttribute("ID") != null) {*/
        
        DataBase db = new DataBase();
        ResultSet rs = null;
        
        int numObras = 0;
        int numRes = 0;
        int numEns = 0;
        int numLir = 0;
        int numLie = 0;
        int numNar = 0;
 
        try {
                db.connect();
                rs = db.query("select count(*) from obra inner join tipoobra on obra.tipo = tipoobra.idtipoObra "
                        + "inner join relobrausu on relobrausu.idObra = obra.idObra "
                        + "where idUsuario = "+idUs+";");
                while(rs.next()){
                   numObras = rs.getInt("count(*)");                  
                } 
                
                rs = db.query("select count(*) from obra inner join tipoobra on obra.tipo = tipoobra.idtipoObra "
                        + "inner join relobrausu on relobrausu.idObra = obra.idObra "
                        + "where tipoobra.tipoObra = 'resumen' and idUsuario = "+idUs+";");
                while(rs.next()){
                   numRes = rs.getInt("count(*)");                  
                }
                
                rs = db.query("select count(*) from obra inner join tipoobra on obra.tipo = tipoobra.idtipoObra "
                        + "inner join relobrausu on relobrausu.idObra = obra.idObra "
                        + "where tipoobra.tipoObra = 'ensayo' and idUsuario = "+idUs+";");
                while(rs.next()){
                   numEns = rs.getInt("count(*)");                  
                }
                
                rs = db.query("select count(*) from obra inner join tipoobra on obra.tipo = tipoobra.idtipoObra "
                        + "inner join relobrausu on relobrausu.idObra = obra.idObra "
                        + "where tipoobra.tipoObra = 'narrativo' and idUsuario = "+idUs+";");
                while(rs.next()){
                   numNar = rs.getInt("count(*)");                  
                }
                
                rs = db.query("select count(*) from obra inner join tipoobra on obra.tipo = tipoobra.idtipoObra "
                        + "inner join relobrausu on relobrausu.idObra = obra.idObra "
                        + "where tipoobra.tipoObra = 'lirica' and idUsuario = "+idUs+";");
                while(rs.next()){
                   numLir = rs.getInt("count(*)");                  
                }
                
                rs = db.query("select count(*) from obra inner join tipoobra on obra.tipo = tipoobra.idtipoObra "
                        + "inner join relobrausu on relobrausu.idObra = obra.idObra "
                        + "where tipoobra.tipoObra = 'lienzo' and idUsuario = "+idUs+";");
                while(rs.next()){
                   numLie = rs.getInt("count(*)");                  
                }
                
                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }
        %>
<div class="" name="header">
  <nav>
    <div class="nav-wrapper ">
      <a href="../../index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="../../img/logoT.png"></a>
      <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/Login.jsp">Cerrar Sesión</a></li>
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/MISOBRAS/MisObras.jsp">Mis Obras</a></li>
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/CREAR/Crear.jsp">Crear</a></li>
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/AJUSTES/Ajustes.jsp">Ajustes</a></li>
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/EVOLUCION/Evolucion.jsp">Evolución</a></li>
      </ul>
      <ul class="sidenav" id="mobile-demo">
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/Login.jsp">Cerrar Sesión</a></li>
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/MISOBRAS/MisObras.jsp">Mis Obras</a></li>
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/CREAR/Crear.jsp">Crear</a></li>
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/AJUSTES/Ajustes.jsp">Ajustes</a></li>
        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/EVOLUCION/Evolucion.jsp">Evolución</a></li>
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
                <div class="center">
                    <canvas id="myChart" class="white-text"></canvas>
                    <input name="total" id="total" value="<%=numObras%>" hidden/>
                    <input name="lie" id="lie" value="<%=numLie%>" hidden/>
                    <input name="ens" id="ens" value="<%=numEns%>" hidden/>
                    <input name="nar" id="nar" value="<%=numNar%>" hidden/>
                    <input name="lir" id="lir" value="<%=numLir%>" hidden/>
                    <input name="res" id="res" value="<%=numRes%>" hidden/>
                   </div>
            </div>
          </div>
          <div class="row">
            <h5 class="white-text">Correciones</h5><hr class="blue lighten-1">
            <div class="col s12 m12 l12 xl12 " >
                <div class="center"><img src="${pageContext.request.contextPath}/img/graph2.png"></div>
            </div>
          </div>
  </div><br><br>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0">        </script>
<script src="../../js/evolucion.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/init.js"></script>
<% /*} 
    else {
    RequestDispatcher rd = request.getRequestDispatcher("../Login.jsp");
                rd.forward(request, response);
}*/%>
</body>
</html>

