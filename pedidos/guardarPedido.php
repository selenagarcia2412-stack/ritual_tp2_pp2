<?php
    // 1. Iniciamos la sesión
    session_start();

    // 2. Recibimos el id del producto que quieren comprar
    $id_producto = $_GET["id"];

    // 3. El cliente lo tomamos de la sesión
    $id_usuario = $_SESSION["id_usuario"];

    // 4. Incluimos la conexión
    include("../config/conexion.php");

    // 5. Buscamos el precio del producto
    $sql_producto = "SELECT precio FROM productos WHERE id_producto = $id_producto";
    $resultado_producto = mysqli_query($conexion, $sql_producto);
    $producto = mysqli_fetch_assoc($resultado_producto);
    $precio = $producto["precio"];

    // 6. Insertamos el pedido (cabecera)
    $sql_pedido = "INSERT INTO pedidos(id_usuario, fecha, estado, total)
                   VALUES($id_usuario, NOW(), 0, $precio)";
    mysqli_query($conexion, $sql_pedido);

    // 7. Recuperamos el id del pedido recién creado
    $id_pedido = mysqli_insert_id($conexion);

    // 8. Insertamos el detalle del pedido
    $sql_detalle = "INSERT INTO detalle_pedido(id_producto, id_pedido, cantidad, precio_unitario)
                    VALUES($id_producto, $id_pedido, 1, $precio)";
    mysqli_query($conexion, $sql_detalle);

    // 9. Redirigimos a "Mis pedidos"
    header("Location: misPedidos.html");
?> 

