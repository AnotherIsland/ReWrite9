<%@page import="soporte.ConsultaReporte"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.Reporte"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DataBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%
    HttpSession sesi = request.getSession();
    DataBase db = new DataBase();
    ResultSet rs;
                              
    //if (sesi.getAttribute("ID") != null) {
%>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
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
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/LevantarReporte.jsp">Alta Reporte</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/VerReporte.jsp">Ver Reportes</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/InicioEventos.jsp">Cerrar Sesión</a></li>
                        
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12 xl12">
                    <div class="section grey z-depth-3 center-align">
                        <h4 class="white-text">Reportes de Mantenimiento</h4>  
                    </div>
                    <br>
                    <div class="col s12 m12 l12 xl12 " >
                        <div class="section white z-depth-3">
                            <div class="row center-align">
                                <h6>Visualización de reportes de mantenimiento</h6><hr class="blue lighten-1">
                                    <div class="row" >
                                        <h6 class="blue2">PENDIENTES<h6>
                                        <table>
                                            <tr>
                                                <th>Folio</th>
                                                <th>Etiqueta</th>                                              
                                                <th>Levantado por:</th>
                                                <th>Asignado a:</th>
                                                <th>Fecha inicio</th>
                                                <th>Fecha término</th>
                                                <th> </th>
                                            </tr>
                                            <%try {//Da de alta ensayo 
                                            
                                          db.connect();
                                                                                   
                                          rs=db.query("Select * from reporteMant where fecha_conclusion is null;");
                                          while(rs.next()){
                                              
                                          int ini= rs.getInt("idreporteMant");
                                          String nom=rs.getString("contenido");
                                          }                                                

                                            db.closeConnection();
                                        } catch (SQLException error) {
                                            System.out.println(error.toString());
                                        }%>
                                            %>
                                            <tr>
                                                <form action="${pageContext.request.contextPath}/jsp/AdminReporte.jsp" method="POST">
                                                <input type="text" value="<%=folio%>" hidden disabled />
                                                <input type="text" name="etiqueta" value="<%=etiqueta%>" hidden disabled />
                                                <td><%=folio%></td>
                                                <td><%=etiqueta%></td>
                                                <td><%=levanta%></td>
                                                <td><%=asigna%></td>
                                                <td>-</td>
                                                <td><%=fInicio%></td>
                                                <td><%=fResol%></td>
                                                <td>-</td>
                                                <td><input type="submit" class="waves-effect waves-light light-blue btn" value="Revisar"/>
                                                </td>
                                                </form>
                                            </tr>
                                            <%}%>
                                        </table>
                                        
                                    </div>
                                    <div class="row" >
                                        <h6 class="blue3">CERRADOS<h6>
                                        <table>
                                            <tr>
                                                <th>Folio</th>
                                                <th>Etiqueta</th>                                              
                                                <th>Levantado por:</th>
                                                <th>Asignado a:</th>
                                                <th>Cerrado por:</th>
                                                <th>Fecha inicio</th>
                                                <th>Fecha resolución</th>
                                                <th>Fecha término</th>
                                                <th> </th>
                                            </tr>
                                            <%for(int i = 0; i < repsCerr.size(); i++){
                                                rep = repsCerr.get(i);
                                                folio = rep.getIdReporte();
                                                etiqueta = rep.getEtiqueta();
                                                levanta = rep.getUsuarioLevanta();
                                                asigna = rep.getUsuarioAsigna();
                                                cierra = rep.getUsuarioCierra();
                                                fInicio = rep.getFecha_inicio();
                                                fResol = rep.getFecha_resolucion();
                                                fTermino = rep.getFecha_conclusion();
                                            %>
                                            <tr>
                                                <form>
                                                <input type="text" value="<%=folio%>" hidden disabled />
                                                <input type="text" name="etiqueta" value="<%=etiqueta%>" hidden disabled />
                                                <td><%=folio%></td>
                                                <td><%=etiqueta%></td>
                                                <td><%=levanta%></td>
                                                <td><%=asigna%></td>
                                                <td><%=cierra%></td>
                                                <td><%=fInicio%></td>
                                                <td><%=fResol%></td>
                                                <td><%=fTermino%></td>
                                                <td><input type="submit" class="waves-effect waves-light light-blue btn" value="Revisar"/>
                                                </td>
                                                </form>
                                            </tr>
                                            <%}%>
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