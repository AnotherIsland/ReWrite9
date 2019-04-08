<%-- 
    Document   : VerReportes
    Created on : 3/04/2019, 12:50:24 PM
    Author     : ACIE-PC
--%>

<%@page import="model.Usuario"%>
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
    
    //if (sesi.getAttribute("ID") != null) {
    
    Usuario user = new Usuario();
    
    user = (Usuario) sesi.getAttribute("usuario");
    
    if(user.getIdTipoUsuario() != 3){//Revisa que sea un usuario de tipo Gerente
        RequestDispatcher rd = request.getRequestDispatcher("jsp/SOPORTE/EVENTOS/InicioEventos.jsp");
        rd.forward(request, response);
    }
    
    Reporte rep = null;
    ArrayList <Reporte> reps = new ArrayList();//Lista de reportes 
    ArrayList <Reporte> repsNA = new ArrayList();//Lista de reportes no asignados
    ArrayList <Reporte> repsPen = new ArrayList();//Lista de reportes pendientes
    ArrayList <Reporte> repsRes = new ArrayList();//Lista de reportes resueltos
    ArrayList <Reporte> repsCerr = new ArrayList();//Lista de reportes cerrados
    
    ConsultaReporte crep = new ConsultaReporte();
    
    DataBase db = new DataBase();
    ResultSet res;
   
    
    int folio = 0;                                          
    String levanta= "-";  
    String asigna= "-";  
    String cierra= "-"; 
    String etiqueta= "-"; 

    String usuario= "";  
    Date fInicio= null;       
    Date fResol= null;       
    Date fTermino= null;
    
    try{
        db.connect();
        res = db.query("select * from reporte;");

        while(res.next()) {
            System.out.println(res.getInt("idUsuarioLevanta"));
            System.out.println(res.getInt("idUsuarioAsigna"));
            System.out.println(res.getInt("idUsuarioCierra"));
                levanta= crep.consultaUsuario(res.getInt("idUsuarioLevanta"));  
                asigna= crep.consultaUsuario(res.getInt("idUsuarioAsigna"));  
                cierra= crep.consultaUsuario(res.getInt("idUsuarioCierra")); 
                rep = new Reporte(res.getInt("idReporte"), res.getDate("fecha_inicio"), 
                        res.getDate("fecha_resolucion"),res.getDate("fecha_conclusion") ,
                        res.getString("etiqueta") ,res.getString("contenido") ,
                        res.getInt("idUsuarioEscritor"),levanta,asigna,cierra);
                reps.add(rep);
        }
        db.closeConnection();
    }
    catch(SQLException error){
        System.out.println(error.toString());
    }
    
    for(int i = 0; i< reps.size();i++){
        rep = reps.get(i);
        if(rep.getEtiqueta().equals("No asignado")){
            repsNA.add(rep);
        } else if(rep.getEtiqueta().equals("Cerrado")){
            repsCerr.add(rep);
        } else if(rep.getEtiqueta().equals("Pendiente")){
            repsPen.add(rep);
        } else if(rep.getEtiqueta().equals("Resuelto")){
            repsRes.add(rep);
        } 
    }

    request.setAttribute("repsNA", repsNA);
    request.setAttribute("repsCerr", repsCerr);
    request.setAttribute("repsPen", repsPen);
    
    
%>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>
        <title>ReWrite - Soporte de eventos</title>
    </head>
    <body>
        <div class="" name="header">
            <nav>
                <div class="nav-wrapper ">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="${pageContext.request.contextPath}/img/logoT.png"></a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/GerenteLevantarReporte.jsp">Alta Reporte</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/GerenteVerReportes.jsp">Ver Reportes</a></li>
                
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/InicioEventos.jsp">Cerrar Sesión</a></li>
                        
                    </ul>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/GerenteLevantarReporte.jsp">Alta Reporte</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/GerenteVerReportes.jsp">Ver Reportes</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/InicioEventos.jsp">Cerrar Sesión</a></li>
                    </ul>    
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12 xl12">
                    <div class="section grey z-depth-3 center-align">
                        <h4 class="white-text">Reportes de eventos - Gerencia</h4>  
                    </div>
                    <br>
                    <div class="col s12 m12 l12 xl12 " >
                        <div class="section white z-depth-3">
                            <div class="row center-align">
                                <h6>Administración de reportes</h6><hr class="blue lighten-1">
                                <div class="col s12 m12 l12 xl12 " >
                                    <div class="row">
                                        <h6 class="blue1">NO ASIGNADOS<h6>
                                        <table>
                                            <tr>
                                                <th>Folio</th>
                                                <th>Etiqueta</th>                                              
                                                <th>Levantado por:</th>
                                                <th>Fecha inicio</th>
                                            </tr>
                                            <%for(int i = 0; i < repsNA.size(); i++){
                                                rep = repsNA.get(i);
                                                folio = rep.getIdReporte();
                                                etiqueta = rep.getEtiqueta();
                                                levanta = rep.getUsuarioLevanta();
                                                fInicio = rep.getFecha_inicio();
                                                
                                            %>
                                            
                                            <tr>
                                                <td><%=folio%></td>
                                                <td><%=etiqueta%></td>
                                                <td><%=levanta%></td>
                                                <td><%=fInicio%></td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/GerenteDetalleReporte.jsp" method="POST">
                                                    <input type="text" name="folio" id="folio" value="<%=folio%>" hidden   />
                                                    <input type="text" name="etiqueta" id="etiqueta" value="<%=etiqueta%>" hidden   />
                                                    <input type="submit" class="waves-effect waves-light light-blue btn" value="Revisar"/>
                                                    </form>
                                                </td> 
                                            </tr>
                                            <%}%>
                                        </table>
                                    </div>
                                    <div class="row" >
                                        <h6 class="blue2">PENDIENTES<h6>
                                        <table>
                                            <tr>
                                                <th>Folio</th>
                                                <th>Etiqueta</th>                                              
                                                <th>Levantado por:</th>
                                                <th>Asignado a:</th>
                                                <th>Fecha inicio</th>
                                            </tr>
                                            <%for(int i = 0; i < repsPen.size(); i++){
                                                rep = repsPen.get(i);
                                                folio = rep.getIdReporte();
                                                etiqueta = rep.getEtiqueta();
                                                levanta = rep.getUsuarioLevanta();
                                                asigna = rep.getUsuarioAsigna();
                                                fInicio = rep.getFecha_inicio();
                                            %>
                                            <tr>
                                                <td><%=folio%></td>
                                                <td><%=etiqueta%></td>
                                                <td><%=levanta%></td>
                                                <td><%=asigna%></td>
                                                <td><%=fInicio%></td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/GerenteDetalleReporte.jsp" method="POST">
                                                    <input type="text" name="folio" id="folio" value="<%=folio%>" hidden />
                                                    <input type="text" name="etiqueta" id="etiqueta" value="<%=etiqueta%>" hidden />
                                                    <input type="submit" class="waves-effect waves-light light-blue btn" value="Revisar"/>
                                                    </form>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </table>
                                    </div>
                                        <div class="row" >
                                        <h6 class="blue2">RESUELTOS<h6>
                                        <table>
                                            <tr>
                                                <th>Folio</th>
                                                <th>Etiqueta</th>                                              
                                                <th>Levantado por:</th>
                                                <th>Asignado a:</th>
                                                <th>Fecha inicio</th>
                                                <th>Fecha resolución</th>
                                            </tr>
                                            <%for(int i = 0; i < repsRes.size(); i++){
                                                rep = repsRes.get(i);
                                                folio = rep.getIdReporte();
                                                etiqueta = rep.getEtiqueta();
                                                levanta = rep.getUsuarioLevanta();
                                                asigna = rep.getUsuarioAsigna();
                                                fInicio = rep.getFecha_inicio();
                                                fResol = rep.getFecha_resolucion(); 
                                            %>
                                            <tr>
                                                <td><%=folio%></td>
                                                <td><%=etiqueta%></td>
                                                <td><%=levanta%></td>
                                                <td><%=asigna%></td>
                                                <td><%=fInicio%></td>
                                                <td><%=fResol%></td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/GerenteDetalleReporte.jsp" method="POST">
                                                    <input type="text" name="folio" id="folio" value="<%=folio%>" hidden />
                                                    <input type="text" name="etiqueta" id="etiqueta" value="<%=etiqueta%>" hidden />
                                                    <input type="submit" class="waves-effect waves-light light-blue btn" value="Revisar"/>
                                                    </form>
                                                </td>
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
                                                <td><%=folio%></td>
                                                <td><%=etiqueta%></td>
                                                <td><%=levanta%></td>
                                                <td><%=asigna%></td>
                                                <td><%=cierra%></td>
                                                <td><%=fInicio%></td>
                                                <td><%=fResol%></td>
                                                <td><%=fTermino%></td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/GerenteDetalleReporte.jsp" method="POST">
                                                    <input type="text" name="folio" id="folio" value="<%=folio%>" hidden   />
                                                    <input type="text" name="etiqueta" id="etiqueta" value="<%=etiqueta%>" hidden   />
                                                    <input type="submit" class="waves-effect waves-light light-blue btn" value="Revisar"/>
                                                    </form>
                                                </td>
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