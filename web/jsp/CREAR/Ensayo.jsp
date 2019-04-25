<%-- 
    Document   : Ensayo
    Created on : 17/11/2018, 07:00:24 AM
    Author     : Axolotech
--%>


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

                        <button id="nuevaRef" class="btn-floating btn-large waves-effect waves-light blue" onclick="mostrarTipoRef();">
                            <i class="material-icons">add</i>
                        </button><label class="white-text" for="nuevaRef"> Nueva referencia</label>
                        <div class="input-field col s12 m12 l12 xl12" id="tipoRef" name="tipoRef" hidden ><!--aparece sólo cuando se da clic en nueva referencia-->
                            <form>
                                <select id="tipoReferencia" name="tipoReferencia" onchange="newRef(this);">
                                    <option class="white-text" value="" disabled selected>Elige uno..</option>
                                    <option value="1">Bibliográfica</option>
                                    <option value="2">Artículo Web</option>
                                </select>
                            </form>
                        </div>
                        <br><br>
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
                        <form name="form1" id="form1" action="${pageContext.request.contextPath}/GuardarObra" method="POST">
                            <input type="text" name="tipo" id="tipo" value="ensayo" hidden="true">
                            <input type="button" class="btn waves-effect waves-light right" name="revisar" id="revisar" value="Revisar" onclick="revEnsayo();"><br><br>
                            <input type="text" name="titulo" id="titulo" class="input-field oculto " placeholder="Título"  >
                            <input type="text" name="intro" id="intro" class="input-field oculto " placeholder="Introducción" >
                            <input type="text" name="desarrollo" id="desarrollo" class="input-field oculto " placeholder="Desarrollo" >
                            <input type="text" name="conclusion" id="conclusion" class="input-field oculto " placeholder="Conclusión" >
                            <label for="referencias"><h6>Referencias</h6></label>
                            <div type="text" id="referencias" name="referencias" class="input-field oculto">
                                <!--Aquí se generan las referencias-->
                            </div>
                            <hr>
                            <label for=""><h6>Sello</h6></label>
                            <input type="text" name="selloF" id="selloF" class="input-field oculto" disabled="true" value="<%=sello%>">
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