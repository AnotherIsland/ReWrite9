<%-- 
    Document   : Resumen
    Created on : 17/11/2018, 07:02:00 AM
    Author     : Axolotech
--%>

<%@page import="controller.AdminConsejos"%>
<%@page import="model.Consejo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.AdminObras"%>
<%@page import="model.Resumen"%>
<%@page import="model.Obra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    Resumen res = null;
    AdminObras ao = new AdminObras();
    String titulo = "";
    String cont = "";
    String clav = null;
    String refe = "";
    String clavs[] = null;
    ArrayList<String> refs = new ArrayList();
    int num = 0;
    String idObra = "";
    ArrayList<Consejo> consC = new ArrayList();
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
               
        res = ao.getRes();
        titulo = obraX.getTitulo();
        cont = res.getContenido();
        //clavs = res.getClaves();
        clavs = res.getClavees().split(",");
        refe = res.getReferencias();
        
        System.out.println("Claves que trae: "+clavs);
        refs = ao.traeRefes(refe);
        
        consO = ac.traePorCategoria(Integer.parseInt(idObra), "otros");
        consG = ac.traePorCategoria(Integer.parseInt(idObra), "ortografia");
        consC = ac.traePorCategoria(Integer.parseInt(idObra), "claridad");
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

  <title>ReWrite - Resumen</title>
</head>
<body >
<div class="" name="header">
  <nav>
    <div class="nav-wrapper ">
      <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo">
          <img class="responsive-img center-align" style="padding: 10px" src="${pageContext.request.contextPath}/img/logoT.png"></a>
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
      <h2 class="white-text">Resumen</h2>
      <div class="row">
        
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
            <div class="collapsible-header"><i class="material-icons">photo_filter</i>Claridad</div>
            <div class="collapsible-body">
              <%for(int h = 0; h < consC.size();h++){
                    consX = consC.get(h);
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
          <li>
            <div class="collapsible-header"><i class="material-icons">description</i>Palabras clave</div>
            <div class="collapsible-body"><!--aquí va el consejo-->
                <div name="pClave" id="pClave">
                    <ul id="listaClaves">
                        <li class="white-text">
                        <input type="text" id="word" class="white-text left" onkeypress="validap();" placeholder="Añade una palabra" onblur="agregaPalabra();">
                        <button class="btn-floating btn-small" name="haceP" type="submit" value="haceP" onclick="agregaPalabra();">
                            <i class="material-icons">check</i>
                        </button>&nbsp;&nbsp;Agregar
                        </li>
                        <br/> 
                        <% for(int p = 0; p < clavs.length; p++){
                            clav = clavs[p];
                            num = p + 1;
                        %>
                        <li class="white-text">
                            <i class="tiny material-icons">check</i>
                            <span class="palabra"><%=clav%></span> 
                        </li>
                        
                        <%}%>
                    </ul>
                </div>
                <br>
                <div name="fClave" id="fClave">
                    <span class="white-text">Te faltan estas palabras en tu resumen:</span>
                    <ul id="faltanClaves">
                        
                    </ul>
                </div>
            </div>
          </li>
        </ul>
        <h6 class="white-text" id="numP">Palabras:</h6><br><!--Aquí va el conteo de número de palabras-->
      </div>
      <div class="row">
        <h6 class="white-text">Otras herramientas</h6><br>

        <button id="nuevaRef" class="btn-floating btn-large waves-effect waves-light blue" onclick="mostrarTipoRef();">
          <i class="material-icons">add</i>
        </button><label class="white-text" for="nuevaRef">&nbsp;&nbsp;Nueva referencia</label>
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
          <a class="truncate" href="${pageContext.request.contextPath}/jsp/Login.jsp?cp=<%=idObra%>">
              ${pageContext.request.contextPath}/jsp/Login.jsp?cp=<%=idObra%></a>
        </div>
      </div>
    </div>

    <div class="section lienzo white col s8 m8 l8 xl8"><!--contenido principal donde se escribe-->
        <form name="form1" id="form1" action="${pageContext.request.contextPath}/ActualizarObra" method="POST">
          <input type="button" class="btn waves-effect waves-light right" name="revisar" id="revisar"
                 value="Revisar" onclick="revResumen();"/><br><br>
          <input type="text" name="idObra" id="idObra" value="<%=idObra%>" hidden="true">
          <input type="text" name="tipo" id="tipo" value="resumen" hidden="true">
          <input type="text" class="input-field oculto" placeholder="Título" name="titulo" id="titulo" value="<%=titulo%>"/>
          <label for="contenido"><h6>Contenido</h6></label>
          <textarea class="materialize-textarea input-field oculto" id="contenido" name="contenido" onchange="revResumen();"><%=cont%></textarea>
          <label for="referencias"><h6>Referencias</h6></label><br>
          <div type="text" id="referencias" name="referencias" class="input-field oculto" >
            <% for(int p = 0; p < refs.size(); p++){
                refe = refs.get(p);
                num = p + 1;
            %>
            <p id="pRef<%=num%>" class="pRef"><%=refe%></p>
            <input value="<%=refe%>" hidden="true" name="vRef<%=num%>"/>
                <%}%>
          </div>
          
          <div class="oculto" id="sello" name="sello" >
              <hr>
                            <label for=""><h6>Sello</h6></label>
              <input type="text" name="selloF" id="selloF" class="input-field oculto" disabled="true" value="<%=sello%>">
                            </div>
                            <input type="submit" class="btn waves-effect waves-light" name="guardar" id="guardar" onclick="guardaResumen();" value="Guardar"><br><br>
        </form>
    </div>

    
  </div>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Resumen.js"></script>
</body>
</html>
<% } 
    else {
    RequestDispatcher rd = request.getRequestDispatcher("../Login.jsp");
                rd.forward(request, response);
}%>
