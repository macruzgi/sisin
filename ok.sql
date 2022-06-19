DROP FUNCTION IF EXISTS GenerarCodigoAlumno;

DELIMITER //
CREATE  FUNCTION GenerarCodigoAlumno() RETURNS VARCHAR(6) 
BEGIN

/*si la funcion retorno un NULL sigunifica que ya no hay codigos disponibles*/
DECLARE v_maximo_codigo INT;
DECLARE v_valor_devolver VARCHAR(6);
DECLARE v_annio_lectivo INT;

-- asigno a la variable v_annio_lectivo el año lectivo corresspondiente
SELECT SUBSTR(annio, 3,2) /*desde la poscion 3 quiero 2 posiciones*/ 
	INTO v_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1   ORDER BY annio DESC LIMIT 1;

-- tarigo el maximo codigo mas uno asignando a la variable v_maximo_codigo
SELECT  MAX(SUBSTRING(alumno_codigo, 1, 4)) +1 INTO v_maximo_codigo FROM adm_alumno;

 SELECT 
	CASE 
		WHEN v_maximo_codigo <= 9 THEN CONCAT('000', CAST(v_maximo_codigo AS CHAR), v_annio_lectivo)
        WHEN v_maximo_codigo <= 99 THEN CONCAT('00', CAST(v_maximo_codigo AS CHAR), v_annio_lectivo)
        WHEN v_maximo_codigo <= 999 THEN CONCAT('0', CAST(v_maximo_codigo AS CHAR), v_annio_lectivo)
		ELSE NULL 
        END INTO v_valor_devolver FROM adm_alumno LIMIT 1;
RETURN v_valor_devolver;

END //
DELIMITER ;

SELECT GenerarCodigoAlumno() AS ok;



DROP FUNCTION IF EXISTS VerifcarAlumnoSiTieneNotasLectivo;

DELIMITER //
CREATE  FUNCTION VerifcarAlumnoSiTieneNotasLectivo(p_id_alumno INT) RETURNS BOOLEAN
BEGIN

/*si la funcion retorno un true(1) sigunifica que el alumno puede desmatricurlarse de la seccion 
elegida, de lo contrario es que ya tiene notas del año lectivo
actual y no puede quitarse se la seccion inscrito(no se puede desmatricular)*/
DECLARE v_cantidad_notas INT;
DECLARE v_id_annio_lectivo INT;

-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
SELECT id_annio_lectivo
	INTO v_id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY annio DESC LIMIT 1; /*simpre me devolvera una fila*/

-- tarigo el la cuenta de las notas del año lectivo actual
SELECT COUNT(*) INTO v_cantidad_notas 
FROM acade_periodo_nota_detalle WHERE id_alumno = p_id_alumno AND id_annio_lectivo = v_id_annio_lectivo ;

	IF v_cantidad_notas = 0 THEN
		RETURN TRUE;
	ELSE
        RETURN FALSE;
	END IF;
        

END //
DELIMITER ;




DROP PROCEDURE IF EXISTS pa_InsertaryDesactivarPeriodoAcademico;
DELIMITER //
CREATE PROCEDURE pa_InsertaryDesactivarPeriodoAcademico(p_id_periodo INT, p_periodo_numero TINYINT, 
p_periodo_nombre VARCHAR(50), p_periodo_recuperacion TINYINT,  p_id_annio_lectivo INT, p_id_usuario INT)
BEGIN
/*
	PA que desactiva el perido actual lectivo e inserta el nuevo perido
    ademas verifica si el perido es de recuperacion o periodo normal
    devolviendo como mensaje deacuerdo a las validaciones
*/
	DECLARE v_id_periodo_actual INT;
    -- variable para asignar el conteo y verificar si ya hay periodo de recuperacion
    DECLARE v_cantidad_recuperacion INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
         -- hubieron errores
         ROLLBACK;
         select 'NO' as MENSAJE;
         resignal; -- MUESTRA EL ERROR GENERADO POR LA EXECPCION
		END;
		
        -- inicio la transaccion
        START TRANSACTION;
			
            select count(*) into v_cantidad_recuperacion from acade_periodo 
						where id_annio_lectivo = (select fn_TraerIdAnioLectivo()) and periodo_recuperacion = 1;
			-- si la parametro p_periodo_recuperacion es igula a 0 no es periodo de recuperacion que setea la variable local
            -- v_cantidad_recuperacion a cero
            if(v_cantidad_recuperacion = 0) then 
					-- traigo el perido actual
					-- siempre devolvera un valor el periodo actual
					SELECT id_periodo INTO v_id_periodo_actual FROM acade_periodo WHERE periodo_estado = 1 ORDER BY id_periodo DESC LIMIT 1;
					-- inactivo el periodo actual
					UPDATE acade_periodo SET periodo_estado = 0 WHERE id_periodo = v_id_periodo_actual;
					-- inserto el nuevo periodo
					INSERT INTO acade_periodo(id_periodo, periodo_numero, periodo_nombre, periodo_recuperacion, id_annio_lectivo, id_usuario)
						VALUES(p_id_periodo,  p_periodo_numero, p_periodo_nombre, p_periodo_recuperacion, p_id_annio_lectivo, p_id_usuario);
					SELECT 'OK' as MENSAJE;
			else
				-- de lo controario que lance un error de YA indicando que ya existe un periodo de recuperacion
				SELECT 'YA' AS MENSAJE;
			end if;
		COMMIT;     
    
    
END
//

DELIMITER ;

-- NOTA: ESTE PA NO SE UTILIZA
DROP PROCEDURE IF EXISTS pa_mensajes;
DELIMITER //
CREATE PROCEDURE pa_mensajes(p_mensaje LONGTEXT)
BEGIN
	CREATE TEMPORARY TABLE temporal_mensajes(id_menasje INT NOT NULL PRIMARY KEY AUTO_INCREMENT, mensaje LONGTEXT NOT NULL);
    INSERT INTO temporal_mensajes(mensaje) VALUES(p_mensaje);
	-- select p_mensaje as MENSARJE;
    DROP TABLE temporal_mensajes;
END;

//

DELIMITER ;



DROP TRIGGER IF EXISTS tr_validar_ingreso_nota;
DELIMITER //
CREATE TRIGGER tr_validar_ingreso_nota  BEFORE INSERT  ON acade_periodo_nota_detalle
FOR EACH ROW
BEGIN
	/*
    valido para ver si la nota ingresa esta entre el rango de 0 a 10.0
    */
    IF new.N_1 < 0 OR new.N_1 > 10 THEN
		CALL pa_mensajes('Las notas deben estar entre el rango de 0 a 10.');
       
	ELSE
		CALL pa_mensajes('OK');
        INSERT INTO acade_periodo_nota_detalle(N_1, N_2, N_3, id_periodo, id_alumno,
id_materia, id_annio_lectivo, id_usuario) VALUES(
new.N_1, new.N_2, new.N_3, new.id_periodo, new.id_alumno,
new.id_materia, new.id_annio_lectivo, new.id_usuario);
	END IF;
		
END;
//
DELIMITER ;


DROP FUNCTION IF EXISTS fn_TraerIdPeriodoEnCurso;
DELIMITER //
CREATE  FUNCTION fn_TraerIdPeriodoEnCurso() RETURNS INT 
BEGIN

/*
	la funcion devolvera el id del periodo en curso activo actualmente
    - si la funccion devuelve null significa no hay periodos activos para el año en curso, hay que revisar
    
*/

DECLARE v_valor_devolver INT;
DECLARE v_id_annio_lectivo INT;

-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
SELECT id_annio_lectivo
	INTO v_id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

	SELECT pe.id_periodo INTO v_valor_devolver FROM acade_periodo pe
		INNER JOIN adm_annio_lectivo a ON(a.id_annio_lectivo = pe.id_annio_lectivo)
        WHERE a.estado = 1 AND pe.periodo_estado = 1 AND a.id_annio_lectivo = v_id_annio_lectivo ORDER BY pe.id_periodo DESC LIMIT 1;
RETURN v_valor_devolver;

END //
DELIMITER ;





drop procedure if exists pa_InsertarAnnioLectivoYdesactivarAnterior;
delimiter //
create procedure pa_InsertarAnnioLectivoYdesactivarAnterior()
begin
/*
	PA que insertara el nuevo año lectivo y desactivara el viejo
    este procedimiento se ejecutara cada año el 1 de enero 1:00 de la madrugada a travez de un evento
*/
          declare v_id_annio_lectivo_viejo int; -- varible para asignarle el año lectivo acutal
		  declare v_id_annio_lectivo int;
          -- variable de excepcion
          declare exit handler for sqlexception
			begin
				-- hubieron errores
                rollback;
                select 'Hubieron errores' as MENSAJE;
                resignal; -- MUESTRA EL ERROR GENERADO POR LA EXCEPCION
			end;
		
        -- inicio transaccion
        start transaction;
           	-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo del año lectivo actual activo
		SELECT id_annio_lectivo
			INTO v_id_annio_lectivo_viejo FROM adm_annio_lectivo 
				WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

         -- actualizo el año lectivo anterior y lo pongo inactivo
         UPDATE adm_annio_lectivo SET estado = 0 WHERE id_annio_lectivo = v_id_annio_lectivo_viejo;
		
        SELECT IFNULL(MAX(id_annio_lectivo), 0) + 1 into v_id_annio_lectivo from adm_annio_lectivo;
		-- una vez inactivado el año lectivo anterior(viejo) inserte el nuevo año lectivo
      	 INSERT INTO adm_annio_lectivo(id_annio_lectivo, annio, id_usuario)
			VALUES (v_id_annio_lectivo, YEAR(NOW()), 1); 
		
		select 'Año lectivo creado satisfactoriamente' as MENSAJE;
        commit;         
        
end;
//
delimiter ;

DROP TABLE IF EXISTS acade_calendario_pago;
CREATE TABLE `acade_calendario_pago` (
  `id_calendario_pago` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'llave primaria incremental',
  `calendario_mes` TINYINT(2) NOT NULL COMMENT 'numero de mes al cual corresponde la cuota del 1 al 12',
  `calendario_annio` INT(4) NOT NULL COMMENT 'año a al que pertenece la cuota, servira para identificar, 
  ya que se pondra el id del año lectivo para la relacion',
  `calendario_fecha_mes_cuota` DATE NOT NULL COMMENT 'ultimo dia de cada mes en el que vence la cuota',
  `calendaria_valor_cuota` DOUBLE DEFAULT NULL COMMENT 'valor en dolares de la cuota cancelada',
  `calendario_cuota_pagada` INT(1) DEFAULT '0' COMMENT 'si es 1 la cuota ya se pago 0 esta pendiente de pagar',
   `calendario_fecha_pago` DATE NOT NULL DEFAULT '0000-00-00' COMMENT 'fecha en la que realamente se pago la cuota',
   fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   id_usuario INT NOT NULL COMMENT 'usaurio que crea el registro o modifica si aplicase, solo sera relacion imaginaria de refencia',
   id_annio_lectivo INT NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
   id_alumno INT NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_alumno, indice',
   INDEX(id_annio_lectivo),
   INDEX(id_alumno),
   UNIQUE INDEX calendario_annio_lectivo_alumno(calendario_mes, calendario_annio, id_annio_lectivo,id_alumno)

) ENGINE=INNODB;


drop procedure if exists pa_GenerarCalendarioPagoPorAlumno;
DELIMITER //
CREATE  PROCEDURE pa_GenerarCalendarioPagoPorAlumno(p_id_alumno INT, p_fecha_ingreso date, p_id_usuario int)
BEGIN
	/*
		PA que se ejecutara cuando se ejecute el PA pa_alumno_AgregarAlumno, es decir, cada vez que se registre un alumno
	*/
	 DECLARE v_id_annio_lectivo INT;
	 DECLARE v_annio_lectivo INT;
	 DECLARE meses INT;
	 DECLARE v_el_nuevo_mes VARCHAR(3);
     -- variable para controlar la transaccion
     declare exit handler for sqlexception
		begin
			rollback; -- hubieron errores
            select 'NO' as MENSAJE;
			resignal; -- mostrara el mensaje de error
		end;
        
	-- inicio la transaccion
    start transaction;
	
	-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
	SELECT id_annio_lectivo
		INTO v_id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

	SELECT annio
		INTO v_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

	-- inserto la inscripcion
	
	INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
				id_usuario, id_annio_lectivo, id_alumno)
				VALUES(30, v_annio_lectivo, CONCAT(v_annio_lectivo, '-',  month(p_fecha_ingreso), '-', '01' ),
				p_id_usuario, v_id_annio_lectivo, p_id_alumno);

	SET meses = month(p_fecha_ingreso);
	    WHILE meses<= 12 DO
			IF(meses <= 9) THEN
				SET v_el_nuevo_mes = '0'+meses;
			ELSE
				SET v_el_nuevo_mes = meses;
			END IF;
			INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
				id_usuario, id_annio_lectivo, id_alumno)
				VALUES(meses, v_annio_lectivo, CONCAT(v_annio_lectivo, '-',  v_el_nuevo_mes, '-', '01' ),
				p_id_usuario, v_id_annio_lectivo, p_id_alumno);
	      SET meses = meses + 1;
	    END WHILE;

	-- le sumo un mes a la fecha_mes_cuota y luego le resto un día para que me de la última fecha de pagao
	UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL 1 MONTH) 
		WHERE calendario_annio = v_annio_lectivo and id_alumno =p_id_alumno;
	UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL -1 DAY) 
		WHERE calendario_annio = v_annio_lectivo and id_alumno =p_id_alumno;
	
    select 'OK' as MENSAJE;
    COMMIT;
END;
//
DELIMITER ;


drop procedure if exists pa_GenerarCalendarioPagoPorAlumnoFortuito;
DELIMITER //
CREATE  PROCEDURE pa_GenerarCalendarioPagoPorAlumnoFortuito(p_id_alumno INT, p_fecha_ingreso date, p_annio_lectivo_generar int,
 p_id_modalidad int, p_id_usuario int)
BEGIN
/*
proceimiento que se ejecutara manualmente por un dba para que genere un plan de calendario
extendido, es decir si el alumno cancelara todos los años respectivos a sus estudios
*/
	 DECLARE v_id_annio_lectivo INT;
	 DECLARE meses INT;
	 DECLARE v_el_nuevo_mes VARCHAR(3);
	 DECLARE v_modalidad_duracion int;
     DECLARE v_cantidad_annios_generados int;
	 declare exit handler for sqlexception
		begin
         -- hubieron errores
         rollback;
         SELECT 'NO' AS MENSAJE;
         resignal; -- MUSTRA EL MENSAJE DE ERROR SI HUBIESE
		end;
		
        -- inicio la transaccion
        start transaction;
	/*
		traigo la duracion de la modalidad para compararla con los años creados en el calendario 
		asi si la modadlidad dura 3 año y se encuntran ya esos tres años que ya no permita
		generar mas plan de pagos porque no puede pagarse lo que ya no se estudia
	*/
	select modalidad_duracion into v_modalidad_duracion from acade_modalidad where id_modalidad = p_id_modalidad;
	/*
		traigo la cantidad de años que dura la modadalidad del alumno
		y compararla con la v_modalidad_duracion
	*/
	select count(*) into v_cantidad_annios_generados from
		( 
		select distinct calendario_annio from acade_calendario_pago where id_alumno = p_id_alumno
		) as resultado;
	if v_cantidad_annios_generados  <  v_modalidad_duracion then


				-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
				SELECT id_annio_lectivo
					INTO v_id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

				
				-- inserto la inscripcion
				
				INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
							id_usuario, id_annio_lectivo, id_alumno)
							VALUES(30, p_annio_lectivo_generar, CONCAT(p_annio_lectivo_generar, '-01-', '01' ),
							p_id_usuario, v_id_annio_lectivo, p_id_alumno);

				SET meses = 1;
					WHILE meses<= 12 DO
						IF(meses <= 9) THEN
							SET v_el_nuevo_mes = '0'+meses;
						ELSE
							SET v_el_nuevo_mes = meses;
						END IF;
						INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
							id_usuario, id_annio_lectivo, id_alumno)
							VALUES(meses, p_annio_lectivo_generar, CONCAT(p_annio_lectivo_generar, '-',  v_el_nuevo_mes, '-', '01' ),
							p_id_usuario, v_id_annio_lectivo, p_id_alumno);
					  SET meses = meses + 1;
					END WHILE;

				-- le sumo un mes a la fecha_mes_cuota y luego le resto un día para que me de la última fecha de pagao
				UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL 1 MONTH) 
					WHERE calendario_annio = p_annio_lectivo_generar and id_alumno =p_id_alumno;
				UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL -1 DAY) 
					WHERE calendario_annio = p_annio_lectivo_generar and id_alumno =p_id_alumno;
		SELECT 'OK' AS MENSAJE;
	 else
		select 'MENSAJE: SEGÚN LA MODALIDAD DEL ALUMNO YA NO PUEDE GENERAR MÁS CALENDARIO DE PAGO' AS ERROR_GENERADO;
	 end if;
	commit; 
END;
//
DELIMITER ;

drop procedure if exists pa_GenerarCalendarioPago;
DELIMITER //
CREATE  PROCEDURE pa_GenerarCalendarioPago()
BEGIN
	/*
		PA que se invocara desde un Evente MySQL que no recibira parametros
        este se ejecutara cada año el 1 de enero para crear el calendario respectivo
        para cada alumno
	*/

	 declare v_id_alumno int; -- variable para el recorrido del cursor
	 DECLARE v_id_annio_lectivo INT;
	 DECLARE v_annio_lectivo INT;
	 DECLARE meses INT;
	 DECLARE v_el_nuevo_mes VARCHAR(3);
	 -- Variable para controlar el fin del bucle del cursor
	 DECLARE fin INTEGER DEFAULT 0;
	/*
		cursor que me trae todos los alumnos
		que en la tabla acade_calendario_pago no se haya creado el calendario para el año lectivo en curso
		estos por si ya alumnos pagaron cuotras por adelantados y se tuvo que generar un calendario fortuito
		con el PA pa_GenerarCalendarioPagoPorAlumnoFortuito
	*/
	DECLARE cursor_alumnos CURSOR FOR
		select id_alumno from adm_alumno where alumno_estado = 1
				and id_alumno not in(select id_alumno from acade_calendario_pago where calendario_annio = v_annio_lectivo);
	-- Condición de salida
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;

	 declare exit handler for sqlexception
		begin
         -- hubieron errores  
         rollback;
         select 'NO' as MENSAJE;
         resignal; -- muestra el mensaje de error si es que hubiese
		end;
		
        -- inicio la transaccion
        start transaction;
			-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo del año lectivo corresspondiente
			SELECT id_annio_lectivo
				INTO v_id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

			SELECT annio
				INTO v_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

			/*
				abro el cursor y lo recorro, si da erro que se salga controlado con la variable fin
			*/
			OPEN cursor_alumnos;
			  recorrer_cursor: LOOP
				FETCH cursor_alumnos INTO v_id_alumno;
				IF fin = 1 THEN
				   LEAVE recorrer_cursor;
				END IF;
				-- inserto la inscripcion
				
				INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
							id_usuario, id_annio_lectivo, id_alumno)
							VALUES(30, v_annio_lectivo, CONCAT(v_annio_lectivo, '-01-01' ), /*simpre sera enero*/
							1, v_id_annio_lectivo, v_id_alumno);

				SET meses = 1; -- 1 porque seimpre se ejecutara en enero
					WHILE meses<= 12 DO
						IF(meses <= 9) THEN
							SET v_el_nuevo_mes = '0'+meses;
						ELSE
							SET v_el_nuevo_mes = meses;
						END IF;
						INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
							id_usuario, id_annio_lectivo, id_alumno)
							VALUES(meses, v_annio_lectivo, CONCAT(v_annio_lectivo, '-',  v_el_nuevo_mes, '-', '01' ),
							1, v_id_annio_lectivo, v_id_alumno);
					  SET meses = meses + 1;
					END WHILE;

				-- le sumo un mes a la fecha_mes_cuota y luego le resto un día para que me de la última fecha de pagao
				UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL 1 MONTH) 
					WHERE calendario_annio = v_annio_lectivo and id_alumno =v_id_alumno;
				UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL -1 DAY) 
					WHERE calendario_annio = v_annio_lectivo and id_alumno =v_id_alumno;
			 END LOOP recorrer_cursor;
              select 'OK' as MENSAJE;
		commit;
END;
//
DELIMITER ;

DROP event IF EXISTS evento_EjecutarPAGenerarCalendarioPago;
DELIMITER //
CREATE event evento_EjecutarPAGenerarCalendarioPago
ON SCHEDULE EVERY 1 YEAR STARTS '2017-03-25 16:00:00'
COMMENT 'evento que se ejecuta cada 1 de enero a las 3:00am'
DO BEGIN
	/*
		evento que se ejecuta cada 1 de enero a las 3:00am ejecutando el PA para generar el calendario de pago para cada lumno registrado
    */
	CALL pa_GenerarCalendarioPago();
END;
//
DELIMITER ;

DROP EVENT IF EXISTS `evento_EjectuarPACrearAnnioLectivo`;
DELIMITER //
CREATE EVENT evento_EjectuarPACrearAnnioLectivo 
ON SCHEDULE EVERY 1 YEAR STARTS '2017-02-27 10:57:00' 
 COMMENT 'Evento que ejecuta cada año el 1 de enero a la 1:00am' 
 DO BEGIN
	/*
		evento que se ejecutara cada año el 1 de enero a las 1 de la madrugada
        ejecutando el PA pa_InsertarAnnioLectivoYdesactivarAnterior que crea el nuevo año lectivo
        y desactiva el anterior, este evente deve ejucarse antes que el evento_EjecutarPAGenerarCalendarioPago
        porque sino no encontrara el año lectivo nuevo
	*/
		call pa_InsertarAnnioLectivoYdesactivarAnterior();
	END ;
    //
DELIMITER ;

drop procedure if exists pa_TaerCalendarioPagoPorAlumno;
delimiter //
create procedure pa_TaerCalendarioPagoPorAlumno(p_id_alumno int)
begin
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
	FROM acade_calendario_pago cp where cp.id_alumno = p_id_alumno and cp.calendario_cuota_pagada = 0 order by cp.id_calendario_pago asc;
end;
//
delimiter ;

drop procedure if exists pa_ActualizarCuotasAlumno;
delimiter //
create procedure pa_ActualizarCuotasAlumno(p_id_alumno int, p_id_calendario_pago int)
begin
	
	 declare exit handler for sqlexception
		begin
         -- hubieron errores
         rollback;
		end;
		
        -- inicio la transaccion
        start transaction;
				/*
					actualizo las cuotas correspondientes
				*/
                update acade_calendario_pago set calendario_cuota_pagada = 1, calendario_fecha_pago = DATE_FORMAT(NOW(),'%Y-%m-%d')
					where id_calendario_pago <= p_id_calendario_pago and id_alumno = p_id_alumno and calendario_cuota_pagada = 0;

        commit;
     
end;
//
delimiter ;



DROP FUNCTION IF EXISTS fn_VerSiAlumnoYaPagoCuota;
DELIMITER //
CREATE  FUNCTION fn_VerSiAlumnoYaPagoCuota(p_id_alumno int, p_calendario_mes int) RETURNS INT 
BEGIN

/*
	la procedimiento devolvera un 0 o 1, si devuelve un 1 significa que ya pago la insecripcion
    de lo contrario no
    
*/

DECLARE v_encontrado INT;
DECLARE v_annio INT;

-- asigno a la variable v_annio el annio lectivo corresspondiente
SELECT annio
	INTO v_annio FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

	SELECT count(*) INTO v_encontrado FROM acade_calendario_pago 
     where id_alumno = p_id_alumno and calendario_annio = v_annio and calendario_mes = p_calendario_mes and calendario_cuota_pagada = 1 LIMIT 1;
     /*
		si el valor de la variable v_encontrado es 1 ya pago la cuota de inscripcion
	*/
    if v_encontrado = 1 then
		return 1;
	else	
		return 0;
	end if;

END //
DELIMITER ;

drop procedure if exists pa_IniciarSesion;
delimiter //
create procedure pa_IniciarSesion(p_usuario varchar(50), p_clave varchar(100))
begin
	/*
		PA que verifica si el usuario ha ingresado las credenciales correctas y si esta activo
        si todo va bien, retornara datos respectivos de lo contrario enviara datos de error
	*/
    -- variable para verificar si el usuario esta activo y si ha ingresado credenciales correctas
    declare v_verificacion int;
    
    select count(*) into v_verificacion from adm_usuario where usuario = p_usuario and clave = p_clave and usuario_estado = 1;
    if v_verificacion = 1 then
		 select u.id_usuario, u.usuario, u.id_rol, 
			 doc.docente_nombre, doc.docente_apellido, (select informacion_siglas from acade_informacion_general limit 1) as SIGLAS,
             (select informacion_url from acade_informacion_general limit 1) as url
			 from adm_usuario u 
			 inner join adm_docente doc on(doc.id_usuario = u.id_usuario)
			 where u.usuario = p_usuario;
	else
		select  'Credenciales incorrectas o usuario está inactivo.' AS id_usuario, 'NO' AS usuario, 'NO' AS id_rol, 
			 'NO' AS docente_nombre, 'NO' AS docente_apellido;
	end if;
end;
//
delimiter ;

DROP procedure IF EXISTS pa_TraerSiguietneId;
DELIMITER //
CREATE  procedure pa_TraerSiguietneId(p_nombre_tabla varchar(100), p_primary_key varchar(100), out resultado int)
BEGIN

/*
	PA devolvera el siguiente primary key de la tabla respectiva
    
*/

DECLARE v_encontrado INT;

	-- SELECT max(p_primary_key) + 1 INTO v_encontrado FROM p_nombre_tabla;
  	SET @armarSQL = CONCAT('SELECT ifnull(max(' , p_primary_key , '), 0) +1 INTO @v_encontrado FROM ' , p_nombre_tabla);
	PREPARE stmt FROM @armarSQL;
	EXECUTE stmt;

	SET resultado = @v_encontrado;

END //
DELIMITER ;

drop procedure if exists pa_AgregarDocenteUsuario;
delimiter //
create procedure pa_AgregarDocenteUsuario(
`p_usuario` varchar(50),
`p_clave` varchar(100),
`p_id_rol` int(11),
 `p_docente_nombre` varchar(150),
  `p_docente_apellido` varchar(150),
  `p_docente_direccion` longtext,
  p_docente_fecha_nacimiento date,
  `p_id_municipio` smallint(6),
  `p_id_especialidad` smallint(6)
)
begin
	/*
		procedimiento que inserta un usuario y docente
    */
    
	declare exit handler for sqlexception
		begin
			-- hubieron errores
			rollback;
			select 'NO' AS MENSAJE;
			resignal; -- muestra el error que genero la exepcion
         end;
		
        -- inicio la transaccion
       start transaction;
			-- variable de sesion para traer el siguiete primary key y enviarlas el PA que trae el sigueitne id
			SET @tabla = 'adm_usuario';
			SET @primary_key = 'id_usuario';
			SET @resultadoID = NULL;
            call pa_TraerSiguietneId(@tabla, @primary_key, @resultadoID);
		    
		
			-- inserto en la tabla adm_usuario
			insert into adm_usuario(id_usuario, usuario, clave, id_rol)
				values((SELECT @resultadoID), p_usuario, p_clave, p_id_rol);
           -- inserto en la tabla adm_docente
           insert into adm_docente(id_docente, docente_nombre, docente_apellido, docente_direccion, docente_fecha_nacimiento, id_usuario, id_municipio, id_especialidad)
			values((SELECT @resultadoID), p_docente_nombre, p_docente_apellido, p_docente_direccion, 
				p_docente_fecha_nacimiento, (SELECT @resultadoID), p_id_municipio, p_id_especialidad);
            select 'OK' AS MENSAJE;
      commit;
end;
//
delimiter ;


drop procedure if exists pa_ModificarDocenteUsuario;
delimiter //
create procedure pa_ModificarDocenteUsuario(
	p_id_docente int,
 `p_docente_nombre` varchar(150),
  `p_docente_apellido` varchar(150),
  `p_docente_direccion` longtext,
   p_docente_fecha_nacimiento date,
  `p_id_municipio` smallint(6),
  `p_id_especialidad` smallint(6)
)
begin
	/*
		procedimiento que actualiza un usuario y docente
    */
    
	declare exit handler for sqlexception
		begin
			-- hubieron errores
			rollback;
			select 'NO' AS MENSAJE;
			resignal; -- muestra el error que geenero la excepcion
         end;
		
        -- inicio la transaccion
       start transaction;
		
           -- actualizo en la tabla adm_docente
           update adm_docente set docente_nombre = p_docente_nombre, docente_apellido = p_docente_apellido, 
			docente_direccion = p_docente_direccion, docente_fecha_nacimiento = p_docente_fecha_nacimiento, id_municipio =  p_id_municipio, id_especialidad =p_id_especialidad
			where id_docente = p_id_docente; 
		select 'OK' AS MENSAJE;
      commit;
end;
//
delimiter ;

DROP PROCEDURE IF EXISTS pa_EliminarDocenteUsuario;
delimiter //
create procedure pa_EliminarDocenteUsuario(p_id_docente int)
begin
	/*
		procedimiento que elimina un usuario realmente solo lo pone inactivo
    */
    
	declare exit handler for sqlexception
		begin
			-- hubieron errores
			rollback;
			select 'NO' AS MENSAJE;
			-- SHOW ERRORS LIMIT 1;
         end;
		
        -- inicio la transaccion
       start transaction;
		
           -- actualizo en la tabla adm_docente
          update adm_usuario u 
				inner join adm_docente d on(u.id_usuario = d.id_usuario)
				set u.usuario_estado = false 
			where d.id_docente = p_id_docente; 
		select 'OK' AS MENSAJE;
      commit;
end;
//
delimiter ;

drop procedure if exists pa_TraerDocentesUsuarios;
delimiter //
create procedure pa_TraerDocentesUsuarios()
begin
	/*
		PA que trae todos los usuarios pero solo los usaurios
    */
	SELECT d.id_docente, d.docente_nombre, d.docente_apellido, d.docente_direccion, d.fecha_creacion,
						u.usuario, r.rol_nombre
						from adm_docente d 
						inner join adm_usuario u
						on(d.id_usuario = u.id_usuario)
						inner join adm_rol r
						on(r.id_rol = u.id_rol)
						where u.usuario_estado = true   order by d.docente_apellido, d.docente_nombre;
end;
//
delimiter ;

drop procedure if exists pa_TraerDocentesParaAsiganarMaterias;
delimiter //
create procedure pa_TraerDocentesParaAsiganarMaterias()
begin
	/*
		PA que trae todos los docentes pero solo los usaurios con rol docentes
        estos para evitar asignarle materias a los administradores y a los usuarios comunes
        id_rol = 2 (profesores)
    */
	SELECT d.id_docente, d.docente_nombre, d.docente_apellido, d.docente_direccion, d.fecha_creacion,
						u.usuario, r.rol_nombre
						from adm_docente d 
						inner join adm_usuario u
						on(d.id_usuario = u.id_usuario)
						inner join adm_rol r
						on(r.id_rol = u.id_rol)
						where u.usuario_estado = true and r.id_rol = 2 order by d.docente_apellido, d.docente_nombre;
end;
//
delimiter ;

drop procedure if exists pa_AgregarModalidad;
delimiter //
create procedure pa_AgregarModalidad(
p_modalidad_nombre varchar(200),
p_modalidad_duracion tinyint(4),
p_modalidad_comentario varchar(400),
p_id_usuario int(11)
)
begin
	/*
		PA que inserta modalidades
    */
    
	declare exit handler for sqlexception
		begin
			-- hubieron errores
			rollback;
			select 'NO' AS MENSAJE;
			-- SHOW ERRORS LIMIT 1;
         end;
		
        -- inicio la transaccion
       start transaction;
			-- variable de sesion para traer el siguiete primary key y enviarlas el PA que trae el sigueitne id
			SET @tabla = 'acade_modalidad';
			SET @primary_key = 'id_modalidad';
			SET @resultadoID = NULL;
            call pa_TraerSiguietneId(@tabla, @primary_key, @resultadoID);
            -- inserto la modalidad
            insert into acade_modalidad(id_modalidad, modalidad_nombre, modalidad_duracion, modalidad_comentario, id_usuario)
				values((select @resultadoID), p_modalidad_nombre, p_modalidad_duracion, p_modalidad_comentario, p_id_usuario);
			select 'OK' AS MENSAJE;
				
	   commit;
end;
//
delimiter ;

drop procedure if exists pa_TaerModalidaPorID;
DELIMITER //
create procedure pa_TaerModalidaPorID(p_id_modalidad int)
begin
	select m.id_modalidad, m.modalidad_nombre, m.modalidad_duracion, m.modalidad_comentario, m.fecha_creacion
					from acade_modalidad m where m.id_modalidad = p_id_modalidad;
end;
//
delimiter ;

drop procedure if exists pa_TraerModalidades;
delimiter //
create procedure pa_TraerModalidades()
begin
	select m.id_modalidad, m.modalidad_nombre, m.modalidad_comentario, m.fecha_creacion
					from acade_modalidad m where m.modalidad_estado = 1;
end;
//
delimiter ;

drop procedure if exists pa_ModificarModalidad;
delimiter //
create procedure pa_ModificarModalidad(
p_id_modalidad int,
p_modalidad_nombre varchar(200),
p_modalidad_duracion tinyint(4),
p_modalidad_comentario varchar(400)
)
begin
	/*
		PA que actualiza una modalidad
    */
    -- varibles de control de transacciones
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            rollback;
            select 'NO' AS MENSAJE;
		end;
	-- inicio transaccion
    start transaction;
		update acade_modalidad set modalidad_nombre = p_modalidad_nombre, modalidad_duracion = p_modalidad_duracion,
			modalidad_comentario = p_modalidad_comentario where id_modalidad = p_id_modalidad;
		select 'OK' as MENSAJE;
	COMMIT;
end;
//
delimiter ;

DROP PROCEDURE IF exists pa_EliminarModalidad;
delimiter //
create procedure pa_EliminarModalidad(p_id_modalidad int)
begin
	/*
		PA que pone a estado inactivo la modalidad
    */
    -- variable de control de transacciones
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            rollback;
            select 'NO' as MENSAJE;
        end;
        
	-- inicio transaccion
    start transaction;
		update acade_modalidad set modalidad_estado = 0 where id_modalidad =p_id_modalidad;
        select 'OK' as MENSAJE;
	commit;
end;
//
delimiter ;


drop procedure if exists pa_rol_TaerRolesUsuarios;
delimiter //
create procedure pa_rol_TaerRolesUsuarios()
begin
	select id_rol, rol_nombre from adm_rol;
end;
//
delimiter ;


drop procedure if exists pa_departamento_TaerDepartamentos;
delimiter //
create procedure pa_departamento_TaerDepartamentos()
begin
	select id_departamento, departamento_nombre from adm_departamento;
end;
//
delimiter ;



drop procedure if exists pa_especialidad_TraerEspecialidades;
delimiter //
create procedure pa_especialidad_TraerEspecialidades()
begin
	/*
		PA que trae todas las especialidades activas
	*/
    select es.id_especialidad, concat(lis.lista_valor, ' ', es.especialidad_nombre) as ESPECIALIDAD,
     es.fecha_creacion
    from acade_especialidad es 
		inner join adm_lista lis on(lis.id_lista = es.id_lista)
	where es.especialidad_estado = 1 order by es.id_especialidad desc;
end;
//
delimiter ;


drop procedure if exists pa_municipio_TraerMunicipioPorDepto;
delimiter //
create procedure pa_municipio_TraerMunicipioPorDepto(p_id_departamento tinyint)
begin
	select id_municipio, municipio_nombre from adm_municipio where id_departamento = p_id_departamento;
end;
//
delimiter ;

drop procedure if exists pa_modulo_TraerPermisosUsuario;
delimiter //
create procedure pa_modulo_TraerPermisosUsuario(p_id_usuario int)
begin
	/*
		PA que lista todas las opciones del usuario respectivo
        para armar el menu principal, esto dependiendo a su rol
	*/
	select u.id_usuario, 
		m.id_modulo, m.nombre_modulo, mo.id_modulo_opcion, mo.nombre_opcion, mo.nombre_controlador_opcion
	from adm_usuario u
	inner join adm_rol r on(u.id_rol = r.id_rol)
	-- inner join adm_modulo_opcion mo on(mo.id_modulo_opcion = mou.id_modulo_opcion)
	inner join adm_modulo m on(m.id_rol = r.id_rol)
	inner join adm_modulo_opcion mo on(mo.id_modulo=m.id_modulo)
	where u.id_usuario = p_id_usuario and mo.opcion_nivel =1 and mo.opcion_estado = 1
		and u.usuario_estado = 1
    order by m.id_modulo, mo.id_modulo_opcion;
end;
//
delimiter ;

drop procedure if exists pa_docente_TraerDocenteUsuarioPorID;
delimiter //
create procedure pa_docente_TraerDocenteUsuarioPorID(p_id_docente int)
begin
	SELECT d.id_docente, d.docente_nombre, d.docente_apellido, d.docente_direccion, d.docente_fecha_nacimiento, d.fecha_creacion,
						u.usuario, r.rol_nombre, u.id_rol, depto.id_departamento, depto.departamento_nombre,
                        d.id_municipio, muni.municipio_nombre, espe.id_especialidad,
                        espe.especialidad_nombre
						from adm_docente d 
						inner join adm_usuario u
						on(d.id_usuario = u.id_usuario)
						inner join adm_rol r
						on(r.id_rol = u.id_rol)
                        inner join adm_municipio muni on(muni.id_municipio = d.id_municipio)
                        inner join adm_departamento depto on(depto.id_departamento = muni.id_departamento)
                        inner join acade_especialidad espe on(espe.id_especialidad = d.id_especialidad)
						where d.id_docente=p_id_docente;
end;
//
delimiter ;

DROP FUNCTION IF EXISTS fn_TraerIdAnioLectivo;
DELIMITER //
CREATE  FUNCTION fn_TraerIdAnioLectivo() RETURNS INT 
BEGIN

/*
	la funcion devolvera el id del annio lectivo
    
*/


	DECLARE v_id_annio_lectivo INT;

	-- asigno a la variable v_annio el annio lectivo corresspondiente
	SELECT id_annio_lectivo
		INTO v_id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 
			ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/
	return v_id_annio_lectivo;
	
END //
DELIMITER ;
select fn_TraerIdAnioLectivo();
drop procedure if exists pa_curso_TraerSecciones;
delimiter //
create procedure pa_curso_TraerSecciones()
begin
	
	select c.id_curso, c.id_modalidad, c.curso_nivel, c.curso_identificador, c.fecha_creacion, m.modalidad_nombre, c.curso_turno
					from adm_curso c
					inner join acade_modalidad m
					on(c.id_modalidad = m.id_modalidad)
					INNER JOIN adm_annio_lectivo an
					ON(an.id_annio_lectivo = c.id_annio_lectivo)
					WHERE c.curso_estado = 1 AND an.id_annio_lectivo = (select fn_TraerIdAnioLectivo()) order by c.curso_nivel, m.id_modalidad;
			
end;
//
delimiter ;

drop procedure if exists pa_curso_AgregarSeccion;
delimiter //
create procedure pa_curso_AgregarSeccion(
p_id_modalidad int,
p_curso_nivel char(4),
p_curso_identificador char(1),
p_curso_turno varchar(15),
p_id_annio_lectivo int(11), 
p_id_usuario int
)
begin
	/*
		PA que inserta una seccion
	*/
    -- variable de control de transaccion
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            rollback;
             SELECT 'NO' AS MENSAJE;
            RESIGNAL; -- muestar el error generado
           
		end;
	-- incicio transaccion
    start transaction;
		-- variable de sesion para traer el siguiete primary key y enviarlas el PA que trae el sigueitne id
			SET @tabla = 'adm_curso';
			SET @primary_key = 'id_curso';
			SET @resultadoID = NULL;
            call pa_TraerSiguietneId(@tabla, @primary_key, @resultadoID);
			insert into adm_curso(id_curso, id_modalidad, curso_nivel, curso_identificador, curso_turno, id_annio_lectivo, id_usuario)
				values((select @resultadoID), p_id_modalidad, p_curso_nivel, p_curso_identificador, p_curso_turno, p_id_annio_lectivo, p_id_usuario);
			select 'OK' AS MENSAJE;
	COMMIT;
end;
//
delimiter ;

drop procedure if exists pa_curso_ModificarSeccion;
delimiter //
create procedure pa_curso_ModificarSeccion(
p_id_curso int,
p_id_modalidad int,
p_curso_nivel char(4),
p_curso_identificador char(1),
p_curso_turno varchar(15)
)
begin
	-- variable de control de trnasaccion
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            select 'NO' as MENSAJE;
            rollback;
            resignal; -- muestra el error generado
		end;
	-- empiesa transaccion
    start transaction;
		update adm_curso set id_modalidad = p_id_modalidad, curso_nivel = p_curso_nivel, curso_identificador = p_curso_identificador,
			curso_turno = p_curso_turno
			where id_curso = p_id_curso;
		select 'OK' AS MENSAJE;
    commit;
end;
// 
delimiter ;


drop procedure if exists pa_alumno_AgregarAlumno;
delimiter //
create procedure pa_alumno_AgregarAlumno(
p_alumno_codigo varchar(6), 
p_alumno_nombre varchar(175),
p_alumno_apellido varchar(175), 
p_alumno_direccion longtext,
p_alumno_telefonos varchar(100), 
p_alumno_fecha_nacimiento date,
p_alumno_nombre_foto varchar(80),
p_alumno_correo varchar(90),
p_id_lista int(11), 
p_id_municipio smallint(6), 
p_id_usuario int,
p_dato_nombres_padre varchar(200),
p_dato_nombres_madre varchar(200),
p_dato_telefonos_contacto varchar(80),
p_dato_correo varchar(100),
p_dato_lugar_trabajo longtext,
p_dato_nombres_responsable varchar(200), 
p_dato_telefono_responsable varchar(80),
p_dato_correo_responsable varchar(80),
p_dato_lugar_trabajo_responsable longtext 
)
begin
	/*
		PA que inserta un alumno
	*/
	-- variable de control de transaccion
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            select 'NO' as MENSAJE;
            rollback;
            resignal; -- MUESTRA EL QUE SE GENERO
		END;
	-- INICIO TRANSACCION
    start transaction;
		-- variables de sesion para traer el proximo id de la tabla respectiva
        SET @tabla = 'adm_alumno';
			SET @primary_key = 'id_alumno';
			SET @resultadoID = NULL;
            call pa_TraerSiguietneId(@tabla, @primary_key, @resultadoID);
		-- inserto en la tabla adm_alumno
        insert into adm_alumno(id_alumno, alumno_codigo, alumno_nombre, alumno_apellido, alumno_direccion, alumno_telefonos, 
			alumno_fecha_nacimiento, alumno_nombre_foto, alumno_correo, id_lista, id_municipio, id_usuario)
			values((select @resultadoID), p_alumno_codigo, p_alumno_nombre, p_alumno_apellido, p_alumno_direccion, p_alumno_telefonos, 
			p_alumno_fecha_nacimiento, p_alumno_nombre_foto, p_alumno_correo, p_id_lista, p_id_municipio, p_id_usuario);
		-- inserto en la tabla acade_alumno_dato
        insert into acade_alumno_dato(dato_nombres_padre, dato_nombres_madre, dato_telefonos_contacto, dato_correo, dato_lugar_trabajo,
			dato_nombres_responsable, dato_telefono_responsable, dato_correo_responsable, dato_lugar_trabajo_responsable, id_alumno, id_usuario)
            values(p_dato_nombres_padre, p_dato_nombres_madre, p_dato_telefonos_contacto, p_dato_correo, p_dato_lugar_trabajo,
			p_dato_nombres_responsable, p_dato_telefono_responsable, p_dato_correo_responsable, p_dato_lugar_trabajo_responsable, 
            (select @resultadoID), p_id_usuario);
            
			/*
				invoco al PA que genera el calendario de pago
			*/
            call pa_GenerarCalendarioPagoPorAlumno((select @resultadoID), DATE_FORMAT(NOW(),'%Y-%m-%d'), p_id_usuario);
            
            
		select 'OK' as MENSAJE;
        
    COMMIT;
end;
//
delimiter ;


drop procedure if exists pa_alumno_ModificarAlumno;
delimiter //
create procedure pa_alumno_ModificarAlumno(
p_id_alumno int,
p_alumno_nombre varchar(175),
p_alumno_apellido varchar(175), 
p_alumno_direccion longtext,
p_alumno_telefonos varchar(100), 
p_alumno_fecha_nacimiento date,
p_alumno_nombre_foto varchar(80),
p_alumno_correo varchar(90),
p_id_lista int(11), 
p_id_municipio smallint(6), 
p_dato_nombres_padre varchar(200),
p_dato_nombres_madre varchar(200),
p_dato_telefonos_contacto varchar(80),
p_dato_correo varchar(100),
p_dato_lugar_trabajo longtext,
p_dato_nombres_responsable varchar(200), 
p_dato_telefono_responsable varchar(80),
p_dato_correo_responsable varchar(80),
p_dato_lugar_trabajo_responsable longtext 
)
begin
	/*
		PA que modifica un alumno
	*/
	-- variable de control de transaccion
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            select 'NO' as MENSAJE;
            rollback;
            resignal; -- MUESTRA EL QUE SE GENERO
		END;
	-- INICIO TRANSACCION
    start transaction;
		
		-- actualizo en la tabla adm_alumno
        update adm_alumno set alumno_nombre = p_alumno_nombre, alumno_apellido = p_alumno_apellido, alumno_direccion = p_alumno_direccion,
			alumno_telefonos = p_alumno_telefonos, alumno_fecha_nacimiento = p_alumno_fecha_nacimiento, alumno_nombre_foto = p_alumno_nombre_foto,
            alumno_correo = p_alumno_correo, id_lista = p_id_lista, id_municipio = p_id_municipio
		where id_alumno = p_id_alumno;
			
		-- actualiza en la tabla acade_alumno_dato
        update acade_alumno_dato set dato_nombres_padre = p_dato_nombres_padre, dato_nombres_madre = p_dato_nombres_madre, 
			dato_telefonos_contacto = p_dato_telefonos_contacto, dato_correo = p_dato_correo, dato_lugar_trabajo = p_dato_lugar_trabajo,
			dato_nombres_responsable = p_dato_nombres_responsable, dato_telefono_responsable = p_dato_telefono_responsable, 
            dato_correo_responsable = p_dato_correo_responsable, dato_lugar_trabajo_responsable = p_dato_lugar_trabajo_responsable
		where id_alumno = p_id_alumno;
          
		select 'OK' as MENSAJE;
        
    COMMIT;
end;
//
delimiter ;


drop function if exists fn_VerSiDocenteIngresoNotasAmateria;
DELIMITER //
CREATE  FUNCTION fn_VerSiDocenteIngresoNotasAmateria(p_id_docente int, p_id_materia int, p_id_curso int) RETURNS tinyint(1)
BEGIN
	/*
	  la funcion devolvera un false (0)  el docente no a ha asigando notas a su materia asiganda
      y podra quitar la materia al docente, de lo contrario no podrá desasignarse la materia
	*/
	DECLARE v_cantidad_notas int;
	DEClARE v_id_annio_lectivo int;
	-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
	select id_annio_lectivo
		into v_id_annio_lectivo from adm_annio_lectivo where estado = 1 order by id_annio_lectivo desc limit 1; /*simpre me devolvera una fila*/
	-- tarigo el la cuenta de las notas del año lectivo actual
	select count(*) into v_cantidad_notas 
	from acade_periodo_nota_detalle pnd
	inner join adm_curso_detalle cd
		on(cd.id_materia = pnd.id_materia)
	inner join adm_alumno_detalle ad
		on(ad.id_curso = cd.id_curso and ad.id_alumno = pnd.id_alumno)
	where pnd.id_materia = p_id_materia  and cd.id_docente = p_id_docente and cd.id_curso = p_id_curso and pnd.id_annio_lectivo = v_id_annio_lectivo;
	if v_cantidad_notas = 0 then
		return 0;
	else
        return 1;
	end If;
        
END;
//
DELIMITER ;


drop table if exists acade_detalle_orientador;
create table acade_detalle_orientador(
id_orientador int not null primary key auto_increment comment 'llave primaria incremental',
id_docente int not null comment 'llave foranea para relacionar con la tabla adm_dcoente, indice',
id_curso int not null comment 'llave foranea para relacionar con la tabla adm_curso, indice',
id_annio_lectivo int not null comment 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
fecha_creacion timestamp not null default current_timestamp,
id_usuario int not null comment 'usuario que creo el registro solo com referencia, relacion imaginaria',
index(id_docente),
index(id_curso),
index(id_annio_lectivo),
unique index curso_annio_lectivo(id_curso, id_annio_lectivo)
)
engine = InnoDB;

drop procedure if exists pa_detalle_orientadorInsertarOrientador;
delimiter //
create procedure pa_detalle_orientadorInsertarOrientador(p_id_docente int, p_id_curso int, p_id_usuario int)
begin
	/*
		PA que inserte los docentes orientadores de cuales quiera y cuantas quiera de secciones
	*/
    -- varible para controlar la tranasccion
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            select 'NO' AS MENSAJE;
            ROLLBACK;
            RESIGNAL; -- MUESTRA EL ERROR QUE PROVOCO LA EXECEPCION
        end;
	-- inicio transaccion
    start transaction;
    		-- select * from tbl_errro;
		insert into acade_detalle_orientador(id_docente, id_curso, id_annio_lectivo, id_usuario)
			values(p_id_docente, p_id_curso, (select fn_TraerIdAnioLectivo()) , p_id_usuario);
		select 'OK' as MENSAJE;
	commit;
end;
//
delimiter ;


drop procedure if exists pa_TraerSeccionesDelDocenteAsiganadasPorMaterias;
delimiter //
create procedure pa_TraerSeccionesDelDocenteAsiganadasPorMaterias(p_id_docente int)
begin
	/*
		PA que trae las las secciones asigandas con materias al docente para ver cual se le asigna como 
        orientador
	*/
	SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
		concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION, cd.id_detalle, c.id_curso, c.curso_turno,
        ifnull(id_orientador, 0) as id_orientador
		from adm_docente d 
		inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
		inner join adm_curso c on(c.id_curso = cd.id_curso)
		inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
        left join acade_detalle_orientador dori on(dori.id_curso = c.id_curso and dori.id_docente = p_id_docente)
		where d.id_docente = p_id_docente and moda.modalidad_estado = 1
		and c.curso_estado = 1 and c.id_annio_lectivo = (select fn_TraerIdAnioLectivo())
		 group by c.id_curso order by c.curso_nivel, moda.id_modalidad, c.curso_identificador;
end;
//
delimiter ;

drop procedure if exists pa_detelle_orientador_EliminarDocenteOrientador;
delimiter //
create procedure pa_detelle_orientador_EliminarDocenteOrientador(p_id_docente int, p_id_curso int)
begin
	/*
		PA que se ejecutara cada para eliminar un docente de orientador
        no se podra quitar un docente orientador si el docente ya ha asignado notas a esa seccion
	*/
    DECLARE v_cantidad_notas int;
     
	-- inicio transaccion
	select count(*) into v_cantidad_notas
	from acade_periodo_nota_detalle pnd
	inner join adm_curso_detalle cd
		on(cd.id_materia = pnd.id_materia)
	inner join adm_alumno_detalle ad
		on(ad.id_curso = cd.id_curso and ad.id_alumno = pnd.id_alumno)
	where /*pnd.id_materia = 1  and*/ cd.id_docente = p_id_docente and cd.id_curso = p_id_curso
		and pnd.id_annio_lectivo = (select fn_TraerIdAnioLectivo());

		if v_cantidad_notas = 0 then
			
			delete from acade_detalle_orientador where id_docente = p_id_docente and id_curso = p_id_curso;
            select  'OK' AS MENSAJE;
		else
			select  'NO' AS MENSAJE;
		end if;
	
	
end;
//
delimiter ;

drop procedure if exists pa_TraerSeccionesSinOrientador;
delimiter //
create procedure pa_TraerSeccionesSinOrientador()
begin
	
end;
//
delimiter ;

drop procedure if exists pa_usuarioResetearClave;
delimiter //
create procedure pa_usuarioResetearClave(p_id_docente int, p_clave varchar(100))
begin
	/*
		PA para resetear la clave
	*/
    -- variables para controlar la transaccion
    declare exit handler for sqlexception
		begin
			
            select 'NO' as MENSAJE;
            rollback; -- hubiero errores
            resignal; -- MUESTRA EL ERROR QUE DA
		END;
        -- INICIO TRANSCCION
		start transaction;
			update adm_usuario u 
				inner join adm_docente d on(u.id_usuario = d.id_usuario)
				set u.clave = p_clave
				where d.id_docente = p_id_docente;
			select 'OK' as MENSAJE;
		commit;
end;
//
delimiter ;

drop procedure if exists pa_TraerMateriasDelDocentenById;
delimiter //
create procedure pa_TraerMateriasDelDocentenById(p_id_docente int)
begin
	/*
		PA que traera el listado de las secciones a las cual es orientador el docente
        este PA se utiliza en varias controlers Inscripciones/Administrar/ y en Reportesnotas/ReporteAlumnosCumpleannieros
        si se modifica este PA tener cuidado que no afecte el resultado para ambas vistas
	*/
    select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION, c.curso_turno
		FROM adm_curso c
		inner join acade_modalidad m on(c.id_modalidad = m.id_modalidad)
		inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
		INNER JOIN adm_annio_lectivo an
		ON(an.id_annio_lectivo = c.id_annio_lectivo and c.id_annio_lectivo = (select fn_TraerIdAnioLectivo()))
		inner join acade_detalle_orientador dori on(dori.id_curso = c.id_curso and dori.id_docente = p_id_docente)
		where c.curso_estado = 1 AND an.estado = 1 and cd.id_docente = p_id_docente group by c.id_curso;
end;
//
delimiter ;


drop procedure if exists pa_TraerSeccionesDelDocentePorMateria;
delimiter //
create procedure pa_TraerSeccionesDelDocentePorMateria(p_id_docente int)
begin
	/*
		PA que trae todas las secciones a las cuales el docente da clase, secciion por materia
	*/
	SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
		concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION, mate.id_materia, mate.materia_nombre, cd.id_detalle, c.id_curso,
        c.curso_turno
		from adm_docente d 
		inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
		inner join adm_curso c on(c.id_curso = cd.id_curso and c.id_annio_lectivo= (select fn_TraerIdAnioLectivo()))
		inner join adm_materia mate on(mate.id_materia = cd.id_materia)
		inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
		where d.id_docente = p_id_docente and c.curso_estado = 1 and moda.modalidad_estado = 1
        order by c.curso_nivel, moda.id_modalidad, c.curso_identificador, mate.id_materia;
end;
// 
delimiter ;

drop table if exists acade_informacion_general;
CREATE TABLE `acade_informacion_general` (
  `informacion_nombre_institucion` varchar(100) NOT NULL  comment 'nombre completo de la institucion',
  `informacion_siglas` varchar(10) NOT NULL  comment 'siglas del nombre de la isntitucion',
  `informacion_codigo_infraestructura` varchar(10) NOT NULL  comment 'codigo de infraestructura legalizado',
  `informacion_distrito` varchar(10) NOT NULL comment 'numero de distrito asignado',
  `informacion_direccion` varchar(100) NOT NULL,
  `informacion_telefonos` varchar(250),
  `informacion_correo` varchar(50),
  `informacion_mision` longtext,
  `informacion_vision` longtext,
  `informacion_valores` longtext,
  informacion_nombre_logo varchar(80) comment 'nombre de la imagen, no la ruta porquque ya sesabe donde se almacenara',
  `id_municipio` smallint NOT NULL default 1 comment 'llave foranea para relacionar con la tabla adm_municipio, indice',
  index(id_municipio)
) 
ENGINE=innodb;

drop procedure if exists pa_informacciongeneralConfigurar;
delimiter //
create procedure pa_informacciongeneralConfigurar(
`p_informacion_nombre_institucion` varchar(100),
  `p_informacion_siglas` varchar(10),
  `p_informacion_codigo_infraestructura` varchar(10),
  `p_informacion_distrito` varchar(10),
  `p_informacion_direccion` varchar(100),
  `p_informacion_telefonos` varchar(250),
  `p_informacion_correo` varchar(50),
  `p_informacion_mision` longtext,
  `p_informacion_vision` longtext,
  `p_informacion_valores` longtext,
  p_informacion_nombre_logo varchar(80),
  p_informacion_url varchar(100),
  `p_id_municipio` smallint
  )
  begin
	/*
		PA que actualiza la informacion general de la institucion
	*/
	update acade_informacion_general set informacion_nombre_institucion = p_informacion_nombre_institucion, 
		 `informacion_siglas`=p_informacion_siglas,
		  `informacion_codigo_infraestructura`=p_informacion_codigo_infraestructura,
		  `informacion_distrito`=p_informacion_distrito,
		  `informacion_direccion`=p_informacion_direccion,
		  `informacion_telefonos`=p_informacion_telefonos,
		  `informacion_correo`=p_informacion_correo,
		  `informacion_mision`=p_informacion_mision,
		  `informacion_vision` =p_informacion_vision,
		  `informacion_valores`=p_informacion_valores,
		  informacion_nombre_logo=p_informacion_nombre_logo,
          informacion_url=p_informacion_url,
		  `id_municipio`=p_id_municipio;
		SELECT 'OK' as MENSAJE;
  end;
  //
  delimiter ;
  
  drop procedure if exists pa_TraerDatosGenerales;
  delimiter //
  create procedure pa_TraerDatosGenerales()
  begin
	/*
		PA que trae la informacion general de la instaitucion
	*/
		select ig.*, muni.municipio_nombre, depto.departamento_nombre, depto.id_departamento
			from acade_informacion_general ig	
				inner join adm_municipio muni on(muni.id_municipio = ig.id_municipio)
                inner join adm_departamento depto on(depto.id_departamento = muni.id_departamento);
  end;
  //
  delimiter ;
  
-- NOTA ESTE PA no se esta usando
drop procedure if exists pa_TraerEspecialidades;
delimiter //
create procedure pa_TraerEspecialidades()
begin
	/*
		PA que trae todas las especialidades activas
	*/
    select es.id_especialidad, concat(lis.lista_valor, ' en ', es.especialidad_nombre) as ESPECIALIDAD
    from acade_especialidad es 
		inner join adm_lista lis on(lis.id_lista = es.id_lista)
	where es.especialidad_estado = 1 order by es.id_especialidad;
end;
//
delimiter ;


drop procedure if exists pa_TraerNotasPorDocenteMateriaCursoYannio;
delimiter //
create procedure pa_TraerNotasPorDocenteMateriaCursoYannio(p_id_docente int, p_id_materia int, p_id_curso int, p_annio int)
begin
	/*
		PA que lista las notas de la seccion por materia con el docente respectivo
	*/
    
    -- variable para traer el id del año lectivo de acuerdo al año (hay que tomar en cuetna que el año es unico
    declare v_id_annio_lectivo int;
    
      -- asigno el resultado de la consulta a la variable v_id_annio_lectivo
    select id_annio_lectivo into v_id_annio_lectivo from adm_annio_lectivo where annio = p_annio;
    
    select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo,
			 concat(pe.periodo_numero,'-', pe.periodo_nombre) as PERIODO, pe.periodo_recuperacion,
             concat(doce.docente_apellido, ', ', doce.docente_nombre) as DOCENTE,
             concat(cur.curso_nivel, ' ', moda.modalidad_nombre, ' ',  cur.curso_identificador) as SECCION, cur.curso_turno,
             mate.materia_nombre
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
    inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_materia = p_id_materia and pnd.id_annio_lectivo = v_id_annio_lectivo)
    inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
    inner join adm_curso_detalle cd on(cd.id_curso = cur.id_curso and cd.id_materia = pnd.id_materia and cd.id_annio_lectivo = v_id_annio_lectivo)
    inner join adm_docente doce on(doce.id_docente = cd.id_docente)
    inner join acade_modalidad moda on(moda.id_modalidad = cur.id_modalidad)
    inner join adm_materia mate on(mate.id_materia = pnd.id_materia)
	where ad.id_curso = p_id_curso  and cd.id_docente = p_id_docente and al.annio = p_annio 
    order by a.alumno_apellido, a.alumno_nombre, pnd.id_periodo;
    
    /*
     select  pnd.id_periodo,
			 concat(pe.periodo_numero,'-', pe.periodo_nombre) as PERIODO,
             case when pnd.id_periodo = pe.id_periodo then  concat(pe.periodo_numero,'-', pe.periodo_nombre)
             end as ok
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
    inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_materia = p_id_materia)
    inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
    inner join adm_curso_detalle cd on(cd.id_curso = cur.id_curso and cd.id_materia = pnd.id_materia)
	where ad.id_curso = p_id_curso  and cd.id_docente = p_id_docente and al.annio = p_annio group by pnd.id_periodo
    order by pnd.id_periodo;
    */
end;
//
delimiter ;

drop procedure if exists pa_BusquedaInteractivaSeccionesDelDocenteReporteNotas;
delimiter //
create procedure pa_BusquedaInteractivaSeccionesDelDocenteReporteNotas(p_id_docente int, buscar_curso varchar(50))
begin
	/*
		PA que buscara las secciones del docente interactivamente
	*/
 SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
		concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION,
        /*mate.id_materia, mate.materia_nombre, */cd.id_detalle, c.id_curso, al.annio
		from adm_docente d 
		inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
		inner join adm_curso c on(c.id_curso = cd.id_curso and c.id_annio_lectivo= (select fn_TraerIdAnioLectivo()))
		-- inner join adm_materia mate on(mate.id_materia = cd.id_materia)
		inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
        inner join adm_annio_lectivo al on(al.id_annio_lectivo = cd.id_annio_lectivo)
		where d.id_docente = p_id_docente and (moda.modalidad_nombre like "%', buscar_curso,'%" or al.annio like "%', buscar_curso,'%")
        group by c.id_curso
        order by c.curso_nivel, moda.id_modalidad, c.curso_identificador;
        PREPARE ejecutar FROM @consulta;
	EXECUTE ejecutar;
end;
//
delimiter ;

/*
		NOTA: ESTE PROCEDIMIENTO SE HA ELIMINADO PORQUE SE MEJORO POR OTRO DEL MISMO NOMBRE
		PA que trae todas las notas del año seleccionadao para la seccion que es orientador o secciones que orienta
        el docente para mostarar las notas de la seccion en conglomerado
	*/
drop procedure if exists pa_GenerarReporteNotasPorSeccion;
delimiter //
create procedure pa_GenerarReporteNotasPorSeccion(p_id_curso int, p_annio int)
begin
	/*
		NOTA: ESTE PROCEDIMIENTO SE HA ELIMINADO PORQUE SE MEJORO POR OTRO DEL MISMO NOMBRE
		PA que trae todas las notas del año seleccionadao para la seccion que es orientador o secciones que orienta
        el docente para mostarar las notas de la seccion en conglomerado
	*/
     select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo,
			 concat(pe.periodo_numero,'-', pe.periodo_nombre) as PERIODO, pe.periodo_recuperacion,
             concat(doce.docente_apellido, ', ', doce.docente_nombre) as DOCENTE,
             concat(cur.curso_nivel, ' ', moda.modalidad_nombre, ' ',  cur.curso_identificador) as SECCION, cur.curso_turno,
             mate.materia_nombre, al.annio
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
	where ad.id_curso = p_id_curso  /*and cd.id_docente = 22*/ and al.annio = p_annio 
    group by pe.id_periodo, a.id_alumno, mate.id_materia
    order by mate.id_materia, a.alumno_apellido, a.alumno_nombre, pnd.id_periodo;
end;
//
delimiter ;

drop procedure if exists pa_TraerAlumnosEnMoraPorSeccion;
delimiter //
create procedure pa_TraerAlumnosEnMoraPorSeccion(p_id_curso int, p_id_annio_lectivo int)
begin
/*
PA que lista todos los alumnos en mora del año seleccionado y del curso seleccionado
*/
	select a.alumno_codigo, concat(a.alumno_apellido, ', ', a.alumno_nombre) as ALUMNO, 
concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION, c.curso_turno,
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
    inner join adm_alumno_detalle ad on(ad.id_alumno = cp.id_alumno and ad.id_curso = p_id_curso)
    inner join adm_curso c on(c.id_curso = ad.id_curso and ad.id_curso = p_id_curso)
    inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
    where cp.calendario_annio < year(now()) and cp.calendario_fecha_pago = '0000-00-00'
		
        or(
			/* el if es para ponerle 1 a la inscripcion y simule que es enero para poder 
            evaluar si esta vencida o no*/
			cp.calendario_annio = year(now()) and if(cp.calendario_mes = 30, 1, cp.calendario_mes) < month(now()) and cp.calendario_fecha_pago = '0000-00-00'
            )
            and cp.id_annio_lectivo = p_id_annio_lectivo

    order by a.alumno_apellido, cp.calendario_annio, cp.calendario_mes asc;
end;
//
delimiter ;

drop procedure if exists pa_GenerarReporteDocentesCumpleannieros;
delimiter //
create procedure pa_GenerarReporteDocentesCumpleannieros(p_fecha date)
begin
/*
	PA que lista todos los docentes que cumplen años en el mes actual
*/
	SELECT d.id_docente, CONCAT(d.docente_apellido, ', ', docente_nombre) as DOCENTE, d.docente_fecha_nacimiento, day(d.docente_fecha_nacimiento) as DIA,
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
		 OR MONTH(d.docente_fecha_nacimiento) = MONTH(p_fecha) -- AND DAY( d.docente_fecha_nacimiento ) > month('2017-12-01')
		 order by  day(d.docente_fecha_nacimiento) asc;
end;
//
delimiter ;

drop procedure if exists pa_GenerarReporteAlumnosCumpleannieros;
delimiter //
create procedure pa_GenerarReporteAlumnosCumpleannieros(p_fecha date, p_id_curso int)
begin
/*
	PA que lista todos los alumnos que cumplen años en el mes que se elija
*/
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
			END AS MES, concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ', c.curso_identificador) as SECCION, c.curso_turno
		 FROM adm_alumno a
         inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno and ad.id_curso = p_id_curso)
         inner join adm_curso c on(c.id_curso = ad.id_curso and c.id_annio_lectivo = (select fn_TraerIdAnioLectivo()))
         inner join acade_modalidad moda on(moda.id_modalidad = c.id_curso)
		 WHERE   /*MONTH(a.alumno_fecha_nacimiento) = MONTH(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)) */
		  MONTH(a.alumno_fecha_nacimiento) = MONTH(p_fecha)  -- AND DAY( d.docente_fecha_nacimiento ) > month('2017-12-01')
		 order by  day(a.alumno_fecha_nacimiento) asc;
end;
//
delimiter ;

drop procedure if exists pa_TraerAlumnosParaNotasRecuperacion;
delimiter //
create procedure pa_TraerAlumnosParaNotasRecuperacion(p_id_curso int, p_id_materia int)
begin
/*
	PA que evalua si el alumno ira a recuperacion y mostrar el listado de los alumnos a los que se
    les asignara notas al periodo de recuperacion
*/
	 -- variables para la asigancaion del cursor al recorrerse
      declare v_id_alumno int;
      declare v_alumno_codigo varchar(6);
      declare v_NOMBRE varchar(350);
	  declare v_id_detalle_alumno int;
	  declare v_id_curso int;
	  declare v_id_nota_detalle INT;
	  declare v_N_1 decimal(4,2);
	  declare v_id_materia int(11);
	  declare v_id_periodo int(11);
      -- fin de las variables de la asignacion del cursor al recorrerse
      -- variable para asignar el promedio 
      declare v_promedio decimal(4,2);
      -- variable para contar los periodos actuales
      declare v_numero_de_peridodos int;
	 -- Variable para controlar el fin del bucle del cursor
	 DECLARE fin INTEGER DEFAULT 0;
	/*
		cursor que me trae todos los alumnos de la seccion seleccionada y evalua si esta aprovado o no
        para luego insertarlos en la tabla temporal solo aquellos que se mostrarn en el listado
        de notas
	*/
	DECLARE cursor_alumnos CURSOR FOR
		select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_periodo
			from adm_alumno a
			inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
			inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
			inner join adm_curso cur on(cur.id_curso = ad.id_curso)
			left join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_periodo = fn_TraerIdPeriodoEnCurso() 
															and pnd.id_materia = p_id_materia)
			left join acade_periodo pe on(pe.id_periodo = pnd.id_periodo  and pe.id_periodo = fn_TraerIdPeriodoEnCurso())
			where ad.id_curso = p_id_curso  and cur.curso_estado = 1 and al.estado = 1 order by a.alumno_apellido, a.alumno_nombre;
	-- Condición de salida
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
			-- creo la tabla temporal donde insertare los alumno que estan reprobados
             drop table if exists tmp_notas_recuperacion;
			create temporary table tmp_notas_recuperacion(
				id_alumno int not null primary key,
				alumno_codigo varchar(6) not null,
				NOMBRE varchar(350) not null,
				id_detalle_alumno int not null,
				id_curso int not null,
				id_nota_detalle INT null,
				N_1 decimal(4,2) NULL,
				id_materia int(11) NULL,
				id_periodo int(11) NULL,
                esta_aprobado varchar(2)
				);
                
			/*
				asigno a la variable v_numero_de_peridodos la cantidad de periodos que hay en el año lictivo acutal
                excluyendo los periodos de recuperacion para dividir la nota de los periores ordinarios entre
                el numero de peridos ordinarios en el año lectivo actual, asi simpre me mostrara los alumnos que aplazron
			*/
            select count(*) into v_numero_de_peridodos from acade_periodo where id_annio_lectivo = (select fn_TraerIdAnioLectivo()) and periodo_recuperacion = 0;

			/*
				abro el cursor y lo recorro, si da error que se salga controlado con la variable fin
			*/
			OPEN cursor_alumnos;
			  recorrer_cursor: LOOP
				FETCH cursor_alumnos INTO  v_id_alumno, v_alumno_codigo, v_NOMBRE, v_id_detalle_alumno,
							v_id_curso, v_id_nota_detalle, v_N_1, v_id_materia, v_id_periodo;
				IF fin = 1 THEN
				   LEAVE recorrer_cursor;
				END IF;
                
                -- evaluo cada alumno para ver si esta aplazado
                select /*a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ' ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
							ad.id_curso, pnd.id_nota_detalle,*/  sum(pnd.N_1)/v_numero_de_peridodos /*count(pnd.id_periodo)*/ into v_promedio/*, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo*/
					from adm_alumno a
					inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
					-- inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
					inner join adm_curso cur on(cur.id_curso = ad.id_curso)
					inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_materia = p_id_materia)
					inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
					where ad.id_curso = p_id_curso and pnd.id_alumno = v_id_alumno and pnd.id_annio_lectivo = (select fn_TraerIdAnioLectivo())
									and pnd.id_materia = p_id_materia and pe.periodo_recuperacion = 0;
				if (v_promedio < 6) then
						-- inserto en la tabla temporal
					insert into tmp_notas_recuperacion values(
						v_id_alumno, v_alumno_codigo, v_NOMBRE, v_id_detalle_alumno,
							v_id_curso, v_id_nota_detalle, v_N_1, v_id_materia, v_id_periodo, 'SI');
					/*
						este esle es para que los alumnos que han aprobado simpre se muestre en el listado para poder genera el reporte de notas
                        pero aqui se ingresara con nota 0 y con reprobado en NO para que en la vista la textbox de nota
                        aparezca bloqueada y no digiten nota el usuario
					*/
				  else
					insert into tmp_notas_recuperacion values(
						v_id_alumno, v_alumno_codigo, v_NOMBRE, v_id_detalle_alumno,
							v_id_curso, v_id_nota_detalle, 0, v_id_materia, v_id_periodo, 'NO');
				end if;
			 END LOOP recorrer_cursor;
			
            -- selecciona los registros de la tabla temporal
            select * from tmp_notas_recuperacion  order by NOMBRE;
			-- elimino la tabla temproal
            drop table if exists tmp_notas_recuperacion;
        
        
end;
//
delimiter ;

drop procedure if exists pa_TraerAlumnosAplazados;
delimiter //
create procedure pa_TraerAlumnosAplazados(p_id_curso int, p_id_materia int, p_annio int)
begin
/*
	PA que trae los alumnos que aplazaron en cualesquiera años lectivos y seccion asiganda a ese año, 
    para generar el reporte GenerarReporteNotas
*/
	 -- variables para la asigancaion del cursor al recorrerse
      declare v_id_alumno int;
      declare v_alumno_codigo varchar(6);
      declare v_NOMBRE varchar(350);
	  declare v_id_detalle_alumno int;
	  declare v_id_curso int;
	  declare v_id_nota_detalle INT;
	  declare v_N_1 decimal(4,2);
	  declare v_id_materia int(11);
	  declare v_id_periodo int(11);
      -- fin de las variables de la asignacion del cursor al recorrerse
      -- variable para asignar el promedio 
      declare v_promedio decimal(4,2);
      -- variable para contar los periodos actuales
      declare v_numero_de_peridodos int;
	 -- Variable para controlar el fin del bucle del cursor
	 DECLARE fin INTEGER DEFAULT 0;
	/*
		cursor que me trae todos los alumnos de la seccion seleccionada y evalua si esta aprobado o no
        para luego insertarlos en la tabla temporal solo aquellos que se mostrarn como reprobados
	*/
	DECLARE cursor_alumnos CURSOR FOR
		select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_periodo
			from adm_alumno a
			inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
			inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
			inner join adm_curso cur on(cur.id_curso = ad.id_curso)
			inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno 
															and pnd.id_materia = p_id_materia)
			inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
			where ad.id_curso = p_id_curso 
            and al.annio = p_annio and cur.curso_estado = 1 group by a.id_alumno  order by a.alumno_apellido, a.alumno_nombre, pnd.id_periodo;
	-- Condición de salida
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
			-- creo la tabla temporal donde insertare los alumno que estan reprobados
             drop table if exists tmp_alumnos_aplazados_annios_cualesquiera;
			create temporary table tmp_alumnos_aplazados_annios_cualesquiera(
				id_alumno int not null primary key,
				alumno_codigo varchar(6) not null,
				NOMBRE varchar(350) not null,
				id_detalle_alumno int not null,
				id_curso int not null,
				id_nota_detalle INT null,
				N_1 decimal(4,2) NULL,
				id_materia int(11) NULL,
				id_periodo int(11) NULL,
                esta_aprobado varchar(2)
				);
                
			/*
				asigno a la variable v_numero_de_peridodos la cantidad de periodos que hay en el año lictivo seleccionado
                excluyendo los periodos de recuperacion para dividir la nota de los periores ordinarios entre
                el numero de peridos ordinarios en el año lectivo seleccionado, asi simpre me mostrara los alumnos que aplazaron
			*/
            select count(*) into v_numero_de_peridodos from acade_periodo  pe 
            inner join adm_annio_lectivo al on(al.id_annio_lectivo = pe.id_annio_lectivo)
            where al.annio = p_annio and periodo_recuperacion = 0;

			/*
				abro el cursor y lo recorro, si da error que se salga controlado con la variable fin
			*/
			OPEN cursor_alumnos;
			  recorrer_cursor: LOOP
				FETCH cursor_alumnos INTO  v_id_alumno, v_alumno_codigo, v_NOMBRE, v_id_detalle_alumno,
							v_id_curso, v_id_nota_detalle, v_N_1, v_id_materia, v_id_periodo;
				IF fin = 1 THEN
				   LEAVE recorrer_cursor;
				END IF;
                
                -- evaluo cada alumno para ver si esta aplazado
                select  sum(pnd.N_1)/v_numero_de_peridodos  into v_promedio
					from adm_alumno a
					inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
					inner join adm_curso cur on(cur.id_curso = ad.id_curso)
					inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_materia = p_id_materia)
					inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
                    inner join adm_annio_lectivo al on(al.id_annio_lectivo = pnd.id_annio_lectivo)
					where ad.id_curso = p_id_curso and pnd.id_alumno = v_id_alumno and al.annio = p_annio
									and pnd.id_materia = p_id_materia and pe.periodo_recuperacion = 0;
				if (v_promedio < 6) then
						-- inserto en la tabla temporal y le especifico que no esta aprobado
					insert into tmp_alumnos_aplazados_annios_cualesquiera values(
						v_id_alumno, v_alumno_codigo, v_NOMBRE, v_id_detalle_alumno,
							v_id_curso, v_id_nota_detalle, v_N_1, v_id_materia, v_id_periodo, 'NO');
				end if;
			 END LOOP recorrer_cursor;
			
            -- selecciona los registros de la tabla temporal
            select * from tmp_alumnos_aplazados_annios_cualesquiera  order by NOMBRE;
			-- elimino la tabla temproal
            drop table if exists tmp_alumnos_aplazados_annios_cualesquiera;
        
        
end;
//
delimiter ;


 DROP procedure IF EXISTS pa_TraerNumerosDePeriodos;
 delimiter //
 create procedure pa_TraerNumerosDePeriodos(pa_annio int)
 begin
	/*
		PA que verifia y devuelve cuantos periodos ordinarios y cuantos de recuperacion existen en el año lectivo atual
        esto para hacer los calculos de las notas en el reporte GenerarReporteNotas, se sabe que solo sera un peridodo de recuperacion,
        si fuese lo contrario esto no serviria
	*/
    -- variable para traer el id_annio_lectivo dependiendo del parametro año recibido (p_annio)
    declare v_id_annio_lectivo int;
    
    -- asigno el resultado de la consulta a la variable v_id_annio_lectivo
    select id_annio_lectivo into v_id_annio_lectivo from adm_annio_lectivo where annio = pa_annio;
    -- traigo los peridos del año seleccionado
    SELECT (select count(*)   from acade_periodo where id_annio_lectivo = v_id_annio_lectivo AND periodo_recuperacion = 0) AS ORDINARIO,
	   (select count(*)   from acade_periodo where id_annio_lectivo = v_id_annio_lectivo AND periodo_recuperacion = 1) AS RECUPERACION;

    
 end;
 //
 delimiter ;
 
 
 
 
drop procedure if exists pa_GenerarReporteNotasPorSeccion;
delimiter //
create procedure pa_GenerarReporteNotasPorSeccion(p_id_curso int, p_annio int)
begin
/*
	PA que trae los promedios de todos los periodos de cada materia para cada alumno del curso seleccionado y año respecvtivo
    ya sean periodos ordinarios o extraordinario(recuperacion), se sabe que periodo de recuperacion solo es uno
*/
	 -- variables para la asigancaion del cursor al recorrerse cursor_alumnos
      declare v_id_alumno int;
      declare v_alumno_codigo varchar(6);
      declare v_NOMBRE varchar(350);
	  declare v_id_curso int;
      declare v_SECCION varchar(350);
      -- fin de las variables de la asignacion del cursor al recorrerse
      -- variables para el cursor cursor_cursos
      declare v_c_id_curso int;
	  declare v_c_id_materia int;
      -- fin de las variables del cursor cursor_cursos
      -- variable para contar los periodos  ordinarios
      declare v_numero_de_peridodos_ordinario int;
       -- variable para contar los periodos  extraordinarios (de recuperacion)
	  declare v_numero_de_peridodos_recuperacion int;
      -- varible para evaluar el promedio de cada alumno
      declare v_promedio_aplazado decimal(4,2);
      -- variable que se asignara el promedio global de cada materia
      declare v_promedio decimal(4,2);
	 -- Variable para controlar el fin del bucle de los cursores
	
    
    -- primer bloque es para el primer cursor que recorre los alumnos de la seccion (curso ) seleccionado
    -- ademas se hace en bloque para oder operar con varios cursores y declarar variables handler
     BLOQUE_UNO: 
		BEGIN 
         DECLARE fin INTEGER DEFAULT 0;
	/*
		cursor que me trae todos los alumnos de la seccion seleccionada
	*/
	DECLARE cursor_alumnos CURSOR FOR
		select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, ad.id_curso,
        concat(cur.curso_nivel, ' ', moda.modalidad_nombre, ' ', cur.curso_identificador) as SECCION
			from adm_alumno a
			inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
			inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
			inner join adm_curso cur on(cur.id_curso = ad.id_curso)
            inner join acade_modalidad moda on(moda.id_modalidad = cur.id_modalidad)
			where ad.id_curso = p_id_curso /* and cur.curso_estado = 1 and al.estado = 1*/ order by a.alumno_apellido, a.alumno_nombre;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
    
    
				-- creo la tabla temporal donde insertare los alumno que estan con sus notas respectivas
             drop table if exists tmp_notas_por_seccion;
			create temporary table tmp_notas_por_seccion(
				id_alumno int not null/* primary key*/,
				alumno_codigo varchar(6) not null,
				NOMBRE varchar(350) not null,
				id_curso int not null,
				N_1 decimal(4,2) NULL,
				id_materia int(11) NULL,
                SECCION varchar(350) not null
				);
                
			/*
				asigno a la variable v_numero_de_peridodos_ordinario la cantidad de periodos que hay en el año lictivo seleccionado
                excluyendo los periodos de recuperacion para dividir la nota de los periores ordinarios entre
                el numero de peridos ordinarios en el año lectivo seleccionado y poder sacar el promedfio correcto
			*/
            select count(*) into v_numero_de_peridodos_ordinario from acade_periodo pe 
            inner join adm_annio_lectivo al on(al.id_annio_lectivo = pe.id_annio_lectivo)
            where al.annio = p_annio and periodo_recuperacion = 0;
              /*
				asigno a la variable v_numero_de_peridodos_recuperacion los peridodos de recuperacion(se sabe que el perido de recuperacion solo es uno)
                esta variable se utilizara para sumarle este periodo a los alumnos que hayan aplazado
			 */
			select count(*) into v_numero_de_peridodos_recuperacion from acade_periodo pe 
            inner join adm_annio_lectivo al on(al.id_annio_lectivo = pe.id_annio_lectivo)
            where al.annio = p_annio and periodo_recuperacion = 1;
            
			/*
				abro el cursor de los alumnos de la seccion respectiva y lo recorro, si da error que se salga controlado con la variable fin
			*/
			OPEN cursor_alumnos;
			  recorrer_cursor: LOOP
				FETCH cursor_alumnos INTO  v_id_alumno, v_alumno_codigo, v_NOMBRE,
							v_id_curso, v_SECCION;
				IF fin = 1 THEN
				   LEAVE recorrer_cursor;
				END IF;
					
                    -- segundo bloque para el cursor de las materias por curso(seccion)
                    BLOQUE_DOS:
						begin
							declare fin_materias integer default 0;
							DECLARE cursor_materias_por_seccion CURSOR FOR
							select cur.id_curso, cd.id_materia
								from adm_curso cur
								inner join adm_curso_detalle cd on(cd.id_curso = cur.id_curso)
								inner join adm_annio_lectivo al on(al.id_annio_lectivo = cur.id_annio_lectivo and al.id_annio_lectivo = cd.id_annio_lectivo)
								where cd.id_curso = p_id_curso and al.annio = p_annio
								group by cd.id_materia;
							   -- condiciones de salida
							   
							DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_materias=1;

								
									/*
										abro el cursor cursor_materias_por_seccion para recorrerlo y evaluar las notas de los alumnos
                                        por cada materia encontrada de dicha seccion seleccionada
									*/
									OPEN cursor_materias_por_seccion;
									  recorrer_cursor_materias_por_seccion: LOOP
										FETCH cursor_materias_por_seccion INTO  v_c_id_curso, v_c_id_materia;
										IF fin_materias = 1 THEN
										   LEAVE recorrer_cursor_materias_por_seccion;
										END IF;
														
											/*
												evaluo cada alumno para ver si esta aplazado utilizando la variable v_numero_de_peridodos_ordinario
                                                que contiene los periodos ordinarios del año seleccionado y la asigo a la variable v_promedio,
                                                si el resultado en al variable v_promedio es menor a 6 entonces se sumaran
                                                todas las notas de todos los periodos y se dividiran entre la variable v_numero_de_peridodos_ordinario
                                                mas la variable v_numero_de_peridodos_recuperacion.
												De lo contrario solo se dividira entre el valor de la variable que contiene los peridos ordinarios
                                                v_numero_de_peridodos_ordinario, de esa forma saber quines aprobaron y quienes reprobaron
											*/
                                                
											select  sum(pnd.N_1)/v_numero_de_peridodos_ordinario into v_promedio
												from adm_curso cur 
												inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = v_id_alumno and pnd.id_materia = v_c_id_materia)
												inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
												inner join adm_annio_lectivo al on(al.id_annio_lectivo = pe.id_annio_lectivo)
												where cur.id_curso = p_id_curso and al.annio = p_annio
												and pe.periodo_recuperacion = 0;
											if (v_promedio < 6) then
													select  sum(pnd.N_1)/(v_numero_de_peridodos_recuperacion + v_numero_de_peridodos_ordinario) into v_promedio
														from acade_periodo_nota_detalle pnd 
														inner join adm_annio_lectivo al on(al.id_annio_lectivo = pnd.id_annio_lectivo)
														where  pnd.id_alumno = v_id_alumno and al.annio = p_annio and pnd.id_materia = v_c_id_materia;
													-- inserto en la tabla temporal
													insert into tmp_notas_por_seccion values(
														v_id_alumno, v_alumno_codigo, v_NOMBRE, v_id_curso, v_promedio, v_c_id_materia, v_SECCION);
													
												
											else
													select  sum(pnd.N_1)/v_numero_de_peridodos_ordinario into v_promedio
														from acade_periodo_nota_detalle pnd 
														inner join adm_annio_lectivo al on(al.id_annio_lectivo = pnd.id_annio_lectivo)
														where  pnd.id_alumno = v_id_alumno and al.annio = p_annio and pnd.id_materia = v_c_id_materia;
													-- inserto en la tabla temporal
													insert into tmp_notas_por_seccion values(
														v_id_alumno, v_alumno_codigo, v_NOMBRE, v_id_curso, v_promedio, v_c_id_materia, v_SECCION);
											end if;
									END LOOP recorrer_cursor_materias_por_seccion;
							END BLOQUE_DOS;
			 END LOOP recorrer_cursor;
		END BLOQUE_UNO;
			
            -- selecciona los registros de la tabla temporal
            select nps.*, mate.materia_nombre, cur.curso_turno
				from tmp_notas_por_seccion nps
					inner join adm_materia mate on(mate.id_materia = nps.id_materia)
                    inner join adm_curso cur on(cur.id_curso = nps.id_curso)
			order by NOMBRE, nps.id_materia;
			-- elimino la tabla temproal
            drop table if exists tmp_notas_por_seccion;
        
        
end;
//
delimiter ;
