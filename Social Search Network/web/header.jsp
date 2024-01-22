

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
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
    </head>
    
    <%
        String utheme=(String)session.getAttribute("session_utheme");
        String uname=(String)session.getAttribute("session_uname");
        String ugender=(String)session.getAttribute("session_ugender");
        String ucity=(String)session.getAttribute("session_ucity");
        String ubirthday=(String)session.getAttribute("session_ubirthday");
        String uemail=(String)session.getAttribute("session_uemail");
        String uprofile_pic=(String)session.getAttribute("session_uprofile_pic");

        String uinterested_in=(String)session.getAttribute("session_uinterested_in");
        String urelationship=(String)session.getAttribute("session_urelationship");
        String uhobbies=(String)session.getAttribute("session_uhobbies");
        String uphone_no=(String)session.getAttribute("session_uphone_no");
        String uaddress=(String)session.getAttribute("session_uaddress");
        String ucollege=(String)session.getAttribute("session_ucollege");
        String utrade=(String)session.getAttribute("session_utrade");
        String ucompany=(String)session.getAttribute("session_ucompany");
        String uposition=(String)session.getAttribute("session_uposition");
    %>
    
    <body style="background-color: <%= utheme %>">
        
        <%
        
        int message_noification=0;
            
            String status222="not_seen";
            
            try
            {
                Connection con=DbConnection.getConnect();
                PreparedStatement ps=con.prepareStatement("select count(*) from GT_MESSAGES where KISKO_BHEJA_EMAIL='"+uemail+"' and STATUS='"+status222+"' ");
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    message_noification=rs.getInt(1);
                }
                       
            }
            catch(Exception e)
            {
                out.print("exception is : ............. "+e);
            }
        
        %>
        
        <%
        
        int follow_noification=0;
            
            String status333="not_seen";
            
            try
            {
                Connection con=DbConnection.getConnect();
                PreparedStatement ps=con.prepareStatement("select count(*) from GT_FOLLOWING where KISKO_EMAIL='"+uemail+"' and STATUS='"+status333+"' ");
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    follow_noification=rs.getInt(1);
                }
                       
            }
            catch(Exception e)
            {
                out.print("exception is : ............. "+e);
            }
        
        %>
        
        <div class="header_main_div">
            <div class="inner_header">
                <div class="logo_division">
                    <div id="letterpress">
                        <a href="about.jsp" class="logo_href"> <h1> Social Network! </h1> </a> <br/>
                    </div>
                </div>
                
                <div class="header_middle_division">
                    <form action="SearchFriendResult.jsp" method="post">
                        <div class="field">
                            <input type="text" name="search_friend" placeholder="Search...." />
                            <input type="submit" value="" class="header_search_button" />
                        </div>
                    </form>
                    
                </div>
                
                <div>
                    <a href="MyCircle.jsp">
                        <img src="images/friend.png" height="30px" style="float: left; margin-left: 25px; margin-top: 25px; opacity: .5" />
                        <span class="notifications_number"> <%= follow_noification %> </span>
                    </a>
                    <a href="MyMessages.jsp">
                        <img src="images/message.png" height="40px" style="float: left; margin-left: 35px; margin-top: 25px; opacity: .5" />
                        <span class="notifications_number"> <%= message_noification %> </span>
                    </a>
                    <a href="Logout" class="logout_href"> Logout </a>
                </div>
                
            </div>
        </div>
        
    </body>
</html>
