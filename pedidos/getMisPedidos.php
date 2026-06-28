<?php
    // Inicia la sesion
    session_start();

    // Tomamos el id del usuario logueado
    $id_usuario = $_SESSION["id_usuario"];

    // Incluimos la conexiom
    include("../config/conexion.php");

    // Consulta: traemos los pedidos del usuario logueado
    $sql = "SELECT id_pedido, fecha, total 
            FROM pedidos 
            WHERE id_usuario = $id_usuario";


    $resultado = mysqli_query($conexion, $sql);

    $datos = mysqli_fetch_all($resultado, MYSQLI_ASSOC);

    echo json_encode($datos);
?>