<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DataBase"%>
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
    //if (sesi.getAttribute("ID") != null) {
%>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>
        <title>Mantenimiento</title>
    </head>
    <body>
        <div class="" name="header">
            <nav>
                <div class="nav-wrapper ">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="${pageContext.request.contextPath}/img/logoT.png"></a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/index.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/Reporte.jsp">Ayuda</a></li>
                    </ul>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/Login.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/MISOBRAS/MisObras.jsp">Mis Obras</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/CREAR/Crear.jsp">Crear</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/AJUSTES/Ajustes.jsp">Ajustes</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/EVOLUCION/Evolucion.jsp">Evolución</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/SOPORTE/Reporte.jsp">Ayuda</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12 xl12">
                    <div class="section white z-depth-3 center-align">
                        <h3 >Crear Reporte de Mantenimiento</h3>  
                    </div>

                    <br><br>
                    <div class="col s12 m12 l12 xl12 " >
                        <div class="section grey z-depth-3">
                            <div class="row">
                                <h6 class="white-text">Reporte de Mantenimiento</h6><hr class="blue lighten-1">
                                <div class="col s12 m12 l12 xl12 " >
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col s12 m12 l12 xl12 " >
                    <div class="section white z-depth-3">
                        <h6>Para levantar un reporte de mantenimiento ingresa los siguientes datos:</h6>
                        <div class="row">
                            <form name="reporte" action="${pageContext.request.contextPath}/AltaMantenimiento0" method="POST">
                                <div class="row">
                                    <!--<div class="col s5 l5 m5 xl5">
                                        <div class="input-field col s12">
                                            <input id="usuario" type="text" name="usuario" onkeypress="valCorreo();" />
                                            <label for="usuario">Seleccione un reporte de evento existente</label>       
                                        </div>
                                    </div>-->
                                    <%DataBase db = new DataBase();
                                    
                                    ResultSet rs;
                                        
                                    %>
                                    
                                    <div class="col s5 l5 m5 xl5">
                                        <select id="Persona"  name="Persona"  >
                                            <option class="white-text" value="" disabled selected>Asigne una Persona a este reporte</option>
                                            <%try {//Da de alta ensayo 
                                            
                                          db.connect();
                                                                                    
                                          rs=db.query("Select * from usuario where idTipoUsuario0=4 or idTipoUsuario0=5;");
                                          while(rs.next()){
                                              
                                          int ini= rs.getInt("idUsuario");
                                          String nom=rs.getString("usuario");
                                          String tipo="i";
                                          if(rs.getInt("idTipoUsuario0")==5){
                                              tipo="Gerente de Mantenimiento";
                                              
                                          }
                                          else
                                          if(rs.getInt("idTipoUsuario0")==4){
                                              
                                              tipo="Ingeniero de Soporte";
                                          }

                                            %>
                                            <option value="<%=ini%>"><%=nom %>        /        <%=tipo %></option>
                                            <%
                                          }
                                                    

                                            db.closeConnection();
                                        } catch (SQLException error) {
                                            System.out.println(error.toString());
                                        }%>
                                        </select>
                                    </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="contenido" type="text" name="contenido" onkeypress="validap();" />
                                        <label for="comentario">Escribe aquí el contenido del reporte...</label>       
                                    </div>
                                </div>
                                <div class="row">
                                    <input type="submit" name="aceptar" class="btn waves-effect waves-light" value="ENVIAR"/>
                                </div> 
                            </form>
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