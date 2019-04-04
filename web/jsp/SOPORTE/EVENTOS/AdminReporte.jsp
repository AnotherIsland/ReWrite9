<%-- 
    Document   : AdminReporte
    Created on : 2/04/2019, 09:03:52 AM
    Author     : ACIE-PC
--%>

<%@page import="java.sql.Date"%>
<%@page import="model.Reporte"%>
<%@page import="java.util.ArrayList"%>
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
    
    ArrayList <Reporte> repsNA = new ArrayList();//Lista de reportes no asignados
    ArrayList <Reporte> repsPen = new ArrayList();//Lista de reportes pendientes
    ArrayList <Reporte> repsCerr = new ArrayList();//Lista de reportes cerrados
    
    repsNA = (ArrayList <Reporte>) request.getAttribute("repsNA");
    repsPen = (ArrayList <Reporte>) request.getAttribute("repsPen");
    repsCerr = (ArrayList <Reporte>) request.getAttribute("repsCerr");
    
    int folio = 0;
    String etiqueta = "";
    int bandera = 0;
    Reporte repX = new Reporte();
    
    if(request.getParameter("folio")!= null){
        folio = Integer.parseInt(request.getParameter("folio"));
        etiqueta = request.getParameter("etiqueta");
    }
    
    if(etiqueta.equals("No asignado")){
        for(int i = 0; i < repsNA.size();i++ ){
            repX = repsNA.get(i);
            if(repX.getIdReporte() == folio){
                repX = repsNA.get(i);
                bandera = 1;
                break;
            }
        } 
    } else if(etiqueta.equals("Cerrado")){
        for(int i = 0; i < repsNA.size();i++ ){
            repX = repsNA.get(i);
            if(repX.getIdReporte() == folio){
                repX = repsNA.get(i);
                bandera = 1;
                break;
            }
        }
        
    } else if(etiqueta.equals("Pendiente")){
        for(int i = 0; i < repsNA.size();i++ ){
            repX = repsNA.get(i);
            if(repX.getIdReporte() == folio){
                repX = repsNA.get(i);
                bandera = 1;
                break;
            }
        }
    }
    
    String especifica = "";
    String levanta = "";  
    String asigna = "";  
    String cierra = ""; 
    Date fInicio = null;       
    Date fResol = null;       
    Date fTermino = null;
    
    if(repX.getEtiqueta() != "" ){
        especifica = repX.getContenido();
        levanta = repX.getUsuarioLevanta();  
        asigna = repX.getUsuarioAsigna();  
        cierra = repX.getUsuarioCierra(); 
        fInicio = repX.getFecha_inicio();       
        fResol = repX.getFecha_resolucion();       
        fTermino = repX.getFecha_conclusion();
    }

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
                        <h4 class="white-text">Detalles del evento y asignación</h4>  
                    </div>
                    <br>
                    <div class="col s12 m12 l12 xl12 " >
                        <div class="section white z-depth-3">
                            <div class="row center-align">
                                <h6>Administración de reportes</h6><hr class="blue lighten-1">
                                <div class="col s12 m12 l12 xl12 " >
                                    <div class="row" >
                                        <table>
                                            <tr><th>Folio</th></tr><td><%=folio%></td>
                                            <tr><th>Etiqueta</th></tr><td><%=etiqueta%></td>
                                            <tr><th>Fecha inicio</th></tr><td><%=fInicio%></td>
                                            <tr><th>Levantado por:</th></tr><td><%=levanta%></td>
                                            <tr><th>Fecha asignación</th></tr><td><%=fResol%></td>
                                            <tr><th>Asignado a:</th></tr><td><%=asigna%></td>
                                            <tr><th>Fecha término</th></tr><td><%=fTermino%></td>
                                            <tr><th>Cerrado por:</th></tr><td><%=cierra%></td>
                                            <tr><th>Especificaciones</th></tr><td><%=especifica%></td>
                                            
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