

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        
        
        <link rel="stylesheet" href="css/leftHeaderStyle.css" type="text/css" />
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        
        
    </head>
    <body>
        
        <%
            String uname1=(String)session.getAttribute("session_uname");
            String uprofile_pic1=(String)session.getAttribute("session_uprofile_pic");
        %>
        
        <a href="profile.jsp" class="profile_name_href">
            <span class="profile_name_style"> <%= uname1 %> </span>
            <div class="profile_pic_division">
                <img src="uploads/<%= uprofile_pic1 %>" height="150px" width="150px" style="border-radius: 5px;" />
            </div>
        </a>
           
            <div class="left_head_add_interests_division">
                <a href="MyInterests.jsp" class="my_interest_href"> <h3> My Interests </h3> </a> <br/>
            
            <table>
                <tr>
                    <td> <a href="AddBooks.jsp"> <img src="images/book.jpg" width="25px;" /></a> </td>
                    <td> <a href="AddBooks.jsp" class="add_books_movies_serials_href"> &nbsp;&nbsp; Add Books </a> </td>
                </tr>
                <tr>
                    <td> &nbsp; </td>
                    <td> &nbsp; </td>
                </tr>
                <tr>
                    <td> <a href="AddMovies.jsp"> <img src="images/movies.jpg" width="25px;" /></a> </td>
                    <td> <a href="AddMovies.jsp" class="add_books_movies_serials_href" > &nbsp;&nbsp; Add Movies </a> </td>
                </tr>
                <tr>
                    <td> &nbsp; </td>
                    <td> &nbsp; </td>
                </tr>
                <tr>
                    <td> <a href="AddTvSerials.jsp"> <img src="images/tv-serials.jpg" width="25px;" /></a> </td>
                    <td> <a href="AddTvSerials.jsp" class="add_books_movies_serials_href"> &nbsp;&nbsp; Add TV Serials </a> </td>
                </tr>
            </table>
            </div>
        
        
    </body>
</html>
