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

function decider(id) {
    var value = document.getElementById(id).value;
    console.log(parseInt(value));
    if (!isNaN((parseInt(value)))) {
        search_book_byISBN(value);
    } else {
        search_books_byName(value);
    }
    
}

async function search_books_byName(book_name) {
    //var book_name = document.getElementById(id).value;
    book_name = book_name.trim();
    //console.log(book_name);
    var arr_book_name = book_name.split(' ');
    book_name = arr_book_name.join('+');
    //console.log(book_name);
    const response = await fetch(`https://localhost:44313/WebService1.asmx/FetchBooks_ByName?book_name=${book_name}`);
    var responseJSON = response.json();
    var awaitResJSON = await responseJSON;
    console.log(awaitResJSON);
    return awaitResJSON;
}

async function search_book_byISBN(ISBN) {
    //var ISBN = Number(document.getElementById(id).value);
    //console.log(typeof ISBN);
    const response = await fetch(`https://localhost:44313/WebService1.asmx/FetchBook?ISBN=${ISBN}`);
    //const response = await fetch(`https://openlibrary.org/api/books?bibkeys=ISBN:9780312944926&jscmd=data&format=json`);
    var responseJSON = response.json();
    var awaitResJSON = await responseJSON;

    console.log(awaitResJSON);
    return awaitResJSON;
}

function search_communities() {

}