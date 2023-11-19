var carouselIdCounter = 13;
var addBookForm = ''
var progressValue = 0;
//var glo_book;
async function openAddBookModal_fetchBook(ISBN) {
    return Promise.resolve().then(v => {
        return fetch_book(ISBN);
    })
}

function add_book(carousel_id) {
    $('#addBookModal').modal('show');
    $('#saveBookISBN').off('click').click(async function () {
        var ISBN = $('#bookISBN').val();
        if (ISBN == '') {
            alert("The ISBN cannot be empty");
        } else {
            $('#addBookModal').modal('hide');
            var book = await openAddBookModal_fetchBook(ISBN);
            //glo_book = book;
            console.log(book);
            var num_of_pages = book.num_of_pages;
            console.log(num_of_pages);

            document.getElementById("bookProgress").setAttribute("max", num_of_pages);
            var num_pages_span = document.createElement("span");
            num_pages_span.innerHTML = num_of_pages;
            document.getElementById("book_progress_form").appendChild(num_pages_span);

            //setTimeout(async function () {
            var book_pic = book.cover_medium
            if (progressValue > num_of_pages) {
                alert("The progress value cannot be greater than the number of pages");
                add_book(carousel_id);
            } else {
                var percentage = (progressValue / num_of_pages) * 100;
                var cards = num_of_cards(carousel_id);
                var carousel = document.getElementById(carousel_id);
                var slide = carousel.getElementsByClassName("active");

                if (cards % 7 == 0) {
                    cards = cards + 1;
                    add_slide(carousel, carousel_id);

                    slide[0].removeAttribute("id");
                    slide[0].classList.remove("active");
                    var new_card1 = create_book(carousel_id, book_pic, percentage);

                    slide = carousel.getElementsByClassName("active");
                    slide[0].appendChild(new_card1);
                } else {
                    var new_card = create_book(carousel_id, book_pic, percentage);
                    var sample = document.getElementById("sample_" + carousel_id);
                    sample.style.display = "none";
                    //slide is the page/item in the carousel
                    slide[0].appendChild(new_card);
                }
            }
            //}, 5000);



        }
        $('#bookISBN').val('');

    });
}

function num_of_cards(carousel_id) {
    var parent = document.getElementById(carousel_id);
    var num_of_items = parent.getElementsByClassName("card");
    return num_of_items.length;
}


function add_slide(carousel, carousel_id) {
    var new_slide = document.createElement("div");
    new_slide.setAttribute("class", "item");
    new_slide.classList.add("active");

    add_indicator(carousel_id + "_indicators");


    carousel.appendChild(new_slide);
}


function create_book(carousel_id, pic_url, percentage) {

    var new_card = document.createElement("div");
    new_card.setAttribute("class", "card");

    var image = document.createElement("img");
    image.setAttribute("src", pic_url);
    image.setAttribute("class", "BookPicSlider")
    image.style.width = "150px";
    image.style.height = "225px";


    new_card.appendChild(image);

    if (carousel_id == "currentRead") {
        var progress_bar = document.createElement("div");
        progress_bar.setAttribute("class", "progress");

        var finish_progress_bar = document.createElement("div");
        finish_progress_bar.setAttribute("class", "progress-bar");
        finish_progress_bar.setAttribute("id", "progress_bar_green");
        finish_progress_bar.setAttribute("onclick", "edit_progress()");


        finish_progress_bar.setAttribute("style", "width:" + Math.floor(percentage) + "%; cursor: pointer;");
        finish_progress_bar.innerHTML = Math.floor(percentage) + "%";

        progress_bar.appendChild(finish_progress_bar);

        new_card.appendChild(progress_bar);
    } else if (carousel_id == "wishlist") {
        new_card.appendChild(document.createElement("br"));
        var center_btn = document.createElement("center");
        var buy_button = document.createElement("button");
        buy_button.setAttribute("class", "buyBtn");
        buy_button.innerHTML = "Click to Buy";
        center_btn.appendChild(buy_button);

        new_card.appendChild(center_btn);

    } else if (carousel_id == "Finished") {
        new_card.setAttribute("style", "margin-bottom: 30px;")
    } else {
        new_card.setAttribute("style", "margin-bottom: 30px;")
    }
    return new_card;
}


function add_indicator(indicator_id) {
    var indicator_list = document.getElementById(indicator_id);
    var old_indicator = indicator_list.getElementsByClassName("active");
    var indicator_num = old_indicator[0].id;
    indicator_num++;
    var new_indicator = document.createElement("li");
    new_indicator.setAttribute("data-target", "#myCarousel");
    new_indicator.setAttribute("data-slide-to", indicator_num);
    new_indicator.setAttribute("id", indicator_num);
    old_indicator[0].classList.remove("active");
    new_indicator.setAttribute("class", "active");
    indicator_list.appendChild(new_indicator);
    indicator_num++;
}


function add_custom_carousel() {
    $('#customListModal').modal('show');

    $('#saveListName').off('click').click(function () {
        var name = $('#listName').val();
        if (name == '' || document.getElementById("myCarousel" + name) != null) {
            alert("This name has already been taken, please choose another name");
        } else {
            $('#customListModal').modal('hide');


            var new_carousel = document.createElement("div");
            new_carousel.setAttribute("class", "carousel slide");
            new_carousel.setAttribute("id", "myCarousel" + name);
            new_carousel.setAttribute("data-interval", "false");

            var new_carousel_ol = document.createElement("ol");
            new_carousel_ol.setAttribute("class", "carousel-indicators");
            new_carousel_ol.setAttribute("id", "myCarousel" + (carouselIdCounter) + "_indicators");

            var new_carousel_ol_li = document.createElement("li");
            new_carousel_ol_li.setAttribute("data-target", "#myCarousel" + (carouselIdCounter));
            new_carousel_ol_li.setAttribute("class", "active");

            new_carousel_ol.appendChild(new_carousel_ol_li);
            new_carousel.appendChild(new_carousel_ol);

            var new_carousel_label = document.createElement("label");
            new_carousel_label.setAttribute("class", "labels");
            new_carousel_label.setAttribute("for", "myCarousel" + (carouselIdCounter));
            new_carousel_label.innerHTML = name;

            new_carousel.appendChild(new_carousel_label);

            var new_carousel_add_btn = document.createElement("a");
            new_carousel_add_btn.setAttribute("class", "aBtn effect6");
            new_carousel_add_btn.setAttribute("onclick", "add_book('myCarousel" + (carouselIdCounter) + "')");
            new_carousel_add_btn.innerHTML = "<i>+</i>";

            new_carousel.appendChild(new_carousel_add_btn);

            var new_carousel_inner_carousel = document.createElement("div");
            new_carousel_inner_carousel.setAttribute("class", "carousel-inner");
            new_carousel_inner_carousel.setAttribute("id", "myCarousel" + (carouselIdCounter));

            var new_carousel_first_slide = document.createElement("div");
            new_carousel_first_slide.setAttribute("class", "item active");

            var new_carousel_first_card = document.createElement("div");
            new_carousel_first_card.setAttribute("class", "card");
            new_carousel_first_card.setAttribute("id", "sample_myCarousel" + carouselIdCounter)
            new_carousel_first_card.setAttribute("style", "margin-bottom: 30px;");
            new_carousel_first_card.innerHTML = '<div class="samplePic">Sample Book</div>';

            new_carousel_first_slide.appendChild(new_carousel_first_card);
            new_carousel_inner_carousel.appendChild(new_carousel_first_slide);
            new_carousel.appendChild(new_carousel_inner_carousel);
            var left_carousel_control = document.createElement("a");
            left_carousel_control.setAttribute("class", "left carousel-control");
            left_carousel_control.setAttribute("href", "#myCarousel" + (name));
            left_carousel_control.setAttribute("data-slide", "prev");

            var span_left = document.createElement("span");
            span_left.setAttribute("class", "glyphicon glyphicon-chevron-left");
            left_carousel_control.appendChild(span_left);
            var span_left_sr = document.createElement("span");
            span_left_sr.setAttribute("class", "sr-only");

            left_carousel_control.appendChild(span_left_sr);
            new_carousel.appendChild(left_carousel_control);

            var right_carousel_control = document.createElement("a");
            right_carousel_control.setAttribute("class", "right carousel-control");
            right_carousel_control.setAttribute("href", "#myCarousel" + (name));
            right_carousel_control.setAttribute("data-slide", "next");

            var span_right = document.createElement("span");
            span_right.setAttribute("class", "glyphicon glyphicon-chevron-right");
            right_carousel_control.appendChild(span_right);
            var span_right_sr = document.createElement("span");
            span_right_sr.setAttribute("class", "sr-only");

            right_carousel_control.appendChild(span_right_sr);
            new_carousel.appendChild(right_carousel_control);
            carouselIdCounter++;
            document.getElementById("customLists").appendChild(new_carousel);
        }
        $('#listName').val('');
    });

}

async function fetch_book(ISBN) {
    //const response = await fetch(`https://openlibrary.org/api/books?bibkeys=ISBN:${ISBN}&jscmd=data&format=json`)
    const response = await fetch(`https://localhost:44313/WebService1.asmx/FetchBook?ISBN=9780312944926`);
    //JSON.stringify(response);

    var responseJson = response.json();
    
    var rspJson = await responseJson;
    console.log(rspJson);
    console.log(responseJson.ISBN_13)
    
    
    

    return rspJson;

}

function getProgressValue() {
    const value = document.getElementById('bookProgress').value;
    progressValue = value;
}

function edit_progress() {
    $('#edit_book_progress').modal('show');
    $('#saveProgressGreen').off('click').click();
}
