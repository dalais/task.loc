<html>
<head>
    <title>{$pageTitle}</title>
    <link rel="stylesheet" href="{$templateWebPath}css/main.css" type="text/css" />
    <script type="text/javascript" src="/www/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/www/js/main.js"></script>
</head>
<body>
<div id="header">
    {if isset($authUser)}
        <h1><a href="/">Главная</a></h1>
    {else}
    {/if}
</div>
{include file="leftcolum.tpl"}

<div id="centerColumn">