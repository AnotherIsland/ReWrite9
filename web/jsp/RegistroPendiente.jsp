<%-- 
    Document   : RegistroPendiente
    Created on : 10/03/2019, 08:13:03 PM
    Author     : ACIE-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ReWrite - Registro</title>
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>
    </head>
    <body class="grey darken-1">
        <nav>
            <div class="nav-wrapper white">
                <div class="row">
                    <div class="col s2 l2 m2 xl2 offset-l5 offset-xl5 offset-s4 offset-m4">
                        <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="${pageContext.request.contextPath}/img/logo.png"/></a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container">

            <div class="row white z-depth-4 section col s12 l12 m12 xl12">
                
                <div class="row center-align">
                    <h3>¡Gracias por unirte a la comunidad de ReWrite!</h3>
                    <h6>Revisa tu bandeja de correo electrónico para validar tu registro.</h6>
                </div>
                <br><br>
                <a href="${pageContext.request.contextPath}/jsp/Registro.jsp">Regresar al Inicio</a>
            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/init.js"></script>
    </body>
</html>
