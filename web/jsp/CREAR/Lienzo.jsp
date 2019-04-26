<%-- 
    Document   : Lienzo
    Created on : 17/11/2018, 07:00:52 AM
    Author     : Axolotech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesi = request.getSession();
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    
    if (sesi.getAttribute("ID") != null) {
    String sello = "";    
    if (request.getAttribute("sello") != null) {
        sello = request.getAttribute("sello").toString();
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>
  <!--<script type="text/javascript" src="/socket.io/socket.io.js"></script>-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
  <title>ReWrite - Lienzo</title>
</head>
<body >
<div class="" name="header">
  <nav>
    <div class="nav-wrapper ">
      <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="${pageContext.request.contextPath}/img/logoT.png"></a>
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

  <div class="row">

    <div class="section grey col s3 m3 l3 xl3"><!--Sidebar para consejos y revisiones-->
      <h2 class="white-text">Lienzo</h2>
      <div class="row">
        <br>
        <h6 class="white-text">Aquí tenemos unos muy buenos consejos para ti. </h6><br>
        <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">forum</i>&nbsp;Ver el chat</a>
        <ul class="collapsible">
          <li>
            <div class="collapsible-header"><i class="material-icons">assignment_turned_in</i>Ortografía y gramática</div>
            <div class="collapsible-body">
              <span class="white-text">consejo</span><!--aquí va el consejo-->
            </div>
          </li>
          <li>
            <div class="collapsible-header"><i class="material-icons">photo_filter</i>Claridad</div>
            <div class="collapsible-body">
              <span class="white-text">consejo</span><!--aquí va el consejo-->
            </div>
          </li>
          <li>
            <div class="collapsible-header"><i class="material-icons">description</i>Estructura</div>
            <div class="collapsible-body"><!--aquí va el consejo-->
              <ul>
                <li class="white-text">Introducción</li>
                <li class="white-text">Desarrollo</li>
                <li class="white-text">Conclusión</li>
                <li class="white-text">Referencias</li>
              </ul>
            </div>
          </li>
        </ul>
        <h6 class="white-text" id="numP">Palabras:</h6><br><!--Aquí va el conteo de número de palabras-->
      </div>
      <div class="row">
        <h6 class="white-text">Otras herramientas</h6><br>
        <br><br>
        <!--Compartir obra y despliega vínculo-->
        <button id="compartir" class="btn-floating btn-large waves-effect waves-light blue" onclick="mostrarCompartir();">
          <i class="material-icons">person_add</i>
        </button><label class="white-text" for="compartir">&nbsp;&nbsp;Compartir Obra</label>
        <div class="" style="overflow: hidden;" id="share" name="share" hidden ><!--aparece sólo cuando se da clic en compartir-->
          <a class="truncate white-text" href="http://127.0.0.1:8084/ReWrite8/jsp/CREAR/Lienzo.jsp">
              http://127.0.0.1:8084/ReWrite8/jsp/CREAR/Lienzo.jsp
          </a>
        </div>
      </div>
    </div>
    <div class="section white col s8 m8 l8 xl8"><!--contenido principal donde se escribe-->
      <div>
        <form action="${pageContext.request.contextPath}/GuardarObra" method="POST">
            <input type="button" class="btn waves-effect waves-light right" name="revisar" id="revisar" value="Revisar" onclick="revEnsayo();"><br><br>
            <input type="text" name="titulo" class="input-field oculto " placeholder="Título" >
            <input type="text" name="tipo" id="tipo" value="lienzo" hidden="true">
            <input type="text" name="contenido" id="contenido" class="input-field oculto " placeholder="Escribe aquí..." >
            <input type="submit" class="btn waves-effect waves-light" name="guardar" id="guardar" value="Guardar"><br><br>
        </form>
      </div>
    </div>
    <ul id="slide-out" class="sidenav">
      <div class="chat section">
        <div class="row">
          <div id="messages"></div>
        </div>
        <div class="row">
          <div id="users" >
            <h7>Usuarios conectados: </h7>
            <ul id="user-list" class="list-group"></ul>
          </div>
        </div>

        <div class="responsive-table">
          <table class="table" align="centered">
            <tr>
              <form class="col l12 m12 s12 xl12" name="messageToSend">
                </th>
                <th>
                  <div class="input-field">
                    <label for="text">Mensaje:</label>
                    <textarea class="materialize-textarea" id="text" placeholder="Escribe aquí..."></textarea>
                  </div>
                  <div class="alert alert-danger" id="alert2"><strong>ERROR! </strong>Ingresa un mensaje válido.</div>
                </th>
                <th><br><br>
                  <div class="">
                    <button class="btn-floating btn-large waves-effect waves-light blue" onclick="addMessage()">
                      <i class="material-icons medium">send</i>
                    </button>
                  </div>
                </th>
              </form>
            </tr>
          </table>
        </div>
      </div>
    </ul>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/init.js"></script>
</body>
</html>
<% } 
    else {
    RequestDispatcher rd = request.getRequestDispatcher("../Login.jsp");
                rd.forward(request, response);
}%>
