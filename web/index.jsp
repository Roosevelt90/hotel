<%@page import="java.sql.Array"%>
<%@page import="model.Usuario"%>
<%@page import="model.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">   		
        <script src="js/bootstrap.min.js"></script> 
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body>

        <div class="container">    
            <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
                <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Iniciar sesión</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                        <form id="loginform" class="form-horizontal" role="form" method="post">

                            <%
                                Login lo = new Login();

                                if (request.getParameter("btnEnviar") != null) {
                                    String email = request.getParameter("email");
                                    String pass = request.getParameter("pass");
                                    HttpSession sesion = request.getSession();
                                    switch (lo.login(email, pass)) {
                                        case 1:

                                            sesion.setAttribute("user", email);
                                            sesion.setAttribute("rol", "1");
                                            response.sendRedirect("homeAdministrador.jsp");
                                            break;

                                        case 2:
                                            sesion.setAttribute("user", email);
                                            sesion.setAttribute("rol", "2");
                                            response.sendRedirect("homeUsuario.jsp");
                                            break;

                                        default:
                            %>
                            <div id="signupalert" class="alert alert-danger">
                                <span>Datos incorrectos</span>
                            </div>
                            <%
                                            break;
                                    }
                                }

                            %>

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="email" name="email" size="15" id="email" class="form-control" placeholder="Ingrese el correo">
                            </div>

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input type="password" name="pass" size="15" id="pass" class="form-control"  placeholder="Ingrese la contraseña">                                
                            </div>
                            <div style="margin-top:10px" class="form-group">
                                <!-- Button -->

                                <div class="col-sm-12 controls">
                                    <input type="submit" name="btnEnviar" class="btn btn-success" value="Ingresar">
                                    <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()" class="btn btn-primary">
                                        Registrarse
                                    </a>                                    
                                </div>
                            </div>
                        </form>     
                    </div>                     
                </div>  
            </div>
            <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Registrarse</div>
                        <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Login</a></div>
                    </div>  
                    <div class="panel-body" >
                        <form id="signupform" method="post" class="form-horizontal" role="form">

                            <%                                Usuario usu = new Usuario();
                                Array responseData;
                                if (request.getParameter("btnRegistrarse") != null) {
                                    String email_user = request.getParameter("email_user");
                                    String cc = request.getParameter("cc");
                                    String name = request.getParameter("name");
                                    String pass = request.getParameter("pass");
                                    responseData = usu.create(email_user, cc, name, pass);

                                }

                            %>



                            <div class="form-group">
                                <label for="email" class="col-md-3 control-label">Email</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="email_user" placeholder="Ingrese el correo">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="name" class="col-md-3 control-label">Nombre completo</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="name" placeholder="Ingrese el nombre completo">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cc" class="col-md-3 control-label">Numero de documento</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="cc" placeholder="Ingrese el numero de documento">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-md-3 control-label">Password</label>
                                <div class="col-md-9">
                                    <input type="password" class="form-control" name="pass" placeholder="Ingrese el password">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-3 col-md-9">
                                    <input type="submit" name="btnRegistrarse" class="btn btn-info" value="Enviar">                                    
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div> 
        </div>


    </body>
</html>
