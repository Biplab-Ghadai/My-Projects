

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <link rel="stylesheet" href="css/menubar.css" type="text/css" />
        
        <script src="js/jquery.min.js"></script>
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

                        <div class="edit_basic_information_division_heading">Click To Edit Basic Information</div>
                        <div class="edit_basic_information_division">
                            <form action="editBasicInfo" method="post">
                                Name : <input type="text" name="uname1" value="<%= uname%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                Gender : <input type="text" name="ugender1" value="<%= ugender%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                City : <input type="text" name="ucity1" value="<%= ucity%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                DOB : <input type="text" name="ubirthday1" value="<%= ubirthday%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                Interested In : <input type="text" name="uinterestedin1" value="<%= uinterested_in%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                Relationship : <input type="text" name="urelationship1" value="<%= urelationship%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                Hobbies : <input type="text" name="uhobbies1" value="<%= uhobbies%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                <input type="submit" value="Update Basic Information" />
                            </form>
                        </div> <br/> <br/>

                        <div class="edit_contact_information_division_heading">Click To Edit Contact Information</div>
                        <div class="edit_contact_information_division">
                            <form action="editContactInfo" method="post">
                                Phone Number : <input type="text" name="uphoneno1" value="<%= uphone_no%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                Address : <input type="text" name="uaddress1" value="<%= uaddress%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                <input type="submit" value="Update Basic Information" />
                            </form>
                        </div> <br/> <br/>

                        <div class="edit_work_information_division_heading">Click To Edit Work And Education Information</div>
                        <div class="edit_work_information_division">
                            <form action="editWorkInfo" method="post">
                                College : <input type="text" name="ucollege1" value="<%= ucollege%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                Trade : <input type="text" name="utrade1" value="<%= utrade%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                Company : <input type="text" name="ucompany1" value="<%= ucompany%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                Position : <input type="text" name="uposition1" value="<%= uposition%>" class="below_toggle_division_textfield"/> <br/> <br/>
                                <input type="submit" value="Update Basic Information" />
                            </form>
                        </div> <br/> <br/>

                    </div>

                </div>
            </div>



            <%@include file="RightDivision.jsp" %>

        </div>
    </body>
</html>