<?php 
/*
Modelo estandarizado y creado por MaCruz-Gi
mail: giancarlos1029@hotmail.com
Modelo que solo busca registro
*/
class Alumnosbuscar extends CI_Model{
	
	public function TaerCodigoAlumno()
	{
		
		
		$resultado = $this->db->query("select GenerarCodigoAlumno() as CODIGO_ALUMNO");
		$fila = $resultado->row();
		return $fila->CODIGO_ALUMNO;
	}
	public function TraerAlumnos()
	{
		$resultado = $this->db->query("select a.id_alumno, a.alumno_codigo, a.alumno_nombre, a.alumno_apellido,
			a.fecha_creacion from adm_alumno a where a.alumno_estado = 1");
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
	
	public function TaerAlumno($id_alumno)
	{
		$resultado = $this->db->query("select a.id_alumno, a.alumno_codigo, a.alumno_nombre, a.alumno_apellido,
						a.alumno_direccion, a.alumno_telefonos, a.alumno_fecha_nacimiento, 
						a.alumno_nombre_foto, a.alumno_correo, 
						ad.dato_nombres_padre, ad.dato_nombres_madre,
						ad.dato_telefonos_contacto, ad.dato_correo, ad.dato_lugar_trabajo,
						ad.dato_nombres_responsable, ad.dato_telefono_responsable, ad.dato_correo_responsable,
						ad.dato_lugar_trabajo_responsable,
						l.id_lista, l.lista_valor,
						muni.id_municipio, muni.municipio_nombre,
						depto.id_departamento, depto.departamento_nombre
						from adm_alumno a inner join acade_alumno_dato ad on(a.id_alumno = ad.id_alumno)
						inner join adm_lista l on(l.id_lista = a.id_lista)
						inner join adm_municipio muni on(muni.id_municipio = a.id_municipio)
						inner join adm_departamento depto on(depto.id_departamento = muni.id_departamento)
						where a.id_alumno =$id_alumno and a.alumno_estado = 1 limit 1");

			
		return $resultado->row();
	}
	/*
		funcion se ocupa tambien el controlador Aranceles/BusquedaInteractivaAlumnos
		si se modifica tener precaucion no afecte el resultado en ambas vistas
	*/
   public function BuscarInteractivaAlumnos($buscar_alumno)
   {
	   $resultado = $this->db->query("select a.id_alumno, a.alumno_codigo, a.alumno_nombre, a.alumno_apellido
			 from adm_alumno a where a.alumno_estado = 1 and  a.alumno_codigo like '%$buscar_alumno%' or a.alumno_nombre like '%$buscar_alumno%'
or a.alumno_apellido like '%$buscar_alumno%'");
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
   public function TraerAlumnosInscritosEnSeccion($id_curso)
   {
	    $resultado = $this->db->query("select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ' ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
		ad.id_curso
from adm_alumno a
inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
where ad.id_curso = $id_curso order by a.alumno_apellido, a.alumno_nombre");
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
    public function VerSiTieneNotasEnAnnioLectivo($id_alumno)
	{
		$resultado = $this->db->query("select VerifcarAlumnoSiTieneNotasLectivo($id_alumno) as Cuenta");
		$fila = $resultado->row();
		return $fila->Cuenta;
	}
   public function TraerAlumnosInscritosEnSeccionConNotaYsinNota($id_curso, $id_materia, $periodo_recuperacion)
   {
	    /* ANTES SIN ID_MATERIA
		$resultado = $this->db->query("select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ' ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
	left join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_periodo = fn_TraerIdPeriodoEnCurso())
    left join acade_periodo pe on(pe.id_periodo = pnd.id_periodo  and pe.id_periodo = fn_TraerIdPeriodoEnCurso())
	where ad.id_curso = $id_curso  and cur.curso_estado = 1 and al.estado = 1 order by a.alumno_apellido, a.alumno_nombre");
*/
	/*
	si $periodo_recuperacion es = 1 significa que el periodo es de recuperacion
	*/
	if($periodo_recuperacion == 1)
	{
		$parametros = array(
			"id_curso"=>$id_curso,
			"id_materia"=>$id_materia
			);
		$resultado = $this->db->query("call pa_TraerAlumnosParaNotasRecuperacion(?, ?)", $parametros);
	}
	else
	{
		$resultado = $this->db->query("select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, /*pnd.id_nota_detalle,*/ pnd.id_periodo, 'SI' esta_aprobado
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
	left join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_periodo = fn_TraerIdPeriodoEnCurso() 
													and pnd.id_materia = $id_materia)
    left join acade_periodo pe on(pe.id_periodo = pnd.id_periodo  and pe.id_periodo = fn_TraerIdPeriodoEnCurso())
	where ad.id_curso = $id_curso  and cur.curso_estado = 1 and al.estado = 1 order by a.alumno_apellido, a.alumno_nombre");
	}

		
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
