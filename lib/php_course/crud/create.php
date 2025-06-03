<?php

include '../connect.php';

$lang = sanitizePostInput("lang");
if (empty($lang) || !isset($messages[$lang])) {
    $lang = 'en';
}

$name = sanitizePostInput("name");
$age  = sanitizePostInput("age");

// Validation
if (empty($name)) {
    echo json_encode([
        "status" => $messages[$lang]['error'] ?? "error",
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
    $stmt = $conn->prepare("INSERT INTO `users`( `name`, `age`) VALUES (:user,:age)");
    $stmt->execute(array(":user" => $name, ":age" => $age));

    echo json_encode([
        "status" =>  $messages[$lang]['success'] ?? "success",
        "message" => $messages[$lang]['add_success'] ?? "User added successfully",
    ]);
} catch (\PDOException $e) {
    if ($e->getCode() == 23000) {
        echo json_encode([
            "status" =>  $messages[$lang]['error'] ?? "error",
            "message" => $messages[$lang]['duplicate'],
        ]);
    } else {
        echo json_encode([
            "status" =>  $messages[$lang]['error'] ?? "error",
            "message" => $messages[$lang]['error'] . " " . $e->getMessage(),
        ]);
    }
}
