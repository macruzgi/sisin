<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo modifica registros
*/
class Modalidadactualizar extends CI_Model{
	
	public function ModificarModalidad($acade_modalidad)
	{
		
		//actualizo la tabla adm_docente
		
		$resultado = $this->db->query("call pa_ModificarModalidad(?, ?, ?, ?)", $acade_modalidad); //nombre del PA mas los datos;
		return $resultado->row();
	}
	public function EliminarModalidad($id_modalidad)
	{
		
		//actualizo la tabla adm_docente
		$resultado = $this->db->query("call pa_EliminarModalidad(?)", $id_modalidad);//nombre del PA + el dato 
		return $resultado->row();
	}
	
}
