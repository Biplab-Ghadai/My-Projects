

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <link rel="stylesheet" href="css/menubar.css" type="text/css" />
    </head>

    <%! String search_value = null;
        String book = "search_book";
        String movie = "search_movie";
        String tv_serial = "search_tv_serial";%>

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
                    <div class="updated_status_division">
                        <form action="FilteredSearchResult.jsp" method="post">
                            Books : <input type="radio" value="search_book" name="filtered_search" checked="checked" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Movies : <input type="radio" value="search_movie" name="filtered_search" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            TV Serials : <input type="radio" value="search_tv_serial" name="filtered_search" /> <br/> <br/>
                            <input type="text" name="search_keyword" placeholder="Enter Search Keyword...." class="below_toggle_division_textfield" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" name="enter_city" placeholder="Enter City....." class="below_toggle_division_textfield" /> <br/> <br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="submit" value="Search" />
                        </form>
                    </div>
                </div>


                

            </div>

            <%@include file="RightDivision.jsp" %>

        </div>
    </body>
</html>