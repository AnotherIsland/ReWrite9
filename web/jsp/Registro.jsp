<%-- 
    Document   : Registro
    Created on : 17/11/2018, 07:03:44 AM
    Author     : Axolotech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ReWrite - Registro</title>
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>
    </head>
    <body class="grey darken-1">
        <nav>
            <div class="nav-wrapper white">
                <div class="row">
                    <div class="col s2 l2 m2 xl2 offset-l5 offset-xl5 offset-s4 offset-m4">
                        <a href="${pageContext.request.contextPath}/index.jsp" class="brand-logo"><img class="responsive-img center-align" style="padding: 10px" src="../img/logo.png"/></a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container">

            <div class="row white z-depth-4 section col s12 l12 m12 xl12">
                <div class="row ">
                    <div class="col s2 l2 m2 xl2 offset-l10 offset-xl10 offset-s8 offset-m9">
                        <h5>
                            <a href="${pageContext.request.contextPath}/Login.jsp" class="waves-effect waves-light light-blue btn">Inicia Sesión</a>
                        </h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col s5 l5 m5 xl5 offset-l1 offset-xl1 offfset-s1 offfset-m1">
                        <div class="carousel carousel-slider center">
                            <div class="carousel-fixed-item center">
                                <a class="btn waves-effect white grey-text darken-text-2">Ver...</a>
                            </div>
                            <div class="carousel-item blue1" href="#one!">
                                <h2>Bienvenido a ReWrite</h2>
                                <p class="white-text"></p>
                                <img src="${pageContext.request.contextPath}/img/writing.jpg" class=" responsive-img" alt="imagen"/>
                            </div>
                            <div class="carousel-item white-text blue2" href="#two!">
                                <h2>Crea tus propias obras literarias, es fácil comenzar.</h2>
                                <p class="white-text"></p>
                                <img src="${pageContext.request.contextPath}/img/writing2.jpg" class=" responsive-img" alt="imagen"/>
                            </div>
                            <div class="carousel-item white-text blue3" href="#three!">
                                <h2></h2>
                                <p class="white-text">Recibe ayuda, consejos y un seguimiento a tus avances en escritura.</p>
                                <img src="${pageContext.request.contextPath}/img/writing3.jpg" class=" responsive-img" alt="imagen"/>
                            </div>
                            <div class="carousel-item white-text blue3" href="#four!">
                                <img src="${pageContext.request.contextPath}/img/imgHome.png" class="responsive-img" alt="imagen"/>
                            </div>
                        </div>

                        
                    </div>
                    <div class="col s5 l5 m5 xl5 ">
                        <div class="">
                            <h3>Registro</h3>
                            <form method="post" action="${pageContext.request.contextPath}/Registroo"  id="formR" name="formR">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="email" type="email" name="email" class="validate" onkeypress="valCorreo();">
                                        <label class="" for="email">Correo Electrónico</label>
                                        <span class="helper-text" data-error="Incorrecto" data-success="correcto">ejemplo@correo.com</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="password" type="password" name="password" class="validate" onkeypress="vNumyLetras();" >
                                        <label class="" for="password">Contraseña</label>
                                        <span class="helper-text" data-error="Incorrecto" data-success="correcto">Puedes usar números y letras</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="password1" type="password" name="password1" class="validate" onkeypress="vNumyLetras();">
                                        <label class="" for="password1">Confirma contraseña</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input type="submit"  class="btn waves-effect waves-light" value="ENVIAR" onclick="return validaRegistro(formR);"  id="aceptar" name="aceptar">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <br><br>
            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/init.js"></script>
    </body>
</html>
