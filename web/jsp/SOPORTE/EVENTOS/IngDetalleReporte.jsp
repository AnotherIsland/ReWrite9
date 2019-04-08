<%-- 
    Document   : IngDetalleReporte
    Created on : 7/04/2019, 09:01:45 PM
    Author     : ACIE-PC
--%>

<%@page import="soporte.ConsultaUsuario"%>
<%@page import="model.Usuario"%>
<%@page import="soporte.ConsultaReporte"%>
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
    
    Usuario user = new Usuario();
    user = (Usuario) sesi.getAttribute("usuario");
    
    if(user.getIdTipoUsuario() != 4){//Revisa que sea un usuario de tipo ingeniero
        RequestDispatcher rd = request.getRequestDispatcher("jsp/SOPORTE/EVENTOS/InicioEventos.jsp");
        rd.forward(request, response);
    }
    
    ArrayList <Reporte> repsPen = new ArrayList();//Lista de reportes pendientes
    ArrayList <Reporte> repsCerr = new ArrayList();//Lista de reportes cerrados
    
    
    int folio = 0;
    String etiqueta = "";
    int bandera = 0;
    Reporte repX = null;
    
    if(request.getParameter("folio")!= null){
        folio = Integer.parseInt(request.getParameter("folio"));
        etiqueta = request.getParameter("etiqueta");
    }
    
    ConsultaReporte cr = new ConsultaReporte();
    repX = cr.consultaReporte(folio);
    
    
    String especifica = "";
    String levanta = "";  
    String asigna = "";  
    String cierra = ""; 
    Date fInicio = null;       
    Date fResol = null;       
    Date fTermino = null;
    
    if(repX != null ){
        especifica = repX.getContenido();
        levanta = repX.getUsuarioLevanta();  
        asigna = repX.getUsuarioAsigna();  
        cierra = repX.getUsuarioCierra(); 
        fInicio = repX.getFecha_inicio();       
        fResol = repX.getFecha_resolucion();       
        fTermino = repX.getFecha_conclusion();
    }
    
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
        <title>ReWrite - Soporte de eventos</title>
    </head>
    <body>
        <div class="" name="header">
            <nav>
                <div class="nav-wrapper ">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="${pageContext.request.contextPath}/img/logoT.png"></a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/IngLevantarReporte.jsp">Alta Reporte</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/IngVerReportes.jsp">Ver Reportes</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/InicioEventos.jsp">Cerrar Sesión</a></li>
                    </ul>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/IngLevantarReporte.jsp">Alta Reporte</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/IngVerReportes.jsp">Ver Reportes</a></li>
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
                                        <form action="${pageContext.request.contextPath}/ActualizaReporte" method="POST">
                                        <table>
                                            <tr><th>Folio</th>
                                                <td><input name="folio" id="folio" type="text" value="<%=folio%>" hidden><%=folio%></td></tr>
                                            <tr><th>Etiqueta</th>
                                                <td>
                                                <select id="etiqueta"  name="etiqueta">
                                                    <option value="<%=etiqueta%>" selected><%=etiqueta%></option>
                                                    <option value="Pendiente">Pendiente</option>
                                                    <option value="Resuelto">Resuelto</option>
                                                    <option value="Cerrado">Cerrado</option>
                                                </select>
                                                </td></tr>
                                            <tr><th>Fecha inicio</th>
                                                <td><input name="fInicio" id="fInicio" type="date" value="<%=fInicio%>"></td></tr>
                                            <tr><th>Levantado por:</th>
                                                <td><input name="levanta" id="levanta" type="text" value="<%=levanta%>"></td></tr>
                                            <tr><th>Asignado a:</th>
                                                <td><input name="asigna" id="asigna" type="text" value="<%=asigna%>"></td></tr>
                                            <tr><th>Especificaciones</th>
                                                <td><textarea class="materialize-textarea" name="especifica" id="especifica" type="text"><%=especifica%></textarea></td></tr>
                                            <%if(etiqueta.equals("Resuelto")){ %>
                                                <tr><th>Fecha resolucion</th>
                                                <td><input name="fResol" id="fResol" type="date" value="<%=fResol%>"></td></tr>
                                            <%}%>
                                            <%if(etiqueta.equals("Cerrado")){ %>
                                                <tr><th>Fecha término</th>
                                                <td><input name="fTermino" id="fTermino" type="date" value="<%=fTermino%>"></td></tr>
                                                <tr><th>Cerrado por:</th>
                                                <td><input name="cierra" id="cierra" type="text" value="<%=cierra%>"></td></tr>
                                            <%}%>
                                            <tr><td><input class="waves-effect waves-light light-blue btn" type="submit" value="Guardar cambios"></td></tr>
                                        </table>
                                        </form>
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