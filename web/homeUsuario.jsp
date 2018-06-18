<%-- 
    Document   : homeUsuario
    Created on : 18/06/2018, 12:13:25 PM
    Author     : Usuario1
--%>

<%@page import="model.Reservaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">   		
        <script src="js/bootstrap.min.js"></script> 
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">    
            <div  style="margin-top:30px;" class="mainbox col-md-12 text-center">                    
                <h2>Buscar reservacion</h2> 
            </div>
        </div>
        <div class="container">    
            <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
                <div class="panel panel-info" >

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                        <form id="loginform" class="form-horizontal" role="form" method="post">

                            <%
                                Reservaciones reser = new Reservaciones();


                            %>

                            <div style="margin-bottom: 25px" class="input-group">
                                <input type="email" name="email" size="15" id="email" class="form-control" placeholder="Fecha de ingreso">
                            </div>

                            <div style="margin-bottom: 25px" class="input-group">
                                <input type="password" name="pass" size="15" id="pass" class="form-control"  placeholder="Fecha de salida">                                
                            </div>
                            <div style="margin-top:10px" class="form-group">
                                <!-- Button -->

                                <div class="col-sm-12 controls">
                                    <input type="submit" name="btnConsultar" class="btn btn-success" value="Consultar">
                                </div>
                            </div>
                        </form> 
                    </div>                     
                </div>  
            </div>
        </div>  
    </div>
</body>
</html>
