
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <link rel="stylesheet" href="css/menubar.css" type="text/css" />
        <script> 
            $(document).ready(function(){
                $(".edit_basic_information_division_heading").click(function(){
                    $(".edit_basic_information_division").slideToggle("slow");
                });
            });
        </script>

        <script> 
            $(document).ready(function(){
                $(".edit_contact_information_division_heading").click(function(){
                    $(".edit_contact_information_division").slideToggle("slow");
                });
            });
        </script>

        <script> 
            $(document).ready(function(){
                $(".edit_work_information_division_heading").click(function(){
                    $(".edit_work_information_division").slideToggle("slow");
                });
            });
        </script>

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

                        <h2> About GOTDAT! </h2>

                    </div>
                </div>

            </div>



            <%@include file="RightDivision.jsp" %>

        </div>
    </body>
</html>