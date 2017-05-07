<?php

/*
	Конроллер главной страницы
*/


//Формирование главной страницы
function indexAction($smarty){

    $smarty->assign('pageTitle', 'Главная страница сайта');

    // Загрузка шаблона
    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'index');
    loadTemplate($smarty, 'footer');

}