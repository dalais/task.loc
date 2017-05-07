<?php


//Константы для обращения к контроллерам
define('PathPrefix', './controllers/');
define('PathPostfix', 'Controller.php');

// используемый шаблон
$template = 'default';

// пути к файлам шаблонов (*.tpl)
define ('TemplatePrefix', "./views/{$template}/");
define ('TemplatePostfix', '.tpl');

// Пути к файлам шаблонов в вебпространстве
define ('TemplateWebPath', "/www/templates/{$template}/");

//> Инициализация шаблона Smarty
// put full path to Smarty.class.php
require('./lib/Smarty/libs/Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir(TemplatePrefix);
$smarty->setCompileDir('../tmp/smarty/templates_c');
$smarty->setCacheDir('../tmp/smarty/cache');
$smarty->setConfigDir('../lib/Smarty/configs');

$smarty->assign('templateWebPath' , TemplateWebPath);