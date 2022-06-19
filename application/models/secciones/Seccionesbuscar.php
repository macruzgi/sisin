<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo busca registro
*/
class Seccionesbuscar extends CI_Model{
	
	/*Nota: esta funcion TraerSecciones se ocupa en al controlador Usuarios
	si se modifica tener cuidado que no afecta en el listado del datable
	*/
	public function TraerSecciones()
	{
			
		$resultado = $this->db->query("call pa_curso_TraerSecciones()");

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
	
	public function TraerSeccion($id_curso)
	{
		$resultado = $this->db->query("select c.id_curso, c.id_modalidad, c.curso_nivel, c.curso_identificador, c.curso_turno, m.modalidad_nombre
					from adm_curso c
					inner join acade_modalidad m
					on(c.id_modalidad = m.id_modalidad)
					where c.id_curso =  $id_curso and c.curso_estado = 1");

			
		return $resultado->row();
	}
	
	public function VerificarIndice($id_modalidad, $curso_nivel, $curso_identificador)
	{
		$id_annio_lectivo = $this->Generico->TaerAnnioLectivo();
		$resultado = $this->db->query("select count(*) AS CUENTA from adm_curso where id_modalidad = $id_modalidad and
					curso_nivel =$curso_nivel and curso_identificador ='$curso_identificador' 
					and id_annio_lectivo = $id_annio_lectivo");
		$fila = $resultado->row();
		
		if($fila->CUENTA > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	
	}
	// esta funcion tambien se utiliza en Reportesnotas/ReporteAlumnosCumpleannieros
	// si se cambia ver que no altere el resultado en las vistas intervinientes
	public function TraerSeccionesDelDocente($id_docente)
	{
		$resultado = $this->db->query("CALL pa_TraerMateriasDelDocentenById(?)", $id_docente);

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
	public function TraerMateriasDelDocente($id_docente)
	{
			
		
		$resultado = $this->db->query("select s.id_curso, concat(s.curso_nivel, ' ', m.modalidad_nombre, ' ', s.curso_identificador) as SECCION,
d.docente_nombre
FROM adm_curso s 
inner join acade_modalidad m on(m.id_modalidad = s.id_modalidad)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = s.id_annio_lectivo)
inner join adm_curso_detalle cd on(cd.id_curso = s.id_curso)
inner join adm_docente d on(d.id_docente = cd.id_docente)
where s.curso_estado= 1 and m.modalidad_estado = 1 and a.estado = 1
and d.id_docente =$id_docente group by m.id_modalidad order by s.curso_nivel, m.modalidad_nombre");

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
where c.curso_estado= 1 and m.modalidad_estado = 1 and a.estado = 1
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
	public function TraerSeccionesDelDocentePorMateria($id_docente)
	{
		$resultado = $this->db->query("CALL pa_TraerSeccionesDelDocentePorMateria(?)", $id_docente);
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
	public function BusquedaInteractivaSeccionesReporteNotas($buscar_curso)
	{
		$resultado = $this->db->query("select c.id_curso, c.id_modalidad, c.curso_nivel, c.curso_identificador, c.fecha_creacion, m.modalidad_nombre, al.annio
					from adm_curso c
					inner join acade_modalidad m
					on(c.id_modalidad = m.id_modalidad)
                    INNER JOIN adm_annio_lectivo al
					ON(al.id_annio_lectivo = c.id_annio_lectivo)
					WHERE m.modalidad_nombre like '%$buscar_curso%' or  al.annio like '%$buscar_curso%' order by c.curso_nivel, m.id_modalidad");
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
