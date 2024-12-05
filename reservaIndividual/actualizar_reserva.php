<?php
$idReserva = $_POST['idReserva'];
$recogidos = $_POST['recogido']; 
$conn = new mysqli('localhost', 'root', '', 'applibros');

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Actualizar cada libro marcado como recogido
foreach ($recogidos as $ISBN) {
    // Realizar el update para cada libro recogido
    $sql = "UPDATE reservas_libros SET entregado=1 WHERE idReserva='$idReserva' AND ISBN='$ISBN'";
    if ($conn->query($sql) === TRUE) {
        echo "Libro con ISBN $ISBN actualizado correctamente.";
    } else {
        echo "Error al actualizar libro con ISBN $ISBN: " . $conn->error;
    }
}
$conn->close();
?>

