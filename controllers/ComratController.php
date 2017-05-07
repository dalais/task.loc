<?php

/*
 * Комплексный контроллер рейтингов и комментариев
 * */
include_once './models/ComsratsModel.php';

if ( ! isset($_SESSION['user'])) {
    header('Location: /');
}


function addcommAction() {
    if (! empty($_POST['comment'])) {

        $content = isset($_POST['comment']) ? $_POST['comment'] : null;
        $content = htmlspecialchars($content);

        $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : null;
        $user_id = intval($user_id);

        $product_id = isset($_POST['product_id']) ? $_POST['product_id'] : null;
        $product_id = intval($product_id);

    } else {
        return false;
    }

    // Запись данных в БД
    $result = insertComment($content, $user_id, $product_id);


    if ($result) {

        header("Location: /product/");
    }else{
        exit;
    }
}

function addratAction() {
    if (! empty($_POST['rating'])) {
        $ratingValue = isset($_POST['rating']) ? $_POST['rating'] : null;
        $ratingValue = intval($ratingValue);

        $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : null;
        $user_id = intval($user_id);

        $product_id = isset($_POST['product_id']) ? $_POST['product_id'] : null;
        $product_id = intval($product_id);
    } else {
        return false;
    }

    // Запись данных в БД
    $result = insertRating($ratingValue, $user_id, $product_id);


    if ($result) {
        header("Location: /product/");
    }else{
        exit;
    }
}