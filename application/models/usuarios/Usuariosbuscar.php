<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo busca registro
*/
class Usuariosbuscar extends CI_Model{
	//NOTA: esta funcion se usa tambien en la funcion Usuarios/AdministrarAsignaciones
	public function TraerDocentesUsuarios()
	{
			/*
		$resultado = $this->db->query("select u.id_usuario, u.nombres, u.apellidos,
			m.id_modulo, m.nombre_modulo, mo.id_modulo_opcion, mo.nombre_opcion
			from adm_usuario u
			inner join adm_modulo_opcion_usuario mou on(u.id_usuario = mou.id_usuario)
			inner join adm_modulo_opcion mo on(mo.id_modulo_opcion = mou.id_modulo_opcion)
			inner join adm_modulo m on(m.id_modulo = mo.id_modulo)
			where u.id_usuario = $id_usuario");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
		*/
		
		$resultado = $this->db->query("call pa_TraerDocentesUsuarios()");

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
	/*NOTA: esta funcion tambien se utiliza en el controlador Reportesnotas/ReporteAlumnosEnMora
	si se modifica tener cuidad que no altere el resultado en ambas vistas
	*/
	public function TraerDocentesParaAsiganarMaterias()
	{
		
		$resultado = $this->db->query("call pa_TraerDocentesParaAsiganarMaterias()");

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
	public function TaerRolesUsuarios()
	{
		$resultado = $this->db->query("call pa_rol_TaerRolesUsuarios()");
		
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
	//NOTA: esta funcion se usa tambien en la funcion Usuarios/Asignacion cuidad al modificar
	public function TraerDocenteUsuario($id_docente)
	{
		$resultado = $this->db->query("call pa_docente_TraerDocenteUsuarioPorID(?)", $id_docente);

			
		return $resultado->row();
	}
	
	public function TraerEspecialidades()
	{
		$resultado = $this->db->query("call pa_especialidad_TraerEspecialidades()");
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
	public function TraerMateriasAsigandasYsecciones($id_docente)
	{
		$id_annio_lectivo = $this->Generico->TaerAnnioLectivo();
		$resultado = $this->db->query("SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION, mate.id_materia, mate.materia_nombre, cd.id_detalle, c.id_curso, c.curso_turno
from adm_docente d 
inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
inner join adm_curso c on(c.id_curso = cd.id_curso)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
where d.id_docente = $id_docente and cd.id_annio_lectivo = $id_annio_lectivo order by c.curso_nivel, moda.id_modalidad, c.curso_identificador");
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
	
	public function TraerDocentesUsuariosDeMaterias()
	{
		$resultado = $this->db->query("SELECT d.id_docente, d.docente_nombre, d.docente_apellido,
u.usuario, r.rol_nombre
from adm_docente d 
inner join adm_usuario u on(d.id_usuario = u.id_usuario)
inner join adm_rol r on(r.id_rol = u.id_rol)
inner join adm_curso_detalle cd on (cd.id_docente = d.id_docente and cd.id_annio_lectivo = (select fn_TraerIdAnioLectivo()))
where u.usuario_estado = true group by d.id_docente order by d.docente_apellido, d.docente_nombre");

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
	public function IniciarSesion($adm_usuario)
	{
	
		$resultado = $this->db->query("CALL pa_IniciarSesion(?, ?)", $adm_usuario);
		return $resultado->row();
	
	}
	public function TraerSeccionesDelDocente($id_docente)    
	{
		$resultado = $this->db->query("CALL pa_TraerSeccionesDelDocenteAsiganadasPorMaterias(?)", $id_docente);
		
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
