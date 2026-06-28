<?php
    // 1. Iniciamos la sesion
    session_start();

    // 2. Recibimos los datos del formulario
    $nombre = $_POST["nombre"];
    $descripcion = $_POST["descripcion"];
    $precio = $_POST["precio"];
    $stock = $_POST["stock"];
    $marca = $_POST["marca"];
    $foto = $_POST["foto"];
    $id_categoria = $_POST["id_categoria"];

    // 3. El vendedor lo tomamos del usuario logueado)
    $id_vendedor = $_SESSION["id_usuario"];

    // 4. Incluimos la conexiom
    include("../config/conexion.php");

    // 5. Creamos la consulta SQL
    $sql = "INSERT INTO productos(nombre, descripcion, precio, stock, marca, foto, id_categoria, id_vendedor)
            VALUES('$nombre', '$descripcion', $precio, $stock, '$marca', '$foto', $id_categoria, $id_vendedor)";

    // 6. Ejecutamos la consulta
    mysqli_query($conexion, $sql);

    // 7. Redirigimos al catlogo
    header("Location: productos.html");
?>