<?php

include_once './models/UsersModel.php';
include_once './models/ProductsModel.php';
/*
 * Контроллер пользователей
 * */

/*
	AJAX регистрация пользователя
    возвращает json массив данных пользователя
*/
function loginAction() {

    $username = isset($_REQUEST['username']) ? $_REQUEST['username'] : null;
    $username = htmlspecialchars($username);

    $password = isset($_REQUEST['password']) ? $_REQUEST['password'] : null;
    $password = htmlspecialchars($password);
    

    // Присвоение переменной значения модели пользователей
    $userData = loginUser($username, $password);

    if($userData['success']) {
        $userData = $userData[0];

        $_SESSION['user'] = $userData;
        $_SESSION['user']['displayName'] = $userData['username'];

        $resData = $_SESSION['user'];
        $resData['success'] = 1;

    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Неверный логин или пароль';
    }

    echo json_encode($resData);
}


// Разлогинивание пользователя
function logoutAction() {
    if(isset($_SESSION['user'])) {
        unset($_SESSION['user']);
    }
    header('Location: /');
}