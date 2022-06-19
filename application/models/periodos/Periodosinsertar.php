<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo inserta registros
*/
class Periodosinsertar extends CI_Model{
	
	public function AgregarPeriodo($acade_periodo)
	{
		
		$insertar = $this->db->query("CALL pa_InsertaryDesactivarPeriodoAcademico(?, ?, ?, ?, ?, ?)", $acade_periodo );
		return $insertar->row();
	}
	
}
