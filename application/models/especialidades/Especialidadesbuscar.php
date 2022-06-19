<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo busca registro
*/
class Especialidadesbuscar extends CI_Model{
	public function TraerEspecialidades()
	{
		$resultado = $this->db->query("call pa_especialidad_TraerEspecialidades()");
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
	public function TraerGrados()
	{
		$resultado = $this->db->query("select id_lista, lista_valor from adm_lista where lista_id_opcion = 3"); //3 es el id de los grados
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
	public function TraerEspecialidadByID($id_especialidad)
	{
		$resultado = $this->db->query("select es.id_especialidad, lis.id_lista, lis.lista_valor, es.especialidad_nombre
			from acade_especialidad es 
				inner join adm_lista lis on(lis.id_lista = es.id_lista)
			where es.id_especialidad =$id_especialidad order by es.id_especialidad desc");
		return $resultado->row();
	}
}
