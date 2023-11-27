<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookSearch.aspx.cs" Inherits="IQRAA.pages.BookSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Search</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../styles/BookSearch.css"/>
    <script src="../scripts/BookSearch.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        </form>
        <div class="card mb-3" onclick="k()">
        <div class="row g-0">
          <div class="col-md-4" style="width: 150px; height: 225px; margin-left: 5px;">
            <img src="../media/images/download.png" class="card-img" alt="..."/>
          </div>
          <div class="col-md-8" style="width: 73rem; height: fit-content;">
            <div class="card-body">
              <h5 class="card-title">Fahrenheit 451</h5>
              <p class="card-text">Guy Montag is a fireman. His job is to destroy the most illegal of commodities, the printed book, along with the houses in which they are hidden. Montag never questions the destruction and ruin his actions produce, returning each day to his bland life and wife, Mildred, who spends all day with her television "family." But when he meets an eccentric young neighbor, Clarisse, who introduces him to a past where people didn't live in fear and to a present where one sees the world through the ideas in books instead of the mindless chatter of television, Montag begins to question everything he has ever known.</p>
              <small class="muted">by Ray Bradbury<br/>ISBN 9781451673319<br/>256 pages</small>
            </div>
          </div>
        </div>
      </div>

      <!--<div class="card mb-3">
        <div class="row g-0">
          <div class="col-md-4" style="width: 150px; height: 225px; margin-left: 5px;">
            <img src="../media/images/download.png" class="card-img" alt="..."/>
          </div>
          <div class="col-md-8" style="width: 73rem; height: fit-content;">
            <div class="card-body">
              <h5 class="card-title">Fahrenheit 451</h5>
              <p class="card-text">Guy Montag is a fireman. His job is to destroy the most illegal of commodities, the printed book, along with the houses in which they are hidden. Montag never questions the destruction and ruin his actions produce, returning each day to his bland life and wife, Mildred, who spends all day with her television "family." But when he meets an eccentric young neighbor, Clarisse, who introduces him to a past where people didn't live in fear and to a present where one sees the world through the ideas in books instead of the mindless chatter of television, Montag begins to question everything he has ever known.</p>
              <small class="muted">by Ray Bradbury<br/>ISBN 9781451673319<br/>256 pages</small>
            </div>
          </div>
        </div>
      </div>-->
    
</body>
</html>
