<%-- 
    Document   : Crear
    Created on : 17/11/2018, 06:59:59 AM
    Author     : Axolotech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="../../css/materialize.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="shortcut icon" type="image/x-icon" href="../../favicon.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ReWrite - Crear</title>
    </head>
    <body >
        <%
        HttpSession sesi = request.getSession();
        if (sesi.getAttribute("ID") != null) {
        %>
        <div class="" name="header">
            <nav>
                <div class="nav-wrapper ">
                    <a href="../../index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="../../img/logoT.png"></a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a class=" text-accent-4" href="${pageContext.request.contextPath}/index.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="../MISOBRAS/MisObras.jsp">Mis Obras</a></li>
                        <li><a class=" text-accent-4" href="../CREAR/Crear.jsp">Crear</a></li>
                        <li><a class=" text-accent-4" href="../AJUSTES/Ajustes.jsp">Ajustes</a></li>
                        <li><a class=" text-accent-4" href="../EVOLUCION/Evolucion.jsp">Evolución</a></li>
                    </ul>
                    <ul class="sidenav" id="mobile-demo">
                        <li><a class=" text-accent-4" href="../Login.jsp">Cerrar Sesión</a></li>
                        <li><a class=" text-accent-4" href="../MISOBRAS/MisObras.jsp">Mis Obras</a></li>
                        <li><a class=" text-accent-4" href="../CREAR/Crear.jsp">Crear</a></li>
                        <li><a class=" text-accent-4" href="../AJUSTES/Ajustes.jsp">Ajustes</a></li>
                        <li><a class=" text-accent-4" href="../EVOLUCION/Evolucion.jsp">Evolución</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container">

            <div class="row">
                <div class="col s12 m12 l12 xl12">
                    <div class="section white col s10 m10 l10 xl10 offset-s1 offset-l1 offset-m1 offset-xl1 z-depth-3" >
                        <h3 class="center">Crear</h3>
                        <span class="grey-text">Realiza todos los escritos que imagines, cuenta tus historias, obtén un diez en tu ensayo.</span>
                        <span class="black-text"><p>Para comenzar, elige una plantilla o usa un lienzo en blanco:</p></span>
                    </div>
                    <div class="row">
                        <div class="section grey col s10 m10 l10 xl10 offset-s1 offset-l1 offset-m1 offset-xl1" >
                            <div class="col s10 m4 l3 xl3">
                                <br><br>
                                <div >
                                    <div class="card z-depth-3">
                                        <div class="card-image">
                                            <img src="../../img/lienzo.png">
                                            <a class="btn-floating halfway-fab waves-effect waves-light " href="Lienzo.jsp"><i class="material-icons">add</i></a>
                                        </div>
                                        <div class="card-content">
                                            <span class="card-title">Lienzo en blanco</span>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col s10 m4 l3 xl3 offset-xl2 offset-l2 ">
                                <h5>Textos Científicos</h5>
                                <div class="card z-depth-3">
                                    <div class="card-image">
                                        <img src="../../img/plantilla.png">
                                        <a class="btn-floating halfway-fab waves-effect waves-light " href="Articulo.jsp"><i class="material-icons">add</i></a>
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title">Artículo de investigación</span>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col s10 m4 l3 xl3">
                                <br><br>
                                <div class="card z-depth-3">
                                    <div class="card-image">
                                        <img src="../../img/plantilla.png">
                                        <a class="btn-floating halfway-fab waves-effect waves-light " href="Resumen.jsp"><i class="material-icons">add</i></a>
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title">Resumen</span>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row"> 
                        <div class="section grey col s10 m10 l10 xl10 offset-s1 offset-l1 offset-m1 offset-xl1" >
                            <h5>Textos Literarios</h5>
                            <div class="col s10 m4 l3 xl3">
                                <div class="card z-depth-3">
                                    <div class="card-image">
                                        <img src="../../img/plantilla.png">
                                        <a class="btn-floating halfway-fab waves-effect waves-light " href="Lirica.jsp"><i class="material-icons">add</i></a>
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title">Lírica</span>
                                        <p>Escribe un poema en verso y recibe consejos acerca de la métrica y rima.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col s10 m4 l3 xl3">
                                <div class="card z-depth-3">
                                    <div class="card-image">
                                        <img src="../../img/plantilla.png">
                                        <a class="btn-floating halfway-fab waves-effect waves-light " href="Narrativo.jsp"><i class="material-icons">add</i></a>
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title">Narrativo</span>
                                        <p>Cuenta tu historia y no dejes que los elementos de la trama se te escapen.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col s10 m4 l3 xl3">
                                <div class="card z-depth-3">
                                    <div class="card-image">
                                        <img src="../../img/plantilla.png">
                                        <a class="btn-floating halfway-fab waves-effect waves-light " href="Dramatico.jsp"><i class="material-icons">add</i></a>
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title">Dramático</span>
                                        <p>Elabora el guión, caracteriza tus pesonajes, añade acotaciones y da vida a tu obra teatral.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col s10 m4 l3 xl3">
                                <div class="card z-depth-3">
                                    <div class="card-image">
                                        <img src="../../img/plantilla.png">
                                        <a class="btn-floating halfway-fab waves-effect waves-light " href="Ensayo.jsp"><i class="material-icons">add</i></a>
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title">Ensayo</span>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript" src="../../js/materialize.min.js"></script>
        <script type="text/javascript" src="../../js/init.js"></script>
        <% } 
    else {
    RequestDispatcher rd = request.getRequestDispatcher("../Login.jsp");
                rd.forward(request, response);
}%>
    </body>
</html>
