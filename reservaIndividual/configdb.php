<?php
$servidor = 'localhost';
$usuario = 'root';
$contrasenia = '';
$basededatos = 'applibros';

// Crear conexión
$sqli = new mysqli($servidor, $usuario, $contrasenia, $basededatos);

// Configurar controladores para manejo de errores
$controlador = new mysqli_driver();
$controlador->report_mode = MYSQLI_REPORT_OFF;

// Verificar conexión
if ($sqli->connect_error) {
    die("Error de conexión: " . $sqli->connect_error);
}
?>
