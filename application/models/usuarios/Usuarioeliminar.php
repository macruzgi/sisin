<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo elimina registros
*/
class Usuarioeliminar extends CI_Model{
	
	public function EliminarDocenteUsuario($id_docente)
	{
		
		//actualizo la tabla adm_docente
		$this->db->where("id_docente", $id_docente);
		$resultado = $this->db->delete("adm_docente"); //nombre de la tabla mas los datos;
		
		
		
		if($resultado === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
	public function EliminarMateriaSeccionAsiganda($id_detalle)
	{
		
		//actualizo la tabla adm_curso_detalle
		$this->db->where("id_detalle", $id_detalle);
		$resultado = $this->db->delete("adm_curso_detalle"); //nombre de la tabla
		
		
		
		if($resultado === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
	public function EliminarOrientador($acade_detalle_orientador)
	{
		$resultado = $this->db->query("call pa_detelle_orientador_EliminarDocenteOrientador(?, ?)", $acade_detalle_orientador);
		return $resultado->row();
	}
	
}
