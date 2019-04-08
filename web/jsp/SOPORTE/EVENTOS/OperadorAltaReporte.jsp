<%-- 
    Document   : OperadorAltaReporte
    Created on : 7/04/2019, 03:04:21 PM
    Author     : ACIE-PC
--%>

<%@page import="soporte.ConsultaUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
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
    
    //Variables para traer clientes en select
    Usuario userX = new Usuario();
    String cliente = "";
    
    //Consulta usuarios clientes para select 
    ArrayList <Usuario> clientes = new ArrayList();
    ConsultaUsuario cu = new ConsultaUsuario();
    clientes = cu.consultaTipoUsuario(1);
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
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/OperadorAltaReporte.jsp">Alta Reporte</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/InicioEventos.jsp">Cerrar Sesión</a></li>
                    </ul>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/OperadorAltaReporte.jsp">Alta Reporte</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/InicioEventos.jsp">Cerrar Sesión</a></li>
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
                                            <label class="small">Selecciona el correo del usuario con la incidencia:</label>  
                                            <br><br>
                                            <select id="usuario"  name="usuario">
                                                <%
                                                    for(int i = 0; i < clientes.size(); i++){
                                                       userX = clientes.get(i);
                                                       cliente = userX.getCorreo();
                                                %>
                                                    <option value="<%=cliente%>" selected><%=cliente%></option>
                                                <%  }%>
                                            </select>     
                                        </div>
                                    </div>
                                    <div class="col s5 l5 m5 xl5">
                                        <br><br>
                                        <div class="input-field col s12">
                                            <input id="fecha" type="date" name="fecha" onkeypress="validap();" />
                                            <label for="fecha">Escoge la fecha del día en que se realiza el reporte</label>       
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="contenido" type="text" name="contenido" onkeypress="vNumyLetras();" />
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