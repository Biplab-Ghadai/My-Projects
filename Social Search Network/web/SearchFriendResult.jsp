
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
    
    <body style="background-color: <%= utheme %>">
        
        <div class="body_main_division">
            
            <div class="body_top_division">
                
            </div>
            
            <div class="body_left_division">
                <%@include file="leftHeader.jsp" %>
            </div>
            
            
            <div class="center_body_division"">
                <%@include file="MenuBar.jsp" %>

                
                    
                    
                <div class="main_updated_status_division">
                    
                    <%
                    
                String search_friend_email=request.getParameter("search_friend");
                String sname11=null;
                String semail11=null;
                String sgender11=null;
                String sprofile_pic11=null;
                String spic_upload=null;
                try
                {
                    Connection con=DbConnection.getConnect();
                    PreparedStatement ps=con.prepareStatement("select * from GT_REGISTER where EMAIL LIKE '%"+search_friend_email+"%' or NAME LIKE '%"+search_friend_email+"%' ");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                        sname11=rs.getString("NAME");
                        semail11=rs.getString("EMAIL");
                        sgender11=rs.getString("GENDER");
                        sprofile_pic11=rs.getString("PROFILE_PIC");
                        spic_upload="uploads/"+sprofile_pic11;
                    }   
                        if(semail11!=null || semail11!=null)
                        {
            %>
            
            
            <form action="DeleteStatus" method="post">
                    <div class="updated_status_division">
                        <a href="searchFriend?ID=<%= semail11 %>" class="updated_status_user_name">
                            <img src="uploads/<%= sprofile_pic11 %>" height="100px" width="100px" style="border-radius: 3px; float: left" />
                            &nbsp;&nbsp;&nbsp;
                            &nbsp;<b> EMAIL ID : </b> <%= semail11 %> <br/>
                        </a> <br/>
                        
                        &nbsp;&nbsp;&nbsp;<b class="updated_status_user_name"> NAME : </b>
                        <span style="font-size: 13px; font-weight: bold;"> <%= sname11 %> </span> <br/> <br/>
                        &nbsp;&nbsp;&nbsp;<b class="updated_status_user_name"> GENDER : </b>
                        <span style="font-size: 13px; font-weight: bold;"> <%= sgender11 %> </span> <br/>
                            
                    </div>
                        </form>
                        
                        
                        <%
                                               
                            } 
                        else
                        {
    %>
                
                        <div class="updated_status_division"> <br/> <br/>
                            <h2> No Results Found </h2>
                            <br/>
                            <br/>
                        </div>

<%
                           }
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
            %>
            </div>

        </div>
            
          <%@include file="RightDivision.jsp" %>
            
        </div>
    </body>
</html>