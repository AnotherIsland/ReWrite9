<%-- 
    Document   : VerReportes
    Created on : 8/04/2019, 06:52:01 PM
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
    
    if(user.getIdTipoUsuario() != 6){//Revisa que sea un usuario de tipo Gerente
        RequestDispatcher rd = request.getRequestDispatcher("jsp/SOPORTE/Login.jsp");
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
    String especifica = "";

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
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/FAQS/InicioFAQs.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/FAQS/VerReportes.jsp">Ver Reportes</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/FAQS/Editor.jsp">FAQS</a></li>
                    </ul>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/FAQS/InicioFAQs.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/FAQS/VerReportes.jsp">Ver Reportes</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/FAQS/Editor.jsp">FAQS</a></li>
                    </ul>   
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12 xl12">
                    <div class="section grey z-depth-3 center-align">
                        <h4 class="white-text">Reportes</h4>  
                    </div>
                    <br>
                    <div class="col s12 m12 l12 xl12 " >
                        <div class="section white z-depth-3">
                            <div class="row center-align">
                                <h6>REPORTES RESUELTOS</h6><hr><hr>
                                <div class="col s12 m12 l12 xl12 ">
                                    <div class="row" >
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
                                                especifica = rep.getContenido();
                                            %>
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
                                            </tr>
                                            <tr>
                                                <td><%=folio%></td>
                                                <td><%=etiqueta%></td>
                                                <td><%=levanta%></td>
                                                <td><%=asigna%></td>
                                                <td><%=cierra%></td>
                                                <td><%=fInicio%></td>
                                                <td><%=fResol%></td>
                                                <td><%=fTermino%></td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr><th>Detalles</th><td><%=especifica%></td></tr>
                                        </table><hr>  
                                            <%}%>
                                          
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