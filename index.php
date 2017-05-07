<?php

session_start();

// Вывод ошибок
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

include_once './config/config.php';
include_once './config/db.php';
include_once './lib/mainFunctions.php';


//Определение контроллера
$controllerName = isset($_GET['controller']) ? ucfirst($_GET['controller']) : 'Index';

//Определение action контроллера
$actionName = isset($_GET['action']) ? $_GET['action'] : 'index';

// если в сессии есть данные об авторизованном пользователе, то передаем
// их в шаблон
if (isset($_SESSION['user'])) {
    $smarty->assign('authUser', $_SESSION['user']);
}

//Загрузка шаблонизированной страницы
loadPage($smarty, $controllerName, $actionName);