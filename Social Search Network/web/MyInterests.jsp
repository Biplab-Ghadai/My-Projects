
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
                </div>
                
                 <br/> <br/> <br/>
                 
                 <h3 style="font-size: 25px; color: #0b965b; float: left; margin-top: 50px; margin-left: 50px;"> My Books </h3>
                <%
            String book_name=null;
            String date=null;
            String time=null;
                try
                {
                    Connection con=DbConnection.getConnect();
                    PreparedStatement ps=con.prepareStatement("select * from GT_ADD_BOOKS where EMAIL='"+uemail+"' order by DATE1 desc,TIME1 desc");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                        book_name=rs.getString("BOOK_NAME");
                        date=rs.getString("DATE1");
                        time=rs.getString("TIME1");
                       
            %>
                 
                <div class="updated_status_division">
                    <b style="font-size: 16px; color: #333;"> Book Name : </b>
                    <span style="font-size: 14px; color: #747373; font-weight: bold;">
                        <%= book_name %>
                    </span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                        (<%= time %>)
                    </span> 
                        <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                        (<%= date %>)
                    </span>  &nbsp;&nbsp; 
                    <br/> <br/>
                    <form action="DeleteMyBooks" method="post">
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
            
            <div style="height: 5px; width: 700px; border-bottom: 2px dashed #d1d0d0; float: left; margin-top: 40px"> </div>
            
            <h3 style="font-size: 25px; color: #0b965b; float: left; margin-top: 50px; margin-left: 50px;"> My Movie </h3>
                
                 
                 <%
            String movie_name=null;
            String date1=null;
            String time1=null;
                try
                {
                    Connection con=DbConnection.getConnect();
                    PreparedStatement ps=con.prepareStatement("select * from GT_ADD_MOVIES where EMAIL='"+uemail+"' order by DATE1 desc,TIME1 desc");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                        movie_name=rs.getString("MOVIE_NAME");
                        date1=rs.getString("DATE1");
                        time1=rs.getString("TIME1");
                       
            %>
                 
                <div class="updated_status_division">
                    <b style="font-size: 16px; color: #333;"> Movie Name : </b>
                    <span style="font-size: 14px; color: #747373; font-weight: bold;">
                        <%= movie_name %>
                    </span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                        (<%= time1 %>)
                    </span> 
                        <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                        (<%= date1 %>)
                    </span>  &nbsp;&nbsp; 
                    <br/> <br/>
                    <form action="DeleteMyMovies" method="post">
                        <input type="hidden" name="dateee" value="<%= date1 %>" />
                        <input type="hidden" name="timeee" value="<%= time1 %>" />
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
                
            <div style="height: 5px; width: 700px; border-bottom: 2px dashed #d1d0d0; float: left; margin-top: 40px"> </div>
            
            <h3 style="font-size: 25px; color: #0b965b; float: left; margin-top: 50px; margin-left: 50px;"> My TV Serials </h3>
                
                 
                 
                 <%
            String tv_serial_name=null;
            String date2=null;
            String time2=null;
                try
                {
                    Connection con=DbConnection.getConnect();
                    PreparedStatement ps=con.prepareStatement("select * from GT_ADD_TV_SERIALS where EMAIL='"+uemail+"' order by DATE1 desc,TIME1 desc");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                        tv_serial_name=rs.getString("TV_SERIAL_NAME");
                        date2=rs.getString("DATE1");
                        time2=rs.getString("TIME1");
                       
            %>
                 
                <div class="updated_status_division">
                    <b style="font-size: 16px; color: #333;"> Book Name : </b>
                    <span style="font-size: 14px; color: #747373; font-weight: bold;">
                        <%= tv_serial_name %>
                    </span> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                        (<%= time2 %>)
                    </span> 
                        <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                        (<%= date2 %>)
                    </span>  &nbsp;&nbsp; 
                    <br/> <br/>
                    <form action="DeleteMyTvSerial" method="post">
                        <input type="hidden" name="dateee" value="<%= date2 %>" />
                        <input type="hidden" name="timeee" value="<%= time2 %>" />
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