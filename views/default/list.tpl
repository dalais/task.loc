{foreach $model as $item}

    <div style="background-color: beige; width: 550px; padding: 10px;">
    <h3><a href="/product/pg/{$item.id}/">{$item.product}</a></h3>
    </div>

    <div id="comraitBlock">
        <div style="width: 1000%">
        <div class="blockComment">
        {if isset($item.comment)}

            {foreach $item.comment as $comt}
                <div id="issetComment">
                    <p class="commented">Ваш комментарий</p>
                    <p>{$comt.comment}</p><br><br>

                        <form class="deleteComment" name="delete" action="/product/deletecomrat/" method="post">
                            <p>
                                <input id="userId" type="hidden" name="user_id" value="{$authUser.id}" />
                                <input id="productId" type="hidden" name="product_id" value="{$item.id}" />
                                <input id="statusC" type="hidden" name="status_c" value="1" />
                            <hr>
                                <input type="submit" value="Удалить" />
                            </p>
                        </form>
                </div>
            {/foreach}

        {else}
            <div id="blockNewComment">
                <form id="formComment" name="comment" action="/comrat/addcomm/" method="post">
                    <p>
                        <label>Добавить комментарий:</label>
                        <br>
                        <textarea id="contentComm"
                                  onkeydown="return keyDown.call(this,event)"
                                  onchange="value = value.replace(/^\s+/,'')"
                                  required name="comment" cols="30" rows="3"></textarea>
                    </p>
                    <p>
                        <input id="userId" type="hidden" name="user_id" value="{$authUser.id}" />
                        <input id="productId" type="hidden" name="product_id" value="{$item.id}" />
                        <input type="submit" value="Отправить" />
                    </p>
                </form>
            </div>
        {/if}
        </div>
        <div id="blockRait">
        {if isset($item.rating)}

            {foreach $item.rating as $rait}
                <p class="commented">Оценка</p>
                <p><font size="6">{$rait.rating}</font></p>
                <form class="deleteRating" name="delete" action="/product/deletecomrat/" method="post">
                    <p>
                        <input id="userId" type="hidden" name="user_id" value="{$authUser.id}" />
                        <input id="productId" type="hidden" name="product_id" value="{$item.id}" />
                        <input id="statusR" type="hidden" name="status_r" value="2" />
                    <hr>
                        <input type="submit" value="Удалить" />
                    </p>
                </form>

            {/foreach}
        {else}
            <div id="blockNewRait">
                <form id="formRating" name="rating" action="/comrat/addrat/" method="post">
                    <p>
                        <label>Оценить:</label>
                        <br>
                        <select id="ratingValue" required name="rating">
                            <option value=""></option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </p>
                    <p>
                        <input id="userId" type="hidden" name="user_id" value="{$authUser.id}" />
                        <input id="productId" type="hidden" name="product_id" value="{$item.id}" />
                        <input type="submit" value="Оценить" />
                    </p>
                </form>
            </div>
        {/if}
        </div>
        </div>
    </div>
    <br>
    <br>
{/foreach}