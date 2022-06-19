<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo busca registro
*/
class Arancelesbuscar extends CI_Model{
	
	
	public function TraerAranceles()
	{
		$resultado = $this->db->query("select ara.id_arancel, ara.arancel_nombre, ara.fecha_creacion
from acade_arancel ara where ara.arancel_estado = 1 order by id_arancel desc");
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
	
	public function TraerArancel($id_arancel)
	{
		$resultado = $this->db->query("select ara.id_arancel, ara.arancel_nombre
from acade_arancel ara where ara.id_arancel = $id_arancel and ara.arancel_estado = 1");

			
		return $resultado->row();
	}
	public function TraerCuotasAlumno($id_alumno)
	{
		$resultado = $this->db->query("CALL pa_TaerCalendarioPagoPorAlumno(?)", $id_alumno);
		 
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
