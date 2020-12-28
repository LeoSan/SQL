UPDATE
   ift_web.dbo.usuarios 
SET
     nombre = nuevaTabla.nombre
   , apellido_materno = nuevaTabla.apellido_materno
   , apellido_paterno = nuevaTabla.apellido_paterno
   , calle = nuevaTabla.calle
   , num_ext = nuevaTabla.num_ext
   , num_int = nuevaTabla.num_int
   , id_entidadfederativa = nuevaTabla.id_entidadfederativa
   , id_municipio = nuevaTabla.id_municipio
   , id_colonia = nuevaTabla.id_colonia
   , cp = nuevaTabla.cp
   , tel_fijo = nuevaTabla.tel_contacto
   , tel_celular = nuevaTabla.tel_mensajes
   , email = nuevaTabla.email
   , login = nuevaTabla.login

FROM
	(SELECT b.id_usuario, c.nombre, c.apellido_paterno, c.apellido_materno, c.calle, c.num_ext, c.num_int, c.id_entidadfederativa, c.id_municipio, c.id_colonia, c.cp, c.tel_contacto, c.tel_mensajes, LOWER(LEFT(c.email, CHARINDEX('@', c.email) )) as login, c.email FROM ift_web.dbo.usuarios as a 
INNER JOIN ift_web.dbo.reclamaciones as b ON  a.id_usuario = b.id_usuario
INNER JOIN ift_web.dbo.reclamaciones_datos_usuario as c ON b.id_datos_usuario = c.id_datos_usuario   
WHERE a.login = 'espacioparanube@gmail.com' ) AS nuevaTabla

WHERE

ift_web.dbo.usuarios.id_usuario = nuevaTabla.id_usuario;



-- UPDATE ift_web.dbo.usuarios  SET login = REPLACE(login,'@','')  WHERE  fecha_registro = '2020-11-09 17:11:57.000';

SELECT REPLACE(login,'@','')  FROM ift_web.dbo.usuarios WHERE  fecha_registro = '2020-11-09 17:11:57.000';
  SELECT *  FROM ift_web.dbo.usuarios as a
  INNER JOIN ift_web.dbo.reclamaciones as b ON  a.id_usuario = b.id_usuario
  WHERE email = 'espacioparanube@gmail.com' AND a.id_usuario < 99999 AND a.id_usuario NOT IN (7, 8, 9, 19472, 19480,19481,27451,39822,42013,50148 )
 


    


