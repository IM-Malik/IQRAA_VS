<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookList2.aspx.cs" Inherits="IQRAA.pages.BookList2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Lists</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../styles/index.css" media="all" />
    <link rel="stylesheet" type="text/css" href="../styles/BookList.css" media="all" />


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <header class="navBar" onscroll="">
        <div id="menu">
            <!-- Default dropright button -->
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle btn-lg" data-toggle="dropdown">
                    Menu
                </button>
                <div class="dropdown-menu">
                    <a class="dropMenuLink" href="#">About</a>
                    <a class="dropMenuLink" href="#contactUs">Contact us</a>
                </div>
            </div>
        </div>

        <div id="searchBar">
            <input type="search" placeholder="Search" id="navSearchBar">
        </div>



        <div class="headerlinks" style="display: flex;">
            <button class="sign" id="signup">Sign up</button>
            <button class="sign" id="login">Log in</button>
        </div>
    </header>

    <!------------------------------------Currently Reading---------------------------------------------->
    <div id="myCarousel1" class="carousel slide firstSlider" data-interval="false">
        <!-- Indicators -->
        <ol class="carousel-indicators" id="currentRead_indicators">
            <!-- data-slide-to = its to switch between slides -->

            <li data-target="#myCarousel" data-slide-to="1" class="active" id="1"></li>
        </ol>


        <!-- Wrapper for slides -->
        <label for="currntRead" class="labels">Currently Reading</label>

        <a class="aBtn effect6" onclick="add_book('currentRead')">
            <i>+</i>
        </a>

        <div class="carousel-inner" id="currentRead">
            <div class="item active" id="active">
                <!------------------------------------------------------------>

                <div class="card" id="sample_currentRead">
                    <div class="samplePic">Sample Book</div>
                    <div class="progress">
                        <div class="progress-bar" style="width: 60%;">
                            60%
                        </div>
                    </div>
                </div>
                <!------------------------------------------------------------------------>

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


    <!------------------------------------WishList---------------------------------------------->
    <!--  data-ride is what makes it slide automatically && and data-interval=false  -->
    <div id="myCarousel2" class="carousel slide" data-interval="false">
        <!-- Indicators -->
        <ol class="carousel-indicators" id="wishlist_indicators">
            <li data-target="#myCarousel" class="active"></li>
        </ol>

        <!-- Wrapper for slides -->
        <label for="wishlist" class="labels">Wishlist</label>
        <a class="aBtn effect6" onclick="add_book('wishlist')">
            <i>+</i>
        </a>
        <div class="carousel-inner" id="wishlist">
            <div class="item active">

                <div class="card" id="sample_wishlist">
                    <div class="samplePic">Sample Book</div>
                    <center>
                        <button class="buyBtn">Click to Buy</button></center>
                </div>

            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel2" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel2" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!------------------------------------Finished---------------------------------------------->
    <div id="myCarousel3" class="carousel slide" data-interval="false">
        <!-- Indicators -->
        <ol class="carousel-indicators" id="Finished_indicators">
            <li data-target="#myCarousel" class="active"></li>
        </ol>

        <!-- Wrapper for slides -->
        <label for="Finished" class="labels">Finished</label>
        <a class="aBtn effect6" onclick="add_book('Finished')">
            <i>+</i>
        </a>
        <div class="carousel-inner" id="Finished">
            <div class="item active">
                <!------------------------------------------------------------>

                <div class="card" style="margin-bottom: 30px;" id="sample_Finished">
                    <div class="samplePic">Sample Book</div>
                </div>

                <!------------------------------------------------------------------------>
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel3" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel3" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div id="customLists"></div>

    <a id="add_carousel_btn" class="aBtn2 effect6" onclick="add_custom_carousel()">
        <i>+</i>
    </a>
    <p class="textUnderAddBtn2">Add New List</p>

    <!--------------------------------add custom list popup----------------------------------->
    <div class="modal" tabindex="-1" role="dialog" id="customListModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Custom List Name</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="listName">List Name</label>
                        <input type="text" class="form-control" id="listName" placeholder="Enter list name">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="saveListName">Save</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!--------------------------------add custom list popup----------------------------------->


    <!--------------------------------add book popup----------------------------------->
    <div class="modal" tabindex="-1" role="dialog" id="addBookModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="bookISBN">Book ISBN</label>
                        <input type="text" class="form-control" id="bookISBN" placeholder="Enter book ISBN">
                    </div>

                </div>
                <div class="form-group" id="book_progress_form">
                    <label for="bookProgress">Book Progress:</label>
                    <input type="number" id="bookProgress" min="0" max="100" placeholder="0" onchange="getProgressValue()">
                </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="saveBookISBN">Save</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!--------------------------------add book popup----------------------------------->

    <!--------------------------------edit book progress popup----------------------------------->
    <div class="modal" tabindex="-1" role="dialog" id="edit_book_progress">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-body">
                    <label for="bookProgressGreen">Book
                    <input type="number" id="bookProgressGreen" min="0" max="100" placeholder="0">
                    <button type="button" class="btn btn-primary" id="sSave</button>
                    <button type="button" class="btn btn-secondary" datClose</button>


                </div>
            </div>
        </div>
    </div>
    <!--------------------------------edit book progress popup----------------------------------->

    <form id="form1" runat="server">

        <asp:SqlDataSource ID="SqlDataSourceBook" runat="server"
            ConnectionString="<%$ ConnectionStrings:IQRAA_dbConnectionString %>"
            SelectCommand="SELECT book_id, ISBN_13, ISBN_10, title, url, author, num_of_pages, 
            publish_date, cover_small, cover_medium, cover_large FROM Books"></asp:SqlDataSource>


        <asp:Button runat="server" OnClick="Unnamed1_Click" Text="Fetch" />
        <br />
        <!--<asp:TextBox ID="ISBN_13" runat="server" placeholder="ISBN-13"></asp:TextBox>
        <asp:TextBox ID="ISBN_10" runat="server" placeholder="ISBN-10"></asp:TextBox>-->

    </form>

    <code></code>

    <script rel="javascript" type="text/javascript" src="../scripts/BookLists.js" defer>
    </script>
    <script type="text/c#" src="../scripts/Book.cs" defer>
    </script>



</body>
</html>
