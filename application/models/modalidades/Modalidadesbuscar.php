<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo busca registro
*/
class Modalidadesbuscar extends CI_Model{
	
	/*Nota: esta funcion TraerModalidades se ocupa en al controlador Secciones
	si se modifica tener cuidado que no afecta en el listado del combo
	*/
	public function TraerModalidades()
	{
			
		
		$resultado = $this->db->query("call pa_TraerModalidades()");

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
	
	public function TraerModalidad($id_modalidad)
	{
		$resultado = $this->db->query("call pa_TaerModalidaPorID(?)", $id_modalidad);		
		return $resultado->row();
	}
	
}
