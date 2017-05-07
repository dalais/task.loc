<?php

/*
	Основные функции
*/


//функция загрузки страницы
function loadPage($smarty, $controllerName, $actionName='index'){
    include_once PathPrefix . $controllerName . PathPostfix;

    $function = $actionName . 'Action';
    $function($smarty);
}

/**
 * Загрузка шаблона
 */
function loadTemplate($smarty, $templateName){
    $smarty->display($templateName . TemplatePostfix);
}


/**
 * Функция отладки. Останавливает работу программ выводя значение переменной
 * $value
 */
function d($value = null, $die = 1){
    echo 'Debug: <br /> <pre>';
    print_r($value);
    echo '</pre>';

    if ($die) die;
}