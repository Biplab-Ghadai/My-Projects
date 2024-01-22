
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
                    
                    
                <div class="main_updated_status_division">
                    
                    <%
                    String name11=null;
                    String profile_pic11=null;
            String date11=null;
            String time11=null;
            String status11=null;
            String pic11=null;
            String pic_upload=null;
                try
                {
                    Connection con=DbConnection.getConnect();
                    PreparedStatement ps=con.prepareStatement("select * from GT_STATUS_UPDATE order by DATE1 desc,TIME1 desc");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                        name11=rs.getString("NAME");
                        profile_pic11=rs.getString("PROFILE_PIC");
                        date11=rs.getString("DATE1");
                        time11=rs.getString("TIME1");
                        status11=rs.getString("STATUS");
                        pic11=rs.getString("ATTACHMENT");
                        pic_upload="uploads/"+pic11;
                        
                        
                        if((!status11.equals("null")) && (!pic11.equals("null")))
                        {
            %>
            
            <form action="DeleteStatus" method="post">
                    <div class="updated_status_division">
                        <a href="profile.jsp" class="updated_status_user_name">
                            <img src="uploads/<%= profile_pic11 %>" height="50px" width="50px" style="border-radius: 3px; float: left" />
                            &nbsp;&nbsp;&nbsp;
                            <%= name11 %> <br/>
                        </a>
                            <span class="updated_status_user_time"> <%= time11 %> &nbsp;&nbsp;&nbsp;&nbsp; <%= date11 %> </span> <br/> <br/>

                        <span class="updated_status_user_status">
                            <%= status11 %> <br/> <br/>
                            <img src="<%= pic_upload %>" height="250px" width="250px" style="border-radius: 3px; float: left" /> <br/> <br/>
                        </span>
                        <div class="main_updated_status_bottom_division">
                            <input type="hidden" name="datee" value="<%= date11 %>" />
                            <input type="hidden" name="timee" value="<%= time11 %>" />
                            <input type="submit" name="delete_status" value="Delete Status" class="status_delete_button" />
                        </div>
                    </div>
                        </form>
                        
                        <%
                }
                else if(status11!=null && (pic11.equals("null")))
                {
                %>
                    
                    <div class="updated_status_division">
                        <a href="profile.jsp" class="updated_status_user_name">
                            <img src="uploads/<%= profile_pic11 %>" height="50px" width="50px" style="border-radius: 3px; float: left" />
                            &nbsp;&nbsp;&nbsp;
                            <%= name11 %> <br/>
                        </a>
                        <span class="updated_status_user_time"> <%= time11 %> &nbsp;&nbsp;&nbsp;&nbsp; <%= date11 %> </span> <br/> <br/>

                        <span class="updated_status_user_status">
                            <%= status11 %>
                         </span>
                        <div class="main_updated_status_bottom_division">
                            <input type="submit" name="delete_status" value="Delete Status" class="status_delete_button" />
                        </div>
                    </div>

                <%
                }
                else if((status11.equals("null")) && (!pic11.equals("null")))
                {
                %> 
                
                <div class="updated_status_division">
                        <a href="profile.jsp" class="updated_status_user_name">
                            <img src="uploads/<%= profile_pic11 %>" height="50px" width="50px" style="border-radius: 3px; float: left" />
                            &nbsp;&nbsp;&nbsp;
                            <%= name11 %> <br/>
                        </a>
                        <span class="updated_status_user_time"> <%= time11 %> &nbsp;&nbsp;&nbsp;&nbsp; <%= date11 %> </span> <br/> <br/>

                        <span class="updated_status_user_status">
                            
                            <img src="<%= pic_upload %>" height="250px" width="250px" style="border-radius: 3px; float: left" /> <br/> <br/>
                        </span>
                        <div class="main_updated_status_bottom_division">
                            <input type="submit" name="delete_status" value="Delete Status" class="status_delete_button" />
                        </div>
                    </div>
                        
                        <%
                                               }
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