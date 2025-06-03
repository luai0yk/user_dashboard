<?php

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "php_course";
    $dsn = "mysql:host=$servername;dbname=$dbname;charset=utf8";

    $option = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ];

    try {
        $conn = new PDO($dsn, $username, $password, $option);
        include "funs.php";
        include "messages/msg.php";

    } catch (PDOException $e) {
        die("Connection failed: " . $e->getMessage());
    }

?>