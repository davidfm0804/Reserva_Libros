<?php
    $idReserva = $_POST['idReserva'];
    $nombre = $_POST['nombre'];
    $curso = $_POST['curso'];
    $clase = $_POST['clase'];
    $libros = $_POST['libros'];  
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/imports/general.css">
    <link rel="stylesheet" href="css/imports/headerFooter.css">
    <link rel="stylesheet" href="css/estilo/totalReservas.css">
    <title>Total de Reservas Individual</title>
</head>
<body>
    <header>
        <div class="logo">
            <a href="../admin/admin.html">
                <img src="../../resources/logo.png" alt="Logo">
            </a>
        </div>
        <nav>
            <a href="../../pages/admin/gestionStock.html">Gestión Stock</a>
            <a href="../../pages/admin/listaReservas.html">Gestión Reservas</a>
            <a href="../../pages/admin/gestionLibros.html">Gestión Libros</a>
        </nav>
        <div class="icono-usuario">
            <a href="../../../index.html">
                <img src="../../resources/login.png" alt="login">
            </a>
        </div>
    </header>
    <main>
        <h2 class="tituloTotalReservas">Total Reservas: <?php echo $nombre; ?> - <?php echo $curso; ?> <?php echo $clase; ?></h2>
        <table class="reservasIndv">
            <tr>
                <th>Libro</th>
                <th>Eliminar</th>
                <th>Modificar</th>
                <th>Recogido</th>
            </tr>
            <?php
                foreach ($libros as $libro) {
                    echo "<tr>";
                    echo "<td>" . $libro . "</td>";
                    echo "<td><button id='eliminar'>Eliminar</button></td>";
                    echo "<td><button id='modificar'>Modificar</button></td>";
                    echo "<td><input type='checkbox' name='recogido' value='1'></td>";
                    echo "</tr>";
                }
            ?>
        </table>
        <a href="../lista_total_reservas/index.php">
            <button id="volver">VOLVER</button>
        </a>
    </main>
    <footer>
        <div class="colaboradores">
            <b>Colaboradores</b>
            <p><a href="https://atabalfundacion.wordpress.com/">Fundacion Atabal</a></p>
            <p><a href="https://www.aytobadajoz.es/es/ayto/portada">Ayto. Badajoz</a></p>
            <p><a href="https://www.aexpainba-fmm.org/comienzo.asp">AEXPAINBA</a></p>
            <p><a href="http://www.fidesbancaetica.com/">FIDES</a></p>
        </div>
        <div class="cita">
            <p>"El examen de conciencia es siempre el mejor medio para cuidar bien el alma."</p>
            <p>"San Ignacio de Loyola"</p>
        </div>
        <div class="contacto">
            <b id="contactar">Contactar</b>
            <p><i class="fas fa-map-marker-alt"></i> C/ Corte de Peleas, 79 06009 Badajoz</p>
            <p><i class="fas fa-phone"></i> +34 924 25 17 61</p>
        </div>
    </footer>
</body>
</html>
