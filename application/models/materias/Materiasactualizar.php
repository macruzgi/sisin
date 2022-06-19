<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo modifica registros
*/
class Materiasactualizar extends CI_Model{
	
	public function ModificarMateria($id_materia, $datos)
	{
		
		//actualizo la tabla adm_docente
		$this->db->where("id_materia", $id_materia);
		$resultado = $this->db->update("adm_materia", $datos); //nombre de la tabla mas los datos;
		
		
		
		if($resultado === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
	public function ModificarNota($filtros, $acade_periodo_nota_detalle)
	{
		//actualizo la tabla adm_docente
		$this->db->where($filtros);
		$resultado = $this->db->update("acade_periodo_nota_detalle", $acade_periodo_nota_detalle); //nombre de la tabla mas los datos;
				
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
