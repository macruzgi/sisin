<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo elimina registros
*/
class Inscripcioneseliminar extends CI_Model{
	
	public function DesinscribirAlumno($id_detalle_alumno)
	{
		
		//actualizo la tabla adm_docente
		$this->db->where("id_detalle_alumno", $id_detalle_alumno);
		$resultado = $this->db->delete("adm_alumno_detalle"); //nombre de la tabla
		
		
		
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
