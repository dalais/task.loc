<?php
/*
 * Контроллер продуктов
 * */
include_once './models/ProductsModel.php';
include_once './models/ComsratsModel.php';

if ( ! isset($_SESSION['user'])) {
    header('Location: /');
}
/*
 * Выдает все элементы в списке с комментариями и рейтингами
 *
 * @param array $products список всех продуктов
 * @param array $comments комментарий конкретного продукта
 * @param array $ratings рейтинг конкретного продукта
 * @param int $userID идентификатор текущего пользователя
 * */
function indexAction($smarty) {

    // Получение из базы всех продуктов
    $products = getAllProducts();

    // присваиваение переменной идентификатор текущего пользователя
    $userID = isset($_SESSION['user']) ? $_SESSION['user']['id'] : null;

    // Получение всех комментариев текущего пользователя
    $comments = getComments($userID);

    // Получение всех рейтингов текущего пользователя
    $ratings = getRatings($userID);
    
    // Привязка к конктретному продукту существующего комментария
    $model = [];
    foreach ($products as $prod) {
        $prod_id = $prod['id'];
        $model[$prod_id] = $prod;

        foreach ($comments as $arr_id => $comt) {
            if ($comt['product_id'] != $prod_id) continue;
            $model[$prod_id]['comment'][] = $comt;
        }

        if (! empty($ratings)) {
            foreach ($ratings as $arr_id => $rait) {
                if ($rait['product_id'] != $prod_id) continue;
                $model[$prod_id]['rating'][] = $rait;
            }
        }
    }

    $smarty->assign('pageTitle', '');
    $smarty->assign('model', $model);

    // Загрузка шаблона
    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'list');
    loadTemplate($smarty, 'footer');

}


/*
 * Страница отдельного продукта
 *
 * @param array $product данные продукта
 * @param array $c_and_r извлекает все комментарии и рейтинги
 * данного продукта со статусом 0 (активный статус)
 * @param array $avgValue сумма и среднее значение рейтинга данного продукта
 * @param int $userID идентификатор текущего пользователя
 * */
function pgAction($smarty) {

    $itemId = isset($_GET['id']) ? $_GET['id'] : null;
    if($itemId == null) exit();

    // Получение данных продукта по идентификатору
    $product = getProductById($itemId);
    $c_and_r = getAllCommRatingsByIdProduct($itemId);
    $avg = avgValue($itemId);
    
    // Передача массива полученных данных в переменную $smarty
    $smarty->assign('pageTitle', '');
    $smarty->assign('product', $product);
    $smarty->assign('c_and_r', $c_and_r);
    $smarty->assign('avg', $avg);

    // Загрузка шаблона
    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'product');
    loadTemplate($smarty, 'footer');

}


/*
 * Функция удаления комментариев и рейтингов
 *
 * @param integer $user_id
 * @param integer $product_id
 * @param integer $label передавается значение поля status_c или status_r
 * */
function deletecomratAction() {


    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : null;
    $user_id = intval($user_id);

    $product_id = isset($_POST['product_id']) ? $_POST['product_id'] : null;
    $product_id = intval($product_id);



    // Определяем какое поле статуса установлено
    if (isset($_POST['status_c'])) {

            $label = 1;

    } elseif (isset($_POST['status_r'])) {

            $label = 2;
    } else {
            return false;
    }

    // Назначить неактивный статус строке комментария или рейтинга
    $res = removeComRat($label, $user_id, $product_id);


    if ($res) {
        header("Location: /product/");
    } else {
        exit;
    }
    return false;
}