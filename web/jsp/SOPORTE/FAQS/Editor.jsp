<%-- 
    Document   : Reporte
    Created on : 10/03/2019, 10:00:34 PM
    Author     : ACIE-PC
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
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
    //if (sesi.getAttribute("ID") != null) {
    
    DataBase db = new DataBase();
    ResultSet res;
    
    ArrayList <String> preguntas = new ArrayList();
    ArrayList <String> respuestas = new ArrayList();
    int [] idP = new int[450];
    
    String preguntaX = "";
    String respuestaX = "";
    int idpX = 0;
    int j = 0;
    
    try{
        db.connect();
        res = db.query("select * from FAQs;");

        while(res.next()) {
            preguntaX = res.getString("pregunta");
            respuestaX = res.getString("respuesta");
            idpX = res.getInt("idFAQ");
            
            //System.out.println(preguntaX);
            preguntas.add(preguntaX);
            respuestas.add(respuestaX);
            idP[j] = idpX;
            j++;//System.out.println(idpX);
        }
        db.closeConnection();
    }
    catch(SQLException error){
        System.out.println(error.toString());
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
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/index.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/MISOBRAS/MisObras.jsp">Mis Obras</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/CREAR/Crear.jsp">Crear</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/AJUSTES/Ajustes.jsp">Ajustes</a></li>
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/jsp/EVOLUCION/Evolucion.jsp">Evolución</a></li>
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
                        <h4 >PREGUNTAS FRECUENTES</h4>  
                    </div>

                    <br><br>
                    <div class="col s12 m12 l12 xl12 " >
                        <div class="section grey z-depth-3">
                            <div class="row">
                                <h6 class="white-text">Revisa nuestra lista de preguntas frecuentes para aclarar cualquier duda:</h6><hr class="blue lighten-1">
                                <div class="col s12 m12 l12 xl12 " >
                                    <div class="white-text">
                                        <%for(int i = 0; i < preguntas.size(); i++){
                                            preguntaX = preguntas.get(i);
                                            respuestaX = respuestas.get(i);
                                            %>
                                            <form method="POST" action="${pageContext.request.contextPath}/ActualizaFAQ">
                                                <input type="hidden"   value=<%=(i+1)%> id="idd" name="idd" />
                                                <br><%=(i+1)%> .- Pregunta: <input type="text" class="white-text"  id="pregunta" name="pregunta" value="<%=preguntaX%>">
                                                <br>Respuesta:  <input type="text" class="white-text" id="respuesta" name="respuesta" value="<%=respuestaX%>"> 
                                        <br><br><input type="submit"  class="btn waves-effect waves-light" value="EDITAR" id="editar" name="editar" />
                                            </form>
                                               
                                               
                                        <form name="eliminar" method="POST" action="${pageContext.request.contextPath}/EliminaFAQ">
                                             <input type="hidden"  visible="false" value=<%=(i+1)%> id="idd" name="idd" />
                                        <input type="submit"  class="btn waves-effect waves-light" value="ELIMINAR" id="eliminar" name="eliminar" />
                                        </form>
                                        <form>
                                        <%}%>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col s12 m12 l12 xl12 " >
                    <div class="section white z-depth-3">
                        <h6>Si las preguntas de la lista no son suficientes para aclarar todas las dudas,
                             siéntete en la libertad de agregar una.</h6>
                        <div class="row">
                            <form name="pregunta" method="POST" action="${pageContext.request.contextPath}/AltaFaqs">
                                
                                <div class="row">
                                    
                                    <div class="input-field col s12">
                                        <input id="pregunta" type="text" name="pregunta" onkeypress="VNumyLetras();" />
                                        <label for="comentario">Escribe aquí la pregunta</label>  
                                    </div>
                                    
                                    <div class="input-field col s12">
                                        <input id="respuesta" type="text" name="respuesta" onkeypress="VNumyLetras();" />
                                        <label for="comentario">Escribe aquí la respuesta</label>       
                                    </div>  
                                    
                                </div>
                                
                                <div class="row">
                                    <input type="submit" name="aceptar" class="btn waves-effect waves-light" value="ACEPTAR"/>
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