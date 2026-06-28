<?php
    // Iniciamos la sesión para dps eliminarla
    session_start();

    // Cerramos la sesión
    session_destroy();

    // Lo mandamos al login
    header("Location: login.html");
?>