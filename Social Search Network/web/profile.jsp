
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
                
                <div class="user_details_division">
                    <span class="profile_details_div">
                        <aa class="user_details_heading"> Basic Information </aa>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="editDetails.jsp" class="user_details_edit_href"> ( Edit )</a> <br/> <br/>
                        <b> Name : </b> <%= uname %> <br/> <br/>
                        <b> Gender : </b> <%= ugender %> <br/> <br/>
                        <b> City : </b> <%= ucity %> <br/> <br/>
                        <b> DOB : </b> <%= ubirthday %> <br/> <br/>
                        <b> Interested In : </b> <%= uinterested_in %> <br/> <br/>
                        <b> Relationship : </b> <%= urelationship %> <br/> <br/>
                        <b> Hobbies : </b> <%= uhobbies %> <br/> <br/>
                    </span>
                    <span class="profile_contact_details_div">
                        <aa class="user_details_heading"> Contact Information </aa>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="editDetails.jsp" class="user_details_edit_href"> ( Edit )</a> <br/> <br/>
                        <b> Phone Number : </b> <%= uphone_no %> <br/> <br/>
                        <b> Address : </b> <%= uaddress %> <br/> <br/>
                    </span>
                    <span class="profile_contact_details_div">
                        <aa class="user_details_heading"> Work & Education </aa>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="editDetails.jsp" class="user_details_edit_href"> ( Edit )</a> <br/> <br/>
                        <b> College : </b> <%= ucollege %> <br/> <br/>
                        <b> Trade : </b> <%= utrade %> <br/> <br/>
                        <b> Company : </b> <%= ucompany %> <br/> <br/>
                        <b> Position : </b> <%= uposition %> <br/> <br/>
                    </span>
                </div>
                
                <div class="main_status_update_division">
                    <div class="status_update_textarea_division">
                        <h4> Update Your Status Here....</h4>
                        <form action="UpdateStatus" method="post" enctype="multipart/form-data">
                            <textarea name="status1" class="status_update_textarea" placeholder="Whats In Your Mind....."></textarea> <br/>
                            <input type="file" name="browse1" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="submit" name="status_update" value="Update" class="circ-button" /> <br/> <br/>
                        </form>
                    </div>
                </div>

                
                    
                    
                <div class="main_updated_status_division">
                    
                    <%
            String date11=null;
            String time11=null;
            String status11=null;
            String pic11=null;
            String pic_upload=null;
                try
                {
                    Connection con=DbConnection.getConnect();
                    PreparedStatement ps=con.prepareStatement("select * from GT_STATUS_UPDATE where EMAIL='"+uemail+"' order by DATE1 desc,TIME1 desc");
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
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
                            <img src="uploads/<%= uprofile_pic %>" height="50px" width="50px" style="border-radius: 3px; float: left" />
                            &nbsp;&nbsp;&nbsp;
                            <%= uname %> <br/>
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
                    
                <form action="DeleteStatus" method="post">
                    <div class="updated_status_division">
                        <a href="profile.jsp" class="updated_status_user_name">
                            <img src="uploads/<%= uprofile_pic %>" height="50px" width="50px" style="border-radius: 3px; float: left" />
                            &nbsp;&nbsp;&nbsp;
                            <%= uname %> <br/>
                        </a>
                        <span class="updated_status_user_time"> <%= time11 %> &nbsp;&nbsp;&nbsp;&nbsp; <%= date11 %> </span> <br/> <br/>

                        <span class="updated_status_user_status">
                            <%= status11 %>
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
                else if((status11.equals("null")) && (!pic11.equals("null")))
                {
                %> 
                
                <form action="DeleteStatus" method="post">
                <div class="updated_status_division">
                        <a href="profile.jsp" class="updated_status_user_name">
                            <img src="uploads/<%= uprofile_pic %>" height="50px" width="50px" style="border-radius: 3px; float: left" />
                            &nbsp;&nbsp;&nbsp;
                            <%= uname %> <br/>
                        </a>
                        <span class="updated_status_user_time"> <%= time11 %> &nbsp;&nbsp;&nbsp;&nbsp; <%= date11 %> </span> <br/> <br/>

                        <span class="updated_status_user_status">
                            
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