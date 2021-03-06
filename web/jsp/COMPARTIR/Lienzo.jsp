<%-- 
    Document   : Lienzo
    Created on : 17/11/2018, 07:00:52 AM
    Author     : Axolotech
--%>

<%@page import="controller.AdminObras"%>
<%@page import="model.Lienzo"%>
<%@page import="model.Obra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesi = request.getSession();
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    
    if (sesi.getAttribute("ID") != null) {
    String sello = "";  
    int idUs = Integer.parseInt(sesi.getAttribute("idUsuario").toString());
    if (request.getAttribute("sello") != null) {
        sello = request.getAttribute("sello").toString();
        request.setAttribute("sello", sello);
    }
    
    
    Obra obraX = null;
    Lienzo lie = null;
    AdminObras ao = new AdminObras();
    String titulo = "";
    String cont = "";
  
    String idObra = "";

    if(request.getParameter("idObra") != null ||request.getAttribute("idObra")!= null ){
        
        if(request.getParameter("idObra") != null){
            idObra = request.getParameter("idObra");
        }else{
            idObra = request.getAttribute("idObra").toString();
        }
        
        obraX = ao.buscaObraporID(Integer.parseInt(idObra));
               
               
        lie = ao.getLie();
        titulo = obraX.getTitulo();
        cont = lie.getContenido();
        
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
        <h6 class="white-text">Deja aquí tu consejo según la categoría.</h6><br>
        <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">forum</i>&nbsp;Ver el chat</a>
        <ul class="collapsible">
          <li>
            <div class="collapsible-header"><i class="material-icons">assignment_turned_in</i>Ortografía y gramática</div>
            <div class="collapsible-body">
             <form action="${pageContext.request.contextPath}/EnviaConsejo" method="POST">
                    <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                    <input type="text"  name="consejo" onkeypress="vNumyLetras();" class="white-text" placeholder="Escribe aquí..."/>
                    <input type="text" hidden name="idUs" id="idUs" value="<%=idUs%>" />
                    <input type="text" hidden name="categoria" value="ortografia"/>
                    <input type="submit" value="ENVIAR CONSEJO" class="btn waves-effect waves-light" />
                </form>
            </div>
          </li>
          <li>
            <div class="collapsible-header"><i class="material-icons">photo_filter</i>Claridad</div>
            <div class="collapsible-body">
              <form action="${pageContext.request.contextPath}/EnviaConsejo" method="POST">
                    <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                    <input type="text"  name="consejo" onkeypress="vNumyLetras();" class="white-text" placeholder="Escribe aquí..."/>
                    <input type="text" hidden name="idUs" id="idUs" value="<%=idUs%>" />
                    <input type="text" hidden name="categoria" value="claridad"/>
                    <input type="submit" value="ENVIAR CONSEJO" class="btn waves-effect waves-light" />
                </form>
            </div>
          </li>
          <li>
            <div class="collapsible-header"><i class="material-icons">description</i>Estructura</div>
            <div class="collapsible-body"><!--aquí va el consejo-->
              <form action="${pageContext.request.contextPath}/EnviaConsejo" method="POST">
                    <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                    <input type="text"  name="consejo" onkeypress="vNumyLetras();" class="white-text" placeholder="Escribe aquí..."/>
                    <input type="text" hidden name="idUs" id="idUs" value="<%=idUs%>" />
                    <input type="text" hidden name="categoria" value="estructura"/>
                    <input type="submit" value="ENVIAR CONSEJO" class="btn waves-effect waves-light" />
                </form>
            </div>
          </li>
          <li>
            <div class="collapsible-header"><i class="material-icons">flag</i>Otros</div>
            <div class="collapsible-body">
              <form action="${pageContext.request.contextPath}/EnviaConsejo" method="POST">
                    <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                    <input type="text"  name="consejo" onkeypress="vNumyLetras();" class="white-text" placeholder="Escribe aquí..."/>
                    <input type="text" hidden name="idUs" id="idUs" value="<%=idUs%>" />
                    <input type="text" hidden name="categoria" value="otros"/>
                    <input type="submit" value="ENVIAR CONSEJO" class="btn waves-effect waves-light" />
                </form>
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
        <form action="${pageContext.request.contextPath}/ActualizarObra" method="POST">
            <input type="button" class="btn waves-effect waves-light right" name="revisar" id="revisar" value="Revisar" onclick="revEnsayo();" /><br><br>
            <input hidden type="text" name="titulo" class="input-field oculto " placeholder="Título" value="<%=titulo%>" />
            <p><%=titulo%></p>
            
            <input type="text" name="tipo" id="tipo" value="lienzo" hidden="true" />
            <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
            <p><%=cont%></p>
            <textarea hidden class="input-field oculto materialize-textarea"  name="contenido" id="contenido"   placeholder="Escribe aquí..." ><%=cont%></textarea>
            <hr>
            <label for=""><h6>Sello</h6></label>
            <input type="text" name="sello" id="sello" class="input-field oculto" disabled="true" value="<%=sello%>">
            <br><br>
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
