<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TempList.aspx.cs" Inherits="IQRAA.pages.TempList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Lists</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../styles/index.css" media="all" />
    <link rel="stylesheet" type="text/css" href="../styles/BookList.css" media="all" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <div id="myCarousel1" class="carousel slide firstSlider" style="margin-top: 50px;" data-interval="false">
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
                <br /><br /><br />
                <asp:Label ID="lbl_author" style="margin-left:40px;" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="lbl_pages" style="margin-left:40px;" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="lbl_isbn13" style="margin-left:40px;" runat="server" Text="Label"></asp:Label><br />
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
    </form>
</body>
</html>
