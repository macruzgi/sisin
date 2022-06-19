<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo inserta registros
*/
class Especialidadinsertar extends CI_Model{
	
	public function AgregarEspecialidad($acade_especialidad)
	{
		
		//inserto en la tabla adm_docente
		
		$insertar = $this->db->insert("acade_especialidad", $acade_especialidad); //nombre de la tabla mas los datos enviados desde el controller;
		
		
		
		if($insertar === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
	
	
}
