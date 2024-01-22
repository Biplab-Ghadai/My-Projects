
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

    </head>

    <body>

        <div class="menubar_main_div">
            <div class="menubar">
                <ul class="nav">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="profile.jsp">Profile</a>
                        <ul class="subs">
                            <li><a href="editDetails.jsp">Edit Details</a></li>
                            <li><a href="changeProfilePic.jsp">Change Profile Pic</a></li>
                            <li><a href="changeTheme.jsp">Change Theme</a></li>
                        </ul>
                    </li>
                    <li><a href="photos.jsp">Photos</a></li>
                    <li><a href="MyCircle.jsp">My Circle</a></li>
                    <li><a href="games.jsp">Games</a></li>
                    <li><a href="settings.jsp">Settings</a></li>
                </ul>
                <div style="clear:both"></div>
            </div>
        </div>
    </body>
</html>