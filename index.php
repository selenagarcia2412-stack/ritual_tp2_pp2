<?php
    session_start();

    // Si no hay sesión activa, mandamos al login
    if (!isset($_SESSION["nombre"])) {
        header("Location: usuarios/login.html");
        exit();
    }
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ritual | Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="includes/style.css" rel="stylesheet">
</head>
<body>

    <header>
        <div class="logo">
            <h1>Ritual</h1>
        </div>
        <nav>
            <a href="index.php">Inicio</a>
            <a href="productos/productos.html">Catálogo</a>
            <a href="usuarios/logout.php">Salir</a>
        </nav>
    </header>

    <main>
        <div class="hero">
            <h2>Hola, <?php echo $_SESSION["nombre"]; ?></h2>
            <p>Bienvenida a Ritual</p>
        </div>
    </main>

    <footer>
        <p class="footer-brand">Ritual · Beauty & Self Care</p>
        <p class="footer-info">ISEC | PP Programación II | 2026</p>
    </footer>

</body>
</html>