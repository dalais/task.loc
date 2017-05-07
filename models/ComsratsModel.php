<?php

/*
 * Модель комментариев и рейтингов
 * */

function getComments($userID) {
    $userID = intval($userID);

    global $pdo;

    $statement = $pdo->query("SELECT comment, user_id, product_id
			FROM comrat
			WHERE user_id= '{$userID}' AND status_c=0");

    $smartyRs = [];

    while ($row = $statement->fetch()) {
        $smartyRs[] = $row;
    }
    return $smartyRs;
}



// Добавление комментария
function insertComment($contentComm, $userId, $productId) {

    global $pdo;

    $statement = $pdo->prepare("INSERT INTO comrat 
SET comment = :comment, user_id = :user_id, product_id = :product_id, status_c = 0
              ON DUPLICATE KEY UPDATE comment = :comment, status_c = 0");

    $statement->bindParam(':comment', $contentComm);
    $statement->bindParam(':user_id', $userId);
    $statement->bindParam(':product_id', $productId);

    $rs = $statement->execute();

    return $rs;
}



function getRatings($userID) {

    $userID = intval($userID);

    global $pdo;

    $statement = $pdo->query("SELECT rating, user_id, product_id
			FROM comrat
			WHERE user_id= '{$userID}' AND status_r=0");

    $smartyRs = [];

    while ($row = $statement->fetch()) {
        $smartyRs[] = $row;
    }
    return $smartyRs;

}


function insertRating($ratingValue, $userId, $productId) {

    global $pdo;

    $statement = $pdo->prepare("INSERT INTO comrat 
SET rating = :rating, user_id = :user_id, product_id = :product_id, status_r = 0
              ON DUPLICATE KEY UPDATE rating = :rating, status_r = 0");

    $statement->bindParam(':rating', $ratingValue);
    $statement->bindParam(':user_id', $userId);
    $statement->bindParam(':product_id', $productId);

    $rs = $statement->execute();

    return $rs;
}


function removeComRat($tableId, $userId, $productId) {

    global $pdo;

    $tableId = intval($tableId);

    // В зависимости от передаваемого значения в $tableId
    // выполняем тот или иной запрос
    if ($tableId == 1) {
        $statement = $pdo->prepare("INSERT INTO comrat 
           SET user_id = :user_id, product_id = :product_id
                  ON DUPLICATE KEY UPDATE status_c = NULL, comment = NULL");
    } elseif ($tableId == 2) {
        $statement = $pdo->prepare("INSERT INTO comrat 
           SET user_id = :user_id, product_id = :product_id
                  ON DUPLICATE KEY UPDATE status_r = NULL, rating = NULL");
    } else {
        return false;
    }
    $statement->bindParam(':user_id', $userId);
    $statement->bindParam(':product_id', $productId);
    $rs = $statement->execute();

    return $rs;
}

// Подсчет суммы и среднего значения рейтингов
// по идентификатору продукта
function avgValue($itemId) {

    $itemId = intval($itemId);

    global $pdo;

    $statement = $pdo->query("SELECT SUM(rating), AVG(rating)
    FROM comrat
    WHERE `status_r` = 0 AND product_id = '{$itemId}'");
    $row = $statement->fetch();
    return $row;
}