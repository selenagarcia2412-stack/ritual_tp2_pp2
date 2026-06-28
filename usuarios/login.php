<?php
    // 1. Iniciamos la sesión
    session_start();

    // 2. Recibimos los datos del formulario
    $email = $_POST["email"];
    $contrasenia = $_POST["contrasenia"];

    // 3. Incluimos la conexión
    include("../config/conexion.php");

    // 4. Buscamos al usuario con ese email y contraseña
    $sql = "SELECT id_usuario, nombre, apellido, id_rol 
            FROM usuarios 
            WHERE email = '$email' AND contrasenia = '$contrasenia'";

    $resultado = mysqli_query($conexion, $sql);

    // 5. Vemos si encontramos al usuario
    if (mysqli_num_rows($resultado) == 1) {
        // Sí lo encontramos: guardamos sus datos en la sesión
        $usuario = mysqli_fetch_assoc($resultado);

        $_SESSION["id_usuario"] = $usuario["id_usuario"];
        $_SESSION["nombre"] = $usuario["nombre"];
        $_SESSION["id_rol"] = $usuario["id_rol"];

        // Redirigimos al index
        header("Location: ../index.php");
    } else {
        // No lo encontramos: volvemos al login
        header("Location: login.html");
    }
?>