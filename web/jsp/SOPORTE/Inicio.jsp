<%-- 
    Document   : Inicio
    Created on : 12/03/2019, 10:00:39 PM
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

                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12 xl12">
                    <div class="section white z-depth-3 center-align">
                        <h4 >Ayuda y soporte</h4>  
                        <h6>Inicia sesión</h6>  
                    </div>
                    <br>
                    <div class="col s4 m4 l4 xl4 " >
                        <div class="section grey z-depth-3">
                            <div class="row center-align">
                                <h6 class="white-text">Eventos</h6><hr class="blue lighten-1">
                                <div class="col s12 m12 l12 xl12 " >
                                    <form action="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/InicioEventos.jsp">
                                    <div class="input-field col s12 center-align">
                                        <input type="submit"  class="btn waves-effect waves-light" value="INGRESAR" id="ingresar1" name="ingresar1" />
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col s4 m4 l4 xl4 " >
                        <div class="section grey z-depth-3">
                            <div class="row center-align">
                                <h6 class="white-text">Mantenimiento</h6><hr class="blue lighten-1">
                                <div class="col s12 m12 l12 xl12 " >
                                    <form action="${pageContext.request.contextPath}/jsp/SOPORTE/Login.jsp">
                                    <div class="input-field col s12 center-align">
                                        <input type="submit" class="btn waves-effect waves-light" value="INGRESAR" id="ingresar2" name="ingresar2" />
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col s4 m4 l4 xl4 " >
                        <div class="section grey z-depth-3">
                            <div class="row center-align">
                                <h6 class="white-text">FAQS</h6><hr class="blue lighten-1">
                                <div class="col s12 m12 l12 xl12 " >
                                    <form action="${pageContext.request.contextPath}/jsp/SOPORTE/FAQS/InicioFAQs.jsp">
                                    <div class="input-field col s12 center-align">
                                        <input type="submit"  class="btn waves-effect waves-light" value="INGRESAR" id="ingresar3" name="ingresar3" />
                                    </div>
                                    </form>
                                </div>
                            </div>
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