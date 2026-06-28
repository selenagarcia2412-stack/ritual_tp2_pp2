<?php
    // 1. Aca se reciben los datos del formulario
    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $email = $_POST["email"];
    $contrasenia = $_POST["contrasenia"];
    $telefono = $_POST["telefono"];
    $direccion = $_POST["direccion"];
    $id_rol = $_POST["id_rol"];

    // 2. Aca se incluye la conexion con la BD
    include("../config/conexion.php");

    // 3. Creamos la consulta SQL
    $sql = "INSERT INTO usuarios(id_rol, nombre, apellido, email, contrasenia, telefono, direccion)
            VALUES($id_rol, '$nombre', '$apellido', '$email', '$contrasenia', '$telefono', '$direccion')";

    // 4. Se ejecuta la consulta
    mysqli_query($conexion, $sql);

    // 5. Redirigimos al login
    header("Location: registro.html");
?>