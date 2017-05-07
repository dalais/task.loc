{* Страница товара *}
<a href="/product/">< Назад к списку</a>
<div style="background-color: #f0ead8; width: 550px; padding: 10px; margin-top: 10px;">

    <h2>{$product['product']}</h2>

<p> Описание:<br />{$product['description']} </p>
</div>
{if ! empty($c_and_r)}
    <center><p>Отзывы и оценки</p></center>
{else}
    <p>Никто еще не оценил этот продукт</p>
{/if}
{foreach $c_and_r as $arr}

   <table>
       <tr style="height: 100px">
           <td width="100"><p>{$arr.username}</p></td>

           <td style="width: 350px;">
               {if ! empty($arr.comment)}

                       <p>{$arr.comment}</p>

               {else}
                   <font style="size: 3px; color: darkgrey">Пусто</font>
               {/if}
           </td>

           <td style="width: 40px">
               <center>
               {if ! empty($arr.rating)}
                   <font size="6"><p>{$arr.rating}</p></font>
               {else}
                       <font style="size: 3px; color: darkgrey">Не оценено</font>
               {/if}
               </center>
           </td>
       </tr>
   </table>
    <hr size="1">

{/foreach}


<br>
<br>
{if ! empty($avg['SUM(rating)'])}
<table>
    <tr>
        <td width="250">
            <p>Сумма рейтинга</p>
            <font size="6"><p>{$avg['SUM(rating)']}</p></font>
        </td>

        <td width="350">
            <p>Общий рейтинг</p>
            <font size="6"><p>{$avg['AVG(rating)']|truncate:3:""}</p></font>
        </td>
    </tr>
</table>
{else}
{/if}