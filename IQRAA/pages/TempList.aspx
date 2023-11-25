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
        <asp:Label ID="lbl_author" Style="margin-left: 40px;" runat="server" Text="Label"></asp:Label><br />
        <asp:Label ID="lbl_pages" Style="margin-left: 40px;" runat="server" Text="Label"></asp:Label><br />
        <asp:Label ID="lbl_isbn13" Style="margin-left: 40px;" runat="server" Text="Label"></asp:Label><br />
    </form>
</body>
</html>
