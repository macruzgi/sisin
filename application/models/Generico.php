<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo generico
*/
class Generico extends CI_Model{
	
	public function TraerSiguienteID($nombreTabla, $campoID)
	{
			
		
		$resultado = $this->db->query("SELECT ifnull(max($campoID), 0) + 1 as ID from $nombreTabla");
		$fila = $resultado->row();
		
		return $fila->ID;
			
	}
	public function TraerDatosLista($lista_id_opcion)
	{
		$resultado = $this->db->query("select id_lista, lista_valor from adm_lista where lista_id_opcion =$lista_id_opcion");

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
	public function TaerDepartamentos()
	{
		$resultado = $this->db->query("call pa_departamento_TaerDepartamentos()");
		
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
	public function TraerMunicipios($id_departamento)
	{
		$resultado = $this->db->query("call pa_municipio_TraerMunicipioPorDepto(?)", $id_departamento);
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
	//esta funcion devuelve solo el id del año lectivo
	public function TaerAnnioLectivo()
	{
			
		
		$resultado = $this->db->query("select id_annio_lectivo, annio from adm_annio_lectivo where estado = 1  order by annio desc limit 1");
		$fila = $resultado->row();
		
		return $fila->id_annio_lectivo;
			
	}
	//funcion que devuel varios datos del año lectivo
	public function TaerIdYAnnioLectivoActual()
	{
			
		$resultado = $this->db->query("select id_annio_lectivo, annio from adm_annio_lectivo where estado = 1  order by annio desc limit 1");
		$fila = $resultado->row();
		
		return $fila;
			
	}
	public function VerificarIndice($indice_compuesto, $algun_campo, $tabla)
	{
		$this->db->select($algun_campo);
		$this->db->where($indice_compuesto);
		$resultado = $this->db->get($tabla);
		
		if($resultado->num_rows() > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	public function TaerPeriodoActivo()
	{
		//$id_annio_lectivo = $this->TaerIdYAnnioLectivoActual()->id_annio_lectivo;
		$resultado = $this->db->query("select p.id_periodo, p.periodo_numero, p.periodo_nombre, p.periodo_recuperacion
  from acade_periodo p
  inner join adm_annio_lectivo a on(a.id_annio_lectivo = p.id_annio_lectivo)
  where p.periodo_estado = 1 and p.periodo_estado =1 and a.estado = 1 and p.id_annio_lectivo = (select fn_TraerIdAnioLectivo()) order by p.id_periodo desc limit 1");
		$fila = $resultado->row();
		
		return $fila;
			
	}
	public function VerSiAlumnoYaPagoCuota($acade_calendario_pago)
	{
		$resultado = $this->db->query("select fn_VerSiAlumnoYaPagoCuota(?, ?) as ESTADO_CUOTA", $acade_calendario_pago);
		$fila = $resultado->row();
		return $fila->ESTADO_CUOTA;
	}
	public function Configurar($acade_informacion_general)
	{
		$resultado = $this->db->query("call pa_informacciongeneralConfigurar(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", $acade_informacion_general);
		return $resultado->row();
	}
	public function TraerDatosGenerales()
	{
		$resultado = $this->db->query("call pa_TraerDatosGenerales()");
		return $resultado->row();
	}
	public function TraerAnniosLectivos()
	{
		$resultado = $this->db->query("SELECT id_annio_lectivo, annio  FROM adm_annio_lectivo order by annio desc");
		
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
	public function TaerAnnioLectivoByID($id_annio_lectivo)
	{
			
		
		$resultado = $this->db->query("select annio from adm_annio_lectivo where id_annio_lectivo = $id_annio_lectivo order by annio desc limit 1");
		$fila = $resultado->row();
		
		return $fila->annio;
			
	}
}
