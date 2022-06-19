<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo inserta registros
*/
class Modalidadesinsertar extends CI_Model{
	
	public function AgregarModalidad($acade_modalidad)
	{
		
		//inserto en la tabla adm_docente
		
		$insertar = $this->db->query("call pa_AgregarModalidad(?, ?, ?, ?)", $acade_modalidad); //nombre de la PA mas los datos enviados desde el controller;
		return $insertar->row();
	}
	
}
