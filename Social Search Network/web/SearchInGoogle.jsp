
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
    
    <body style="background-color: <%= utheme %>">
        
        <div class="body_main_division">
            <div class="body_top_division">
                
            </div>
            
            
            <div class="body_left_division">
                <%@include file="leftHeader.jsp" %>
            </div>
            
            
            <div class="center_body_division">
                <%@include file="MenuBar.jsp" %>
                
                 <br/> <br/> <br/>
                 
                 <h3 style="font-size: 25px; color: #0b965b; float: left; margin-top: 50px; margin-left: 50px;"> Search In Google </h3>
                <div class="updated_status_division">
                    <!-- Google CSE Search Box Begins  -->
                    <!-- Use of this code assumes agreement with the Google Custom Search Terms of Service. -->
                    <!-- The terms of service are available at https://www.google.com/cse/docs/tos.html -->
                    <form id="cref_iframe" action="SearchInGoogle.jsp">
                      <input type="hidden" name="cref" value="http://www.guha.com/cref_cse.xml" />
                      <input type="hidden" name="cof" value="FORID:9" />
                      <input type="text" name="q" size="40" />
                      <input type="submit" name="sa" value="Search" />
                    </form>
                    <script type="text/javascript" src="'/cse'/brand'?form='cref_iframe" ></script>
                    <!-- Google CSE Search Box Ends -->
                </div> <br/> <br/>
                 
                <div id="cse-search-results"></div>
                <script type="text/javascript">
                  var googleSearchIframeName = "cse-search-results";
                  var googleSearchFormName = "cse-search-box";
                  var googleSearchFrameWidth = 400;
                  var googleSearchDomain = "www.google.com";
                  var googleSearchPath = "/cse";
                </script>
                <script type="text/javascript" src="//www.google.com/afsonline/show_afs_search.js"></script>
                
                
        </div>
            
          <%@include file="RightDivision.jsp" %>
            
        </div>
    </body>
</html>