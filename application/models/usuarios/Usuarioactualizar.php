<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo modifica registros
*/
class Usuarioactualizar extends CI_Model{
	
	public function ModificarDocenteUsuario($adm_docente)
	{
		
	    $resultado = $this->db->query("CALL pa_ModificarDocenteUsuario(?, ?, ?, ?, ?, ?, ?)", $adm_docente);
		
		return $resultado->row();
		
	}
	public function EliminarDocenteUsuario($id_docente)
	{
		
		$resultado = $this->db->query("CALL pa_EliminarDocenteUsuario(?)", $id_docente);
		
		return $resultado->row();
	}
	public function ResetearClave($adm_usuario)
	{
		$resultado = $this->db->query("CALL pa_usuarioResetearClave(?, ?)", $adm_usuario);
		return $resultado->row();
	}
	
}
