
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
            
            
            <div class="center_body_division">
                <%@include file="MenuBar.jsp" %>
                
                 <br/> <br/> <br/>
                 
                 <h3 style="font-size: 25px; color: #0b965b; float: left; margin-top: 50px; margin-left: 50px;"> Add Movies </h3>
                <div class="updated_status_division">
                    <form action="AddMyMovies" method="post">
                        <input type="text" name="my_movie" placeholder="Enter Your Movies...." class="add_books_movies_serials_textfield" /> <br/> <br/>
                        <input type="submit" value="Add Movie" class="all_simple_button" />
                    </form>
                    </div>
                 
                 <h3 style="font-size: 25px; color: #0b965b; float: left; margin-top: 50px; margin-left: 50px;"> My Movie </h3>
                
                 
                 <%
            String movie_name=null;
            String date=null;
            String time=null;
                try
                {
                    Connection con=DbConnection.getConnect();
                    PreparedStatement ps=con.prepareStatement("select * from GT_ADD_MOVIES where EMAIL='"+uemail+"' order by DATE1 desc,TIME1 desc");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                        movie_name=rs.getString("MOVIE_NAME");
                        date=rs.getString("DATE1");
                        time=rs.getString("TIME1");
                       
            %>
                 
                <div class="updated_status_division">
                    <b style="font-size: 16px; color: #333;"> Movie Name : </b>
                    <span style="font-size: 14px; color: #747373; font-weight: bold;">
                        <%= movie_name %>
                    </span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                        (<%= time %>)
                    </span> 
                        <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                        (<%= date %>)
                    </span>  &nbsp;&nbsp; 
                    <br/> <br/>
                    <form action="DeleteMyMovies" method="post">
                        <input type="hidden" name="dateee" value="<%= date %>" />
                        <input type="hidden" name="timeee" value="<%= time %>" />
                        <input type="submit" value="Delete" />
                    </form>
                    
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
            
          <%@include file="RightDivision.jsp" %>
            
        </div>
    </body>
</html>