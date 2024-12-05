<?php
include 'configdb.php';
include 'consulta.php';

// Crear instancia de la base de datos
$database = new Database();
$reservasLibros = new ReservasLibros($database);

// Obtener libros entregados
$librosEntregados = $reservasLibros->obtenerLibrosEntregados();

// Cerrar conexión
$database->cerrarConexion();
?>
