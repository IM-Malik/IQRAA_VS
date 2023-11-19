<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="IQRAA.pages.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        email&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="email_input" runat="server"></asp:TextBox>
            <input id="Text1" type="text" />
        <p>
            first name&nbsp;
            <asp:TextBox ID="fname_input" runat="server" TextMode="Password"></asp:TextBox>
            <a runat="server">jsklda</a>
        </p>

        <asp:TextBox ID="psw" runat="server" TextMode="Password"></asp:TextBox>
        <asp:TextBox ID="cpsw" runat="server" TextMode="Password"></asp:TextBox>
        <asp:TextBox ID="email" runat="server" placeholder="Enter Email"></asp:TextBox>

        <asp:Button ID="save_btn" runat="server" Height="47px" OnClick="Button1_Click" Text="save" Width="92px" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IQRAA_dbConnectionString %>" SelectCommand="SELECT * FROM [Book_list]" OnSelecting="SqlDataSource1_Selecting" OnInserting="SqlDataSource1_Inserting" InsertCommand="INSERT INTO Users(password, email) VALUES (@psw, @email)">
            <InsertParameters>
                <asp:ControlParameter ControlID="email" Name="email" PropertyName="Text" />
                <asp:ControlParameter ControlID="psw" Name="psw" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
