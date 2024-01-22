

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
                    <div class="updated_profile_pic_division">
                        <img src="uploads/<%= uprofile_pic%>" height="250px" width="250px" style="border-radius: 10px;" /> <br/> <br/>
                        <form action="ChangeProfilePic" method="post" enctype="multipart/form-data">
                            <input type="file" name="browse1" /> 
                            <input type="submit" value="Upload Profile Pic" />
                        </form>
                    </div>

                </div>
            </div>



            <%@include file="RightDivision.jsp" %>

        </div>
    </body>
</html>