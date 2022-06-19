<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo modifica registros
*/
class Alumnosactualizar extends CI_Model{
	
	public function ModificarAlumno($adm_alumno)
	{
		
		$resultado = $this->db->query("call pa_alumno_ModificarAlumno(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", $adm_alumno);//nombre del PA mas los datos enviados del controler
		return $resultado->row();
		
	}
	public function EliminarAlumno($id_alumno)
	{
		
		//actualizo la tabla adm_docente
		$this->db->set("alumno_estado", false);
		$this->db->where("id_alumno", $id_alumno);
		$resultado = $this->db->update("adm_alumno");//nombre de la tabla
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
