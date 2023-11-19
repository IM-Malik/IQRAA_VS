﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="IQRAA.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>IQRAA</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="styles/index.css" media="all" />
    <script type="text/javascript" src="scripts/index.js" defer></script>
    <link rel="icon" href="media/images/Book32px.png" />
    <link rel="stylesheet" type="text/css" href="styles/BookList.css" media="all" />
</head>

<body>

    <section id="hero">
        <header class="navBar" onscroll="">
            <div id="menu">
                <a href="#hero">
                    <img src="media/images/Book32px.png" id="navBarIcon" /></a>
                <div id="menuOptions">
                    <ul style="display: flex; padding: 0; list-style-type: none;">
                        <li><a class="menuBtn" href="pages/BookList2.aspx">Book List page</a></li>
                        <!--<li><a class="menuBtn" href="#contactUs">Contact us</a></li>-->
                    </ul>
                </div>
            </div>

            <div id="searchBar">
                <form id="navSearch">
                    <input type="search" placeholder="Search" id="navSearchBar" />
                </form>
            </div>

            <div class="search-box">
                <button class="btn-search"><i class="fas fa-search"></i></button>
                <input type="text" class="input-search" placeholder="Type to Search..." />
            </div>

            <div class="headerlinks" style="display: flex;">
                <button class="sign" id="signup" onclick="open_signup()">Sign up</button>
                <button class="sign" id="login" onclick="open_login()">Log in</button>
            </div>


            <!-------------------------------------------Login Form--------------------------------------------------->
            <div class="form-popup" id="login_form">
                <form id="login_form" class="form-container">
                    <center>
                        <h1 style="font-weight: bold; font-size: 50px;">Login</h1>
                    </center>

                    <label for="email" style="padding-left: 5px; font-size: 20px;"><b>Email</b></label>
                    <input type="text" placeholder="Enter Email" name="email" required />

                    <label for="psw" style="padding-left: 5px; font-size: 20px;"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required />

                    <button type="submit" class="primary_btn">Login</button>
                    <button type="submit" class="secondary_btn" onclick="open_signup()">Sign up</button>
                    <button type="button" class="secondary_btn cancel" onclick="close_login()">Close</button>
                </form>
            </div>
            <!-------------------------------------------Login Form--------------------------------------------------->

            <!-------------------------------------------Sign-up Form--------------------------------------------------->
            <div class="form-popup" id="signup_form">
                <form id="signup_form" class="form-container" runat="server">
                    <center>
                        <h1 style="font-weight: bold; font-size: 50px;">Sign up</h1>
                    </center>

                    <label for="email" style="padding-left: 5px; font-size: 20px;"><b>Email</b></label>
                    <!--<input type="text" runat="server" id="email" placeholder="Enter Email" name="email" required />-->
                    <asp:TextBox ID="txt_email" runat="server" placeholder="Enter Email"></asp:TextBox>

                    <label for="psw" style="padding-left: 5px; font-size: 20px;"><b>Password</b></label>
                    <asp:TextBox ID="txt_psw" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <!--<input type="password" placeholder="Enter Password" id="psw" name="psw" style="margin-bottom: 4px" required />
                    <a class="show_password_a" onclick="show_hide_password('psw')">show password</a><br />-->

                    <label for="cpsw" style="padding-left: 5px; font-size: 20px;"><b>Confirm Password</b></label>
                    <asp:TextBox ID="txt_cpsw" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                    <!--<input type="password" placeholder="Confirm Password" id="cpsw" name="cpsw" style="margin-bottom: 4px" required />

                    <a class="show_password_a" onclick="show_hide_password('cpsw')">show password</a>-->

                    
                    

                    <!--<button type="submit" class="primary_btn">Sign up</button>-->
                    <asp:Button ID="Button1" class="primary_btn" runat="server" Text="Sign up" OnClick="insertUser"/>
                    <button type="submit" class="secondary_btn" onclick="open_login()">login</button>
                    <button type="button" class="secondary_btn cancel" onclick="close_signup()">Close</button>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:IQRAA_dbConnectionString %>' SelectCommand="SELECT [email], [password] FROM [Users]"></asp:SqlDataSource>
                </form>
            </div>
            <!-------------------------------------------Sign-up Form--------------------------------------------------->


        </header>



        <div class="heroSection">
            <div id="mainLogo">

                <div id="mainLogoImage"></div>

                <p id="textUnderLogo">IQRAA | اقرأ</p>
                <div class="searchDiv">
                    <form id="mainSearchBar">
                        <input type="search" placeholder="Search" id="mainSearchBar" autofocus required>
                        <center>
                            <button class="searchBtn">Search</button>
                            <button class="searchBtn">Random</button>
                        </center>
                    </form>
                </div>
            </div>
        </div>

        <!----------------------------------------------------------------------------------------->

        <div id="myCarousel1" class="carousel slide firstSlider" data-ride="carousel" style="margin-top: 130px;">
            <!-- Indicators -->
            <ol class="carousel-indicators ">
                <!-- data-slide-to = its to switch between slides -->
                <li data-target="#myCarousel" data-slide-to="1" class="active"></li>

            </ol>


            <!-- Wrapper for slides -->
            <label for="trending" class="labels">Trending Books</label>


            <div class="carousel-inner" id="trending">
                <div class="item active">
                    <div class="card mb-3 firstCard" style="max-width: 470px; margin-bottom: 30px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <a href="https://google.com">
                                    <img src="media/images/download.png" class="BookPicSlider" alt="..."></a>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">
                                        This is a wider card with supporting text below as a natural
                                    lead-in to
                                    additional content. This content is a little bit longer.
                                    </p>
                                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-----------------------------------card 2----------------------------------------->
                    <div class="card mb-3" style="max-width: 470px; margin-bottom: 30px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <a href="https://google.com">
                                    <img src="media/images/download.png" class="BookPicSlider" alt="..."></a>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">
                                        This is a wider card with supporting text below as a natural
                                    lead-in to
                                    additional content. This content is a little bit longer.
                                    </p>
                                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!------------------------------------card 3----------------------------------------->

                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel1" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel1" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    </section>

    <script rel="javascript" type="text/javascript" src="scripts/index.js" defer></script>
    <!--<script rel="javascript" type="text/javascript" src="../scripts/BookLists.js" defer></script>-->
    <form id="form1">
        <div>
            
        </div>
    </form>
</body>
</html>
