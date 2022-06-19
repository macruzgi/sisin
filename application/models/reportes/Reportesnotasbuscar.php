<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo busca registro
*/
class Reportesnotasbuscar extends CI_Model{
	
	
	public function TraerNotasPorDocenteMateriaCursoYannio($filtros)
	{
			
		
		$resultado = $this->db->query("call pa_TraerNotasPorDocenteMateriaCursoYannio(?, ?, ?, ?)", $filtros);

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	//esta funcion trae todas las materias que el docente imparte o ha impartido
	public function TraerMateriasDelDocenteGenerales($id_docente)
	{
		$resultado = $this->db->query("SELECT d.id_docente, mate.id_materia, mate.materia_nombre, a.annio
from adm_docente d 
inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
inner join adm_curso c on(c.id_curso = cd.id_curso)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo)
where d.id_docente = $id_docente and c.curso_estado = 1  group by mate.id_materia");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	//esta funcion trae todos los años que el docente imparte o ha impartido clases
	public function TraerAnniosDelDocenteGenerales($id_docente)
	{
		$resultado = $this->db->query("SELECT a.annio
from adm_docente d 
inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
inner join adm_curso c on(c.id_curso = cd.id_curso)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo)
where d.id_docente = $id_docente and c.curso_estado = 1  group by cd.id_annio_lectivo order by a.annio desc");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	//funcion que trae las secciones segun la materia que se selecione
	public function TraerSeccionesPorMateriasDelDocente($id_materia, $id_docente)
	{
		$resultado = $this->db->query("select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION, c.curso_turno,
d.docente_nombre, mate.materia_nombre
FROM adm_curso c 
inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo)
inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
inner join adm_docente d on(d.id_docente = cd.id_docente)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
where c.curso_estado= 1 and m.modalidad_estado = 1
and d.id_docente =$id_docente and mate.id_materia = $id_materia order by c.curso_nivel, m.modalidad_nombre");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	public function BusquedaInteractivaSeccionesDelDocenteReporteNotas($id_docente, $buscar_curso)
	{
		$resultado = $this->db->query("SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
		c.curso_nivel, moda.modalidad_nombre,  c.curso_identificador,
        /*mate.id_materia, mate.materia_nombre, */dori.id_orientador, c.id_curso, c.curso_nivel, c.curso_turno, al.annio
		from adm_docente d 
		inner join acade_detalle_orientador dori on(dori.id_docente = d.id_docente)
		inner join adm_curso c on(c.id_curso = dori.id_curso)
		-- inner join adm_materia mate on(mate.id_materia = cd.id_materia)
		inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
        inner join adm_annio_lectivo al on(al.id_annio_lectivo = dori.id_annio_lectivo)
		where d.id_docente = $id_docente and (moda.modalidad_nombre like '%$buscar_curso%' or al.annio like '%$buscar_curso%')
        order by c.curso_nivel, moda.id_modalidad, c.curso_identificador");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	public function GenerarReporteNotasPorSeccion($filtros)
	{
			
		
		$resultado = $this->db->query("call pa_GenerarReporteNotasPorSeccion(?, ?)", $filtros);

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	//funcion que trae todas las seccioens a las cual el imparte clases del año actual
	public function TraerSeccionesDocenteAnnioActual($id_docente)
	{
		$resultado = $this->db->query("select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION, c.curso_turno,
		d.docente_nombre, mate.materia_nombre
		FROM adm_curso c 
		inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
		inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo and c.id_annio_lectivo = (SELECT fn_TraerIdAnioLectivo()))
		inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
		inner join adm_docente d on(d.id_docente = cd.id_docente)
		inner join adm_materia mate on(mate.id_materia = cd.id_materia)
		where c.curso_estado= 1 and m.modalidad_estado = 1
		and d.id_docente = $id_docente  group by c.id_curso order by c.curso_nivel, m.modalidad_nombre");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	//funcion que trae el listado de alumnos por seccion nomina comun
	public function TraerAlumnosDeSeccion($id_curso)
	{
	 
			$resultado = $this->db->query("select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, 
		concat(cur.curso_nivel, ' ', moda.modalidad_nombre, ' ', cur.curso_identificador) as SECCION, cur.curso_turno
			from adm_alumno a
			inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
			inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
			inner join adm_curso cur on(cur.id_curso = ad.id_curso)
			inner join acade_modalidad moda on(moda.id_modalidad = cur.id_modalidad)
			where ad.id_curso = $id_curso and al.id_annio_lectivo = (select fn_TraerIdAnioLectivo()) and cur.curso_estado = 1 and al.estado = 1 order by a.alumno_apellido, a.alumno_nombre");


		$datosEnArray = array();
		if($resultado->num_rows() > 0)
		{
			foreach($resultado->result() as $filasEncontradas)
			{
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
	}
	//funcion que trae todas las secciones a las cual el docente imparte o ha impartido clases
	public function ReporteTraerSeccionesDelDocenteCualesquiera($id_docente, $id_annio_lectivo)
	{
		$resultado = $this->db->query("SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
		concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION, /*mate.id_materia, mate.materia_nombre,*/ cd.id_detalle, c.id_curso, c.curso_turno, cd.id_annio_lectivo
		from adm_docente d 
		inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
		inner join adm_curso c on(c.id_curso = cd.id_curso)
		inner join adm_materia mate on(mate.id_materia = cd.id_materia)
		inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
		where d.id_docente = $id_docente and  cd.id_annio_lectivo = $id_annio_lectivo group by c.id_curso
		order by c.curso_nivel, moda.id_modalidad, c.curso_identificador");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	public function TraerAlumnosEnMoraPorSeccion($parametros)
	{
		
		$resultado = $this->db->query("call pa_TraerAlumnosEnMoraPorSeccion(?, ?)", $parametros);

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	//funcion que trae los docentes que cumplen año en el mes actual
	public function GenerarReporteDocentesCumpleannieros($fecha)
	{
		$resultado = $this->db->query("call pa_GenerarReporteDocentesCumpleannieros(?)", $fecha);

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	public function GenerarReporteDocentes($id_annio_lectivo)
	{
		$resultado = $this->db->query("SELECT d.id_docente, CONCAT(d.docente_apellido, ', ', docente_nombre) as DOCENTE,
espe.especialidad_nombre, 
ifnull(concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador), 'SIN ASIGNAR') as SECCION, c.curso_turno
FROM adm_docente d
left join acade_detalle_orientador dori on(dori.id_docente = d.id_docente and dori.id_annio_lectivo = $id_annio_lectivo)
left join adm_curso c on(c.id_curso = dori.id_curso)
left join acade_especialidad espe on(espe.id_especialidad = d.id_especialidad)
left join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
order by d.docente_apellido, c.curso_nivel, m.id_modalidad");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	public function GenerarReporteAlumnosCumpleannieros($parametros)
	{
		$resultado = $this->db->query("call pa_GenerarReporteAlumnosCumpleannieros(?, ?)", $parametros);

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	public function TraerNumerosDePeriodos($annio)
	{
		$resultado = $this->db->query("call pa_TraerNumerosDePeriodos(?)", $annio);

		return $resultado->row();
	}
	/*
		funcion que trae los alumnos aplazados en cualesquiera de los años lectivos
		para la seccion seleccionada
	*/
	public function TraerAlumnosAplazados($parametros)
	{
		$resultado = $this->db->query("call pa_TraerAlumnosAplazados(?, ?, ?)", $parametros);

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	

}
