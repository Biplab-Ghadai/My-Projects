
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
                 
                 <h3 style="font-size: 25px; color: #0b965b; float: left; margin-top: 50px; margin-left: 50px;"> Profile Pics </h3>
                 
                 
                <%
            String imagess=null;
            String date=null;
            String time=null;
                try
                {
                    Connection con=DbConnection.getConnect();
                    PreparedStatement ps=con.prepareStatement("select * from GT_ALL_PROFILE_PICS where EMAIL='"+uemail+"' order by DATE1 desc,TIME1 desc");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                        imagess=rs.getString("PROFILE_PIC");
                        date=rs.getString("DATE1");
                        time=rs.getString("TIME1");
                       
            %>
                 
                <div class="updated_status_image_division">
                    <span style="font-size: 14px; color: #565555; font-weight: bold"> Updated On : </span>
                    <span style="font-size: 12px; color: #acacac;"> <%= time %> &nbsp;&nbsp;&nbsp;&nbsp; <%= date %> <br/> <br/> </span>
                    
                    <img src="uploads/<%= imagess %>" height="250px" width="250px"  style="border-radius: 5px;"/>
                    
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
            
            <h3 style="font-size: 25px; color: #0b965b; float: left; margin-top: 50px; margin-left: 50px;"> Status Images </h3>
                <br/> <br/> <br/> <br/>
                 
                 <%
            String imagess1=null;
            String date1=null;
            String time1=null;
                try
                {
                    Connection con=DbConnection.getConnect();
                    PreparedStatement ps=con.prepareStatement("select * from GT_STATUS_UPDATE where EMAIL='"+uemail+"' order by DATE1 desc,TIME1 desc");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                        imagess1=rs.getString("ATTACHMENT");
                        date1=rs.getString("DATE1");
                        time1=rs.getString("TIME1");
                       
                        if((!imagess1.equals("null")))
                        {
            %>
                 
                <div class="updated_status_image_division">
                    
                    <span style="font-size: 14px; color: #565555; font-weight: bold"> Updated On : </span>
                    <span style="font-size: 12px; color: #acacac;"> <%= time1 %> &nbsp;&nbsp;&nbsp;&nbsp; <%= date1 %> <br/> <br/> </span>
                    <img src="uploads/<%= imagess1 %>" height="250px" width="250px" style="border-radius: 5px;" />
                    
                </div>
                    
                    <%
                }
                else
                {
                %>
                &nbsp;
                    
                <%
                           }
                    }
                                       }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
            %>
                
            <div style="height: 5px; width: 700px; border-bottom: 2px dashed #d1d0d0; float: left; margin-top: 40px"> </div>
            
                            
                
            
            
            
        </div>
            
          <%@include file="RightDivision.jsp" %>
            
        </div>
    </body>
</html>