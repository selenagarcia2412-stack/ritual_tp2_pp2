<?php
    // 1. Requerimos la conexión
    include("../config/conexion.php");

    // 2. Creamos la consulta
    $sql = "SELECT id_producto, nombre, descripcion, precio, stock, marca, foto, id_categoria, id_vendedor 
            FROM productos";

    // 3. Ejecutamos la consulta
    $resultado = mysqli_query($conexion, $sql);

    // 4. Convertimos el resultado a un Array PHP
    $datos = mysqli_fetch_all($resultado, MYSQLI_ASSOC);

    // 5. Convertimos a un JSON y lo devolvemos
    echo json_encode($datos);
?>