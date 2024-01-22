
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <link rel="stylesheet" href="css/menubar.css" type="text/css" />
    </head>

    <%@include file="header.jsp" %>

    <body style="background-color: <%= utheme%>">

        <div class="body_main_division">
            <div class="body_top_division">

            </div>


            <div class="body_left_division">
                <%@include file="leftHeader.jsp" %>
            </div>


            <div class="center_body_division">
                <%@include file="MenuBar.jsp" %>


                <br/> <br/> <br/>

                <h3 style="font-size: 25px; color: #0b965b; float: left; margin-top: 50px; margin-left: 50px;"> Delete Your Account </h3>

                <div class="updated_status_division">
                    <form action="DeleteMyAccount" method="post">
                        <input type="submit" value="Delete Your Account" />
                    </form>

                </div>

            </div>

            <%@include file="RightDivision.jsp" %>

        </div>
    </body>
</html>