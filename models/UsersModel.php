<?php

/*
 * Модель для таблицы ползователей
 * */

//Извлечение данных пользователя
function loginUser($username, $password) {
    $username = htmlspecialchars($username);
    $password = htmlspecialchars($password);

    global $pdo;

    $statement = $pdo->query("SELECT * FROM users
			WHERE username = '$username' AND password = '$password'");

    $rs = $statement->fetchAll();

    if (isset($rs[0])) {
        $rs['success'] = 1;
    } else {
        $rs['success'] = 0;
    }

    return $rs;
}