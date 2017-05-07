<?php
/* Smarty version 3.1.30, created on 2017-04-19 09:33:44
  from "D:\OpenServer\domains\task.loc\views\default\header.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_58f6cc883d8d54_09134618',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c7c2b2f14a127ed5ef2409cca9362f779f87cf92' => 
    array (
      0 => 'D:\\OpenServer\\domains\\task.loc\\views\\default\\header.tpl',
      1 => 1492568950,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:leftcolum.tpl' => 1,
  ),
),false)) {
function content_58f6cc883d8d54_09134618 (Smarty_Internal_Template $_smarty_tpl) {
?>
<html>
<head>
    <title><?php echo $_smarty_tpl->tpl_vars['pageTitle']->value;?>
</title>
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['templateWebPath']->value;?>
css/main.css" type="text/css" />
    <?php echo '<script'; ?>
 type="text/javascript" src="/js/jquery-3.2.1.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 type="text/javascript" src="/js/main.js"><?php echo '</script'; ?>
>
</head>
<body>
<div id="header">
    <h1><a href="/">Главная</a></h1>
</div>
<?php $_smarty_tpl->_subTemplateRender("file:leftcolum.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>


<div id="centerColumn"><?php }
}
