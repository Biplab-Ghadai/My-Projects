
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

    <body style="background-color: <%= utheme%>">


        <div class="body_main_division">
            <div class="body_top_division">

            </div>


            <div class="body_left_division">
                <%@include file="leftHeader.jsp" %>
            </div>


            <div class="center_body_division">
                <%@include file="MenuBar.jsp" %>


                <div class="main_updated_status_division">

                    <form action="SendMessage" method="post">
                        <div class="updated_status_division">
                            <b> From : </b> <%= uname%> <br/> <br/>
                            <b> To : </b> <input type="text" name="send_message" placeholder="Email id...." class="below_toggle_division_textfield" /> <br/> <br/>
                            <textarea name="send_message" placeholder="Message........." class="send_message_textarea" ></textarea> <br/> <br/>
                            <input type="submit" value="Send Message" />
                        </div>
                    </form>


                    <div class="updated_status_division">
                        <form action="seeInbox" method="post">
                            <h3> You have got <%= message_noification%> Messages....</h3> <br/>
                            <input type="submit" value="Click To See Inbox" />
                        </form>
                    </div>

                    <div class="updated_status_division">
                        <h3> Your Sent Messages....</h3> <br/>
                        <input type="submit" value="Click To See Sent Messages" />
                    </div>
                </div>
            </div>

                <%@include file="RightDivision.jsp" %>

            </div>
    </body>
</html>