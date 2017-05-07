//Запрет ввода в поле пробела и символа табуляции
function keyDown(e){
    var position = 'selectionStart' in this ?
        this.selectionStart :
        Math.abs(document.selection.createRange().moveStart('character', -input.value.length)); //ie<9
    if(e.keyCode === 32 && position === 0) return false
}

/*
 Авторизация пользователя
 */
function login() {
    var username = $('#loginEmail').val();
    var password   = $('#loginPwd').val();

    var postData = "username="+ username +"&password=" +password;

    $.ajax ({
        type: 'POST',
        async: false,
        url: "/user/login/",
        data: postData,
        dataType: 'json',
        success: function(data) {
            if (data['success']) {
                window.location.reload('task.loc/');
                $('#userLink').html(data['displayName']);
                $('#userBox').show();
            }
        }
    });
}
