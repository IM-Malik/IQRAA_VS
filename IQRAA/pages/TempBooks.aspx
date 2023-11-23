<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TempBooks.aspx.cs" Inherits="IQRAA.pages.TempBooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Search</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../styles/index.css" media="all"/>
    <script type="text/javascript" src="../scripts/index.js" defer></script>
    <link rel="icon" href="../media/images/Book32px.png" />
    <link rel="stylesheet" type="text/css" href="../styles/BookList.css" media="all"/>
</head>
<body>
    <form id="form1" runat="server">
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
                <!-----------------------------------card 1----------------------------------------->
                <div class="card mb-3 firstCard" style="max-width: 470px; margin-bottom: 30px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <a href="https://google.com"><img src="../media/images/download.png" class="BookPicSlider" alt="..."></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural
                                    lead-in to
                                    additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                <asp:Button ID="Add_book" runat="server" Text="+" OnClick="Add_book_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <!------------------------------------card 2----------------------------------------->
                <div class="card mb-3" style="max-width: 470px; margin-bottom: 30px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <a href="#"><img src="../media/images/download.png" class="BookPicSlider" alt="..."></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural
                                    lead-in to
                                    additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                <asp:Button ID="Add_book1" runat="server" Text="+" OnClick="Add_book1_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
                
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IQRAA_dbConnectionString %>" 
            SelectCommand="SELECT [book_id], [ISBN_13], [ISBN_10], [title], [url], [author], [num_of_pages], [cover_small], 
            [publish_date], [cover_medium], [cover_large], [translated], [language] FROM [Books]">
            
        </asp:SqlDataSource>
    </form>
</body>
</html>
