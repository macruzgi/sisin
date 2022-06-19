<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo busca registro
*/
class Periodosbuscar extends CI_Model{
	
	public function TraerPeridos($id_annio_lectivo)
	{
		$resultado = $this->db->query("select p.id_periodo, p.periodo_numero, p.periodo_nombre, p.fecha_creacion, a.annio, 
case 
	when p.periodo_estado = 1 then 'ABIERTO' ELSE 'CERRADO' END ESTADO
from acade_periodo p
inner join adm_annio_lectivo a on(a.id_annio_lectivo = p.id_annio_lectivo)
where a.estado = 1 and a.id_annio_lectivo = $id_annio_lectivo/*and p.periodo_estado = 1*/ order by p.id_periodo desc;");
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
