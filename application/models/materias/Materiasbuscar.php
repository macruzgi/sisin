<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo busca registro
*/
class Materiasbuscar extends CI_Model{
	
	//NOTA: esta funcion se utiliza tambient en el controlador Usuarios/AsignarDocente cuidado al modificar
	public function TraerMaterias()
	{
			
		
		$resultado = $this->db->query("select m.id_materia, m.materia_nombre, m.materia_unidades_valorativas, m.fecha_creacion
					from adm_materia m order by m.id_materia");

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
	
	public function TaerMateria($id_materia)
	{
		$resultado = $this->db->query("select m.id_materia, m.materia_nombre, m.materia_unidades_valorativas
					from adm_materia m where m.id_materia = $id_materia");

			
		return $resultado->row();
	}
	public function TraerMateriasDelDocente($id_docente)
	{
		$resultado = $this->db->query("SELECT d.id_docente, mate.id_materia, mate.materia_nombre
from adm_docente d 
inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
inner join adm_materia mate on(mate.id_materia = cd.id_materia)
inner join adm_curso c on(c.id_curso = cd.id_curso)
inner join adm_annio_lectivo a on(a.id_annio_lectivo = c.id_annio_lectivo)
where d.id_docente = $id_docente and c.curso_estado = 1 and a.estado = 1 group by mate.id_materia");

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
	public function ValidacionNotasAgregarEditarOnada($filtros)
	{
		$this->db->select("count(id_nota_detalle) as CUENTA, pnd.id_nota_detalle, pnd.N_1, pnd.id_periodo, pnd.id_alumno,
pnd.id_materia, pnd.id_annio_lectivo");
		$this->db->where($filtros);
		$resultado = $this->db->get("acade_periodo_nota_detalle pnd");
		return $resultado->row();
	}
	public function VerSiDocenteIngresoNotasAmateria($acade_periodo_nota_detalle)
	{
		$resultado = $this->db->query("select fn_VerSiDocenteIngresoNotasAmateria(?, ?, ?) as ESTADO", $acade_periodo_nota_detalle);
		$fila = $resultado->row();
		return $fila->ESTADO;
	}
	
}
