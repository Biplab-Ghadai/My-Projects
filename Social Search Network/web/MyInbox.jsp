
<%@page import="databasee.DbConnection"%>
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

                    <%
                        String name11 = null;
                        String profile_pic11 = null;
                        String date11 = null;
                        String time11 = null;
                        String status11 = null;
                        String pic11 = null;
                        String pic_upload = null;
                        String message = null;
                        try {
                            Connection con = DbConnection.getConnect();
                            PreparedStatement ps = con.prepareStatement("select * from GT_MESSAGES where KISKO_BHEJA_EMAIL='" + uemail + "' ");
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                name11 = rs.getString("KISNE_BHEJA_NAME");
                                profile_pic11 = rs.getString("KISNE_BHEJA_PROFILE_PIC");
                                pic_upload = "uploads/" + profile_pic11;
                                date11 = rs.getString("DATE1");
                                time11 = rs.getString("TIME1");
                                message = rs.getString("MESSAGE");
                    %>

                    
                    <form action="DeleteStatus" method="post">
                        <div class="updated_status_division">
                            <a href="profile.jsp" class="updated_status_user_name">
                                <img src="<%= pic_upload%>" height="50px" width="50px" style="border-radius: 3px; float: left" />
                                &nbsp;&nbsp;&nbsp;
                                <%= name11%> <br/>
                            </a>
                            <span class="updated_status_user_time"> <%= time11%> &nbsp;&nbsp;&nbsp;&nbsp; <%= date11%> </span> <br/> <br/>

                            <span class="updated_status_user_status">
                                <%= message %> <br/> <br/>
                            </span>
                            <div class="main_updated_status_bottom_division">
                                <input type="hidden" name="datee" value="<%= date11%>" />
                                <input type="hidden" name="timee" value="<%= time11%>" />
                                <input type="submit" name="delete_status" value="Delete Message" class="status_delete_button" />
                            </div>
                        </div>
                    </form>

                                
                                
                    <%
                                
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                </div>

            </div>

            <%@include file="RightDivision.jsp" %>

        </div>
    </body>
</html>