function open_login() {
    if (document.getElementById("signup_form").style.display = "block") {
        document.getElementById("signup_form").style.display = "none";
    }
    document.getElementById("login_form").style.display = "block";
}

function close_login() {
    document.getElementById("login_form").style.display = "none";
}  

function open_signup() {
    if (document.getElementById("login_form").style.display == "block") {
        document.getElementById("login_form").style.display = "none";
    }
    document.getElementById("signup_form").style.display = "block";
}

function close_signup() {
    document.getElementById("signup_form").style.display = "none";
}  