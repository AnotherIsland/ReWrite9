<%-- 
    Document   : Lirica
    Created on : 17/11/2018, 07:01:22 AM
    Author     : Axolotech
--%>

<%@page import="controller.AdminConsejos"%>
<%@page import="model.Consejo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.AdminObras"%>
<%@page import="model.Obra"%>
<%@page import="model.Lirico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesi = request.getSession();
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    
    /*if (sesi.getAttribute("ID") != null) {*/
    String sello = "";    
    if (request.getAttribute("sello") != null) {
        sello = request.getAttribute("sello").toString();
        request.setAttribute("sello", sello);
    }
    
    Obra obraX = null;
    Lirico lir = null;
    AdminObras ao = new AdminObras();
    String titulo = "";
    String cont = "";
    String idObra = "";
    ArrayList<Consejo> consM = new ArrayList();
    ArrayList<Consejo> consR = new ArrayList();
    ArrayList<Consejo> consO = new ArrayList();
    ArrayList<Consejo> consG = new ArrayList();
    AdminConsejos ac = new AdminConsejos();
    Consejo consX = null;
    String consejo = "";
    String usCons = "";

    if(request.getParameter("idObra") != null ||request.getAttribute("idObra")!= null ){
        
        if(request.getParameter("idObra") != null){
            idObra = request.getParameter("idObra");
        }else{
            idObra = request.getAttribute("idObra").toString();
        }
        
        obraX = ao.buscaObraporID(Integer.parseInt(idObra));
               
               
        lir = ao.getLir();
        titulo = obraX.getTitulo();
        cont = lir.getContenido();
        
        consM = ac.traePorCategoria(Integer.parseInt(idObra), "metrica");
        consO = ac.traePorCategoria(Integer.parseInt(idObra), "otros");
        consG = ac.traePorCategoria(Integer.parseInt(idObra), "ortografia");
        consR = ac.traePorCategoria(Integer.parseInt(idObra), "rima");
        
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <!--<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>-->
        <title>ReWrite - Lírica</title>
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
                    <h2 class="white-text">Lírica</h2>
                    <div class="row"> 
                        <br>
                        <h6 class="white-text">Aquí tenemos unos muy buenos consejos para ti. </h6><br>
                        
                        <ul class="collapsible">
                            <li>
                                <div class="collapsible-header"><i class="material-icons">assignment_turned_in</i>Ortografía y gramática</div>
                                <div class="collapsible-body">
                                    <%for(int h = 0; h < consG.size();h++){
                                        consX = consG.get(h);
                                        consejo = consX.getConsejo();
                                        usCons = consX.getUsuario();
                                    %>
                                    <span class="white-text"><%=consejo%></span><br/><!--aquí va el consejo-->
                                    <span class="grey-text">- <%=usCons%></span><br/><br/>
                                    <%}%>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">book</i>Rima</div>
                                <div class="collapsible-body">
                                    <%for(int h = 0; h < consR.size();h++){
                                        consX = consR.get(h);
                                        consejo = consX.getConsejo();
                                        usCons = consX.getUsuario();
                                    %>
                                    <span class="white-text"><%=consejo%></span><br/><!--aquí va el consejo-->
                                    <span class="grey-text">- <%=usCons%></span><br/><br/>
                                    <%}%>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">border_color</i>Métrica</div>
                                <div class="collapsible-body">
                                    <%for(int h = 0; h < consM.size();h++){
                                        consX = consM.get(h);
                                        consejo = consX.getConsejo();
                                        usCons = consX.getUsuario();
                                    %>
                                    <span class="white-text"><%=consejo%></span><br/><!--aquí va el consejo-->
                                    <span class="grey-text">- <%=usCons%></span><br/><br/>
                                    <%}%>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">flag</i>Otros</div>
                                <div class="collapsible-body">
                                    <%for(int h = 0; h < consO.size();h++){
                                        consX = consO.get(h);
                                        consejo = consX.getConsejo();
                                        usCons = consX.getUsuario();
                                    %>
                                    <span class="white-text"><%=consejo%></span><br/><!--aquí va el consejo-->
                                    <span class="grey-text">- <%=usCons%></span><br/><br/>
                                    <%}%>
                                </div>
                            </li>
                        </ul>
                        <h6 class="white-text" id="numP">Palabras:</h6><br><!--Aquí va el conteo de número de palabras-->
                    </div>
                    <div class="row">
                        <h6 class="white-text">Herramientas</h6><br>

                        <button id="nuevaEstrofa" class="btn-floating btn-large waves-effect waves-light blue" ONCLICK="mostrarEstrofa();">
                            <i class="material-icons">add</i>
                        </button><label class="white-text" for="nuevaEstrofa">&nbsp;&nbsp;Estrofa</label>
                        <div class="input-field col s12 m12 l12 xl12" hidden id="tipoEstro" name="tipoEstro" ><!--aparece sólo cuando se da clic en nueva estrofa-->
                            <select id="tipoEstrofa" name="tipoEstrofa" >
                                <option class="white-text" value="" disabled selected>Elige uno..</option>
                                <option value="1">Alejandrino</option><!--Traer opciones de la base-->
                                <option value="2">Quintilla</option>
                            </select>
                        </div>
                        <br><br>
                        <!--Compartir obra y despliega vínculo-->
                        <button id="compartir" class="btn-floating btn-large waves-effect waves-light blue" onclick="mostrarCompartir();">
                            <i class="material-icons">person_add</i>
                        </button><label class="white-text" for="compartir">&nbsp;&nbsp;Compartir Obra</label>
                        <div class="" style="overflow: hidden;" id="share" name="share" hidden ><!--aparece sólo cuando se da clic en compartir-->
                             <a class="truncate" href="${pageContext.request.contextPath}/jsp/Login.jsp?cp=<%=idObra%>">
                             ${pageContext.request.contextPath}/jsp/Login.jsp?cp=<%=idObra%></a>
                        </div>
                    </div>
                </div>

                <div class="section white col s8 m8 l8 xl8"><!--contenido principal donde se escribe-->
                            
                    <form action="${pageContext.request.contextPath}/ActualizarObra" method="POST">
                        <input type="text" name="tipo" id="tipo" value="lirica" hidden="true">
                        <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
                        <input type="submit" class="btn waves-effect waves-light right" name="guardar" id="guardar" value="Guardar"><br><br>
                        <br>
                        
                        <input type="text" name="titulo" class="input-field oculto " placeholder="Título" value="<%=titulo%>" />
                        <textarea class="materialize-textarea input-field oculto" name="contenido" placeholder="Escribe aquí tu poema..." ><%=cont%></textarea>
                        
                        
                        <hr>
                            <label for=""><h6>Sello</h6></label>
                            <input type="text" name="selloF" id="selloF" class="input-field oculto" disabled="true" value="<%=sello%>"><br>
                            <input type="button" class="btn waves-effect waves-light left" name="revisar" id="revisar" value="Revisar" onclick="cuentaSilabas()"><br><br>
                    </form>
                </div>
                <ul id="slide-out" class="sidenav">
                    <div class="chat section">
                        <div class="row">
                            <div id="messages"></div>
                        </div>
                        <div class="row">
                            <div id="users" >
                                <h7>Usuarios conectados: </h7>
                                <ul id="user-list" class="list-group"></ul>
                            </div>
                        </div>

                        <div class="responsive-table">
                            <table class="table" align="centered">
                                <tr>
                                <form class="col l12 m12 s12 xl12" name="messageToSend">
                                    </th>
                                    <th>
                                        <div class="input-field">
                                            <label for="text">Mensaje:</label>
                                            <textarea class="materialize-textarea" id="text" placeholder="Escribe aquí..."></textarea>
                                        </div>
                                        <div class="alert alert-danger" id="alert2"><strong>ERROR! </strong>Ingresa un mensaje válido.</div>
                                    </th>
                                    <th><br><br>
                                        <div class="">
                                            <button class="btn-floating btn-large waves-effect waves-light blue" onclick="addMessage()">
                                                <i class="material-icons medium">send</i>
                                            </button>
                                        </div>
                                    </th>
                                </form>
                                </tr>
                            </table>
                        </div>
                    </div>
                </ul>

            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lirica.js"></script>
        
    </body>
</html>
<% /*} 
    else {
    RequestDispatcher rd = request.getRequestDispatcher("../Login.jsp");
                rd.forward(request, response);
}*/%>

