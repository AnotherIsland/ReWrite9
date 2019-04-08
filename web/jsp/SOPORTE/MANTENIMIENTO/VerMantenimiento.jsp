
<%@page import="model.Mantenimiento"%>
<%@page import="model.Usuario"%>
<%@page import="soporte.ConsultaReporte"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.Mantenimiento"%>
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
    
    /*if (sesi.getAttribute("ID") != null) {
    
    Usuario user = new Usuario();
    
    user = (Usuario) sesi.getAttribute("usuario");
    
    if(user.getIdTipoUsuario() != 5||user.getIdTipoUsuario() != 4){//Revisa que sea un usuario de tipo Gerente de Mantenimiento
        RequestDispatcher rd = request.getRequestDispatcher("jsp/SOPORTE/MANTENIMIENTO/Inicio.jsp");
        rd.forward(request, response);
    */
    
    Mantenimiento rep = null;
    ArrayList <Mantenimiento> reps = new ArrayList();//Lista de reportes 
    ArrayList <Mantenimiento> repsNA = new ArrayList();//Lista de reportes no asignados
    ArrayList <Mantenimiento> repsPen = new ArrayList();//Lista de reportes pendientes
    ArrayList <Mantenimiento> repsRes = new ArrayList();//Lista de reportes resueltos
    ArrayList <Mantenimiento> repsCerr = new ArrayList();//Lista de reportes cerrados
    
    ConsultaReporte crep = new ConsultaReporte();
    
    DataBase db = new DataBase();
    ResultSet res;
   
    
    int folio = 0;                                          
    int levanta= 0;  
    int asigna= 0;  
    String etiqueta= "-"; 
    

    String contenido= "";  
    Date fInicio= null;       
    Date fResol= null;       
    Date fTermino= null;
    
    try{
        db.connect();
        res = db.query("select * from reporteMant;");

        while(res.next()) {
            System.out.println(res.getInt("idUsuario1Levanta"));
            System.out.println(res.getInt("idUsuario1Asigna"));
                levanta= res.getInt("idUsuario1Levanta");  
                asigna= res.getInt("idUsuario1Asigna");  
                rep = new Mantenimiento(res.getInt("idreporteMant"), res.getDate("fecha_inicio"),
                        res.getDate("fecha_conclusion"), res.getString("contenido"), res.getInt("idUsuario1Levanta"),res.getInt("idUsuario1Asigna"));
                reps.add(rep);
        }
        db.closeConnection();
    }
    catch(SQLException error){
        System.out.println(error.toString());
    }
    
    for(int i = 0; i< reps.size();i++){
        rep = reps.get(i);
        if(rep.getFecha_conclusion()==null){
            repsPen.add(rep);
        }else if(rep.getFecha_conclusion()!=null){
            repsCerr.add(rep);
        } 
    }

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
        <title>ReWrite - Reporte de mantenimiento</title>
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
                        <h4 class="white-text">Reportes de Mantenimiento - Gerencia</h4>  
                    </div>
                    <br>
                    <div class="col s12 m12 l12 xl12 " >
                        <div class="section white z-depth-3">
                            <div class="row center-align">
                                <h6>Administración de reportes</h6><hr class="blue lighten-1">
                                <div class="col s12 m12 l12 xl12 " >
                                    <div class="row">
                                                                            <div class="row" >
                                        <h6 class="blue2">PENDIENTES<h6>
                                        <table>
                                            <tr>
                                                <th>Folio:</th>
                                                <th>Nombre del reporte:</th>
                                                <th>Levantado por usuario con ID:</th>
                                                <th>Asignado a usuario con ID:</th>
                                                <th>Fecha inicio:</th>
                                            </tr>
                                            <%for(int i = 0; i < repsPen.size(); i++){
                                                rep = repsPen.get(i);
                                                folio = rep.getIdreporteMant();
                                                contenido = rep.getContenido();
                                                levanta = rep.getIdUsuario1Levanta();
                                                asigna = rep.getIdUsuario1Asigna();
                                                fInicio = rep.getFecha_inicio();
                          
                                            %>
                                            <tr>
                                                <td><%=folio%></td>
                                                <td><%=contenido%></td>
                                                <td><%=levanta%></td>
                                                <td><%=asigna%></td>
                                                <td><%=fInicio%></td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/jsp/SOPORTE/EVENTOS/GerenteDetalleReporte.jsp" method="POST">
                                                    <input type="text" name="folio" id="folio" value="<%=folio%>" hidden />
                                                    <input type="text" name="etiqueta" id="etiqueta" value="<%=etiqueta%>" hidden />
                                                    </form>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </table>
                                    </div>
                                        <div class="row" >
                                        <h6 class="blue2">CONCLUIDOS<h6>
                                        <table>
                                            <tr>
                                                <th>Folio</th>
                                                <th>Nombre del reporte:</th>
                                                <th>Levantado por usuario con ID:</th>
                                                <th>Asignado a usuario con ID:</th>
                                                <th>Fecha inicio</th>
                                                <th>Fecha resolución</th>
                                            </tr>
                                            <%for(int i = 0; i < repsCerr.size(); i++){
                                                rep = repsCerr.get(i);
                                                folio = rep.getIdreporteMant();
                                                etiqueta = rep.getContenido();
                                                levanta = rep.getIdUsuario1Levanta();
                                                asigna = rep.getIdUsuario1Asigna();
                                                fInicio = rep.getFecha_inicio();
                                                fResol = rep.getFecha_conclusion(); 
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
