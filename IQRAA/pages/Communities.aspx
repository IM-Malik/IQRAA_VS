<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Communities.aspx.cs" Inherits="IQRAA.pages.Communities" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Head content remains the same -->
    <!-- Include your CSS and JavaScript files -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../styles/Communities.css" />


</head>

<body>

    <section id="hero">
        <header class="navBar" onscroll="">
          
            <div id="menu">
                <a href="#hero">
                    <img src="../media/images/Book32px.png" id="navBarIcon" />
                </a>
                <div id="menuOptions">
                    <ul style="display: flex; padding: 0; list-style-type: none;">
                        <li><a class="menuBtn" href="BookList2.aspx">Book List Page</a></li>
                        <li><a class="menuBtn" href="UserProfile.aspx" id="user_profile_btn" style="display:none;">User Profile Page</a></li>
                        <li><a class="menuBtn" id="signout" style="display:none;" onclick="signout()">Sign out</a></li>                        
                    </ul>
                </div>
            </div>


        </header>

        <div class="heroSection">
            <form runat="server">
                    <asp:HiddenField ID="hdnCommunityData" runat="server" ClientIDMode="Static" />

            </form>
            <div id="communityList" class="communityList">
                
            </div>
        </div>
    </section>
<script type="text/javascript" src="../scripts/Communities.js">

</script>

</body>
</html>
