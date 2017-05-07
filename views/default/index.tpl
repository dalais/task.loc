{* Шаблон главной страницы *}

{if isset($authUser)}
        <h3>Здравствуйте, {$authUser['displayName']}!</h3><br/>
        <p><a href="/product/">К списку продуктов -></a></p>
{else}

    <h3>Для входа в систему авторизуйтесь.</h3>
{/if}