
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
        <link rel="stylesheet" href="css/leftHeaderStyle.css" type="text/css" />
    </head>
    
    <%
        String search_friend_name=(String)session.getAttribute("session_search_friend_name");
        String search_friend_profile_pic=(String)session.getAttribute("session_search_friend_profile_pic");
        String search_friend_gender=(String)session.getAttribute("session_search_friend_gender");
        String search_friend_city=(String)session.getAttribute("session_search_friend_city");
        String search_friend_birthday=(String)session.getAttribute("session_search_friend_birthday");
        String search_friend_email=(String)session.getAttribute("session_search_friend_email");
        String search_friend_theme=(String)session.getAttribute("session_search_friend_theme");
        String search_friend_interested_in=(String)session.getAttribute("session_search_friend_interested_in");
        String search_friend_relationship=(String)session.getAttribute("session_search_friend_relationship");
        String search_friend_hobbies=(String)session.getAttribute("session_search_friend_hobbies");
        String search_friend_phone_no=(String)session.getAttribute("session_search_friend_phone_no");
        String search_friend_address=(String)session.getAttribute("session_search_friend_address");
        String search_friend_college=(String)session.getAttribute("session_search_friend_college");
        String search_friend_trade=(String)session.getAttribute("session_search_friend_trade");
        String search_friend_company=(String)session.getAttribute("session_search_friend_company");
        String search_friend_position=(String)session.getAttribute("session_search_friend_position");
    %>
    
    <body style="background-color: <%= search_friend_theme %>">
        
        <%@include file="header.jsp" %> %>
        
    <div class="body_main_division">
            <div class="body_top_division">
                
            </div>
            
            
            <div class="body_left_division">
                
                
            <a href="SearchFriendProfile.jsp" class="updated_status_user_name">
                    <span class="profile_name_style"> <%= search_friend_name %> </span>
                    <div class="profile_pic_division">
                        <img src="uploads/<%= search_friend_profile_pic %>" height="150px" width="150px" style="border-radius: 5px;" />
                    </div>
                </a>
           
            <div class="left_head_add_interests_division">
            
            
            <table>
                <tr>
                    <td>
                        <form action="Follow" method="post">
                            <input type="submit" value="Follow" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td> &nbsp; </td>
                    <td> &nbsp; </td>
                </tr>
                <tr>
                    <td>
                        <form action="sendMessage.jsp" method="post">
                            <input type="submit" value="Send Message" />
                        </form>
                    </td>
                </tr>
            </table>
            </div>
                
            </div>
            
            
            <div class="center_body_division">
                <%@include file="MenuBar.jsp" %>
                
                <form action="SendMessage" method="post">
                    <div class="main_updated_status_division">
                        <div class="updated_status_division">
                            <b> From : </b> <%= uname %> <br/> <br/>
                            <b> To : </b> <%= search_friend_name %> <br/> <br/>
                            <input type="hidden" name="search_email" value="<%=search_friend_email%>" />
                            <input type="hidden" name="search_name" value="<%=search_friend_name%>" />
                            <input type="hidden" name="search_profile_pic" value="<%=search_friend_profile_pic%>" />
                            <textarea name="send_message" placeholder="Message........." class="send_message_textarea" ></textarea> <br/> <br/>
                            <input type="submit" value="Send Message" />
                        </div>
                    </div>
                </form>
                

        </div>
            
          <%@include file="RightDivision.jsp" %>
            
        </div>
    </body>
</html>