<?php

include '../connect.php';

$lang = sanitizePostInput("lang");
if (empty($lang) || !isset($messages[$lang])) {
    $lang = 'en';
}

$id = sanitizePostInput("id");

if (empty($id)) {
    echo json_encode([
        "status" =>  $messages[$lang]['error'] ?? "error",
        "message" => $messages[$lang]['missing_id'] ?? "User ID is required.",
    ]);
    exit;
}

try {
    $stmt = $conn->prepare("DELETE FROM users WHERE `id` = :id");
    $stmt->execute([
        ':id' => $id,
    ]);

    if($stmt->rowCount() > 0) {
        echo json_encode(array(
            'status' =>  $messages[$lang]['success'] ?? "success",
            'message' => $messages[$lang]['delete_success']
        ));
    } else {
        echo json_encode(array(
            'status' =>  $messages[$lang]['error'] ?? "error",
            'message' => $messages[$lang]['delete_failed']
        ));
    }
} catch (\PDOException $e) {
    echo json_encode([
        "status" =>  $messages[$lang]['error'] ?? "error",
        "message" => $messages[$lang]['error'] . " " . $e->getMessage(),
    ]);
}
