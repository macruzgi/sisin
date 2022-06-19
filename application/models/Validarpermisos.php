<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo busca registro
*/
class Validarpermisos extends CI_Model{
	
	public function TraerPermisosUsuario($id_usuario)
	{
			/*
		$resultado = $this->db->query("select u.id_usuario, u.nombres, u.apellidos,
			m.id_modulo, m.nombre_modulo, mo.id_modulo_opcion, mo.nombre_opcion
			from adm_usuario u
			inner join adm_modulo_opcion_usuario mou on(u.id_usuario = mou.id_usuario)
			inner join adm_modulo_opcion mo on(mo.id_modulo_opcion = mou.id_modulo_opcion)
			inner join adm_modulo m on(m.id_modulo = mo.id_modulo)
			where u.id_usuario = $id_usuario");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
		*/
		
		$resultado = $this->db->query("call pa_modulo_TraerPermisosUsuario(?)", $id_usuario);

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	
	
}
