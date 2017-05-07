<?php
/*
  * Модель Продуктов
  * */

// Получить данные всех продуктов
function getAllProducts() {

    global $pdo;

    $statement = $pdo->query("SELECT * FROM products");

    $smartyRs = array();

    while ($row = $statement->fetch()) {
        $smartyRs[] = $row;
    }
    return $smartyRs;

}


// Получить данные продукта по ID
function getProductById($itemId) {

    $itemId = intval($itemId);

    global $pdo;

    $statement = $pdo->query("SELECT *
			FROM products
			WHERE id= '{$itemId}'");
    $row = $statement->fetch();
    return $row;
}

function getAllCommRatingsByIdProduct($itemId) {

    $itemId = intval($itemId);

    global $pdo;

    $statement = $pdo->query("SELECT users.username, comrat.comment, comrat.rating
            FROM comrat
            LEFT JOIN users ON users.id = comrat.user_id
            WHERE 
            comrat.product_id = '{$itemId}'
            AND(comrat.comment IS NOT NULL OR comrat.rating IS NOT NULL)");

    $smartyRs = array();

    while ($row = $statement->fetch()) {
        $smartyRs[] = $row;
    }
    return $smartyRs;

}