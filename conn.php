<?php
    $dsn = 'mysql:dbname=iot;host=127.0.0.1';
    $user="";
    $pass="";
    try {
        $pdo=new PDO($dsn, $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("ERROR: Couldn't connect". $e->getMessage());
    }
?>