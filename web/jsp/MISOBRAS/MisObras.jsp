<%-- 
    Document   : MisObras
    Created on : 17/11/2018, 12:47:16 PM
    Author     : Student
--%>

<%@page import="controller.AdminObras"%>
<%@page import="Database.DataBase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Obra"%>
<%@page import="model.Obra"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%
        HttpSession sesi = request.getSession();
        if (sesi.getAttribute("ID") != null) {
            
                    
            /*if(request.getAttribute("obras") == null){
                System.out.println("Entra al java");
                RequestDispatcher rd = request.getRequestDispatcher("/MisObras");
                rd.forward(request, response);
            }else{
                System.out.println(request.getAttribute("tiene").toString());
            }*/
            
            DataBase db = new DataBase();
            ResultSet rs = null;
            
            String usuario = sesi.getAttribute("Email").toString();
            String idUs = sesi.getAttribute("idUsuario").toString();

            //Datos a obtener de la obra
            ArrayList <Obra> obras = new ArrayList();
            Obra obraX = null;
            int idObra = 0;
            String titulo = "";
            String fecha = "";
            String tipo = "";

            try {
                db.connect();
                rs = db.query("select * from obra inner join relobrausu on relobrausu.idObra = obra.idObra where idUsuario ="+idUs+";");
                while(rs.next()){
                    idObra = rs.getInt("idObra");
                    titulo = rs.getString("titulo");
                    fecha = rs.getString("fecha");
                    tipo = rs.getString("tipo");
                    

                    obraX = new Obra(idObra, titulo, fecha, tipo);
                    if(!tipo.equals("10")){
                        obras.add(obraX);
                    }
                    
                }                      
                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }
            
            //Para buscar una obra específica
            String busca = "";
            boolean buscando = false;
            AdminObras ao = new AdminObras();
            
            if(request.getParameter("search")!=null){
                buscando = true;
            }
            
        %>
<html>
<head>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>
  <title>ReWrite - Mis Obras</title>
</head>
<body>
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
    <div class="col s12 m12 l12 xl12">
        <div class="section white z-depth-3">
            <h3 >Mis Obras</h3>  
        </div>
        
        <br><br>
        <form action="${pageContext.request.contextPath}/jsp/VerificaSello.jsp">
            <input type="submit" class="btn waves-button-input black-text z-depth-3" value="Verificador de sellos" name="aceptar">
        </form>
      <div class="col s7 m7 l8 xl8 " >
          
        <div class="section grey z-depth-3">
          <div class="row">
            <h5 class="white-text">Recientes</h5><hr class="blue lighten-1">
            <div class="col s12 m12 l12 xl12 " >
                <%for(int i = 0; i < obras.size(); i++){
                    obraX = obras.get(i);
                    titulo = obraX.getTitulo();
                    fecha = obraX.getFecha();
                    tipo = obraX.getTipo();
                    idObra = obraX.getIdObra();
                    int type = Integer.parseInt(tipo);
                    String tipoo = "";
                    
                    if(type == 1){
                        tipoo = "Ensayo";
                    }else if(type == 2){
                        tipoo = "Resumen";
                    }else if(type == 3){
                        tipoo = "Narrativo";
                    }else if(type == 4){
                        tipoo = "Lirica";
                    }else if(type == 5){
                        tipoo = "Lienzo";
                    }
                %>
              <div class="col s4 m4 l4 xl4 ">
                <div class="card sticky-action">
                  <div class="card-image">
                    <img src="${pageContext.request.contextPath}/img/plantilla.png">
                    <form action="${pageContext.request.contextPath}/jsp/MISOBRAS/<%=tipoo%>.jsp" method="POST" >
                        <input name="idObra" type="text" value="<%=idObra%>" hidden/>
                        <button class="btn-floating halfway-fab waves-effect waves-light">
                            <i class="material-icons">create</i>
                        </button>
                        <button class="btn-floating halfway-fab waves-effect waves-light">
                            <i class="material-icons">create</i>
                        </button>
                    </form>
                  </div>
                  <div class="card-content">
                    <span class="card-title black-text"><%=titulo%></span><!--Traer titulo de la obra-->
                    <p><%=fecha%></p>
                  </div>
                  <div class="card-action">
                      <form action="${pageContext.request.contextPath}/MisObras" method="POST" >
                          <input name="title" type="text" value="<%=titulo%>" hidden />
                          <input name="fecha" type="text" value="<%=fecha%>" hidden/>
                          <input name="idObra" type="text" value="<%=idObra%>" hidden/>
                          <input name="tipo" type="text" value="<%=tipo%>" hidden/>
                          
                          <button class="btnRef" name="descargaPDF" type="submit" value="pdf">
                            <i class="material-icons">file_download</i>  
                          </button>
                          <button class="btnRef" name="elimina" type="submit" value="elimina">
                            <i class="material-icons">&nbsp;&nbsp;delete</i>  
                          </button>
                          
                         <!-- <input class="waves-effect waves-light btn" name="descargaPDF" type="submit" value="Descargar PDF">-->
                      </form>
                  </div>
                </div>
              </div><%}%>
              
            </div>
          </div>
        </div>
      </div>

      <div class="col s5 m5 l4 xl4 " >
        <div class="section white z-depth-3">
            <form method="POST" action="${pageContext.request.contextPath}/jsp/MISOBRAS/MisObras.jsp">
                
            <div class="input-field">
              <input id="search" name="search" type="text" required />
              <label for="search"> 
                  <button class="btnNada"><i class="material-icons">search</i></button>
                  &nbsp;&nbsp;Buscar
              </label>
              
            </div>
            <!--<div class="input-field" id="select">
              <select>
                <option value="1" selected>A-z</option>
                <option value="2">Z-a</option>
                <option value="3">Fecha</option>
              </select>
              <label>Ordenar por...</label>
            </div>-->
            <br>
            </form>
            <%if(buscando){
                if(!request.getParameter("search").equals("")){
                    busca = request.getParameter("search");
                
                    for (int i = 0; i < obras.size(); i++) {
                        obraX = obras.get(i);
                        if(obraX.getTitulo().equals(busca)) {
                            System.out.println("Se encontró la obra: "+busca);
                            break;
                        } 
                    }
                    titulo = obraX.getTitulo();
                    fecha = obraX.getFecha();
                    tipo = obraX.getTipo();
                    idObra = obraX.getIdObra();
                    int type = Integer.parseInt(tipo);
                    String tipoo = "";
                    
                    if(type == 1){
                        tipoo = "Ensayo";
                    }else if(type == 2){
                        tipoo = "Resumen";
                    }else if(type == 3){
                        tipoo = "Narrativo";
                    }else if(type == 4){
                        tipoo = "Lirica";
                    }else if(type == 5){
                        tipoo = "Lienzo";
                    }
              %>
              <div class="card sticky-action">
                  <div class="card-image">
                    <img src="${pageContext.request.contextPath}/img/plantilla.png">
                    <form action="${pageContext.request.contextPath}/jsp/MISOBRAS/<%=tipoo%>.jsp" method="POST" >
                        <input name="idObra" type="text" value="<%=idObra%>" hidden/>
                        <button class="btn-floating halfway-fab waves-effect waves-light">
                            <i class="material-icons">create</i>
                        </button>
                    </form>
                  </div>
                  <div class="card-content">
                    <span class="card-title black-text"><%=titulo%></span><!--Traer titulo de la obra-->
                    <p><%=fecha%></p>
                  </div>
                  <div class="card-action">
                      <form action="${pageContext.request.contextPath}/MisObras" method="POST" >
                          <input name="title" type="text" value="<%=titulo%>" hidden />
                          <input name="fecha" type="text" value="<%=fecha%>" hidden/>
                          <input name="idObra" type="text" value="<%=idObra%>" hidden/>
                          <input name="tipo" type="text" value="<%=tipo%>" hidden/>
                          <i class="material-icons">file_download</i>
                          <input class="waves-effect waves-light btn" name="descargaPDF" type="submit" value="Descargar PDF">
                      </form>
                  </div>
                </div>
              <%}
              }%>
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
<% } 
    else {
    RequestDispatcher rd = request.getRequestDispatcher("../Login.jsp");
                rd.forward(request, response);
}%>