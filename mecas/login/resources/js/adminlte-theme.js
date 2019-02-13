
$(function () {

    // turn all checkboxs into iCheck boxes
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%'
    });
});

// when a new language is selected, redirect to the language's page
function languageSelected() {
    var redirectUrl = $('#language-picker-dropdown').val();
    window.location.href = redirectUrl;
}

function isValidPassword(password) {
    var regex = new RegExp('^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}$');

    if(regex.test(password)) {
        this.removeErrorMessage('formGroupPassword');
    } else {
        this.addErrorMessage('formGroupPassword');
    }
}

function isSamePassword(passwordConfirm) {
    var password = document.getElementById('password').value;

    if(password === passwordConfirm) {
        this.removeErrorMessage('formGroupPasswordConfirm')
    } else {
        this.addErrorMessage('formGroupPasswordConfirm');
    }
}

function removeErrorMessage(id) {
    document.getElementById(id).classList.remove('has-error');
}

function addErrorMessage(id) {
    document.getElementById(id).classList.add('has-error');
}
