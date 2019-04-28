<%-- 
    Document   : Narrativo
    Created on : 17/11/2018, 07:02:35 AM
    Author     : Axolotech
--%>

<%@page import="controller.AdminObras"%>
<%@page import="model.Narrativo"%>
<%@page import="model.Obra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    HttpSession sesi = request.getSession();
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    
    if (sesi.getAttribute("ID") != null) {
    String sello = "";    
    if (request.getAttribute("sello") != null) {
        sello = request.getAttribute("sello").toString();
    }
    
    Obra obraX = null;
    Narrativo nar = null;
    AdminObras ao = new AdminObras();
    String titulo = "";
    String expo = "";
    String desa = "";
    String clim = "";
    String dese = "";
    int num = 0;
    String idObra = "";

    if(request.getParameter("idObra") != null ||request.getAttribute("idObra")!= null ){
        
        if(request.getParameter("idObra") != null){
            idObra = request.getParameter("idObra");
        }else{
            idObra = request.getAttribute("idObra").toString();
        }
        
        obraX = ao.buscaObraporID(Integer.parseInt(idObra));
               
               
        nar = ao.getNar();
        titulo = obraX.getTitulo();
        expo = nar.getExposicion();
        desa = nar.getDesarrollo();
        clim = nar.getClimax();
        dese = nar.getDesenlace();
       
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <!--<script type="text/javascript" src="../../js/main.js"></script>-->
        <title>ReWrite - Narrativo</title>
    </head>
    <body >
        <div class="" name="header">
            <nav>
                <div class="nav-wrapper ">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="${pageContext.request.contextPath}/img/logoT.png"></a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/Login.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/MISOBRAS/MisObras.jsp">Mis Obras</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/CREAR/Crear.jsp">Crear</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/AJUSTES/Ajustes.jsp">Ajustes</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/EVOLUCION/Evolucion.jsp">Evolución</a></li>
                    </ul>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/Login.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/MISOBRAS/MisObras.jsp">Mis Obras</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/CREAR/Crear.jsp">Crear</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/AJUSTES/Ajustes.jsp">Ajustes</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/EVOLUCION/Evolucion.jsp">Evolución</a></li>
                    </ul>
                </div>
            </nav>

        </div>
        <div class="container">

            <div class="row"> 

                <div class="section grey col s3 m3 l3 xl3"><!--Sidebar para consejos y revisiones-->
                    <h2 class="white-text">Narrativo</h2>
                    <div class="row"> 
                        <br>
                        <h6 class="white-text">Aquí tenemos unos muy buenos consejos para ti. </h6><br>
                        
                        <ul class="collapsible">
                            <li>
                                <div class="collapsible-header"><i class="material-icons">assignment_turned_in</i>Ortografía y gramática</div>
                                <div class="collapsible-body">
                                    <span class="white-text">consejo</span><!--aquí va el consejo-->
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">photo_filter</i>Claridad</div>
                                <div class="collapsible-body">
                                    <span class="white-text">consejo</span><!--aquí va el consejo-->
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">description</i>Estructura</div>
                                <div class="collapsible-body"><!--aquí va el consejo-->
                                    <ul>
                                        <li class="white-text">Introducción</li>
                                        <li class="white-text">Desarrollo</li>
                                        <li class="white-text">Conclusión</li>
                                        <li class="white-text">Referencias</li>
                                    </ul>

                                    <p class="white-text">Estructura las ideas según:</p>
                                    <ol>
                                        <li class="white-text">Idea Principal</li>
                                        <li class="white-text">Idea secundaria
                                            <ol>
                                                <li class="white-text">Sustento</li>
                                                <li class="white-text">Sustento</li>
                                            </ol>
                                        </li>
                                        <li class="white-text">Idea secundaria
                                            <ol>
                                                <li class="white-text">Sustento</li>
                                                <li class="white-text">Sustento</li>
                                            </ol>
                                        </li>
                                        <li class="white-text">Referencias</li>
                                    </ol>
                                </div>
                            </li>
                        </ul>
                        <h6 class="white-text" id="numP">Palabras:</h6><br><!--Aquí va el conteo de número de palabras-->
                    </div>
                    <div class="row">
                        <h6 class="white-text">Otras herramientas</h6><br>
                        <!--Compartir obra y despliega vínculo-->
                        <button id="compartir" class="btn-floating btn-large waves-effect waves-light blue" onclick="mostrarCompartir();">
                            <i class="material-icons">person_add</i>
                        </button><label class="white-text" for="compartir">&nbsp;&nbsp;Compartir Obra</label>
                        <div class="" style="overflow: hidden;" id="share" name="share" hidden ><!--aparece sólo cuando se da clic en compartir-->
                            <a class="truncate" href="https://material.io/tools/color/?fbclid=IwAR0W6Dplr3J4E2x6bGo_lqiLd-kJJJijRuk5t9iEXBO4FblTc51Y9mNjaoY#!/?view.left=1&view.right=0&primary.color=212121&secondary.color=64B5F6">https://material.io/tools/color/?fbclid=IwAR0W6Dplr3J4E2x6bGo_lqiLd-kJJJijRuk5t9iEXBO4FblTc51Y9mNjaoY#!/?view.left=1&view.right=0&primary.color=212121&secondary.color=64B5F6
                            </a>
                        </div>
                    </div>
                </div>
                <div class="section white lienzo col s8 m8 l8 xl8"><!--contenido principal donde se escribe-->
                    <div>
                        <form name="form1" id="form1" action="${pageContext.request.contextPath}/ActualizarObra" method="POST">
                            <input type="text" name="tipo" id="tipo" value="narrativo" hidden="true">
                            <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                            <input type="button" class="btn waves-effect waves-light right" name="revisar" id="revisar" value="Revisar" onclick="revNarrativo();"><br><br>
                            <input type="text" name="titulo" class="input-field oculto " placeholder="Título" value="<%=titulo%>" >
                            <textarea class="input-field oculto materialize-textarea" name="exposicion"  placeholder="Exposición" ><%=expo%></textarea>
                            <textarea class="input-field oculto materialize-textarea" name="desarrollo"  placeholder="Desarrollo" ><%=desa%></textarea>
                            <textarea class="input-field oculto materialize-textarea" name="climax"  placeholder="Climax" ><%=clim%></textarea>
                            <textarea class="input-field oculto materialize-textarea" name="desenlace"  placeholder="Desenlace" ><%=dese%></textarea>
                            
                            <div class="oculto" id="sello" name="sello" contenteditable>

                            </div>
                            <input type="submit" class="btn waves-effect waves-light" name="guardar" id="guardar" value="Guardar"><br><br>
                        </form>
                            
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/init.js"></script>
    </body>
</html>
<% } 
    else {
    RequestDispatcher rd = request.getRequestDispatcher("../Login.jsp");
                rd.forward(request, response);
}%>