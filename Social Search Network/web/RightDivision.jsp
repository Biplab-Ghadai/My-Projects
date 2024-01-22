

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <link rel="stylesheet" href="css/menubar.css" type="text/css" />

        <script src="js/jquery.min.js"></script>
        <script> 
            $(document).ready(function(){$("#scroll").show();
                $("#search_button").click(function(){
                    $("#scroll").animate({
                        height:'toggle'
                    });
                });
            });
        </script>

    </head>
    <body>

        <div class="right_body_division">

            <div class="button-wrapper">
                <a href="SearchInGoogle.jsp" class="a-btn">
                    <span></span>
                    <span style="float:left; margin-top:-10px;">Search</span>
                    <span>in GooGle</span>
                </a>
            </div> <br/>


            <button id="search_button" class="a-btn">Click Here For Quick Search</button> <br/> <br/>
            <div id="scroll" class="below_toggle_division">
                <form method="post" action="Searchbook.jsp">
                    <input type="text" name="book_search" placeholder="search books...." class="below_toggle_division_textfield" />
                    <input type="submit" value="Search" name="" class="below_toggle_division_search_button"/> <br/> <br/> <br/>
                </form>
                <form method="post" action="Searchmovie.jsp">
                    <input type="text" name="movie_search" placeholder="search movies...." class="below_toggle_division_textfield" />
                    <input type="submit" value="Search" name="" class="below_toggle_division_search_button"/> <br/> <br/> <br/>
                </form>
                <form method="post" action="SearchTvSerial.jsp">
                    <input type="text" name="tv_search_search" placeholder="search tv serials...." class="below_toggle_division_textfield" />
                    <input type="submit" value="Search" name="" class="below_toggle_division_search_button"/>
                </form>
            </div>

            <form action="FilteredSearch.jsp" method="post">
                <input type="submit" class="a-btn" value="Filtered Search">
            </form>

        </div>

    </body>
</html>
