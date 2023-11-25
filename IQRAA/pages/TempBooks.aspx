<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TempBooks.aspx.cs" Inherits="IQRAA.pages.TempBooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Search</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../styles/index.css" media="all" />
    <script type="text/javascript" src="../scripts/index.js" defer></script>
    <link rel="icon" href="../media/images/Book32px.png" />
    <link rel="stylesheet" type="text/css" href="../styles/BookList.css" media="all" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lbl_add_err" runat="server" Text=""></asp:Label>




        <div id="myCarousel1" class="carousel slide firstSlider" data-interval="false">
            <!-- Indicators -->
            <ol class="carousel-indicators" id="currentRead_indicators">
                <!-- data-slide-to = its to switch between slides -->

                <li data-target="#myCarousel" data-slide-to="1" class="active" id="1"></li>
            </ol>


            <!-- Wrapper for slides -->
            <label for="currntRead" class="labels">Trending</label>


            <div class="carousel-inner" id="currentRead">
                <div class="item active" id="active">
                    <!-----------------------------------card 1----------------------------------------->
                    <div class="card mb-3 firstCard" style="max-width: 470px; margin-bottom: 30px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <a href="https://google.com">
                                    <img src="../media/images/download.png" class="BookPicSlider" alt="..." class="BookPicSlider" style="width: 150px; height: 225px;"></a>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Fahrenheit 451</h5>
                                    <p class="card-text" style="font-size: 15px;">Guy Montag is a fireman. His job is to destroy the most illegal of commodoties, the printed book, along with the houses in which they are hidden. Montag never questions the destruction and ruin his actions produce, returning each day to his bland life and wife, Mildred, who spends all day with her television “family.” But then he meets an eccentric young neighbor, Clarisse, who introduces him to a past where people didn’t live in fear and to a present where one sees the world through the ideas in books instead of the mindless chatter of television, Montag begins to question everything he has ever known.</p>
                                    <br />
                                    <asp:Label ID="author_C1" class="card-text text-muted" runat="server" Text="Ray Bradbury"></asp:Label><br />
                                    <asp:Label ID="ISBN_13_C1" class="card-text text-muted" runat="server" Text="9781451673319"></asp:Label><br />
                                    <asp:Label ID="num_of_pages_C1" class="card-text text-muted" runat="server" Text="256 pages"></asp:Label>
                                    <br />
                                    <asp:Button ID="Add_book1" CommandName="ADD" runat="server" Text="+" OnClick="List_book_command" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!------------------------------------card 2----------------------------------------->
                    <div class="card mb-3" style="max-width: 470px; margin-bottom: 30px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="../media/images/0008396122-M.jpg" class="BookPicSlider" alt="..." class="BookPicSlider" style="width: 150px; height: 225px;" /></a>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title" style="padding-left: 30px;">Digital Fortress</h5>
                                    <p class="card-text" style="padding-left: 30px; font-size: 15px;">When the NSA's invincible code-breaking machine encounters a mysterious code it cannot break, the agency calls its head cryptographer, Susan Fletcher, a brilliant and beautiful mathematician. What she uncovers sends shock waves through the corridors of power. The NSA is being held hostage ... not by guns or bombs, but by a code so ingeniously complex that if released it would cripple U.S. intelligence</p>
                                    <asp:Label ID="author_C2" Style="padding-left: 30px;" class="card-text text-muted" runat="server" Text="Dan Brown"></asp:Label><br />
                                    <asp:Label ID="ISBN_13_C2" Style="padding-left: 30px;" class="card-text text-muted" runat="server" Text="9780312944926"></asp:Label><br />
                                    <asp:Label ID="num_of_pages_C2" Style="padding-left: 30px;" class="card-text text-muted" runat="server" Text="526 pages"></asp:Label><br />
                                    <asp:Button ID="Add_book2" CommandName="ADD" runat="server" Text="+" Style="margin-left: 30px;" OnClick="List_book_command" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!------------------------------------------------------------------------>

                </div>
            </div>
                    <asp:Button ID="ViewList" CommandName="hi" runat="server" Text="ViewList" Style="margin-left: 30px;" 
                        OnClick="List_book_command" />

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
            [publish_date], [cover_medium], [cover_large], [translated], [language] FROM [Books]"></asp:SqlDataSource>
    </form>
</body>
</html>
