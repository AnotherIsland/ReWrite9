<%-- 
    Document   : Login
    Created on : 17/11/2018, 07:03:22 AM
    Author     : Axolotech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesi;
    if(request.getSession() != null){
        sesi = request.getSession();
        sesi.invalidate();
    }
    
    String cp = "";

    if(request.getParameter("cp")!=null){//Revisa sea la petición para compartir
        cp = request.getParameter("cp");
    }
    
%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>
  <title>ReWrite - Login</title>
</head>
<body class="grey darken-1 ">
<nav>
  <div class="nav-wrapper white">
    <div class="row">
      <div class="col s2 l2 m2 xl2 offset-l5 offset-xl5 offset-s4 offset-m4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="${pageContext.request.contextPath}/img/logo.png"/></a>
      </div>
    </div>
  </div>
</nav>
<div class="container ">
  <div class="row white z-depth-4 section col s12 l12 m12 xl12">
    <div class="row ">
      <div class="col s2 l2 m2 xl2 offset-l10 offset-xl10 offset-s8 offset-m9">
        <h5>
          <a href="${pageContext.request.contextPath}/jsp/Registro.jsp" class="waves-effect waves-light light-blue btn">Regístrate</a>
        </h5>
      </div>
    </div>
    <div class="row">
      <div class="col s5 l5 m5 xl5 offset-l1 offset-xl1 offfset-s1 offfset-m1">
        <!--<img src="archivo.jpg">-->
        <img src="${pageContext.request.contextPath}/img/imgHome.png" class=" responsive-img" alt="imagen" />
      </div>
      <div class="col s5 l5 m5 xl5 ">
        <div class="">
          <h3>Inicia Sesión</h3>
          <form action="${pageContext.request.contextPath}/Login" method="post" name="formI" id="formI">
              <input type="text" name="cp" id="cp" hidden="true" value="<%=cp%>">
            <div class="row">
              <div class="input-field col s12">
                <input id="username" type="text" name="username" class="validate" onkeypress="valCorreo();">
                <label class="" for="username">Correo o nombre de usuario</label>
              </div>
            </div>
            <div class="row">
              <div class="input-field col s12">
                <input id="password" type="password" name="password" class="validate" onkeypress="vNumyLetras();">
                <label class="" for="password">Contraseña</label>
              </div>
            </div>
            <div class="row">
              <div class="input-field col s12">
                <input type="submit"  class="btn waves-effect waves-light" value="ENVIAR" onclick="return validaInicio(formI);addUser(); "  name="aceptar">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <br><br>
  </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/init.js"></script>
</body>
</html>

