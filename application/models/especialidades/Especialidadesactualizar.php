<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo modifica registros
*/
class Especialidadesactualizar extends CI_Model{
	
	public function ModificarEspecialidad($acade_especialidad, $id_especialidad)
	{
		
		//actualizo la tabla adm_docente
		$this->db->where("id_especialidad", $id_especialidad);
		$resultado = $this->db->update("acade_especialidad", $acade_especialidad); //nombre de la tabla mas los datos;
		
		
		
		if($resultado === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
	public function EliminarEspecialidad($id_especialidad)
	{
		//actualizo la tabla adm_docente
		$this->db->set("especialidad_estado", 0);
		$this->db->where("id_especialidad", $id_especialidad);
		$resultado = $this->db->update("acade_especialidad"); //nombre de la tabla;
				
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
