

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />

        <link rel="stylesheet" media="screen" href="css/slider.css" type="text/css">
        <script src="js/jquery-1.7.min.js"></script>
        <script src="js/tms-0.4.x.js"></script>
        <script>
            $(document).ready(function () {
                $('.slider')._TMS({
                    show: 0,
                    pauseOnHover: true,
                    prevBu: false,
                    nextBu: false,
                    playBu: false,
                    duration: 1000,
                    preset: 'fade',
                    pagination: true,
                    pagNums: false,
                    slideshow: 7000,
                    numStatus: true,
                    banners: 'fromRight',
                    waitBannerAnimation: false,
                    progressBar: false
                })
            });
        </script>

    </head>
    <body>
        <div class="header_main_div">
            <div class="inner_header">
                <div class="logo_division">
                    <div id="letterpress">
                        <a href="index.jsp" class="logo_href"> <h1> Social Network ! </h1> </a>
                    </div>
                </div>
                <div class="login_division">
                    <form action="Login" method="post">
                        <input type="text" class="inputs" placeholder="Email" name="uemail" /> &nbsp;&nbsp;&nbsp;
                        <input type="password" class="inputs" placeholder="Password" name="upassword" /> &nbsp;&nbsp;&nbsp;
                        <input type="submit" name="login" value="LOGIN" class="css_button" />
                    </form>
                </div>
            </div>
        </div>





        <div class="main_body">

            <div class="main_left_division">

                <div id="slide" class="box-shadow">		
                    <div class="slider">
                        <ul class="items">
                            <li><img src="images/slider-1.jpg" alt="" /><div class="banner">Create New Account For Free....&nbsp;</div></li>
                            <li><img src="images/slider-2.jpg" alt="" /><div class="banner">Get Close To Your Friends....&nbsp;</div></li>
                            <li><img src="images/slider-3.jpg" alt="" /><div class="banner">Share Your Moments With Friends....&nbsp;</div></li>
                        </ul>
                    </div>	
                </div>

            </div>



            <div class="main_right_division">

                <jsp:scriptlet>
                    String error_message = (String) request.getAttribute("error_message");
                    if (error_message != null) {
                </jsp:scriptlet>

                <div style="color: red">
                    <strong> Error :: </strong> <jsp:expression>error_message</jsp:expression>
                    </div> <br/>

                <jsp:scriptlet>
            }
                </jsp:scriptlet>

                <form action="Registeration" method="post">
                    <input type="text" class="register_inputs" placeholder="Enter Name" name="name1" /> <br/>
                    <input type="text" class="register_inputs" placeholder="Enter Email Id" name="email1" /> <br/>
                    <input type="password" class="register_inputs" placeholder="Enter Password" name="password1" /> <br/>
                    <input type="password" class="register_inputs" placeholder="Confirm Password" name="cpassword1" /> <br/>
                    <select class="register_inputs" name="city1">
                        <option value="Bengaluru"> Bengaluru </option>
                        <option value="Chandigarh"> Chandigarh </option>
                        <option value="Gurgaon"> Gurgaon </option>
                        <option value="New Delhi"> New Delhi </option>
                        <option value="New York"> New York </option>
                    </select> <br/>
                    BIRTHDAY : <br/>
                    <input type="date" class="register_inputs" placeholder="Enter Password" name="birthday1" /> <br/>

                    <input type="radio" name="ugender1" value="Male"/>Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="ugender1" value="Female"/>Female <br/> <br/>
                    <input type="submit" value="REGISTER" class="register_button" />
                </form>
            </div>

        </div>
    </body>
</html>
