<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo inserta registros
*/
class Usuarioinsertar extends CI_Model{
	
	public function AgregarDocenteUsuario($adm_docente)
	{
		
		$resultado = $this->db->query("CALL pa_AgregarDocenteUsuario(?, ?, ?, ?, ?, ?, ?, ?, ?)", $adm_docente);
		
		return $resultado->row();
	}
	public function AsignarDocente($adm_curso_detalle)
	{
		$resultado = $this->db->insert("adm_curso_detalle", $adm_curso_detalle);//nombre de la tabla + los datos
		if($resultado === true)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	public function AsiganarDocenteOrientador($acade_detalle_orientador)
	{
		$resultado = $this->db->query("CALL pa_detalle_orientadorInsertarOrientador(?, ?, ?)", $acade_detalle_orientador);
		
		return $resultado->row();
	}
}
