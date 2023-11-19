var singup = document.getElementById("signup_form");
var login = document.getElementById("login_form");
function open_login() {
    signup.removeAttribute("runat");
    login.setAttribute("runat", "server");
    if (singup.style.display = "block") {
        singup.style.display = "none";
    }
    login.style.display = "block";
}

function close_login() {
    login.style.display = "none";
}

function open_signup() {
    login.removeAttribute("runat");
    signup.setAttribute("runat", "server");
    if (login.style.display == "block") {
        login.style.display = "none";
    }
    singup.style.display = "block";
}

function close_signup() {
    signup.style.display = "none";
}

function show_hide_password(id) {
    var password = document.getElementById(id);
    console.log(password.type);
    if (password.type === "password") {
        password.type = "text";
    } else {
        password.type = "password";
    }
}