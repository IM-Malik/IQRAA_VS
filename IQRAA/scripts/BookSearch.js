
function create_book_card() {
    var coverM = sessionStorage.getItem("coverM");
    var title = sessionStorage.getItem("title");
    var author = sessionStorage.getItem("author"); 
    var isbn_13 = sessionStorage.getItem("ISBN13");
    var pages = sessionStorage.getItem("pages");
    
    var card_div = document.createElement("div");
    card_div.setAttribute("class", "card mb-3");

    var row_div = document.createElement("div");
    row_div.setAttribute("class", "row g-0");

    var col_div = document.createElement("div");
    col_div.setAttribute("class", "col-md-4");
    col_div.style.width = "150px";
    col_div.style.height = "225px";
    col_div.style.marginLeft = "5px";

    var card_img = document.createElement("img");
    card_img.setAttribute("class", "card-img")
    card_img.setAttribute("src", coverM);

    var card_content = document.createElement("div");//card_column
    card_content.setAttribute("class", "col-md-8");
    card_content.style.width = "73rem";
    card_content.style.height = "fit-content";
    //console.log(card_content);

    var card_body = document.createElement("div");
    card_body.setAttribute("class", "card-body");

    var card_header = document.createElement("h5");
    card_header.setAttribute("class", "card-title");
    card_header.innerHTML = title;

    var card_text = document.createElement("p");
    card_text.setAttribute("class", "card-text");
    card_text.innerHTML = "Guy Montag is a fireman.His job is to destroy the most illegal of commodities, the printed book, along with the houses in which they are hidden.Montag never questions the destruction and ruin his actions produce, returning each day to his bland life and wife, Mildred, who spends all day with her television 'family.' But when he meets an eccentric young neighbor, Clarisse, who introduces him to a past where people didn't live in fear and to a present where one sees the world through the ideas in books instead of the mindless chatter of television, Montag begins to question everything he has ever known.";

    var card_small = document.createElement("small");
    card_small.setAttribute("class", "muted");
    card_small.innerHTML = "by " + author + "<br />ISBN-13 " + isbn_13 + "<br />" + pages + " pages";

    card_body.appendChild(card_header);
    card_body.appendChild(card_text);
    card_body.appendChild(card_small);

    card_content.appendChild(card_body);

    col_div.appendChild(card_img);

    row_div.appendChild(col_div);
    row_div.appendChild(card_content);

    card_div.appendChild(row_div);

    var bod = document.body;

    bod.insertBefore(card_div, bod.firstChild);



}