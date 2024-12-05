<?php
class Database {
    private $servidor = 'localhost';
    private $usuario = 'root';
    private $contrasenia = '';
    private $basededatos = 'applibros';
    public $conexion;

    public function __construct() {
        $this->conectar();
    }

    private function conectar() {
        $this->conexion = new mysqli($this->servidor, $this->usuario, $this->contrasenia, $this->basededatos);
        
        if ($this->conexion->connect_error) {
            die("Error de conexión: " . $this->conexion->connect_error);
        }
    }

    public function cerrarConexion() {
        $this->conexion->close();
    }
}
?>
