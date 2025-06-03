<?php

include "../connect.php";

// Set language
$lang = sanitizePostInput("lang");
if (empty($lang) || !isset($messages[$lang])) {
    $lang = 'en';
}

// Validate and sanitize input
$id = sanitizePostInput("id");
$name = sanitizePostInput("name");
$age = sanitizePostInput("age");

// Validation
if (empty($id)) {
    echo json_encode([
        "status" =>  $messages[$lang]['error'] ?? "error",
        "message" => $messages[$lang]['missing_id'] ?? "User ID is required.",
    ]);
    exit;
}
if (empty($name)) {
    echo json_encode([
        "status" =>  $messages[$lang]['error'] ?? "error",
        "message" => $messages[$lang]['missing_name'] ?? "Name is required.",
    ]);
    exit;
}
if (empty($age)) {
    echo json_encode([
        "status" =>  $messages[$lang]['error'] ?? "error",
        "message" => $messages[$lang]['missing_age'] ?? "Age is required.",
    ]);
    exit;
}
if (!is_numeric($age) || $age < 0) {
    echo json_encode([
        "status" =>  $messages[$lang]['error'] ?? "error",
        "message" => $messages[$lang]['invalid_age'] ?? "Invalid age value.",
    ]);
    exit;
}

try {
    $stmt = $conn->prepare(
        "UPDATE `users` SET `name`= :name, `age`= :age WHERE `id` = :id"
    );
    $stmt->execute([
        ':name' => $name,
        ':age' => $age,
        ':id' => $id
    ]);

    if ($stmt->rowCount() > 0) {
        echo json_encode([
            'status' =>  $messages[$lang]['success'] ?? "success",
            'message' => $messages[$lang]['update_sucess'] ?? "User updated successfully."
        ]);
    } else {
        echo json_encode(['status' => 'error', 'message' => $messages[$lang]['update_failed']]);
    }
} catch (\PDOException $e) {
    if ($e->getCode() == 23000) {
        echo json_encode([
            "status" =>  $messages[$lang]['error'] ?? "error",
            "message" => $messages[$lang]['duplicate'],
        ]);
    } elseif ($e->getCode() == '42S22') { // Column not found
        echo json_encode([
            "status" =>  $messages[$lang]['error'] ?? "error",
            "message" => $messages[$lang]['update_column_not_found'],
        ]);
    } elseif ($e->getCode() == '42S02') { // Table not found
        echo json_encode([
            "status" =>  $messages[$lang]['error'] ?? "error",
            "message" => $messages[$lang]['update_table_not_found'],
        ]);
    } elseif ($e->getCode() == 'HY093') { // Invalid parameter number
        echo json_encode([
            "status" =>  $messages[$lang]['error'] ?? "error",
            "message" => $messages[$lang]['update_invalid_param'],
        ]);
    } else {
        echo json_encode([
            "status" =>  $messages[$lang]['error'] ?? "error",
            "message" => $messages[$lang]['update_unknown_error'] . " " . $e->getMessage(),
        ]);
    }
}
