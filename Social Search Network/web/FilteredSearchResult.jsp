

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
        <title>Search Result</title>
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
                    
                    <div class="updated_status_division">
                        <a href="FilteredSearch.jsp" class="search_again_href"> Click Here To Search Again </a>
                    </div>

                    <%


                        String search_value = null;
                        String book = "search_book";
                        String movie = "search_movie";
                        String tv_serial = "search_tv_serial";

                        search_value = request.getParameter("filtered_search");
                        String search_keyword = request.getParameter("search_keyword");
                        String city = request.getParameter("enter_city");



                        if (search_value.equals(book)) {
                            String ema11 = null;
                            String name11 = null;
                            String city11 = null;
                            String pic11 = null;
                            String pic_upload = null;
                            String book_name = null;
                            String date11 = null;
                            String time11 = null;

                            try {
                                Connection con = DbConnection.getConnect();
                                PreparedStatement ps = con.prepareStatement("select * from GT_ADD_BOOKS where BOOK_NAME LIKE '%" + search_keyword + "%' AND CITY LIKE '%" + city + "%'");
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    name11 = rs.getString("NAME");
                                    pic11 = rs.getString("PROFILE_PIC");
                                    ema11 = rs.getString("email");
                                    city11 = rs.getString("city");
                                    date11 = rs.getString("DATE1");
                                    time11 = rs.getString("TIME1");
                                    book_name = rs.getString("BOOK_NAME");
                                    pic_upload = "uploads/" + pic11;
                    %>
                    <div class="updated_status_division">
                        <a href="searchFriend?ID=<%= ema11%>"  class="add_books_movies_serials_href">
                            <img src="<%= pic_upload%>" height="50px" width="50px"/><br/>
                        </a>
                        <b style="font-size: 16px; color: #333;"> Book Name : </b>
                        <span style="font-size: 14px; color: #747373; font-weight: bold;">
                            <%= book_name%>
                        </span> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                            (<%= time11%>)
                        </span> 
                        <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                            (<%= date11%>)
                        </span>  &nbsp;&nbsp; 
                        <br/>
                        <b style="font-size: 16px; color: #333;">Name : </b>
                        <span style="font-size: 14px; color: #747373; font-weight: bold;">

                            <a href="searchFriend?ID=<%= ema11%>"  class="add_books_movies_serials_href"> <%= name11%> </a>
                        </span>
                        <br/>
                        <b style="font-size: 16px; color: #333;"> Email : </b>
                        <span style="font-size: 14px; color: #747373; font-weight: bold;">
                            <a href="searchFriend?ID=<%= ema11%>"  class="add_books_movies_serials_href"> <%= ema11%> </a>
                        </span>
                    </div>
                    <%
                            }
                        } catch (Exception e) {
                            out.print(e);
                        }
                    } else if (search_value.equals(movie)) {
                        String ema11 = null;
                        String name11 = null;
                        String city11 = null;
                        String pic11 = null;
                        String pic_upload = null;
                        String movie_name = null;
                        String date11 = null;
                        String time11 = null;
                        try {
                            Connection con = DbConnection.getConnect();
                            PreparedStatement ps = con.prepareStatement("select * from GT_ADD_MOVIES where MOVIE_NAME  LIKE '%" + search_keyword + "%' AND CITY LIKE '%" + city + "%'");
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                name11 = rs.getString("NAME");
                                pic11 = rs.getString("PROFILE_PIC");
                                ema11 = rs.getString("email");
                                city11 = rs.getString("city");
                                date11 = rs.getString("DATE1");
                                time11 = rs.getString("TIME1");
                                movie_name = rs.getString("movie_name");
                                pic_upload = "uploads/" + pic11;

                    %>
                    <div class="updated_status_division">
                        <a href="searchFriend?ID=<%= ema11%>"  class="add_books_movies_serials_href">
                            <img src="<%= pic_upload%>" height="50px" width="50px"/><br/>
                        </a>
                        <b style="font-size: 16px; color: #333;"> Movie Name : </b>
                        <span style="font-size: 14px; color: #747373; font-weight: bold;">
                            <%= movie_name%>
                        </span> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                            (<%= time11%>)
                        </span> 
                        <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                            (<%= date11%>)
                        </span>  &nbsp;&nbsp; 
                        <br/>
                        <b style="font-size: 16px; color: #333;">Name : </b>
                        <span style="font-size: 14px; color: #747373; font-weight: bold;">
                            <a href="searchFriend?ID=<%= ema11%>"  class="add_books_movies_serials_href"><%= name11%></a>
                        </span>
                        <br/>
                        <b style="font-size: 16px; color: #333;"> Email : </b>
                        <span style="font-size: 14px; color: #747373; font-weight: bold;">
                            <a href="searchFriend?ID=<%= ema11%>"  class="add_books_movies_serials_href"><%= ema11%></a>
                        </span>
                    </div>

                    <%
                            }
                        } catch (Exception e) {
                            out.print(e);
                        }
                    } else if (search_value.equals(tv_serial)) {
                        String ema11 = null;
                        String name11 = null;
                        String city11 = null;
                        String pic11 = null;
                        String pic_upload = null;
                        String tv_serial_name = null;
                        String date11 = null;
                        String time11 = null;
                        try {
                            Connection con = DbConnection.getConnect();
                            PreparedStatement ps = con.prepareStatement("select * from GT_ADD_TV_SERIALS where TV_SERIAL_NAME  LIKE '%" + search_keyword + "%' AND CITY LIKE '%" + city + "%'");
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                name11 = rs.getString("NAME");
                                pic11 = rs.getString("PROFILE_PIC");
                                ema11 = rs.getString("email");
                                city11 = rs.getString("city");
                                date11 = rs.getString("DATE1");
                                time11 = rs.getString("TIME1");
                                tv_serial_name = rs.getString("TV_SERIAL_NAME");
                                pic_upload = "uploads/" + pic11;

                    %>
                    <div class="updated_status_division">
                        <a href="searchFriend?ID=<%= ema11%>"  class="add_books_movies_serials_href">
                            <img src="<%= pic_upload%>" height="50px" width="50px"/><br/>
                        </a>
                        <b style="font-size: 16px; color: #333;"> TV Serial Name : </b>
                        <span style="font-size: 14px; color: #747373; font-weight: bold;">
                            <%= tv_serial_name%>
                        </span> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                            (<%= time11%>)
                        </span> 
                        <span style="font-size: 12px; color: #a7a6a6; font-weight: bold;">
                            (<%= date11%>)
                        </span>  &nbsp;&nbsp; 
                        <br/>
                        <b style="font-size: 16px; color: #333;">Name : </b>
                        <span style="font-size: 14px; color: #747373; font-weight: bold;">
                            <a href="searchFriend?ID=<%= ema11%>"  class="add_books_movies_serials_href"><%= name11%></a>
                        </span>
                        <br/>
                        <b style="font-size: 16px; color: #333;"> Email : </b>
                        <span style="font-size: 14px; color: #747373; font-weight: bold;">
                            <a href="searchFriend?ID=<%= ema11%>"  class="add_books_movies_serials_href"><%= ema11%></a>
                        </span>
                    </div>

                    <%
                            }
                        } catch (Exception e) {
                            out.print(e);
                        }
                    } else if(search_value.equals("null")) {
                    %>
                    <div class="updated_status_division"> <br/> <br/>
                        <h2> No Data Found </h2>
                        <br/>
                        <br/>
                    </div>

                    <%                        }

                    %>
                </div>

            </div>

            <%@include file="RightDivision.jsp" %>

        </div>
    </body>
</html>