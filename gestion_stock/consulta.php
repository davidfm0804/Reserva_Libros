<?php
class ReservasLibros {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function obtenerLibrosEntregados() {
        $consulta = '
        SELECT Reservas_Libros.idReserva, Reservas_Libros.ISBN, Reservas.nombreAlumno, Reservas.fecha_reserva, Libros.nombre AS nombreLibro
        FROM Reservas_Libros
        INNER JOIN Reservas ON Reservas_Libros.idReserva = Reservas.idReserva
        INNER JOIN Libros ON Reservas_Libros.ISBN = Libros.ISBN
        WHERE Reservas_Libros.entregado = 0
        ORDER BY Reservas.fecha_reserva DESC';

        $resultado = $this->db->conexion->query($consulta);

        $librosEntregados = [];
        if ($resultado->num_rows > 0) {
            while ($fila = $resultado->fetch_assoc()) {
                $librosEntregados[] = $fila;
            }
        }
        return $librosEntregados;
    }
}
?>
