

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
                        <form action="ChangeTheme" method="post">
                            <table style="float: left; margin-left: -100px;">
                                <tr>
                                    <td class="change_theme_color_name"> WHITE : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="white" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="change_theme_color_name"> AZURE : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#F0FFFF" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="change_theme_color_name"> BEIGE : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#F0F0E0" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                </tr>
                                <tr>
                                    <td class="change_theme_color_name"> CORNSILK : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#FFF8E0" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="change_theme_color_name"> LIGHTCYAN : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#E0FFFF" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="change_theme_color_name"> LEMONCHIFFON : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#FFF8D0" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                </tr>
                                <tr>
                                    <td class="change_theme_color_name"> LIGHTYELLOW : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#FFFFE0" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="change_theme_color_name"> SEASHELL : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#FFF0F0" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="change_theme_color_name"> LINEN : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#F0F0E0" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                </tr>
                                <tr>
                                    <td class="change_theme_color_name"> TAN : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#D0B090" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="change_theme_color_name"> MOCCASIN : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#FFE0B0" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="change_theme_color_name"> GAINSBORO : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#E0D8E0" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                </tr>
                                <tr>
                                    <td class="change_theme_color_name"> GHOSTWHITE : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#F0F7FF" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="change_theme_color_name"> MISTYROSE : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#FFE0E0" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="change_theme_color_name"> MINTCREAM : &nbsp; </td>
                                    <td> <input type="radio" name="utheme" value="#F0FFF0" /> </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
                                </tr>
                            </table>
                            <br/> <br/><br/> <br/><br/> <br/><br/> <br/><br/> <br/><br/>
                            <input type="submit" value="Change Theme" />
                        </form>
                    </div>

                </div>
            </div>



            <%@include file="RightDivision.jsp" %>

        </div>
    </body>
</html>