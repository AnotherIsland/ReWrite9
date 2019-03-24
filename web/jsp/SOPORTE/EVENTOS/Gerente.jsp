<%-- 
    Document   : Gerente
    Created on : 12/03/2019, 09:58:41 PM
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
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/InicioEventos.jsp">Cerrar Sesión</a></li>

                    </ul>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12 xl12">
                    <div class="section grey z-depth-3 center-align">
                        <h4 class="white-text">Reporte de eventos - Gerencia</h4>  
                    </div>
                    <br>
                    <div class="col s12 m12 l12 xl12 " >
                        <div class="section white z-depth-3">
                            <div class="row center-align">
                                <h6>Administración de reportes</h6><hr class="blue lighten-1">
                                <div class="col s12 m12 l12 xl12 " >
                                    <div class="row" >
                                        <h6 class="blue1">NO ASIGNADOS<h6>
                                        <table>
                                            <tr>
                                                <th>Folio</th>
                                                <th>Etiqueta</th>
                                                //Incluir contenido, usuario y estado en ver reporte
                                                <th>Responsable</th>
                                                <th>Fecha inicio</th>
                                                <th>Fecha resolución</th>
                                                <th>Fecha término</th>
                                                <th> </th>
                                            </tr>
                                            
                                            <tr>
                                                <td>0001</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>12/03/19</td>
                                                <td>13/03/19</td>
                                                <td>13/02/19</td>
                                                <td><h5>
                                                    <a href="${pageContext.request.contextPath}/jsp/Revisar.jsp" 
                                                       class="waves-effect waves-light light-blue btn">Revisar</a>
                                                </h5></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="row" >
                                        <h6 class="blue2">PENDIENTES<h6>
                                        <table>
                                            <tr>
                                                <th>Folio</th>
                                                <th>Etiqueta</th>                                              
                                                <th>Responsable</th>
                                                <th>Fecha inicio</th>
                                                <th>Fecha resolución</th>
                                                <th>Fecha término</th>
                                                <th> </th>
                                            </tr>
                                            <tr>
                                                <td>0001</td>
                                                <td>Hardware</td>
                                                <td>David Cruz</td>
                                                <td>12/03/19</td>
                                                <td>13/03/19</td>
                                                <td>13/02/19</td>
                                                <td><h5>
                                                    <a href="${pageContext.request.contextPath}/jsp/Revisar.jsp" 
                                                       class="waves-effect waves-light light-blue btn">Revisar</a>
                                                </h5></td>
                                            </tr>
                                        </table>
                                        
                                    </div>
                                    <div class="row" >
                                        <h6 class="blue3">CERRADOS<h6>
                                        <table>
                                            <tr>
                                                <th>Folio</th>
                                                <th>Etiqueta</th>
                                                <th>Responsable</th>
                                                <th>Fecha inicio</th>
                                                <th>Fecha resolución</th>
                                                <th>Fecha término</th>
                                                <th> </th>
                                            </tr>
                                            <tr>
                                                <td>0001</td>
                                                <td>Hardware</td>
                                                <td>David Cruz</td>
                                                <td>12/03/19</td>
                                                <td>13/03/19</td>
                                                <td>13/02/19</td>
                                                <td><h5>
                                                    <a href="${pageContext.request.contextPath}/jsp/Reporte.jsp" 
                                                       class="waves-effect waves-light light-blue btn">Revisar</a>
                                                </h5></td>
                                            </tr>
                                        </table>
                                                 
                                    </div>
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