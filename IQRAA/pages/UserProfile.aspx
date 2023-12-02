<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="IQRAA.pages.UserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="../styles/index.css" media="all" />
    <link rel="stylesheet" type="text/css" href="../styles/UserProfile.css" media="all" />
    <script type="text/javascript" src="../scripts/UserProfile.js"></script>
    <title>Profile</title>
</head>
<body>
    <header class="navBar" onscroll="">

        <div id="menu">
            <a href="#hero">
                <img src="../media/images/Book32px.png" id="navBarIcon" /></a>
            <div id="menuOptions">
                <ul style="display: flex; padding: 0; list-style-type: none;">
                    <li><a class="menuBtn" href="#">About</a></li>
                    <li><a class="menuBtn" href="ContactUs.html">Contact us</a></li>
                </ul>
            </div>
        </div>

       
    </header>

    <form id="form1" runat="server">

        <center>
            <div class="picCircle">
                <asp:Image ID="ProfilePicture" runat="server" />
            </div>
             <div>  
            <p>Browse to Upload Image</p>  
            <asp:FileUpload ID="ImageUpload" runat="server" />  
        </div>  
        <p>  
            <asp:Button ID="ImageUploadButton" runat="server" Text="Upload Image" OnClick="ImageUploadButton_Click" />  
        </p>  
             <p>  
        <asp:Label runat="server" ID="FileUploadStatus"></asp:Label>  
    </p>  
        </center>

        <center>
            <div id="cent_username">
                <label class="labels" for="username">Username</label><br />
                <asp:TextBox ID="username" runat="server" class="textBox username" placeholder="Username"></asp:TextBox>
                <span class="textBox">#</span>
                <asp:TextBox ID="generated_id" runat="server" class="textBox username" placeholder="Generated ID" ReadOnly="true"></asp:TextBox>
                
            </div>
        </center>

        <center id="cent_email">
            <label class="labels" for="email">Email</label><br />
            <asp:TextBox ID="email" type="text" runat="server" class="textBox email" placeholder="Email" ReadOnly="true"></asp:TextBox>
        </center>

        <center id="cent_phone">
            <label class="labels" for="phone_number">Phone Number</label><br />
            <asp:TextBox ID="phone_num" class="textBox phone_number" placeholder="Phone Number" runat="server"></asp:TextBox>
        </center>

        <center id="cent_bio">
            <label class="labels" for="bio">Bio</label><br />
            <asp:TextBox ID="bio" class="textBox bioArea" placeholder="Tell us about yourself ..." runat="server" 
                TextMode="MultiLine"></asp:TextBox>
            <!--<a class="edit" onclick="edit('bio', 'cent_bio')">edit</a>-->
        </center>
        <center><asp:Button ID="save_changes" runat="server" Text="save changes" OnClick="update_profile" /></center>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IQRAA_dbConnectionString %>" InsertCommand="INSERT INTO Users(username) VALUES (@Username)" UpdateCommand="UPDATE Users SET username = @Username, phone_number = @Phone_Number WHERE (user_id = 1)" SelectCommand="SELECT username, phone_number, email, image, user_id FROM Users WHERE user_id = 1">
            <InsertParameters>
                <asp:ControlParameter ControlID="username" Name="Username" PropertyName="Text" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="username" Name="Username" PropertyName="Text" />
                <asp:ControlParameter ControlID="phone_num" Name="Phone_Numbe" />
                <asp:ControlParameter ControlID="bio" Name="Bio" PropertyName="Text" />
                <asp:ControlParameter ControlID="ImageUpload" Name="Image" />
                <asp:ControlParameter ControlID="email" Name="Email" PropertyName="Text" />

            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

