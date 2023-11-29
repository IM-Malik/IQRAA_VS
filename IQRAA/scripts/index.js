var singup = document.getElementById("signup_div");
var login = document.getElementById("login_div");
function open_login() {
    if (singup.style.display = "block") {
        singup.style.display = "none";
    }
    login.style.display = "block";
}

function close_login() {
    login.style.display = "none";
}
function open_signup() {
    if (login.style.display == "block") {
        login.style.display = "none";
    }
    singup.style.display = "block";
}

function close_signup() {
    document.getElementById("signup_div").style.display = "none";
    console.log(signup);
}
function show_hide_password(id) {
    var password = document.getElementById(id);
    if (password.type === "password") {
        password.type = "text";
    } else {
        password.type = "password";
    }
}

function validate_password() {
    var psw = document.getElementById("txt_psw");
    var cpsw = document.getElementById("txt_cpsw");
    if (psw.value != cpsw.value) {
        var err_match = document.getElementById("no_match_psw");
        err_match.innerText = "Passwords don't match"
        err_match.style.display = "block";
        return false;
    }
    return true;

}

async function user_login() {
    var email = document.getElementById("login_email").value;
    var psw = document.getElementById("login_psw").value;
    var userInfo_db = await fetch(`https://localhost:44313/WebService1.asmx/login_user?email=${email}&password=${psw}`);
    var userInfo_db_JSON = userInfo_db.json();
    var await_userInfo_db = await userInfo_db_JSON;
    console.log(await_userInfo_db);
    //here it should remove the login signup bottons


}

function decider(id) {
    var value = document.getElementById(id).value;
    console.log(parseInt(value));
    var list = document.getElementById("dropdownMenuButton");
    if (list.innerHTML === "Book") {
        if (!isNaN((parseInt(value)))) {
            search_book_byISBN(value);
        } else {
            search_books_byName(value);
        }
    } else if (list.innerHTML === "Community") {
        search_communities();
    }

}

async function search_books_byName(book_name) {
    book_name = book_name.trim();
    var arr_book_name = book_name.split(' ');
    book_name = arr_book_name.join('+');

    const response = await fetch(`https://localhost:44313/WebService1.asmx/FetchBooks_ByName?book_name=${book_name}`);

    var responseJSON = response.json();
    var awaitResJSON = await responseJSON;

    create_bookSearch_card(awaitResJSON);
    return awaitResJSON;
}

async function search_book_byISBN(ISBN) {
    ISBN = ISBN.trim();

    const response = await fetch(`https://localhost:44313/WebService1.asmx/FetchBook?ISBN=${ISBN}`);

    var responseJSON = response.json();
    var awaitResJSON = await responseJSON;

    create_bookSearch_card(awaitResJSON);
    return awaitResJSON;
}

function search_communities() {

}
function create_bookSearch_card(response) {
    sessionStorage.setItem("ISBN13", response.ISBN_13);
    sessionStorage.setItem("author", response.author);
    sessionStorage.setItem("coverM", response.cover_medium);
    sessionStorage.setItem("pages", response.num_of_pages);
    sessionStorage.setItem("title", response.title);
    window.open("../pages/BookSearch.aspx");
}
function change(id) {
    var list = document.getElementById("dropdownMenuButton");
    var book_item = document.getElementById("book_item");
    var community_item = document.getElementById("community_item");
    console.log(list);
    if (id === 'book_item') {
        list.innerHTML = "Book";
        book_item.style.display = "none";
        community_item.style.display = "block";
    } else {
        list.innerHTML = "Community";
        book_item.style.display = "block";
        community_item.style.display = "none";
    }
}

function login_before_booklist () {
    
}