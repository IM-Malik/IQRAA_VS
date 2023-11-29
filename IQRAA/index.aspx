<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="IQRAA.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>IQRAA</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="styles/index.css" media="all" />
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
                        <li><a class="menuBtn" href="pages/BookList2.aspx" >Book List page</a></li>
                        <!--<li><a class="menuBtn" href="#contactUs">Contact us</a></li>-->
                    </ul>
                </div>
            </div>

            <div id="searchBar">
                <form id="navSearch">
                    <input type="search" placeholder="Search" id="navSearchBar" />
                </form>
            </div>

            

            <div class="headerlinks" style="display: flex;">
                <button class="sign" id="signup" onclick="open_signup()">Sign up</button>
                <button class="sign" id="login" onclick="open_login()">Log in</button>
            </div>


            <!-------------------------------------------Login Form--------------------------------------------------->
            <div class="form-popup" id="login_div" style="display: none;">
                <form id="login_form" class="form-container">
                    <center>
                        <h1 style="font-weight: bold; font-size: 50px;">Login</h1>
                    </center>

                    <label for="login_email" style="padding-left: 5px; font-size: 20px;"><b>Email</b></label>
                    <input type="text" id="login_email" placeholder="Enter Email" required />

                    <label for="login_psw" style="padding-left: 5px; font-size: 20px;"><b>Password</b></label>
                    <input type="password" id="login_psw" placeholder="Enter Password" style="margin-bottom: 4px" 
                        name="login_psw" required />
                    <a class="show_password_a" onclick="show_hide_password('login_psw')">show password</a>

                    <button type="button" class="primary_btn" onclick="user_login()">Login</button>
                    <button type="submit" class="secondary_btn" onclick="open_signup()">Sign up</button>
                    <button type="button" class="secondary_btn cancel" onclick="close_login()">Close</button>
                </form>
            </div>
            <!-------------------------------------------Login Form--------------------------------------------------->

            <!-------------------------------------------Sign-up Form--------------------------------------------------->
            <div class="form-popup" id="signup_div" style="display: none;">
                <form id="signup_form" class="form-container" runat="server">
                    <center>
                        <h1 style="font-weight: bold; font-size: 50px;">Sign up</h1>
                    </center>

                    <label style="padding-left: 5px; font-size: 20px;"><b>Email</b></label>
                    <asp:TextBox ID="txt_email" runat="server" placeholder="Enter Email" required></asp:TextBox>

                    <label style="padding-left: 5px; font-size: 20px;"><b>Password</b></label>
                    <asp:TextBox ID="txt_psw" runat="server" TextMode="Password" placeholder="Password" 
                        Style="margin-bottom: 4px" required></asp:TextBox>
                    <a class="show_password_a" onclick="show_hide_password('txt_psw')">show password</a>

                    <label style="padding-left: 5px; font-size: 20px;"><b>Confirm Password</b></label>
                    <asp:TextBox ID="txt_cpsw" runat="server" TextMode="Password" placeholder="Confirm Password" 
                        Style="margin-bottom: 4px" required></asp:TextBox>
                    <a class="show_password_a" onclick="show_hide_password('txt_cpsw')">show password</a>

                    

                    <span id="no_match_psw" style="display: none; color: white;"></span>
                    <asp:Label ID="lbl_err" runat="server" ForeColor="White"></asp:Label>

                    <asp:Button ID="btn_signup" class="primary_btn" runat="server" 
                        Text="Sign up" OnClientClick="return validate_password();" OnClick="SignUptUser"/>

                    <asp:Button ID="btn_open_login" class="secondary_btn" runat="server" Text="login" 
                        OnClientClick="open_login();return false;" />
                    <asp:Button ID="btn_close_signup" class="secondary_btn cancel" runat="server" Text="Close" 
                        OnClientClick="close_signup();return false;" />

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString='<%$ ConnectionStrings:IQRAA_dbConnectionString %>'>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txt_email" Name="Email" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </form>
            </div>
            <!-------------------------------------------Sign-up Form--------------------------------------------------->


        </header>



        <div class="heroSection">
            <div id="mainLogo">

                <div id="mainLogoImage"></div>

                <p id="textUnderLogo">IQRAA | اقرأ</p>
                <div class="searchDiv">
                    <form id="mainSearchBarF">
                        <input type="search" placeholder="Search" id="mainSearchBar" autofocus required"/>
                        <div class="dropdown">
                          <button class="stylee btn dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                            Book
                          </button>
                          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="drop_list" style="background:white;">
                            <a class="dropdown-item" href="#" id="book_item" onclick="change('book_item')" style="display:none;">Book</a>
                            <a class="dropdown-item" href="#" id="community_item" onclick="change('community_item')">Community</a>
                          </div>
                        </div>
                        <center>
                            <button class="searchBtn" type="button" onclick="decider('mainSearchBar')">Search</button>
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
                    <!-----------------------------------card 1----------------------------------------->
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
                    <!------------------------------------card 2----------------------------------------->

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
    <script rel="javascript" type="text/javascript" src="scripts/BookSearch.js" defer></script>
    <!--<script rel="javascript" type="text/javascript" src="../scripts/BookLists.js" defer></script>-->
    <form id="form1">
        <div>
        </div>
    </form>
</body>
</html>
