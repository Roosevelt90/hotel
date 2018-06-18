<%-- 
    Document   : homeUsuario
    Created on : 18/06/2018, 12:13:25 PM
    Author     : Usuario1
--%>

<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Habitacion"%>
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
                                String email = session.getAttribute("user").toString();

                            %>
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"></span>
                                <input type="date" name="fechaInicial" size="15" id="fechaInicial" class="form-control" placeholder="Fecha de ingreso">
                            </div>

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"></span>
                                <input type="date" name="fechaFin" size="15" id="fechaFin" class="form-control"  placeholder="Fecha de salida">                                
                            </div>
                            <div style="margin-top:10px" class="form-group">
                                <div class="col-sm-12 controls">
                                    <input type="submit" name="btnConsultar" class="btn btn-success" value="Consultar">
                                    <input type="reset" name="btnConsultar" class="btn btn-success" value="Limpiar">
                                </div>
                            </div>
                        </form> 
                    </div>                     
                </div>  
            </div>
        </div>  

        <%            Habitacion habi = new Habitacion();
            HttpSession sesion = request.getSession();

//            if (request.getParameter("btnConsultar") != null) {
            String fechaInicial = request.getParameter("fechaInicial");
            String fechaFin = request.getParameter("fechaFin");
            sesion.setAttribute("fechaInicial", fechaInicial);
            sesion.setAttribute("fechaFin", fechaFin);
            String r;
            ResultSet rs = habi.getHabitacionesDisponibles(fechaInicial, fechaFin);
        %>

        <div class="container">    
            <div  style="margin-top:30px;" class="mainbox col-md-8 text-center col-md-offset-2">                    
                <table class="table table-bordered table-striped" >
                    <thead>
                        <tr><th>Numero de habitacion</th><th>Valor por dia</th>
                            <th>Fecha de ingreso</th><th>Fecha de salida</th></tr>
                    </thead>
                    <tbody>
                        <% while (rs.next()) {
                                String id = rs.getString(1);
                                String numero = rs.getString(2);
                                String valorDia = rs.getString(3);
                        %>
                        <tr><td><%= numero%></td>
                            <td><%= valorDia%></td>
                            <td><%= fechaInicial%></td>
                            <td><%= fechaFin%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="container">    
            <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
                <div class="panel panel-info" >

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                        <form  class="form-horizontal" role="form" method="post">

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"></span>
                                <input type="text" name="hab" size="15" id="hab" class="form-control" placeholder="Habitacion seleccionada">
                            </div>

                            <div style="margin-top:10px" class="form-group">
                                <div class="col-sm-12 controls">
                                    <input type="submit" name="btnReservar" class="btn btn-success" value="Reservar">
                                </div>
                            </div>
                        </form> 
                        <%
                            //fechaInicial = fechaInicial ;
                            if (request.getParameter("btnReservar") != null) {
                               String fechaInicial_2 = session.getAttribute("fechaInicial").toString();
                               String fechaFin_2 = session.getAttribute("fechaFin").toString();
                                String numeroHabitacion = request.getParameter("hab");
                                reser.reservar(numeroHabitacion, email, fechaInicial_2, fechaFin_2);
                            }
                        %>
                    </div>                     
                </div>  
            </div>
        </div>
        <% //       }%>

    </body>
</html>
