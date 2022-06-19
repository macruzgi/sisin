<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo inserta registros
*/
class Arancelesinsertar extends CI_Model{
	
	public function AgregarArancel($acade_arancel)
	{
		
		//inserto en la tabla adm_docente
		
		$insertar = $this->db->insert("acade_arancel", $acade_arancel); //nombre de la tabla mas los datos enviados desde el controller;
		
		
		
		if($insertar === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
	
	
}
