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
        <p>
            first name&nbsp;
            <asp:TextBox ID="fname_input" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="save_btn" runat="server" Height="47px" OnClick="Button1_Click" Text="save" Width="92px" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IQRAA_dbConnectionString %>" InsertCommand="INSERT INTO Temp(email, first_name) VALUES (@email, @fname)" ProviderName="<%$ ConnectionStrings:IQRAA_dbConnectionString.ProviderName %>" SelectCommand="SELECT [email], [first_name] FROM [Temp]">
            <InsertParameters>
                <asp:ControlParameter ControlID="email_input" Name="email" PropertyName="Text" />
                <asp:ControlParameter ControlID="fname_input" Name="fname" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
