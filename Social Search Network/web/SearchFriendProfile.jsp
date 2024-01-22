
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
        <link rel="stylesheet" href="css/leftHeaderStyle.css" type="text/css" />
    </head>

    <%
        String search_friend_name = (String) session.getAttribute("session_search_friend_name");
        String search_friend_profile_pic = (String) session.getAttribute("session_search_friend_profile_pic");
        String search_friend_gender = (String) session.getAttribute("session_search_friend_gender");
        String search_friend_city = (String) session.getAttribute("session_search_friend_city");
        String search_friend_birthday = (String) session.getAttribute("session_search_friend_birthday");
        String search_friend_email = (String) session.getAttribute("session_search_friend_email");
        String search_friend_theme = (String) session.getAttribute("session_search_friend_theme");
        String search_friend_interested_in = (String) session.getAttribute("session_search_friend_interested_in");
        String search_friend_relationship = (String) session.getAttribute("session_search_friend_relationship");
        String search_friend_hobbies = (String) session.getAttribute("session_search_friend_hobbies");
        String search_friend_phone_no = (String) session.getAttribute("session_search_friend_phone_no");
        String search_friend_address = (String) session.getAttribute("session_search_friend_address");
        String search_friend_college = (String) session.getAttribute("session_search_friend_college");
        String search_friend_trade = (String) session.getAttribute("session_search_friend_trade");
        String search_friend_company = (String) session.getAttribute("session_search_friend_company");
        String search_friend_position = (String) session.getAttribute("session_search_friend_position");
    %>

    <body style="background-color: <%= search_friend_theme%>">

        <%@include file="header.jsp" %> %>

        <div class="body_main_division">
            <div class="body_top_division">

            </div>


            <div class="body_left_division">

                <a href="SearchFriendProfile.jsp" class="updated_status_user_name">
                    <span class="profile_name_style"> <%= search_friend_name%> </span>
                    <div class="profile_pic_division">
                        <img src="uploads/<%= search_friend_profile_pic%>" height="150px" width="150px" style="border-radius: 5px;" />
                    </div>
                </a>


                <div class="left_head_add_interests_division">



                    <table>
                        <tr>
                            <td>
                                <%

                                    String status = "seen";
                                    String status55 = "not_seen";
                                    String status22 = null;
                                    String date12 = null;
                                    String time12 = null;
                                    try {
                                        Connection con = DbConnection.getConnect();
                                        PreparedStatement ps = con.prepareStatement("select * from GT_FOLLOWING where KISKO_EMAIL='" + search_friend_email + "'");
                                        ResultSet rs = ps.executeQuery();
                                        while (rs.next()) {
                                            status22 = rs.getString("STATUS");
                                            date12 = rs.getString("DATE1");
                                            time12 = rs.getString("TIME1");
                                        }
                                        
                                        if (status22.equals(status) || status22.equals(status55)) {
                                %>
                                <form action="Unfollow" method="post">
                                    <h3> Following </h3> <br/>
                                    <input type="hidden" name="date12" value="<%= date12%>" />
                                    <input type="hidden" name="time12" value="<%= time12%>" />
                                    <input type="submit" value="Unfollow" />
                                </form>
                                <%
                                } else if(status22.equals("null") || status22==null) {
                                %>

                                

                                <%                                                                }
                                    } catch (Exception e) {
                                        //out.print("Exception is : "+e);%>
                                        
                                <form action="Follow" method="post">
                                    <input type="submit" value="Follow" />
                                </form>
                                        
                                <%
                                    }
                                %>
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

                <div class="user_details_division">
                    <span class="profile_details_div">
                        <aa class="user_details_heading"> Basic Information </aa>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br/> <br/>
                        <b> Name : </b> <%= search_friend_name%> <br/> <br/>
                        <b> Gender : </b> <%= search_friend_gender%> <br/> <br/>
                        <b> City : </b> <%= search_friend_city%> <br/> <br/>
                        <b> DOB : </b> <%= search_friend_birthday%> <br/> <br/>
                        <b> Interested In : </b> <%= search_friend_interested_in%> <br/> <br/>
                        <b> Relationship : </b> <%= search_friend_relationship%> <br/> <br/>
                        <b> Hobbies : </b> <%= search_friend_hobbies%> <br/> <br/>
                    </span>
                    <span class="profile_contact_details_div">
                        <aa class="user_details_heading"> Contact Information </aa>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br/> <br/>
                        <b> Phone Number : </b> <%= search_friend_phone_no%> <br/> <br/>
                        <b> Address : </b> <%= search_friend_address%> <br/> <br/>
                    </span>
                    <span class="profile_contact_details_div">
                        <aa class="user_details_heading"> Work & Education </aa>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br/> <br/>
                        <b> College : </b> <%= search_friend_college%> <br/> <br/>
                        <b> Trade : </b> <%= search_friend_trade%> <br/> <br/>
                        <b> Company : </b> <%= search_friend_company%> <br/> <br/>
                        <b> Position : </b> <%= search_friend_position%> <br/> <br/>
                    </span>
                </div>




                <div class="main_updated_status_division">

                    <%                        String date11 = null;
                        String time11 = null;
                        String status11 = null;
                        String pic11 = null;
                        String pic_upload = null;


                        try {
                            Connection con = DbConnection.getConnect();
                            PreparedStatement ps = con.prepareStatement("select * from GT_STATUS_UPDATE where EMAIL='" + search_friend_email + "' order by DATE1 asc,TIME1 asc");
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                date11 = rs.getString("DATE1");
                                time11 = rs.getString("TIME1");
                                status11 = rs.getString("STATUS");
                                pic11 = rs.getString("ATTACHMENT");
                                pic_upload = "uploads/" + pic11;


                                if ((!status11.equals("null")) && (!pic11.equals("null"))) {
                    %>

                    <form action="DeleteStatus" method="post">
                        <div class="updated_status_division">
                            <a href="SearchFriendProfile.jsp" class="updated_status_user_name">
                                <img src="uploads/<%= search_friend_profile_pic%>" height="50px" width="50px" style="border-radius: 3px; float: left" />
                                &nbsp;&nbsp;&nbsp;
                                <%= search_friend_name%> <br/>
                            </a>
                            <span class="updated_status_user_time"> <%= time11%> &nbsp;&nbsp;&nbsp;&nbsp; <%= date11%> </span> <br/> <br/>

                            <span class="updated_status_user_status">
                                <%= status11%> <br/> <br/>
                                <img src="<%= pic_upload%>" height="250px" width="250px" style="border-radius: 3px; float: left" /> <br/> <br/>
                            </span>
                            <div class="main_updated_status_bottom_division">
                                <input type="hidden" name="datee" value="<%= date11%>" />
                                <input type="hidden" name="timee" value="<%= time11%>" />
                                <input type="submit" name="delete_status" value="Delete Status" class="status_delete_button" />
                            </div>
                        </div>
                    </form>

                    <%
                    } else if (!status11.equals("null") && pic11.equals("null")) {
                    %>

                    <div class="updated_status_division">
                        <a href="profile.jsp" class="updated_status_user_name">
                            <img src="uploads/<%= search_friend_profile_pic%>" height="50px" width="50px" style="border-radius: 3px; float: left" />
                            &nbsp;&nbsp;&nbsp;
                            <%= search_friend_name%> <br/>
                        </a>
                        <span class="updated_status_user_time"> <%= time11%> &nbsp;&nbsp;&nbsp;&nbsp; <%= date11%> </span> <br/> <br/>

                        <span class="updated_status_user_status">
                            <%= status11%>
                        </span>
                        <div class="main_updated_status_bottom_division">
                            <input type="submit" name="delete_status" value="Delete Status" class="status_delete_button" />
                        </div>
                    </div>

                    <%
                    } else if (status11.equals("null") && !pic11.equals("null")) {
                    %> 

                    <div class="updated_status_division">
                        <a href="profile.jsp" class="updated_status_user_name">
                            <img src="uploads/<%= search_friend_profile_pic%>" height="50px" width="50px" style="border-radius: 3px; float: left" />
                            &nbsp;&nbsp;&nbsp;
                            <%= search_friend_name%> <br/>
                        </a>
                        <span class="updated_status_user_time"> <%= time11%> &nbsp;&nbsp;&nbsp;&nbsp; <%= date11%> </span> <br/> <br/>

                        <span class="updated_status_user_status">

                            <img src="<%= pic_upload%>" height="250px" width="250px" style="border-radius: 3px; float: left" /> <br/> <br/>
                        </span>
                        <div class="main_updated_status_bottom_division">
                            <input type="submit" name="delete_status" value="Delete Status" class="status_delete_button" />
                        </div>
                    </div>

                    <%
                                }
                            }
                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>
                </div>

            </div>

            <%@include file="RightDivision.jsp" %>

        </div>
    </body>
</html>