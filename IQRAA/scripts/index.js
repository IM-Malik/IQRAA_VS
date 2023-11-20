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