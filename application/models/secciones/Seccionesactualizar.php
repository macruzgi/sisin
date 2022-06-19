<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo modifica registros
*/
class Seccionesactualizar extends CI_Model{
	
	public function ModificarSeccion($adm_curso)
	{
		
		//actualizo la tabla adm_docente
		$resultado = $this->db->query("call pa_curso_ModificarSeccion(?, ?, ?, ?, ?)", $adm_curso); //nombre del PA mas los datos;
		return $resultado->row();
		
	}
	public function EliminarSeccion($id_curso)
	{
		
		//actualizo la tabla adm_docente
		$resultado = $this->db->query("update adm_curso set curso_estado = 0 where id_curso = $id_curso"); 
				
		if($resultado === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
	
	
}
