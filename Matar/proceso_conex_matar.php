<?php
/**
 * Created by PhpStorm.
 * User: ljcuenca
 * Date: 03/11/2017
 * Time: 12:31 PM
 */
header('Content-Type: text/html; charset=UTF-8');
// http://quantum1.pendulum.com.mx/pendulum/matar_sleep.php
//Variables
//$ip = '10';
$ip    = 'localhost';
$usu   = 'rootito';
$pass  = '';
$bd    = 'wf_workflow';
$query = "SELECT * FROM INFORMATION_SCHEMA.PROCESSLIST WHERE ( COMMAND = 'Sleep' OR COMMAND = 'Query' ) AND TIME >= 20 AND ( INFO IS NULL OR INFO LIKE '%SELECT%' )";//Pruebo la Conexion

//Prueba de Datos.
$link = conectar_mysql($ip, $usu, $pass, $bd);
$resultado = consultar_sql($link, $query);
// Matar Procesos
if (count($resultado) > 0){
    foreach ($resultado as $filas){
        $query2 = "KILL ".$filas["ID"].";";
        $result = $link->query($query2);
    }
}//fin del for

var_dump($resultado);

cerrar_mysql($link, $resultado);

/*********************************************************************************************************************************/
//Conectar con la Bases de Datos
function conectar_mysql($ip, $usu, $pass, $bd){
    // Conectarse a y seleccionar una base de datos de MySQL
    // Nombre de host: 127.0.0.1, nombre de usuario: tu_usuario, contraseña: tu_contraseña, bd: sakila
    $mysqli = new mysqli($ip, $usu, $pass, $bd);
    if ($mysqli->connect_errno){
         echo "Lo sentimos, este sitio web está experimentando problemas.";
        // Algo que no se debería de hacer en un sitio público, aunque este ejemplo lo mostrará
        // de todas formas, es imprimir información relacionada con errores de MySQL -- se podría registrar
        echo "Error: Fallo al conectarse a MySQL debido a: \n";
        echo "Errno: " . $mysqli->connect_errno . "\n";
        echo "Error: " . $mysqli->connect_error . "\n";
        exit;
    }
    return $mysqli;
}

//Cerrar conexión
function cerrar_mysql($mysqli, $resultado ){
    // El script automáticamente liberará el resultado y cerrará la conexión
// a MySQL cuando finalice, aunque aquí lo vamos a hacer nostros mismos
    $resultado->free();
    $mysqli->close();
}

//Extraer La informacion
function consultar_sql($mysqli, $sql ){
    // Realizar una consulta SQL
    $resultado = $mysqli->query($sql);
    $arr[] = array();
    if ( !$resultado ) {
        echo "Lo sentimos, este sitio web está experimentando problemas.";
        echo "Error: La ejecución de la consulta falló debido a: \n";
        echo "Query: " . $sql . "\n";
        echo "Errno: " . $mysqli->errno . "\n";
        echo "Error: " . $mysqli->error . "\n";
        exit;
    }

    if ($resultado){   //si retorna data

        $filas = $mysqli->affected_rows;

        for ($i = 1; $i <= $filas; $i++){
            $arr[] =  mysqli_fetch_assoc($resultado);
        }

        if(isset($arr)){
            return $arr;
        }else{
            return -3;
        }
    }else{
        return -1;
    }
  return  $arr;
}

