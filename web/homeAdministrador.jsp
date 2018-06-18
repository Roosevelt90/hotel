<%@page import="java.sql.ResultSet"%>
<%@page import="model.Reservaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">   		
        <script src="js/bootstrap.min.js"></script> 
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Administrador</title>
    </head>
    <body>
        <%
            Reservaciones reser = new Reservaciones();
            ResultSet rs = reser.getReservacionesPendientes();

        %>
        <div class="container">    
            <div  style="margin-top:30px;" class="mainbox col-md-12 text-center">                    
                <h2>Reservaciones</h2> 
            </div>
        </div>

        <div class="container">    
            <div  style="margin-top:30px;" class="mainbox col-md-8 text-center col-md-offset-2">                    
                <table class="table table-bordered table-striped" >
                    <thead>
                        <tr><th>Fecha de inicio</th><th>Fecha final</th>
                            <th>pin</th><th>valor</th><th>Confirmada</th><th>Acciones</th></tr>
                    </thead>
                    <tbody>
                        <% while (rs.next()) {
                                String id = rs.getString(1);
                                String fecha_hora_inicial = rs.getString(4);
                                String fecha_hora_fin = rs.getString(5);
                                String confirmada = rs.getString(6);
                                String pin = rs.getString(7);
                                String valor = rs.getString(8);
                        %>
                        <tr><td><%= fecha_hora_inicial%></td>
                            <td><%= fecha_hora_fin%></td>
                            <td><%= pin%></td>
                            <td><%= valor%></td>
                            <td><%= confirmada%></td>
                            <td>
                                <form id="loginform"  role="form" method="post">
                                    <input type="submit" name="btnConfirmar" class="btn btn-success" value="Enviar">
                                </form>
                                <%
                                    if (request.getParameter("btnConfirmar") != null) {
                                        reser.confirmar(id);
                                        response.sendRedirect("homeAdministrador.jsp");
                                    }
                                %>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>


    </body>
</html>
