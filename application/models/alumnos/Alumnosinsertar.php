<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo inserta registros
*/
class Alumnosinsertar extends CI_Model{
	
	public function AgregarAlumno($adm_alumno)
	{
		$resultado = $this->db->query("call pa_alumno_AgregarAlumno(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", $adm_alumno);
		return $resultado->row();
	}
	public function InscribirAlumno($adm_alumno_detalle)
	{
		//inserto en la tabla acade_alumno_dato
		$resultado = $this->db->insert("adm_alumno_detalle", $adm_alumno_detalle); //nombre de la tabla mas los datos enviados desde el controller;
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
