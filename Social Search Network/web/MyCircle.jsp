
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





                <div class="main_updated_status_division">


                    <div class="updated_status_division">
                        <form action="seeFollower" method="post">
                            <h3> You have recently got <%= follow_noification%> Followers....</h3> <br/>
                            <input type="submit" value="Click To See Followers" />
                        </form>
                    </div>

                    <div class="updated_status_division">
                        <h3> You Are Following These People</h3> <br/>
                        <form action="MyFollowing.jsp" method="post">
                            <input type="submit" value="Click To See My Following" />
                        </form>
                        
                    </div>
                </div>
            </div>

                <%@include file="RightDivision.jsp" %>

            </div>
    </body>
</html>