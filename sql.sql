SELECT * FROM adm_usuario;

INSERT INTO adm_modulo_opcion(nombre_opcion, id_modulo)
SELECT nombre_opcion, 2 FROM adm_modulo_opcion;


SELECT u.id_usuario, u.nombres, u.apellidos,
m.id_modulo, m.nombre_modulo, mo.id_modulo_opcion, mo.nombre_opcion
FROM adm_usuario u
INNER JOIN adm_rol r ON(u.id_rol = r.id_rol)
-- inner join adm_modulo_opcion mo on(mo.id_modulo_opcion = mou.id_modulo_opcion)
INNER JOIN adm_modulo m ON(m.id_rol = r.id_rol)
INNER JOIN adm_modulo_opcion mo ON(mo.id_modulo=m.id_modulo)
WHERE u.id_usuario = 1 AND mo.opcion_nivel =1;

INSERT INTO adm_usuario(usuario, nombres, apellidos, clave) VALUES
('mcruz', 'MARVIN GIANCARLO', 'CRUZ', '010707'), ('jcalin', 'jovel', 'calin', '1029');


INSERT INTO `db_sisin`.`adm_rol`
(`id_rol`,
`rol_nombre`,
`rol_comentario`,
`id_usuario`)
VALUES
(1,
'ADMINISTRACION',
'NINGUNO',
1);

UPDATE adm_modulo SET ID_ROL = 1;

INSERT INTO adm_modulo_opcion(id_modulo_opcion, nombre_opcion, opcion_nivel, id_modulo)
					   VALUES(9,'Ver Usuarios', 2, 1), (10,'Agregar Usuarios', 2, 1),
                       (11,'Editar Usuarios', 2, 1), (12,'Eliminar Usuarios', 2, 1);
                       
INSERT INTO adm_modulo_opcion(id_modulo_opcion, nombre_opcion, opcion_nivel, id_modulo)
					   VALUES(13,'Ver Año', 2, 1), (14,'Agregar Año', 2, 1),
                       (15,'Editar Año', 2, 1), (16,'Eliminar Año', 2, 1);
                       
                       
INSERT INTO adm_modulo_opcion(id_modulo_opcion, nombre_opcion, opcion_nivel, id_modulo)
					   VALUES(17,'Reporte Usuarios',1, 1), (18,'Reporte Secciones', 1, 1),
                       (19,'Reporte Docentes', 1, 1), (20,'Reporte Materias', 1, 1);
                       
                       
INSERT INTO adm_modulo_opcion(id_modulo_opcion, nombre_opcion, opcion_nivel, id_modulo)
					   VALUES(21,'Mi Perfil',1, 2), (22,'Materias', 1, 2),
                       (23,'Reporte Docentes', 1, 1), (24,'Reporte Materias', 1, 1);
INSERT INTO adm_modulo_opcion(id_modulo_opcion, nombre_opcion, opcion_nivel, id_modulo)
					   VALUES(25,'Asignar Docente',1, 1), (22,'Materias', 1, 2),
                       (23,'', 1, 1), (24,'Reporte Materias', 1, 1);
INSERT INTO adm_modulo_opcion(id_modulo_opcion, nombre_opcion, opcion_nivel, id_modulo)
					   VALUES(26,'Asignaciones Docentes',1, 1)
  USE db_sisin;                     
SELECT * FROM adm_modulo_opcion;
UPDATE adm_modulo_opcion SET nombre_opcion ='Asignaciones Docentes' WHERE id_modulo_opcion = 25;

delete from adm_modulo_opcion where id_modulo_opcion = 26;


UPDATE adm_modulo_opcion SET nombre_controlador_opcion ='Usuarios/DocentesUsuarios/' WHERE id_modulo_opcion = 1;

UPDATE adm_modulo_opcion SET nombre_controlador_opcion ='Inscripciones/InscribirAlumnos/' WHERE id_modulo_opcion = 24;

UPDATE adm_modulo_opcion SET nombre_controlador_opcion ='Usuarios/Asignacion/' WHERE id_modulo_opcion = 25;

UPDATE adm_modulo_opcion SET nombre_controlador_opcion ='Usuarios/AdministrarAsignaciones/' WHERE id_modulo_opcion = 25;

SELECT * FROM adm_docente;

INSERT INTO adm_docente VALUES(1, 'MARVIN GIANCARLO', 'CRUZ', 'LA GARITA', NOW(), 1), 
(2, 'MARIA LUISA', 'VASQUEZ', 'MEJICANOS', NOW(), 1),
(3, 'CARLOS MARIO', 'ROMERO', 'LA GARITA PALMERA', NOW(), 1);

SELECT d.id_docente, d.docente_nombre, d.docente_apellido, d.docente_direccion, d.fecha_creacion,
u.usuario, r.rol_nombre
FROM adm_docente d 
INNER JOIN adm_usuario u
ON(d.id_usuario = u.id_usuario)
INNER JOIN adm_rol r
ON(r.id_rol = u.id_rol)
ORDER BY d.id_docente DESC;

SELECT d.id_docente, d.docente_nombre, d.docente_apellido, d.docente_direccion, d.fecha_creacion,
						u.usuario, r.rol_nombre
						FROM adm_docente d 
						INNER JOIN adm_usuario u
						ON(d.id_usuario = u.id_usuario)
						INNER JOIN adm_rol r
						ON(r.id_rol = u.id_rol)
						WHERE d.id_docente=2;


SELECT * FROM  adm_modulo_opcion;

UPDATE adm_modulo_opcion SET nombre_opcion = 'Docentes (quitar esta opcion)' WHERE id_modulo_opcion = 4;

UPDATE adm_modulo_opcion SET nombre_controlador_opcion = 'Aranceles/AdministrarAranceles/' WHERE id_modulo_opcion = 8;

SELECT * FROM adm_annio_lectivo;

UPDATE adm_annio_lectivo SET annio =2016;

SELECT IFNULL(MAX(id_modalidad), 0) + 1 AS ID FROM acade_modalidad;
SELECT * FROM acade_modalidad

SELECT m.id_modalidad, m.modalidad_nombre, m.modalidad_comentario, m.fecha_creacion
FROM acade_modalidad m;

UPDATE adm_curso SET id_annio_lectivo = 2;

SELECT id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 LIMIT 1;

SELECT curso_identificador FROM adm_curso WHERE id_modalidad = 1 AND curso_nivel ='1' AND curso_identificador ='A' AND 
id_annio_lectivo = 2

SELECT c.id_curso, c.id_modalidad, c.curso_nivel, c.curso_identificador, m.modalidad_nombre
FROM adm_curso c
INNER JOIN acade_modalidad m
ON(c.id_modalidad = m.id_modalidad)
WHERE c.id_curso = 1 AND c.curso_estado = 1;

UPDATE adm_curso SET curso_estado = 1; 

INSERT INTO acade_especialidad(id_especialidad, especialidad_nombre, id_usuario)
VALUES(1, 'INGENIERO EN SISTEMAS Y REDES INFORMÁTICAS', 1),(2, 'CIENCIAS DE LA EDUCACIÓN', 1),
(3, 'FÍSICO-QUÍMICO', 1);

UPDATE adm_docente SET id_especialidad = 1;

SELECT id_municipio, municipio_nombre FROM adm_municipio WHERE id_departamento = 


SELECT d.id_docente, d.docente_nombre, d.docente_apellido, d.docente_direccion, d.fecha_creacion,
						u.usuario, r.rol_nombre, u.id_rol, depto.id_departamento, depto.departamento_nombre,
                        d.id_municipio, muni.municipio_nombre, espe.id_especialidad,
                        espe.especialidad_nombre
						FROM adm_docente d 
						INNER JOIN adm_usuario u
						ON(d.id_usuario = u.id_usuario)
						INNER JOIN adm_rol r
						ON(r.id_rol = u.id_rol)
                        INNER JOIN adm_municipio muni ON(muni.id_municipio = d.id_municipio)
                        INNER JOIN adm_departamento depto ON(depto.id_departamento = muni.id_departamento)
                        INNER JOIN acade_especialidad espe ON(espe.id_especialidad = d.id_especialidad)
                        
INSERT INTO adm_lista(lista_valor, lista_id_opcion, lista_comentario)
VALUES('PUREBA', 2, 'PRUEBA'), ('PRUEBA', 2, 'PUREBA');

UPDATE adm_alumno SET alumno_codigo =

SELECT GenerarCodigoAlumno();

SELECT a.id_alumno, a.alumno_codigo, a.alumno_nombre, a.alumno_apellido,
a.fecha_creacion FROM adm_alumno a;


SELECT a.id_alumno, a.alumno_codigo, a.alumno_nombre, a.alumno_apellido,
a.alumno_direccion, a.alumno_telefonos, a.alumno_fecha_nacimiento, 
a.alumno_nombre_foto, a.alumno_correo, 
ad.dato_nombres_padre, ad.dato_nombres_madre,
ad.dato_telefonos_contacto, ad.dato_correo, ad.dato_lugar_trabajo,
ad.dato_nombres_responsable, ad.dato_telefono_responsable, ad.dato_correo_responsable,
ad.dato_lugar_trabajo_responsable,
l.id_lista, l.lista_valor,
muni.id_municipio, muni.municipio_nombre,
depto.id_departamento, depto.departamento_nombre
FROM adm_alumno a INNER JOIN acade_alumno_dato ad ON(a.id_alumno = ad.id_alumno)
INNER JOIN adm_lista l ON(l.id_lista = a.id_lista)
INNER JOIN adm_municipio muni ON(muni.id_municipio = a.id_municipio)
INNER JOIN adm_departamento depto ON(depto.id_departamento = muni.id_departamento)
WHERE a.id_alumno =1 AND a.alumno_estado = 1;

UPDATE adm_alumno SET alumno_estado = 1 WHERE id_alumno = 1;

SELECT * FROM adm_modulo_opcion;
DELETE FROM adm_modulo_opcion WHERE id_modulo_opcion = 4;

SELECT * FROM adm_modulo;

UPDATE adm_modulo SET nombre_modulo = 'CATÁLOGOS' WHERE id_modulo = 1;

INSERT INTO adm_modulo(id_modulo, nombre_modulo, modulo_descripcion, id_rol)
VALUES(6, 'INSCRIPCIONES', 'pertenece al rol administradores', 1);


SELECT u.id_usuario, u.nombres, u.apellidos,
m.id_modulo, m.nombre_modulo, mo.id_modulo_opcion, mo.nombre_opcion, mo.nombre_controlador_opcion
FROM adm_usuario u
INNER JOIN adm_rol r ON(u.id_rol = r.id_rol)
-- inner join adm_modulo_opcion mo on(mo.id_modulo_opcion = mou.id_modulo_opcion)
INNER JOIN adm_modulo m ON(m.id_rol = r.id_rol)
LEFT JOIN adm_modulo_opcion mo ON(mo.id_modulo=m.id_modulo)
WHERE u.id_usuario = 1 AND mo.opcion_nivel =1;


SELECT c.id_curso, c.id_modalidad, c.curso_nivel, c.curso_identificador, c.fecha_creacion, m.modalidad_nombre
					FROM adm_curso c
					INNER JOIN acade_modalidad m
					ON(c.id_modalidad = m.id_modalidad)
					INNER JOIN adm_annio_lectivo an
					ON(an.id_annio_lectivo = c.id_annio_lectivo)
					WHERE c.curso_estado = 1 AND an.estado = 1 
					ORDER BY c.curso_nivel, m.id_modalidad
                    
                    
select annio from adm_annio_lectivo where estado = 1  order by annio desc limit 1;

select id_annio_lectivo, annio from adm_annio_lectivo where estado = 1  order by annio desc limit 1;

SELECT * FROM `adm_curso_detalle` WHERE `id_annio_lectivo` = '2' 
AND `id_curso` = '4' AND `id_docente` = '22' AND `id_materia` = '1';



SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION,  mate.materia_nombre
from adm_docente d 
inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
inner join adm_curso c on(c.id_curso = cd. id_curso)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
where d.id_docente = 22 order by c.curso_nivel, moda.id_modalidad, c.curso_identificador	


SELECT d.id_docente, d.docente_nombre, d.docente_apellido,
						u.usuario, r.rol_nombre
						from adm_docente d 
						inner join adm_usuario u
						on(d.id_usuario = u.id_usuario)
						inner join adm_rol r
						on(r.id_rol = u.id_rol)
						where u.usuario_estado = true order by d.docente_apellido, d.docente_nombre	
                        
SELECT d.id_docente, d.docente_nombre, d.docente_apellido,
u.usuario, r.rol_nombre
from adm_docente d 
inner join adm_usuario u on(d.id_usuario = u.id_usuario)
inner join adm_rol r on(r.id_rol = u.id_rol)
inner join adm_curso_detalle cd on (cd.id_docente = d.id_docente)
where u.usuario_estado = true group by d.id_docente order by d.docente_apellido, d.docente_nombre	


select c.id_curso, c.id_modalidad, c.curso_nivel, c.curso_identificador, c.fecha_creacion, m.modalidad_nombre, cd.id_docente
					from adm_curso c
					inner join acade_modalidad m
					on(c.id_modalidad = m.id_modalidad)
					INNER JOIN adm_annio_lectivo an
					ON(an.id_annio_lectivo = c.id_annio_lectivo)
                    inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
					WHERE c.curso_estado = 1 AND an.estado = 1 and cd.id_docente = 23 order by c.curso_nivel, m.id_modalidad

select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION
FROM adm_curso c
inner join acade_modalidad m on(c.id_modalidad = m.id_modalidad)
inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
INNER JOIN adm_annio_lectivo an
ON(an.id_annio_lectivo = c.id_annio_lectivo)
where c.curso_estado = 1 AND an.estado = 1 and cd.id_docente = 23 group by c.id_curso


SELECT `id_detalle_alumno` FROM `adm_alumno_detalle` WHERE `id_annio_lectivo` = '2' AND `id_curso` = '3' AND `id_alumno` = '6'

select a.alumno_codigo, concat( a.alumno_apellido, ' ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
ad.id_curso
from adm_alumno a
inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
where ad.id_curso = 1 order by a.alumno_apellido, a.alumno_nombre


select count(*) 
from acade_periodo_nota_detalle where id_alumno = 1;

insert into acade_periodo(id_periodo, periodo_nombre, id_annio_lectivo, id_usuario)
values (1,'preuba para funcion que no permita desmatircular', 1, 1);
insert into acade_periodo(id_periodo, periodo_nombre, id_annio_lectivo, id_usuario)
values (2,'preuba para funcion que no permita desmatircular', 2, 1);
insert into acade_periodo_nota_detalle(N_1, N_2, N_3, id_periodo, id_alumno,
id_materia, id_annio_lectivo, id_usuario) VALUES(
10.01,0,0, 2, 1, 1, 2, 1);

delete from acade_periodo_nota_detalle;

select count(*) 
from acade_periodo_nota_detalle where id_alumno = 1 and id_annio_lectivo = 1 ;


select p.id_periodo, p.periodo_numero, p.periodo_nombre, p.fecha_creacion, a.annio, 
case 
	when p.periodo_estado = 1 then 'ABIERTO' ELSE 'CERRADO' END ESTADO
from acade_periodo p
inner join adm_annio_lectivo a on(a.id_annio_lectivo = p.id_annio_lectivo)
where a.estado = 1 and a.id_annio_lectivo = 2/*and p.periodo_estado = 1*/ order by p.id_periodo desc;


select s.id_curso, concat(s.curso_nivel, ' ', m.modalidad_nombre, ' ', s.curso_identificador) as SECCION,
d.docente_nombre
FROM adm_curso s 
inner join acade_modalidad m on(m.id_modalidad = s.id_modalidad)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = s.id_annio_lectivo)
inner join adm_curso_detalle cd on(cd.id_curso = s.id_curso)
inner join adm_docente d on(d.id_docente = cd.id_docente)
where s.curso_estado= 1 and m.modalidad_estado = 1 and a.estado = 1
and d.id_docente =7 group by m.id_modalidad order by s.curso_nivel, m.modalidad_nombre;



SELECT d.id_docente, mate.id_materia, mate.materia_nombre
from adm_docente d 
inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
inner join adm_curso c on(c.id_curso = cd.id_curso)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo)
inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
where d.id_docente = 23 and c.curso_estado = 1 and a.estado = 1 and m.modalidad_estado = 1 group by mate.id_materia;


select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION,
d.docente_nombre, mate.materia_nombre
FROM adm_curso c 
inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo)
inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
inner join adm_docente d on(d.id_docente = cd.id_docente)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
where c.curso_estado= 1 and m.modalidad_estado = 1 and a.estado = 1
and d.id_docente =23 and mate.id_materia = 1 order by c.curso_nivel, m.modalidad_nombre

INSERT INTO adm_modulo (nombre_modulo, modulo_descripcion, id_rol)
values('INSCRIPCIONES', 'pertenece al rol DOCENTES', 2)


UPDATE adm_modulo_opcion SET id_modulo = 2 where id_modulo_opcion = 26;

UPDATE adm_modulo_opcion SET nombre_controlador_opcion = 'Secciones/SeccionesDocente/', nombre_opcion ='Secciones' where id_modulo_opcion = 22;

insert into adm_modulo_opcion(nombre_opcion, nombre_controlador_opcion, opcion_nivel,
id_modulo)
values ('Reporte Notas', 'Notas/Reporte/', 1, 5);
insert into adm_modulo_opcion(nombre_opcion, nombre_controlador_opcion, opcion_nivel,
id_modulo)
values ('Reporte Notas por Sección', 'Reportesnotas/ReportesnotasPorSeccion/', 1, 5);
insert into adm_modulo_opcion(nombre_opcion, nombre_controlador_opcion, opcion_nivel,
id_modulo)
values ('Reporte Nómina de Alumnos', 'Reportesnotas/ReportesNominaAlumnos/', 1, 5);
insert into adm_modulo_opcion(nombre_opcion, nombre_controlador_opcion, opcion_nivel,
id_modulo)
values ('Reporte Cumpleañeros', 'Reportesnotas/ReporteDocentesCumpleannieros/', 1, 4);
insert into adm_modulo_opcion(nombre_opcion, nombre_controlador_opcion, opcion_nivel,
id_modulo)
values ('Reporte Cumpleañeros', 'Reportesnotas/ReporteAlumnosCumpleannieros/', 1, 5);

select u.id_usuario, u.nombres, u.apellidos,
								m.id_modulo, m.nombre_modulo, mo.id_modulo_opcion, mo.nombre_opcion, mo.nombre_controlador_opcion
								from adm_usuario u
								inner join adm_rol r on(u.id_rol = r.id_rol)
								-- inner join adm_modulo_opcion mo on(mo.id_modulo_opcion = mou.id_modulo_opcion)
								inner join adm_modulo m on(m.id_rol = r.id_rol)
								inner join adm_modulo_opcion mo on(mo.id_modulo=m.id_modulo)
								where u.id_usuario = 23 and mo.opcion_nivel =1;

insert into acade_periodo_nota_detalle(N_1, N_2, N_3, id_periodo, id_alumno,
id_materia, id_annio_lectivo, id_usuario) VALUES(
10.01,0,0, 2, 1, 1, 2, 1);

select * from temporal_mensajes;

delete from acade_periodo_nota_detalle;
/* taer notas de los alumnos existan o no existas
*/
	select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ' ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
	left join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_periodo = fn_TraerIdPeriodoEnCurso())
    left join acade_periodo pe on(pe.id_periodo = pnd.id_periodo  and pe.id_periodo = fn_TraerIdPeriodoEnCurso())
	where ad.id_curso = 1  and cur.curso_estado = 1 and al.estado = 1 order by a.alumno_apellido, a.alumno_nombre;
    
select id_periodo from acade_periodo where periodo_estado = 1 order by id_periodo desc limit 1;


select id_annio_lectivo
	 from adm_annio_lectivo where estado = 1 order by id_annio_lectivo desc limit 1; /*simpre me devolvera una fila*/

	select pe.id_periodo from acade_periodo pe
		inner join adm_annio_lectivo a on(a.id_annio_lectivo = pe.id_annio_lectivo)
        where a.estado = 1 and pe.periodo_estado = 1 and a.id_annio_lectivo = 2 order by pe.id_periodo desc limit 1;

    
SELECT count(id_nota_detalle), `pnd`.`id_nota_detalle`, `pnd`.`N_1`, `pnd`.`id_periodo`, `pnd`.`id_alumno`, `pnd`.`id_materia`, 
`pnd`.`id_annio_lectivo`
 FROM `acade_periodo_nota_detalle` pnd 
WHERE `id_periodo` = '8' AND `id_alumno` = '8' AND `id_materia` = '1' AND `id_annio_lectivo` = '2';


/*
aranceles
*/

select ara.id_arancel, ara.arancel_nombre, ara.fecha_creacion
from acade_arancel ara where ara.arancel_estado = 1 order by id_arancel desc;

-- parametros id_alumno, fecha de ingreso y el usaurio
call pa_GenerarCalendarioPagoPorAlumno(19, '2017-03-25', 1);
-- parametros id_alumno, fecha de ingreso, año lectivo a generar, id modalidad y el usuario
call pa_GenerarCalendarioPagoPorAlumnoFortuito(5, '2016-01-01', 2016, 3, 1);
select count(*) from
( 
select distinct calendario_annio from acade_calendario_pago where id_alumno = 8
) as resultado;
select year('2017-03-25'), month('2017-03-25');

-- procedimiento que se sera llamado desde un evento que no recibe parametros
call pa_GenerarCalendarioPago();


select id_alumno from adm_alumno where alumno_estado = 1
				and id_alumno not in(select id_alumno from acade_calendario_pago where calendario_annio = 2017);
                

select * from acade_calendario_pago;

select cp.id_calendario_pago, cp.calendario_mes, cp.calendario_annio,
case 
 when cp.calendario_mes  = 1 then 'ENERO'
 when cp.calendario_mes  = 2 then 'FEBRERO'
 when cp.calendario_mes  = 3 then 'MARZO'
 when cp.calendario_mes  = 4 then 'ABRIL'
 when cp.calendario_mes  = 5 then 'MAYO'
 when cp.calendario_mes  = 6 then 'JUNIO'
 when cp.calendario_mes  = 7 then 'JULIO'
 when cp.calendario_mes  = 8 then 'AGOSTO'
 when cp.calendario_mes  = 9 then 'SEPTIEMBRE'
 when cp.calendario_mes  = 10 then 'OCTUBRE'
 when cp.calendario_mes  = 11 then 'NOVIEMBRE'
 when cp.calendario_mes  = 12 then 'DICIEMBRE'
 ELSE 'INSCRIPCIÓN' END AS MES,
 case 
	when cp.calendario_annio < year(now()) then 'VENCIDA'
     else
		CASE 
			when cp.calendario_annio = year(now()) then 
					case 
						/*
						  el if es para ponerle siempre 1 al mes si este es 30 la inscripcion
                          y asi poder validar si la inscripcion ya esta vencida
						*/
						WHEN if(cp.calendario_mes = 30, 1, cp.calendario_mes) < month(now()) then 'VENCIDO'
						ELSE 'OK'
					END
			when cp.calendario_annio > year(now()) then  'OK'
		END
END AS ESTADO_CUOTA
 FROM acade_calendario_pago cp where cp.id_alumno = 8 and cp.calendario_cuota_pagada = 0 order by cp.id_calendario_pago asc;
 
call pa_TaerCalendarioPagoPorAlumno(8);
 
select cp.id_calendario_pago, cp.calendario_mes, cp.calendario_annio, cp.id_alumno
 FROM acade_calendario_pago cp where cp.id_alumno = 8 and cp.calendario_cuota_pagada = 0
 and cp.id_calendario_pago <= 205 order by cp.id_calendario_pago asc;
 
 select DATE_FORMAT(NOW(),'%Y-%m-%d');
 
 -- procedimiento que acutaliza las cuotas del alumno seleccionado
 -- parametros id_alumno e id_calendario_pago
 
 call pa_ActualizarCuotasAlumno(8, 205);
 
 
 SELECT count(*)  FROM acade_calendario_pago 
     where id_alumno = 8 and calendario_annio = 2017 and calendario_mes = 1 and calendario_cuota_pagada = 1  LIMIT 1;
 
 -- PA que indica si el alumno ya pago la inscripcion
 -- recibe el id_alumno como paramtro y el mes 
 call pa_VerSiAlumnoYaPagoCuota(8, 1);
 SELECT GenerarCodigoAlumno('8','30') as ESTADO_CUOTA;
 
 select count(*) from adm_usuario where usuario = 'jualia@hotmail.com' 
 and clave = md5('010707') and usuario_estado = 1;
 
 select u.id_usuario, u.usuario, u.id_rol, 
 doc.docente_nombre, doc.docente_apellido
 from adm_usuario u 
 inner join adm_docente doc on(doc.id_usuario = u.id_usuario)
 where u.usuario = 'ustiel@hotmail.com';
 
 -- PA que verifica el usuario para loguearse
 -- parametros recibidos usuario y contraseña
 CALL pa_IniciarSesion('ustiel@hotmail.com', 'a47c973cdb475cec9ad0d26e0891c43j');
 
 
 select u.id_usuario, u.nombres, u.apellidos,
								m.id_modulo, m.nombre_modulo, mo.id_modulo_opcion, mo.nombre_opcion, mo.nombre_controlador_opcion
								from adm_usuario u
								inner join adm_rol r on(u.id_rol = r.id_rol)
								-- inner join adm_modulo_opcion mo on(mo.id_modulo_opcion = mou.id_modulo_opcion)
								inner join adm_modulo m on(m.id_rol = r.id_rol)
								inner join adm_modulo_opcion mo on(mo.id_modulo=m.id_modulo)
								where u.id_usuario = 6 and mo.opcion_nivel =1;
                                
-- PA que trae el sigueinte id
-- recibe dos parametos nombre de la tabla y el nombre del compo primary key
SET @tabla = 'tbl_prueba';
SET @primary_key = 'id';
SET @resultado = NULL;
call pa_TrearSiguietneId(@tabla, @primary_key, @resultado);
SELECT @resultado;

-- PA que inserta usuario/docente, recibe varios parametros
call pa_AgregarDocenteUsuario('JUAN CARLOS DANIEL', 'MONTIEL CORNIEL', 1,
'MONTIEL CORNIEL', 'MONTIEL CORNIEL', 'MONTIEL CORNIEL', '1989-10-30', 1, 1);

show variables like '%ERRORS%';

-- PA que inactiva a usuario/docente recibe como parametro id_docente
call pa_EliminarDocenteUsuario(27);

-- PA que trae los roles no recibe parametro
call pa_rol_TaerRolesUsuarios();

-- PA que inserta una seccion recibe varios parametros
call pa_curso_AgregarSeccion(1, '5', 'L', 2, 1);

select count(*)  
from acade_periodo_nota_detalle where id_alumno = p_id_alumno and id_annio_lectivo = v_id_annio_lectivo ;


select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION, d.docente_nombre, mate.materia_nombre FROM adm_curso c inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad) inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo) inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso) inner join adm_docente d on(d.id_docente = cd.id_docente) inner join adm_materia mate on(mate.id_materia = cd.id_materia) where c.curso_estado= 1 and m.modalidad_estado = 1 and a.estado = 1 and d.id_docente =28 and mate.id_materia = 3 order by c.curso_nivel, m.modalidad_nombre;

select *
	from acade_periodo_nota_detalle pnd
	inner join adm_curso_detalle cd
		on(cd.id_materia = pnd.id_materia)
	inner join adm_alumno_detalle ad
		on(ad.id_curso = cd.id_curso and ad.id_alumno = pnd.id_alumno)
	where pnd.id_materia = 3  and cd.id_docente = 28  and cd.id_curso = 4   and pnd.id_annio_lectivo = 2;
-- funcion que verifica si el profesor ya ha ingresado notas y no poder quitarle la materia
-- recibe de parametro id_docnete, id_materia e id_curso
select fn_VerSiDocenteIngresoNotasAmateria(7, 1, 2);

select fn_TraerIdAnioLectivo() as ok;

-- PA para insertar un docente como orientador
-- recibe como parametro id_docente, id_curso, y el usuario que creo el registro
call pa_detalle_orientadorInsertarOrientador(22,12, 1);

-- sql trae materias asignada a docente
SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION, cd.id_detalle, c.id_curso,
ifnull(id_orientador, 0) as id_orientador
from adm_docente d 
inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
inner join adm_curso c on(c.id_curso = cd.id_curso)
inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
left join acade_detalle_orientador dori on(dori.id_curso = c.id_curso)
where d.id_docente = 22 and moda.modalidad_estado = 1
and c.curso_estado = 1 and c.id_annio_lectivo = (select fn_TraerIdAnioLectivo())
 group by c.id_curso order by c.curso_nivel, moda.id_modalidad, c.curso_identificador;
 
 
 
-- PA 	que devuelve todos los curso actuales asignados al docente
-- recibe como parametro el id del docente
call pa_TraerSeccionesDelDocente(23);


select count(*) 
	from acade_periodo_nota_detalle pnd
	inner join adm_curso_detalle cd
		on(cd.id_materia = pnd.id_materia)
	inner join adm_alumno_detalle ad
		on(ad.id_curso = cd.id_curso and ad.id_alumno = pnd.id_alumno)
	where /*pnd.id_materia = 1  and*/ cd.id_docente = 23 and cd.id_curso = 3
		and pnd.id_annio_lectivo = (select fn_TraerIdAnioLectivo());
    
    delete from acade_detalle_orientador where id_docente = 23 and id_curso = 1;
	-- PA que y quita a un docente orientador
    -- recibe como parametro el id del docente y el id del curso
    call pa_detelle_orientador_EliminarDocenteOrientador(23, 3);
    
    call pa_TraerSeccionesDelDocente(23);
    
-- PA que inserta el orientador 
-- recibe de parametro id docente y id curso mas el id usaurio
call pa_detalle_orientadorInsertarOrientador(22, 1, 1);
    
    
    select fn_VerSiDocenteIngresoNotasAmateria(23,1,2);

    
SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
		concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION, cd.id_detalle, c.id_curso,
        ifnull(id_orientador, 0) as id_orientador
		from adm_docente d 
		inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
		inner join adm_curso c on(c.id_curso = cd.id_curso)
		inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
        left join acade_detalle_orientador dori on(dori.id_curso = c.id_curso and dori.id_docente = p_id_docente)
		where d.id_docente = p_id_docente and moda.modalidad_estado = 1
		and c.curso_estado = 1 and c.id_annio_lectivo = (select fn_TraerIdAnioLectivo())
		 group by c.id_curso order by c.curso_nivel, moda.id_modalidad, c.curso_identificador;
         
call pa_modulo_TraerPermisosUsuario(2);

-- PA que cambia la clave
-- parametro que recbibe id del usuario y clave
call pa_usuarioResetearClave(1, md5('010707'));


select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION
	FROM adm_curso c
	inner join acade_modalidad m on(c.id_modalidad = m.id_modalidad)
	inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
	INNER JOIN adm_annio_lectivo an
	ON(an.id_annio_lectivo = c.id_annio_lectivo)
    inner join acade_detalle_orientador dori on(dori.id_curso = c.id_curso and dori.id_docente = 22)
	where c.curso_estado = 1 AND an.estado = 1 and cd.id_docente = 22 group by c.id_curso;
    
-- PA que trae todos las secciones a las cual es orientador el docente
-- parametros id del docente
call pa_TraerMateriasDelDocentenById(22);

-- PA que trae todas las secciones a las cuales el docente da clases
-- parametros id del docente
call pa_TraerSeccionesDelDocentePorMateria(21);

-- PA que trae la informacion de la institucion
call pa_TraerDatosGenerales();

call pa_informacciongeneralConfigurar('INSTITUTO NACIONAL DE SANTIAGO DE MARÍA', 'ISNAM', '1500', '11-21', 'Santiago de María, final calle olocuilta', '2222-2525, 2525-5857', 'insam@gmail.com', 'alguna misión', 'alguna visión', 'algunos valores', '', '260');

insert into adm_lista(lista_valor, lista_id_opcion, lista_comentario)
values
('Bachi.', '3', 'se ocupara en el registro de especialidades'),
('Tec.', '3', 'se ocupara en el registro de especialidades'),
('Lic.', '3', 'se ocupara en el registro de especialidades'),
('Ing.', '3', 'se ocupara en el registro de especialidades'),
('Máster.', '3', 'se ocupara en el registro de especialidades'),
('Dr.', '3', 'se ocupara en el registro de especialidades');

-- PA que trae todas las especialidades
call pa_TraerEspecialidades();

call pa_especialidad_TraerEspecialidades();


  select es.id_especialidad, lis.lista_valor, es.especialidad_nombre
    from acade_especialidad es 
		inner join adm_lista lis on(lis.id_lista = es.id_lista)
	where es.id_especialidad = 1;
    
    call pa_TaerCalendarioPagoPorAlumno(19);
    
    
    select p.id_periodo, p.periodo_numero, p.periodo_nombre
  from acade_periodo p
  inner join adm_annio_lectivo a on(a.id_annio_lectivo = p.id_annio_lectivo)
  where p.periodo_estado = 1 and p.periodo_estado =1 and a.estado = 1 and p.id_annio_lectivo = 2 order by p.id_periodo desc limit 1;
  
    
select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION, 
d.docente_nombre, mate.materia_nombre 
FROM adm_curso c inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad) 
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo) 
inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso) 
inner join adm_docente d on(d.id_docente = cd.id_docente) 
inner join adm_materia mate on(mate.id_materia = cd.id_materia) 
where c.curso_estado= 1 and m.modalidad_estado = 1 and a.estado = 1 
and d.id_docente =22 and mate.id_materia = 2 order by c.curso_nivel, m.modalidad_nombre;

select fn_TraerIdPeriodoEnCurso();

select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ' ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
	left join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_periodo = fn_TraerIdPeriodoEnCurso() 
										and pnd.id_materia = 1)
    left join acade_periodo pe on(pe.id_periodo = pnd.id_periodo  and pe.id_periodo = fn_TraerIdPeriodoEnCurso())
	where ad.id_curso = 3  and cur.curso_estado = 1 and al.estado = 1 order by a.alumno_apellido, a.alumno_nombre;
    


select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ' ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo,
            concat(pe.periodo_numero,'-', pe.periodo_nombre) as PERIODO

	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
	inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_materia = 1 /*and pnd.id_periodo = 2*/)
    inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
	where ad.id_curso = 3 and al.annio = 2017 /*and cur.curso_estado = 1 and al.estado = 1*/ order by a.alumno_apellido, a.alumno_nombre, pnd.id_periodo;


select c.id_curso, c.id_modalidad, c.curso_nivel, c.curso_identificador, c.fecha_creacion, m.modalidad_nombre, an.annio,
cd.id_docente
					from adm_curso c
					inner join acade_modalidad m
					on(c.id_modalidad = m.id_modalidad)
                    INNER JOIN adm_annio_lectivo an
					ON(an.id_annio_lectivo = c.id_annio_lectivo)
                    inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
                    inner join adm_docente doce on(doce.id_docente = cd.id_docente and doce.id_docente = cd.id_docente)
					WHERE m.modalidad_nombre like '%bachille%' order by c.curso_nivel, m.id_modalidad;
                    
	select c.id_curso, c.id_modalidad, c.curso_nivel, c.curso_identificador, c.fecha_creacion, m.modalidad_nombre
					from adm_curso c
					inner join acade_modalidad m
					on(c.id_modalidad = m.id_modalidad)
					INNER JOIN adm_annio_lectivo an
					ON(an.id_annio_lectivo = c.id_annio_lectivo)
				 order by c.curso_nivel, m.id_modalidad;
                 
-- PA que lista las notas por materia de la seccion del docente respectivo
-- recibe como parametro id_docente, id_materia, id_curso y año
call pa_TraerNotasPorDocenteMateriaCursoYannio(22, 1, 12, 2018);


SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
		concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION,
        /*mate.id_materia, mate.materia_nombre, */dori.id_orientador, c.id_curso, al.annio
		from adm_docente d 
		inner join acade_detalle_orientador dori on(dori.id_docente = d.id_docente)
		inner join adm_curso c on(c.id_curso = dori.id_curso)
		-- inner join adm_materia mate on(mate.id_materia = cd.id_materia)
		inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
        inner join adm_annio_lectivo al on(al.id_annio_lectivo = dori.id_annio_lectivo)
		where d.id_docente = 22 and (moda.modalidad_nombre like '%nocturno%' or al.annio like '%nocturno%')
        order by c.curso_nivel, moda.id_modalidad, c.curso_identificador;
        
 select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo,
			 concat(pe.periodo_numero,'-', pe.periodo_nombre) as PERIODO,
             concat(doce.docente_apellido, ', ', doce.docente_nombre) as DOCENTE,
             concat(cur.curso_nivel, ' ', moda.modalidad_nombre, ' ',  cur.curso_identificador) as SECCION,
             mate.materia_nombre
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
    inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno /*and pnd.id_materia = p_id_materia*/)
    inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
    inner join adm_curso_detalle cd on(cd.id_curso = cur.id_curso and cd.id_materia = pnd.id_materia)
    inner join adm_docente doce on(doce.id_docente = cd.id_docente)
    inner join acade_modalidad moda on(moda.id_modalidad = cur.id_modalidad)
    inner join adm_materia mate on(mate.id_materia = pnd.id_materia)
	where ad.id_curso = 3  /*and cd.id_docente = 22*/ and al.annio = 2017 group by pe.id_periodo, a.id_alumno, mate.id_materia
    order by mate.id_materia, a.alumno_apellido, a.alumno_nombre, pnd.id_periodo;
-- PA que muestra las ntoas de los alumnos por seccion
-- recibe como parametro id_curso y annio
call pa_GenerarReporteNotasPorSeccion(3, 2017);


select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION,
d.docente_nombre, mate.materia_nombre
FROM adm_curso c 
inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo and c.id_annio_lectivo = (SELECT fn_TraerIdAnioLectivo()))
inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
inner join adm_docente d on(d.id_docente = cd.id_docente)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
where c.curso_estado= 1 and m.modalidad_estado = 1
and d.id_docente =22  group by c.id_curso order by c.curso_nivel, m.modalidad_nombre;

CALL pa_mensajes('ERROR AL EJECUTAR ESTO');

SELECT fn_TraerIdPeriodoEnCurso();

select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, 
concat(cur.curso_nivel, ' ', moda.modalidad_nombre, ' ', cur.curso_identificador) as SECCION
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
    inner join acade_modalidad moda on(moda.id_modalidad = cur.id_modalidad)
	where ad.id_curso = 3 and al.id_annio_lectivo = (select fn_TraerIdAnioLectivo()) and cur.curso_estado = 1 and al.estado = 1 order by a.alumno_apellido, a.alumno_nombre;
    
    
    
    
select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION,
		d.docente_nombre/*, mate.materia_nombre*/, al.annio, d.id_docente
		FROM adm_curso c 
		inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
		inner join adm_annio_lectivo al on(al.id_annio_lectivo = c.id_annio_lectivo)
		inner join adm_docente d on(d.id_docente = 20)
		-- inner join adm_materia mate on(mate.id_materia = cd.id_materia)
		where c.curso_estado= 1 and al.id_annio_lectivo = 1 and m.modalidad_estado = 1 order by c.curso_nivel, m.modalidad_nombre;
        



SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION, /*mate.id_materia, mate.materia_nombre,*/ cd.id_detalle, c.id_curso, cd.id_annio_lectivo
from adm_docente d 
inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
inner join adm_curso c on(c.id_curso = cd.id_curso)
-- inner join adm_materia mate on(mate.id_materia = cd.id_materia)
inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
where d.id_docente = 22 and  cd.id_annio_lectivo = 2 
group by c.id_curso
order by c.curso_nivel, moda.id_modalidad, c.curso_identificador;


select a.alumno_codigo, concat(a.alumno_apellido, ', ', a.alumno_nombre) as ALUMNO, 
concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION,
cp.id_alumno, cp.id_calendario_pago, cp.calendario_mes, cp.calendario_annio,
		case 
		 when cp.calendario_mes  = 1 then 'ENERO'
		 when cp.calendario_mes  = 2 then 'FEBRERO'
		 when cp.calendario_mes  = 3 then 'MARZO'
		 when cp.calendario_mes  = 4 then 'ABRIL'
		 when cp.calendario_mes  = 5 then 'MAYO'
		 when cp.calendario_mes  = 6 then 'JUNIO'
		 when cp.calendario_mes  = 7 then 'JULIO'
		 when cp.calendario_mes  = 8 then 'AGOSTO'
		 when cp.calendario_mes  = 9 then 'SEPTIEMBRE'
		 when cp.calendario_mes  = 10 then 'OCTUBRE'
		 when cp.calendario_mes  = 11 then 'NOVIEMBRE'
		 when cp.calendario_mes  = 12 then 'DICIEMBRE'
		 ELSE 'INSCRIPCIÓN' END AS MES,
		 case 
			when cp.calendario_annio < year(now()) then 'VENCIDA'
			 else
				CASE 
					when cp.calendario_annio = year(now()) then 
							case 
								/*
								  el if es para ponerle siempre 1 al mes si este es 30 la inscripcion
								  y asi poder validar si la inscripcion ya esta vencida
								*/
								WHEN if(cp.calendario_mes = 30, 1, cp.calendario_mes) < month(now()) then 'VENCIDA'
								ELSE 'OK'
							END
					when cp.calendario_annio > year(now()) then  'OK'
				END
		END AS ESTADO_CUOTA
	FROM acade_calendario_pago cp
    inner join adm_alumno a on(a.id_alumno = cp.id_alumno)
    inner join adm_alumno_detalle ad on(ad.id_alumno = cp.id_alumno and ad.id_curso = 1)
    inner join adm_curso c on(c.id_curso = ad.id_curso and ad.id_curso = 1)
    inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
    where cp.calendario_annio < year(now()) and cp.calendario_fecha_pago = '0000-00-00'
		
        or(
			/* el if es para ponerle 1 a la inscripcion y simule que es enero para poder 
            evaluar si esta vencida o no*/
			cp.calendario_annio = year(now()) and if(cp.calendario_mes = 30, 1, cp.calendario_mes) < month(now()) and cp.calendario_fecha_pago = '0000-00-00'
            )
            and cp.id_annio_lectivo = 2

    order by a.alumno_apellido, cp.calendario_annio, cp.calendario_mes asc;
    
    
SELECT d.id_docente, CONCAT(d.docente_apellido, ', ', docente_nombre) as DOCENTE,
espe.especialidad_nombre, 
ifnull(concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador), 'SIN ASIGNAR') as SECCION
FROM adm_docente d
left join acade_detalle_orientador dori on(dori.id_docente = d.id_docente and dori.id_annio_lectivo = 2)
left join adm_curso c on(c.id_curso = dori.id_curso)
left join acade_especialidad espe on(espe.id_especialidad = d.id_especialidad)
left join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
order by d.docente_apellido, c.curso_nivel, m.id_modalidad;

SELECT CONCAT(d.docente_apellido, ', ', docente_nombre) as DOCENTE, d.docente_fecha_nacimiento, day(d.docente_fecha_nacimiento) as DIA,
case 
		 when MONTH(d.docente_fecha_nacimiento)  = 1 then 'ENERO'
		 when MONTH(d.docente_fecha_nacimiento)  = 2 then 'FEBRERO'
		 when MONTH(d.docente_fecha_nacimiento)  = 3 then 'MARZO'
		 when MONTH(d.docente_fecha_nacimiento)  = 4 then 'ABRIL'
		 when MONTH(d.docente_fecha_nacimiento)  = 5 then 'MAYO'
		 when MONTH(d.docente_fecha_nacimiento)  = 6 then 'JUNIO'
		 when MONTH(d.docente_fecha_nacimiento)  = 7 then 'JULIO'
		 when MONTH(d.docente_fecha_nacimiento)  = 8 then 'AGOSTO'
		 when MONTH(d.docente_fecha_nacimiento)  = 9 then 'SEPTIEMBRE'
		 when MONTH(d.docente_fecha_nacimiento)  = 10 then 'OCTUBRE'
		 when MONTH(d.docente_fecha_nacimiento)  = 11 then 'NOVIEMBRE'
		 when MONTH(d.docente_fecha_nacimiento)  = 12 then 'DICIEMBRE'
	END AS MES
 FROM adm_docente d
 WHERE MONTH(d.docente_fecha_nacimiento) = MONTH(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)) 
 OR MONTH(d.docente_fecha_nacimiento) = MONTH('2017-02-01') -- AND DAY( d.docente_fecha_nacimiento ) > month('2017-12-01')
 order by  day(d.docente_fecha_nacimiento) asc;

-- PA para listar los docentes que cumplen años
-- parametro la fecha actual
call pa_GenerarReporteDocentesCumpleannieros('2017-02-01');


SELECT a.alumno_codigo, CONCAT(a.alumno_apellido, ', ', a.alumno_nombre) as ALUMNO, a.alumno_fecha_nacimiento, day(a.alumno_fecha_nacimiento) as DIA,
		case 
				 when MONTH(a.alumno_fecha_nacimiento)  = 1 then 'ENERO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 2 then 'FEBRERO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 3 then 'MARZO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 4 then 'ABRIL'
				 when MONTH(a.alumno_fecha_nacimiento)  = 5 then 'MAYO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 6 then 'JUNIO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 7 then 'JULIO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 8 then 'AGOSTO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 9 then 'SEPTIEMBRE'
				 when MONTH(a.alumno_fecha_nacimiento)  = 10 then 'OCTUBRE'
				 when MONTH(a.alumno_fecha_nacimiento)  = 11 then 'NOVIEMBRE'
				 when MONTH(a.alumno_fecha_nacimiento)  = 12 then 'DICIEMBRE'
			END AS MES, concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ', c.curso_identificador) as SECCION
		 FROM adm_alumno a
         inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno and ad.id_curso = 3)
         inner join adm_curso c on(c.id_curso = ad.id_curso and c.id_annio_lectivo = (select fn_TraerIdAnioLectivo()))
         inner join acade_modalidad moda on(moda.id_modalidad = c.id_curso)
		 WHERE   /*MONTH(a.alumno_fecha_nacimiento) = MONTH(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)) */
		  MONTH(a.alumno_fecha_nacimiento) = MONTH('2017-10-01')  -- AND DAY( d.docente_fecha_nacimiento ) > month('2017-12-01')
		 order by  day(a.alumno_fecha_nacimiento) asc;
         
 -- PA para listar los alumnos que cumplen años
-- parametro la mes e id_curso
call pa_GenerarReporteAlumnosCumpleannieros('2017-02-01', 3);        


select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ' ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
	left join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_periodo = fn_TraerIdPeriodoEnCurso() 
													and pnd.id_materia = 1)
    left join acade_periodo pe on(pe.id_periodo = pnd.id_periodo  and pe.id_periodo = fn_TraerIdPeriodoEnCurso())
	where ad.id_curso = 3  and cur.curso_estado = 1 and al.estado = 1 order by a.alumno_apellido, a.alumno_nombre;
    
    
    select  /*a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ' ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle,*/ sum(pnd.N_1)/3 as promedio/*, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo*/
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	-- inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
	inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_materia = 1)
    inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
	where ad.id_curso = 3 and pnd.id_alumno = 21 and pnd.id_annio_lectivo = (select fn_TraerIdAnioLectivo())
					and pnd.id_materia = 1 and pe.periodo_recuperacion = 0;

-- PA que trae los alumnos reprobados
-- recibe como parametros el id_curso y el id_materia
call pa_TraerAlumnosParaNotasRecuperacion(3, 1);

-- PA que inserta el nuevo periodo y desactiva el anterior
-- recibe varios parametros
call pa_InsertaryDesactivarPeriodoAcademico(7, 7, 'prueba', 0, 2, 1);


select count(*) from acade_periodo where id_annio_lectivo = (select fn_TraerIdAnioLectivo()) and periodo_recuperacion = 0;

SELECT (select count(*)   from acade_periodo where id_annio_lectivo = (select fn_TraerIdAnioLectivo()) AND periodo_recuperacion = 0) AS ORDINARIO,
	   (select count(*)   from acade_periodo where id_annio_lectivo = (select fn_TraerIdAnioLectivo()) AND periodo_recuperacion = 1) AS RECUPERACION;

-- PA que trae el numero de periodos por separado ordinarios y de recuperacion del año especificado
-- recibe como parametro el año
call pa_TraerNumerosDePeriodos(2017);



select  sum(pnd.N_1)/3, id_materia
from acade_periodo_nota_detalle pnd 
inner join adm_annio_lectivo al on(al.id_annio_lectivo = pnd.id_annio_lectivo)
where  pnd.id_alumno = 21 and al.annio = 2017 and pnd.id_materia = 2
group by id_materia;

select count(*)  from acade_periodo pe 
            inner join adm_annio_lectivo al on(al.id_annio_lectivo = pe.id_annio_lectivo)
            where al.annio = 2017 and periodo_recuperacion = 1;

select  sum(pnd.N_1)/3 
from adm_alumno a
inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
					-- inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
inner join adm_curso cur on(cur.id_curso = ad.id_curso)
inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_materia = p_id_materia)
inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
where ad.id_curso = p_id_curso and pnd.id_alumno = v_id_alumno and pnd.id_annio_lectivo = (select fn_TraerIdAnioLectivo())
and pnd.id_materia = p_id_materia and pe.periodo_recuperacion = 0;



select cur.id_curso, cd.id_materia
from adm_curso cur
inner join adm_curso_detalle cd on(cd.id_curso = cur.id_curso)
inner join adm_annio_lectivo al on(al.id_annio_lectivo = cur.id_annio_lectivo and al.id_annio_lectivo = cd.id_annio_lectivo)
where cd.id_curso = 3 and al.annio = 2017
group by cd.id_materia;

            select count(*) from acade_periodo pe 
            inner join adm_annio_lectivo al on(al.id_annio_lectivo = pe.id_annio_lectivo)
            where al.annio = 2017 and periodo_recuperacion = 0;
  select  sum(pnd.N_1)/3
					from adm_curso cur 
                    inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = 21 and pnd.id_materia = 1)
					inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
                    inner join adm_annio_lectivo al on(al.id_annio_lectivo = pe.id_annio_lectivo)
					where cur.id_curso = 3 and al.annio = 2017
					and pe.periodo_recuperacion = 0;
                    
-- PA que muestra las ntoas de los alumnos por seccion
-- recibe como parametro id_curso y annio
call pa_GenerarReporteNotasPorSeccion(3, 2017);

-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
SELECT id_annio_lectivo
	/*INTO v_id_annio_lectivo*/ FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/
    
-- PA que crea y desactiva el año lectivo
call pa_InsertarAnnioLectivoYdesactivarAnterior();



SELECT d.id_docente, mate.id_materia, mate.materia_nombre, a.annio
from adm_docente d 
inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
inner join adm_curso c on(c.id_curso = cd.id_curso)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo)
where d.id_docente = 22 and c.curso_estado = 1  group by mate.id_materia;


select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION, c.curso_turno,
d.docente_nombre, mate.materia_nombre
FROM adm_curso c 
inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo)
inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
inner join adm_docente d on(d.id_docente = cd.id_docente)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
where c.curso_estado= 1 and m.modalidad_estado = 1
and d.id_docente =22 and mate.id_materia = 3 order by c.curso_nivel, m.modalidad_nombre;



select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_periodo
			from adm_alumno a
			inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
			inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
			inner join adm_curso cur on(cur.id_curso = ad.id_curso)
			inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno 
															and pnd.id_materia = 1)
			inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
			where ad.id_curso = 3 
            and al.annio = 2017 and cur.curso_estado = 1   order by a.alumno_apellido, a.alumno_nombre, pnd.id_periodo;
            
            
 select count(*) as v_numero_de_peridodos from acade_periodo  pe 
            inner join adm_annio_lectivo al on(al.id_annio_lectivo = pe.id_annio_lectivo)
            where al.annio = 2018 and periodo_recuperacion = 0;
            
            
select  sum(pnd.N_1)/3  as v_promedio
					from adm_alumno a
					inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
					inner join adm_curso cur on(cur.id_curso = ad.id_curso)
					inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_materia = 1)
					inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
                    inner join adm_annio_lectivo al on(al.id_annio_lectivo = pnd.id_annio_lectivo)
					where ad.id_curso = 3 and pnd.id_alumno = 21 and al.annio = 2016
									and pnd.id_materia = 1 and pe.periodo_recuperacion = 0;
                                    
-- PA que trae los alumnos aplazados de cualesquira año lectivo y seccion selecionada
-- parametros que recibe id_curso, id_materia y el año de que se imparito esa materia a ese curso 
call pa_TraerAlumnosAplazados(3, 1, 2017);

SELECT d.id_docente, d.docente_nombre, d.docente_apellido,
u.usuario, r.rol_nombre
from adm_docente d 
inner join adm_usuario u on(d.id_usuario = u.id_usuario)
inner join adm_rol r on(r.id_rol = u.id_rol)
inner join adm_curso_detalle cd on (cd.id_docente = d.id_docente and cd.id_annio_lectivo = (select fn_TraerIdAnioLectivo()))
where u.usuario_estado = true group by d.id_docente order by d.docente_apellido, d.docente_nombre;

-- PA que trae los alumnos en mora de la seccion selecionada
-- parametros id_curso e id_annio_lectivo
call pa_TraerAlumnosEnMoraPorSeccion(3, 2);

-- PA para insertar un docente como orientador
-- recibe como parametro id_docente, id_curso, y el usuario que creo el registro
call pa_detalle_orientadorInsertarOrientador(22,12, 1);


select fn_VerSiAlumnoYaPagoCuota(21, 30) as ESTADO_CUOTA;


SELECT annio
	AS v_annio FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1;
    
    SELECT count(*) AS v_encontrado FROM acade_calendario_pago 
     where id_alumno = 21 and calendario_annio = 2018 and calendario_mes = 30 and calendario_cuota_pagada = 1 LIMIT 1;
     
     
SELECT a.annio
from adm_docente d 
inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
inner join adm_curso c on(c.id_curso = cd.id_curso)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo)
where d.id_docente = 22 and c.curso_estado = 1  group by cd.id_annio_lectivo;



show events;

evento_EjectuarPACrearAnnioLectivo

evento_GenerarCalendarioPago