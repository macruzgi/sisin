<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo inserta registros
*/
class Seccionesinsertar extends CI_Model{
	
	public function AgregarSeccion($adm_curso)
	{
		
		//inserto en la tabla adm_docente
		
		$insertar = $this->db->query("call pa_curso_AgregarSeccion(?, ?, ?, ?, ?, ?)", $adm_curso); //nombre del PA mas los datos enviados desde el controller;
		return $insertar->row();
	}
	
}
