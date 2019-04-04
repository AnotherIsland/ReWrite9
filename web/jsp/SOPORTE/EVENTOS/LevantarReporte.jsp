<%-- 
    Document   : UsOperador
    Created on : 12/03/2019, 09:55:07 PM
    Author     : ACIE-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%
    HttpSession sesi = request.getSession();
    //if (sesi.getAttribute("ID") != null) {
%>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>
        <title>ReWrite - Ayuda y soporte</title>
    </head>
    <body>
        <div class="" name="header">
            <nav>
                <div class="nav-wrapper ">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="${pageContext.request.contextPath}/img/logoT.png"></a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/index.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/Reporte.jsp">Ayuda</a></li>
                    </ul>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/Login.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/MISOBRAS/MisObras.jsp">Mis Obras</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/CREAR/Crear.jsp">Crear</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/AJUSTES/Ajustes.jsp">Ajustes</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/EVOLUCION/Evolucion.jsp">Evolución</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/Reporte.jsp">Ayuda</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12 xl12">
                    <div class="section white z-depth-3 center-align">
                        <h4 >Ayuda y soporte - Operador</h4>  
                    </div>

                    <br><br>
                    <div class="col s12 m12 l12 xl12 " >
                        <div class="section grey z-depth-3">
                            <div class="row">
                                <h6 class="white-text">Reporte de evento</h6><hr class="blue lighten-1">
                                <div class="col s12 m12 l12 xl12 " >
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col s12 m12 l12 xl12 " >
                    <div class="section white z-depth-3">
                        <h6>Para levantar un reporte de evento ingresa los siguientes datos:</h6>
                        <div class="row">
                            <form name="reporte" action="${pageContext.request.contextPath}/AltaReporte" method="POST">
                                <div class="row">
                                    <div class="col s5 l5 m5 xl5">
                                        <div class="input-field col s12">
                                            <input id="usuario" type="text" name="usuario" onkeypress="valCorreo();" />
                                            <label for="usuario">Ingresa el correo del usuario que ha reportado el asunto</label>       
                                        </div>
                                    </div>
                                    <div class="col s5 l5 m5 xl5">
                                        <div class="input-field col s12">
                                            <input id="fecha" type="date" name="fecha" onkeypress="validap();" />
                                            <label for="fecha">Escoge la fecha del día en que se realiza el reporte</label>       
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="contenido" type="text" name="contenido" onkeypress="validap();" />
                                        <label for="comentario">Escribe aquí el contenido del reporte...</label>       
                                    </div>
                                </div>
                                <div class="row">
                                    <input type="submit" name="aceptar" class="btn waves-effect waves-light" value="ENVIAR"/>
                                </div> 
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/init.js"></script>
</body>
</html>
<% //} 
    //else {

    //RequestDispatcher rd = request.getRequestDispatcher("../Login.jsp");
    //rd.forward(request, response);
//}%>