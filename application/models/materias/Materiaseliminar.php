<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo elimina registros
*/
class Materiaseliminar extends CI_Model{
	
	public function EliminarMateria($id_materia)
	{
		
		//actualizo la tabla adm_docente
		$this->db->where("id_materia", $id_materia);
		$resultado = $this->db->delete("adm_materia"); //nombre de la tabla
		
		
		
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
