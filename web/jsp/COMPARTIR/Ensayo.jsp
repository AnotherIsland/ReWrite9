<%-- 
    Document   : Ensayo
    Created on : 17/11/2018, 07:00:24 AM
    Author     : Axolotech
--%>


<%@page import="model.Ensayo"%>
<%@page import="model.Resumen"%>
<%@page import="controller.AdminObras"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Database.DataBase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Obra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    HttpSession sesi = request.getSession();
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    
    if (sesi.getAttribute("ID") != null) {
        int idUs = Integer.parseInt(sesi.getAttribute("idUsuario").toString());
        String sello = "";    
    if (request.getAttribute("sello") != null) {
        sello = request.getAttribute("sello").toString();
        request.setAttribute("sello", sello);
    }
    
    Obra obraX = null;
    Ensayo ens = null;
    AdminObras ao = new AdminObras();
    String titulo = "";
    String intro = "";
    String desa = "";
    String conclu = "";
    String refe = "";
    ArrayList<String> refs = new ArrayList();
    int num = 0;
    String idObra = "";

    if(request.getParameter("idObra") != null ||request.getAttribute("idObra")!= null ){
        
        if(request.getParameter("idObra") != null){
            idObra = request.getParameter("idObra");
        }else{
            idObra = request.getAttribute("idObra").toString();
        }
        
        obraX = ao.buscaObraporID(Integer.parseInt(idObra));
               
        ens = ao.getEns();
        titulo = obraX.getTitulo();
        intro = ens.getIntro();
        desa = ens.getDesarrollo();
        conclu = ens.getConclusion();
        refe = ens.getReferencias();
        
        refs = ao.traeRefes(refe);
        
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
        <title>ReWrite - Ensayo</title>
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
                    <h2 class="white-text">Ensayo</h2>
                    <div class="row"> 
                        <br>
                        <h6 class="white-text">Deja aquí tu comentario según la categoría. </h6><br>
                        
                        <ul class="collapsible">
                            <li>
                                <div class="collapsible-header"><i class="material-icons">assignment_turned_in</i>Ortografía y gramática</div>
                                <div class="collapsible-body">
                                    <form action="${pageContext.request.contextPath}/EnviaConsejo" method="POST">
                                        <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                                        <input type="text"  name="consejo" onkeypress="vNumyLetras();" class="white-text" placeholder="Escribe aquí..."/>
                                        <input type="text" hidden name="idUs" id="idUs" value="<%=idUs%>" />
                                        <input type="text" hidden name="categoria" value="ortografia"/>
                                        <input type="submit" value="ENVIAR CONSEJO" class="btn waves-effect waves-light" />
                                    </form>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">photo_filter</i>Claridad</div>
                                <div class="collapsible-body">
                                    <form action="${pageContext.request.contextPath}/EnviaConsejo" method="POST">
                                        <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                                        <input type="text"  name="consejo" onkeypress="vNumyLetras();" class="white-text" placeholder="Escribe aquí..."/>
                                        <input type="text" hidden name="idUs" id="idUs" value="<%=idUs%>" />
                                        <input type="text" hidden name="categoria" value="claridad"/>
                                        <input type="submit" value="ENVIAR CONSEJO" class="btn waves-effect waves-light" />
                                    </form>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">description</i>Estructura</div>
                                <div class="collapsible-body"><!--aquí va el consejo-->
                                    <form action="${pageContext.request.contextPath}/EnviaConsejo" method="POST">
                                        <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                                        <input type="text"  name="consejo" onkeypress="vNumyLetras();" class="white-text" placeholder="Escribe aquí..."/>
                                        <input type="text" hidden name="idUs" id="idUs" value="<%=idUs%>" />
                                        <input type="text" hidden name="categoria" value="estructura"/>
                                        <input type="submit" value="ENVIAR CONSEJO" class="btn waves-effect waves-light" />
                                    </form>
                                </div>
                            </li>
                            <li>
                            <div class="collapsible-header"><i class="material-icons">flag</i>Otros</div>
                            <div class="collapsible-body">
                              <form action="${pageContext.request.contextPath}/EnviaConsejo" method="POST">
                                    <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                                    <input type="text"  name="consejo" onkeypress="vNumyLetras();" class="white-text" placeholder="Escribe aquí..."/>
                                    <input type="text" hidden name="idUs" id="idUs" value="<%=idUs%>" />
                                    <input type="text" hidden name="categoria" value="otros"/>
                                    <input type="submit" value="ENVIAR CONSEJO" class="btn waves-effect waves-light" />
                                </form>
                            </div>
                          </li>
                        </ul>
                        <h6 class="white-text" id="numP">Palabras:</h6><br><!--Aquí va el conteo de número de palabras-->
                    </div>
                    
                </div>
                <div class="section white lienzo col s8 m8 l8 xl8"><!--contenido principal donde se escribe-->
                    <div>
                        <form name="form1" id="form1" action="${pageContext.request.contextPath}/ActualizarObra" method="POST">
                            <input type="text" name="tipo" id="tipo" value="ensayo" hidden="true">
                            <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                            <input type="button" class="btn waves-effect waves-light right" name="revisar" id="revisar" value="Revisar" onclick="revEnsayo();"><br><br>
                            <p><%=titulo%></p>
                            <input hidden type="text" name="titulo" id="titulo" class="input-field oculto " placeholder="Título" value="<%=titulo%>"  >
                            <p><%=intro%></p>
                            <p><%=desa%></p>
                            <p><%=conclu%></p>
                            <textarea hidden class="input-field oculto materialize-textarea" name="intro" id="intro" class="input-field oculto " placeholder="Introducción" ><%=intro%></textarea>
                            <textarea hidden class="input-field oculto materialize-textarea" name="desarrollo" id="desarrollo" class="input-field oculto " placeholder="Desarrollo" ><%=desa%></textarea>
                            <textarea hidden class="input-field oculto materialize-textarea" name="conclusion" id="conclusion" class="input-field oculto " placeholder="Conclusión" ><%=conclu%></textarea>
                            <label for="referencias"><h6>Referencias</h6></label>
                            <div type="text" id="referencias" name="referencias" class="input-field oculto" value="<%=refe%>">
                                <!--Aquí se generan las referencias-->
                                <div type="text" id="referencias" name="referencias" class="input-field oculto" >
                                <% for(int p = 0; p < refs.size(); p++){
                                    refe = refs.get(p);
                                    num = p + 1;
                                %>
                                <p id="pRef<%=num%>" class="pRef"><%=refe%></p>
                                <input value="<%=refe%>" hidden="true" name="vRef<%=num%>"/>
                                    <%}%>
                              </div>
                            </div>
                            <hr>
                            <label for=""><h6>Sello</h6></label>
                            <input type="text" name="sello" id="sello" class="input-field oculto" disabled="true" value="<%=sello%>">
                            <br><br>
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