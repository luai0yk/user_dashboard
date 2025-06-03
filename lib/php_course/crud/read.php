<?php

include '../connect.php';

$lang = sanitizePostInput("lang");
if (empty($lang) || !isset($messages[$lang])) {
    $lang = 'en';
}

try {
    $stmt = $conn->prepare("SELECT * FROM users");
    $stmt->execute();
    $users = $stmt->fetchAll();

    echo json_encode(array(
        "status" =>  $messages[$lang]['success'] ?? "success",
        "message" => $messages[$lang]['users_retrieved'] ?? "Users retrieved successfully.",
        "data" => $users,
    ));
} catch (PDOException $e) {
    echo json_encode([
        "status" =>  $messages[$lang]['error'] ?? "error",
        "message" => $messages[$lang]['error'] . " " . $e->getMessage(),
    ]);
}
