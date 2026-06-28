<?php
    // 1. Recibimos el id del producto por la URL
    $id_producto = $_GET["id"];

    // 2. Incluimos la conexión
    include("../config/conexion.php");

    // 3. Consulta: producto + datos del vendedor (con JOIN)
    $sql = "SELECT productos.nombre, productos.descripcion, productos.precio, 
                   productos.stock, productos.marca, productos.foto,
                   usuarios.nombre AS vendedor_nombre, 
                   usuarios.apellido AS vendedor_apellido,
                   usuarios.email AS vendedor_email,
                   usuarios.telefono AS vendedor_telefono
            FROM productos
            INNER JOIN usuarios ON productos.id_vendedor = usuarios.id_usuario
            WHERE productos.id_producto = $id_producto";

    // 4. Ejecutamos
    $resultado = mysqli_query($conexion, $sql);

    // 5. Traemos los datos
    $producto = mysqli_fetch_assoc($resultado);

    // 6. Devolvemos JSON
    echo json_encode($producto);
?>