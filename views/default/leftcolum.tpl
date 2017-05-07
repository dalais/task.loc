{* Левый столбец *}

<div id="leftColumn">
    {if isset($authUser)}
        <div id="userBox">
            <font size="5">{$authUser['displayName']}</font>
            <br>
            <br>
            <a href="/user/logout/">Выход</a>
        </div>
    {else}
        <div id="loginBox">
            <div class="menuCaption">Вход</div>
            <input type="text" id="loginEmail" required="required" name="loginEmail" value=""/><br /><br />
            <input type="password" id="loginPwd" required="required" name="loginPwd" value=""/><br />
            <input type="button" onclick="login();" value="Войти"/>
        </div>
    {/if}
</div>