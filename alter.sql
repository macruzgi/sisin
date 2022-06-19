
ALTER TABLE adm_usuario ADD id_rol INT NOT NULL COMMENT 'llave foranera para relacionar con la tabla adm_rol, indice';
ALTER TABLE adm_usuario ADD INDEX(id_rol);
ALTER TABLE adm_usuario  ADD CONSTRAINT fk_usuario_rol FOREIGN KEY(id_rol)
REFERENCES adm_rol(id_rol) ON UPDATE CASCADE;
 
ALTER TABLE adm_modulo ADD modulo_descripcion VARCHAR(180) NOT NULL COMMENT 'descripcion del modulo' AFTER nombre_modulo;

ALTER TABLE adm_modulo_opcion ADD opcion_nivel TINYINT NOT NULL COMMENT 'nivel de la opcion, 1 opcion del menu raiz, 2 opcion del submenu raiz 1,  3 opcion del submenu 2, etc..' AFTER nombre_opcion;
ALTER TABLE adm_modulo_opcion ADD opcion_estado TINYINT(1) 
NOT NULL default 1 COMMENT 'estado de la opcion 1=activo 0=inactiva' AFTER opcion_nivel;


ALTER TABLE adm_modulo ADD id_rol INT NOT NULL COMMENT 'llave foranea apra relacionar con la tabla rol, indice' AFTER fech_crecion,
ADD INDEX (id_rol);
ALTER TABLE adm_modulo ADD CONSTRAINT fk_modulo_rol FOREIGN KEY (id_rol)
REFERENCES adm_rol(id_rol) ON UPDATE CASCADE;

ALTER TABLE adm_modulo_opcion_usuario ADD CONSTRAINT fk_moduloopcionusuario_usuario FOREIGN KEY(id_usuario)
REFERENCES adm_usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE adm_modulo_opcion_usuario ADD CONSTRAINT fk_moduloopcionusuario_opcionesmodulo FOREIGN KEY(id_modulo_opcion)
REFERENCES adm_modulo_opcion(id_modulo_opcion) ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE adm_modulo_opcion ADD CONSTRAINT fk_moduloopcion_modulo FOREIGN KEY(id_modulo)
REFERENCES adm_modulo(id_modulo) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE adm_curso_detalle ADD INDEX fk_cursodetalle_anniolectivo(id_annio_lectivo);
ALTER TABLE adm_curso_detalle DROP INDEX fk_cursodetalle_anniolectivo;
alter table adm_curso add curso_turno varchar(15) not null comment 'para identificar si es matutino, vespertino o nocturno'
after curso_identificador;

ALTER TABLE adm_curso_detalle change id_materia id_materia INT NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_materia, indice' after id_docente;
-- ALTER TABLE adm_curso_detalle ADD INDEX(id_materia);
ALTER TABLE adm_curso_detalle ADD CONSTRAINT fk_cursodetalle_materia FOREIGN KEY(id_materia)
REFERENCES adm_materia(id_materia) ON UPDATE CASCADE;
ALTER TABLE adm_curso_detalle ADD UNIQUE INDEX indice_compuesto_unico(id_annio_lectivo, id_curso, id_docente, id_materia);

-- indices
ALTER TABLE adm_curso_detalle ADD INDEX(id_annio_lectivo);
ALTER TABLE adm_curso_detalle ADD INDEX(id_curso);
ALTER TABLE adm_curso_detalle ADD INDEX(id_docente);
ALTER TABLE adm_curso_detalle ADD INDEX(id_materia);




ALTER TABLE adm_materia_detalle ADD CONSTRAINT fk_materiadetalle_materia FOREIGN KEY(id_materia)
REFERENCES adm_materia(id_materia) ON UPDATE CASCADE;
ALTER TABLE adm_materia_detalle ADD CONSTRAINT fk_materiadetalle_anniolectivo FOREIGN KEY(id_annio_lectivo)
REFERENCES adm_annio_lectivo(id_annio_lectivo) ON UPDATE CASCADE;
ALTER TABLE adm_materia_detalle ADD CONSTRAINT fk_materiadetalle_docente FOREIGN KEY(id_docente)
REFERENCES adm_docente(id_docente) ON UPDATE CASCADE;


ALTER TABLE adm_alumno ADD CONSTRAINT fk_alumno_municipio FOREIGN KEY(id_municipio)
REFERENCES adm_municipio(id_municipio) ON UPDATE CASCADE;

ALTER TABLE adm_alumno ADD CONSTRAINT fk_alumno_lista FOREIGN KEY(id_lista)
REFERENCES adm_lista(id_lista) ON UPDATE CASCADE;

ALTER TABLE adm_alumno DROP INDEX id_lista;

ALTER TABLE adm_alumno CHANGE id_lista id_lista INT NOT NULL COMMENT 'llave foranera para relacionar con la tabla adm_lista, donde habran multiples registros para armar los combobox en esta caso indica el genero, indice';
ALTER TABLE adm_alumno ADD INDEX(id_lista);

ALTER TABLE adm_alumno_detalle ADD CONSTRAINT fk_alumnodetalle_alumno FOREIGN KEY(id_alumno)
REFERENCES adm_alumno(id_alumno) ON UPDATE CASCADE;
/*
ALTER TABLE adm_alumno_detalle ADD CONSTRAINT fk_alumnodetalle_materia FOREIGN KEY(id_materia)
REFERENCES adm_materia(id_materia) ON UPDATE CASCADE;
*/
ALTER TABLE adm_alumno_detalle ADD CONSTRAINT fk_alumnodetalle_curso FOREIGN KEY(id_curso)
REFERENCES adm_curso(id_curso) ON UPDATE CASCADE;
ALTER TABLE adm_alumno_detalle ADD CONSTRAINT fk_alumnodetalle_anniolectivo FOREIGN KEY(id_annio_lectivo)
REFERENCES adm_annio_lectivo(id_annio_lectivo) ON UPDATE CASCADE;

alter table adm_alumno_detalle drop index alumno_curso_aniolectivo;
alter table adm_alumno_detalle add index(id_alumno);
alter table adm_alumno_detalle add index(id_curso);
alter table adm_alumno_detalle add index(id_annio_lectivo);
alter table adm_alumno_detalle add unique index alumno_curso_aniolectivo(id_alumno, id_annio_lectivo);
alter table adm_alumno_detalle drop index fk_alumnodetalle_anniolectivo;
alter table adm_alumno_detalle add fecha_creacion datetime not null default current_timestamp after id_annio_lectivo;
alter table adm_alumno_detalle add id_usuario int not null 
comment 'para saber el usuario que creo el registro o modifica, relacion imaginaria fk'  after fecha_creacion;

ALTER TABLE acade_periodo ADD CONSTRAINT fk_periodo_anniolectivo FOREIGN KEY(id_annio_lectivo)
REFERENCES adm_annio_lectivo(id_annio_lectivo) ON UPDATE CASCADE;
alter table acade_periodo add periodo_numero tinyint not null comment 'numero del periodo en numeros arabigos' after id_periodo;
alter table acade_periodo add unique index anniolectivo_periodos_unico(id_annio_lectivo, periodo_numero);
alter table acade_periodo change periodo_nombre periodo_nombre varchar(50) null;
alter table acade_periodo add periodo_estado boolean not null default true 
comment 'estado del del periodo 1=true activo, 0=false inactivo' after periodo_nombre;
alter table acade_periodo add periodo_recuperacion boolean not null default false 
comment 'periodo es de recuperacion 1=true si, 0=false no' after periodo_nombre;

ALTER TABLE acade_periodo_nota_detalle ADD CONSTRAINT fk_periodonotadetalle_periodo FOREIGN KEY(id_periodo)
REFERENCES acade_periodo(id_periodo) ON UPDATE CASCADE;
ALTER TABLE acade_periodo_nota_detalle ADD CONSTRAINT fk_periodonotadetalle_alumno FOREIGN KEY(id_alumno)
REFERENCES adm_alumno(id_alumno) ON UPDATE CASCADE;
ALTER TABLE acade_periodo_nota_detalle ADD CONSTRAINT fk_periodonotadetalle_materia FOREIGN KEY(id_materia)
REFERENCES adm_materia(id_materia) ON UPDATE CASCADE;
ALTER TABLE acade_periodo_nota_detalle ADD CONSTRAINT fk_periodonotadetalle_anniolectivo FOREIGN KEY(id_annio_lectivo)
REFERENCES adm_annio_lectivo(id_annio_lectivo) ON UPDATE CASCADE;

alter table acade_periodo_nota_detalle drop foreign key fk_periodonotadetalle_periodo;
alter table acade_periodo_nota_detalle drop foreign key fk_periodonotadetalle_alumno;
alter table acade_periodo_nota_detalle drop foreign key fk_periodonotadetalle_materia;
alter table acade_periodo_nota_detalle drop foreign key fk_periodonotadetalle_anniolectivo;
alter table acade_periodo_nota_detalle drop index id_periodo;
alter table acade_periodo_nota_detalle drop index id_alumno;
alter table acade_periodo_nota_detalle drop index id_materia;
alter table acade_periodo_nota_detalle drop index id_annio_lectivo;

alter table acade_periodo_nota_detalle add index (id_periodo);
alter table acade_periodo_nota_detalle add index (id_alumno);
alter table acade_periodo_nota_detalle add index (id_materia);
alter table acade_periodo_nota_detalle add index (id_annio_lectivo);
alter table acade_periodo_nota_detalle add unique index periodo_alumno_materia_annio_lectivo(id_periodo, id_alumno, id_materia, id_annio_lectivo);

ALTER TABLE adm_municipio ADD CONSTRAINT fk_municipio_departamento FOREIGN KEY(id_departamento)
REFERENCES adm_departamento(id_departamento) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE adm_modulo_opcion CHANGE codigo_opcion nombre_controlador_opcion CHAR(100) NOT NULL COMMENT 'este contrendra el nombre del controlador y el nomnre de la opcion para indicarle al controlador que opcion debe ir a buscar en los link' AFTER nombre_opcion;

ALTER TABLE adm_docente CHANGE id_usuario id_usuario INT NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_usuario, indice';
ALTER TABLE adm_docente ADD INDEX(id_usuario);
ALTER TABLE adm_docente ADD CONSTRAINT fk_docente_usuario FOREIGN KEY(id_usuario)
REFERENCES adm_usuario(id_usuario) ON UPDATE CASCADE;
alter table adm_docente add docente_fecha_nacimiento date not null comment 'fecha de nacimiento del docente' 
after docente_direccion;

ALTER TABLE adm_usuario ADD usuario_estado BOOLEAN DEFAULT TRUE NOT NULL COMMENT 'estado del usaurio, true activo, false inactivo' AFTER clave;
ALTER TABLE adm_usuario drop  index id_usuario;
ALTER TABLE adm_annio_lectivo ADD UNIQUE INDEX(annio);


ALTER TABLE adm_curso CHANGE curso_nombre id_modalidad INT NOT NULL COMMENT 'llave forarean para relacionar con la tabla acade_modalidad, indice';
ALTER TABLE adm_curso ADD INDEX(id_modalidad);
ALTER TABLE adm_curso ADD CONSTRAINT fk_curso_modalidad FOREIGN KEY(id_modalidad)
REFERENCES acade_modalidad(id_modalidad) ON UPDATE CASCADE;
ALTER TABLE adm_curso ADD curso_estado BOOLEAN NOT NULL DEFAULT 1 COMMENT '1=activo, 0=false inactivo' AFTER curso_identificador;

ALTER TABLE adm_curso ADD UNIQUE INDEX moda_curso_nivel_iden_lectivo(id_modalidad, curso_nivel, curso_identificador, id_annio_lectivo);
ALTER TABLE adm_curso DROP  INDEX id_modalidad_2;

ALTER TABLE adm_curso CHANGE curso_nivel curso_nivel CHAR(4) NOT NULL COMMENT 'nivel del curso o grado, 1º, 2º, 3º...I, II....';
ALTER TABLE adm_curso ADD id_annio_lectivo INT NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice' AFTER curso_estado;
ALTER TABLE adm_curso ADD INDEX(id_annio_lectivo);

ALTER TABLE adm_curso ADD CONSTRAINT fk_curso_anniolectivo FOREIGN KEY(id_annio_lectivo)
REFERENCES adm_annio_lectivo(id_annio_lectivo) ON UPDATE CASCADE ;
alter table adm_curso modify curso_nivel tinyint(2) not null comment 'nivel del curso o grado en numero arabigo';
alter table adm_curso add curso_orientador int not null default 0 comment 'para indicar que docente cera el orientador'
after curso_identificador;
alter table adm_curso drop curso_orientador;

ALTER TABLE adm_municipio CHANGE id_municipio id_municipio SMALLINT NOT NULL;

ALTER TABLE adm_alumno CHANGE id_municipio id_municipio SMALLINT NOT NULL;

ALTER TABLE adm_docente ADD id_municipio INT NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_municipio, indice';
ALTER TABLE adm_docente CHANGE id_municipio id_municipio SMALLINT NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_municipio, indice';
ALTER TABLE adm_docente ADD INDEX(id_municipio);
alter table adm_docente add unique index id_usuario_unico(id_usuario);
alter table adm_docente drop  index id_usuario_2;
ALTER TABLE adm_docente ADD CONSTRAINT fk_docente_municipio FOREIGN KEY(id_municipio)
REFERENCES adm_municipio(id_municipio) ON UPDATE CASCADE;

ALTER TABLE adm_docente ADD id_especialidad SMALLINT NOT NULL COMMENT 'llave foranea para relacionar con la tabla acade_especialidad';
ALTER TABLE adm_docente ADD INDEX(id_especialidad);
ALTER TABLE adm_docente ADD CONSTRAINT fk_docente_especialidad FOREIGN KEY(id_especialidad)
REFERENCES acade_especialidad(id_especialidad) ON UPDATE CASCADE;

ALTER TABLE adm_alumno ADD alumno_nombre_foto VARCHAR(80) COMMENT 'nombre de la foto unica no puede repertirse sera la combinacion de el id del alumno mas el nombre de la foto' AFTER alumno_lugar_trabaja_encargado;

ALTER TABLE adm_alumno CHANGE alumno_nombre_foto alumno_nombre_foto VARCHAR(80) COMMENT 'nombre de la foto unica no puede repertirse sera la combinacion de el id del alumno mas el nombre de la foto' AFTER alumno_fecha_nacimiento;

ALTER TABLE adm_alumno ADD alumno_correo VARCHAR(90) COMMENT 'correo del alumno' AFTER alumno_nombre_foto;

ALTER TABLE adm_alumno DROP alumno_encargado; 
ALTER TABLE adm_alumno DROP alumno_telefono_encargado;
ALTER TABLE adm_alumno DROP alumno_lugar_trabaja_encargado;

ALTER TABLE acade_alumno_dato ADD CONSTRAINT fk_alumnodato_alumno FOREIGN KEY(id_alumno)
REFERENCES adm_alumno(id_alumno) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE adm_alumno ADD alumno_codigo VARCHAR(6) NOT NULL COMMENT 'codigo del alumno, unico' AFTER id_alumno;
ALTER TABLE adm_alumno ADD UNIQUE INDEX(alumno_codigo);

ALTER TABLE adm_alumno ADD alumno_estado BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'estado del alumno 1=acitvo, true, 0=inactivo,false'
AFTER alumno_correo;

 
alter table acade_arancel add arancel_estado BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'estado del alumno 1=acitvo, true, 0=inactivo,false'
after arancel_nombre;

alter table acade_calendario_pago add constraint fk_calendariopago_anniolectivo foreign key(id_annio_lectivo)
references adm_annio_lectivo(id_annio_lectivo) on update cascade;
alter table acade_calendario_pago add constraint fk_calendariopago_alumno foreign key(id_alumno)
references adm_alumno(id_alumno) on update cascade;

alter table acade_modalidad add modalidad_duracion int not null comment 'tiempo en años lo que dura la carrera o la modalidad'
after modalidad_nombre;
alter table acade_modalidad modify modalidad_duracion tinyint not null comment 'tiempo en años lo que dura la carrera o la modalidad'
after modalidad_nombre;



alter table adm_usuario drop apellidos;

alter table acade_detalle_orientador add constraint fk_detalleorientador_docente foreign key(id_docente)
references adm_docente(id_docente) on update cascade;
alter table acade_detalle_orientador add constraint fk_detalleorientador_curso foreign key(id_curso)
references adm_curso(id_curso) on update cascade;
/* NOTA: ESTA REFERENCIA ESTABA ASI, NO SE PORUQE LA HISE ASI PERO ESTA MALA SE CORRIGIO
alter table acade_detalle_orientador add constraint fk_detalleorientador_anniolectivo foreign key(id_annio_lectivo)
references adm_alumno_detalle(id_annio_lectivo) on update cascade;
*/
alter table acade_detalle_orientador drop foreign key fk_detalleorientador_anniolectivo;
alter table acade_detalle_orientador add constraint fk_detalleorientador_anniolectivo foreign key(id_annio_lectivo)
references adm_annio_lectivo(id_annio_lectivo) on update cascade;

alter table acade_informacion_general add constraint fk_informaciongeneral_municipio foreign key(id_municipio)
references adm_municipio(id_municipio) on update cascade;

alter table acade_informacion_general change informacion_nombre_imagen informacion_nombre_logo varchar(80) null
comment 'nombre de la imagen, no la ruta porquque ya sesabe donde se almacenara'
after informacion_valores;

alter table acade_especialidad add id_lista int not null comment 'llave foranea para relacionar con la tabla adm_lista, indice'
after especialidad_estado;

alter table acade_especialidad add index(id_lista);

alter table acade_especialidad add especialidad_estado tinyint(1) not null default 1 comment 'estado de la especialidad 1=activo,  0=inactivo'
after especialidad_nombre;
alter table acade_especialidad add constraint fk_especialidad_lista foreign key(id_lista)
references adm_lista(id_lista) on update cascade;

alter table acade_especialidad add unique index nombre_especialidad_lista(especialidad_nombre, id_lista);

alter table acade_informacion_general add informacion_url varchar(100) comment 'direccion web de la intitucion' 
after informacion_nombre_logo;