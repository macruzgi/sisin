<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo inserta registros
*/
class Materiasinsertar extends CI_Model{
	
	public function AgregarMateria($datos)
	{
		
		//inserto en la tabla adm_docente
		
		$insertar = $this->db->insert("adm_materia", $datos); //nombre de la tabla mas los datos enviados desde el controller;
		
		
		
		if($insertar === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
	public function AgregarNotas($acade_periodo_nota_detalle)
	{
		//inserto en la tabla acade_periodo_nota_detalle
		
		$insertar = $this->db->insert("acade_periodo_nota_detalle", $acade_periodo_nota_detalle); //nombre de la tabla mas los datos enviados desde el controller;
			
		
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
