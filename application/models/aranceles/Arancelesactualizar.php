<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo modifica registros
*/
class Arancelesactualizar extends CI_Model{
	
	public function ModificarArancel($id_arancel, $acade_arancel)
	{
		
		//actualizo la tabla adm_docente
		$this->db->where("id_arancel", $id_arancel);
		$resultado = $this->db->update("acade_arancel", $acade_arancel); //nombre de la tabla mas los datos;
		
		
		
		if($resultado === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
	public function EliminarArancel($id_arancel)
	{
		//actualizo la tabla adm_docente
		$this->db->where("id_arancel", $id_arancel);
		$this->db->set("arancel_estado", false);
		$resultado = $this->db->update("acade_arancel"); //nombre de la tabla mas los datos;
				
		if($resultado === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
	public function ActualizarCuotasAlumno($acade_calendario_pago)
	{
		/*inicio la transaccion aqui no es necesario por ya se controla la trnasaccion en el
			el PA pa_ActualizarCuotasAlumno aqui se hace para devolver un valor true o false 
			y poder mostrar mensajes de exitos o error en la aplicacion
		*/
		$this->db->trans_begin();
		 $this->db->query("CALL pa_ActualizarCuotasAlumno(?, ?)", $acade_calendario_pago );
		 
		if($this->db->trans_status() === true)
		{
			$this->db->trans_commit();
			return true;
		}
		else
		{
			$this->db->trans_rollback();
		}
	}
	
}
