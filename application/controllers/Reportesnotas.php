<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Reportesnotas extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	 public function __construct()
	 {
		 parent::__construct();
		  //comprobamos si el usuario está logueado
		$estalogueado	= $this->session->userdata("chequear");
		if($estalogueado === true)
		{
		}
		else
		{
			//si no estoy logueado que me envie a index
			redirect(base_url());
		}
		 //cargo los modelos necesarios en este controlador
		 $this->load->model("reportes/Reportesnotasbuscar");
		 $this->load->model("usuarios/Usuariosbuscar");
		 $this->load->model("secciones/Seccionesbuscar");
	 }
	public function VistaError($error)
    {
        $mostrar["error"] = $error;
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
	    $mostrar["contenido"] = "vista_error";
        $this->load->view("plantilla", $mostrar);
    }
	public function ReporteNotas()
	{
		if($this->session->userdata("id_rol") != 2)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="reportes/vista_reporte_notas";
		$mostrar["TraerMateriasDelDocente"] = $this->Reportesnotasbuscar->TraerMateriasDelDocenteGenerales($this->session->userdata("id_usuario"));//envio como parametro el docente logueado
		$mostrar["TraerAnniosDelDocenteGenerales"] = $this->Reportesnotasbuscar->TraerAnniosDelDocenteGenerales($this->session->userdata("id_usuario"));//envio como parametro el docente logueado
		 
		$mostrar["Informacion"]	= "Este reporte mostar&aacute; el listado de alumnos con sus respectivas notas por per&iacute;dos existentes para la materia, secci&oacute;n  y a&ntilde;o lectivo seleccionado, mostrando su promedio respectivo.";
		$this->load->view("plantilla", $mostrar);
		
	}
	public function TraerSeccionesPorMateriasDelDocente()
	{
		$id_materia = $this->input->post("id_materia");
		$id_docente = $this->session->userdata("id_usuario"); //docente logueado el id del docente es el mismo id del usario
		//el formulario espera un json
		echo json_encode($this->Reportesnotasbuscar->TraerSeccionesPorMateriasDelDocente($id_materia, $id_docente));
	
	}
	public function BusquedaInteractivaSeccionesDelDocenteReporteNotas()
	{
		$this->form_validation->set_rules("buscar_curso", "Curso","required");
		
		
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 
					$mostrar["TraerSecciones"]	= $this->Reportesnotasbuscar->BusquedaInteractivaSeccionesDelDocenteReporteNotas($this->session->userdata("id_usuario"), $this->input->post("buscar_curso"));
					$this->load->view("reportes/resulado_independiente_secciones_notas", $mostrar);
					
		
				 
             }
	}
	public function GenerarReporteNotas()
	{
		$this->form_validation->set_rules("id_materia", "Materia","required");
		$this->form_validation->set_rules("id_curso", "Curso","required");
		$this->form_validation->set_rules("annio", "A&ntilde;o","required");
		
		
		
		 if ($this->form_validation->run() == FALSE)
             {
						$respuesta = array(
							"respuesta"=>0,
							"mensaje"=>validation_errors()
						);
					echo json_encode($respuesta);
             }
          else
             {
				 $filtros = array(
						"id_docente"=>$this->session->userdata("id_usuario"),
						"id_materia"=>$this->input->post("id_materia"),
						"id_curso"=>$this->input->post("id_curso"),
						"annio"=>$this->input->post("annio")
					);

			//date_default_timezone_set('America/El_Salvador'); 
			$mostrar["Titulo"]		= "Reporte: NOTAS POR MATERIA";
			$mostrar["TraerDatosGenerales"] = $this->Generico->TraerDatosGenerales();
			mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
			$this->load->view("reportes/encabezados/encabezado", $mostrar);
			$mostrar["TraerNumerosDePeriodos"]		  = $this->Reportesnotasbuscar->TraerNumerosDePeriodos($this->input->post("annio"));
			mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
			$mostrar["TraerNotasPorDocenteMateriaCursoYannio"] = $this->Reportesnotasbuscar->TraerNotasPorDocenteMateriaCursoYannio($filtros);
			mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
			// TRAIGO LOS ALUMNO QUE HAN APLAZADO
			$parametros = array(
				"id_curso"=>$this->input->post("id_curso"),
				"id_materia"=>$this->input->post("id_materia"),
				"annio"=>$this->input->post("annio")
				);
			$mostrar["TraerAlumnosAplazados"]	= $this->Reportesnotasbuscar->TraerAlumnosAplazados($parametros);
			$this->load->view("reportes/reporte_notas_seccion_curso_annio", $mostrar);
			$this->load->view("reportes/encabezados/pie");
			 }
			 
	}
  public function ReporteNotasPorSeccion()
	{
		if($this->session->userdata("id_rol") != 2)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="reportes/vista_reporte_notas_por_seccion";
		$mostrar["TraerMateriasDelDocente"] = $this->Reportesnotasbuscar->TraerMateriasDelDocenteGenerales($this->session->userdata("id_usuario"));//envio como parametro el docente logueado
		 
		$mostrar["Informacion"]	= "Este reporte mostar&aacute; el listado de alumnos con sus respectivas notas conglomeradas por secci&oacute;n para la cual se especifique con su a&ntilde;o lectivo respectivo.";
		$this->load->view("plantilla", $mostrar);
		
	}
	public function GenerarReporteNotasPorSeccion()
	{
		$this->form_validation->set_rules("id_curso", "Secci&oacute;n","required");
		$this->form_validation->set_rules("annio", "A&ntilde;o","required");
				
		
		 if ($this->form_validation->run() == FALSE)
             {
					
					echo validation_errors();
             }
          else
             {
				 $filtros = array(
						"id_curso"=>$this->input->post("id_curso"),
						"annio"=>$this->input->post("annio")
					);
			$mostrar["TraerDatosGenerales"] = $this->Generico->TraerDatosGenerales();
			mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
			$this->load->view("reportes/encabezados/encabezado", $mostrar);
			//date_default_timezone_set('America/El_Salvador');
			$mostrar["Titulo"]		= "Reporte: NOTAS POR SECCI&Oacute;N";
			
			$mostrar["GenerarReporteNotasPorSeccion"] = $this->Reportesnotasbuscar->GenerarReporteNotasPorSeccion($filtros);
			
			$this->load->view("reportes/reporte_notas_por_seccion", $mostrar);
			$this->load->view("reportes/encabezados/pie");
			 }
			 
	}
	public function ReportesNominaAlumnos()
	{
		if($this->session->userdata("id_rol") != 2)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="reportes/vista_reporte_nomina_alumnos";
		$mostrar["TraerSeccionesDocenteAnnioActual"] = $this->Reportesnotasbuscar->TraerSeccionesDocenteAnnioActual($this->session->userdata("id_usuario"));//envio como parametro el docente logueado
		 
		$mostrar["Informacion"]	= "Este reporte mostar&aacute; el listado de alumnos de cada secci&oacute;n a las cuales usted imparte clases del a&ntilde;o lectivo en curso.";
		$this->load->view("plantilla", $mostrar);
	}
	public function GenerarReporteNominaAlumnos()
	{
		$this->form_validation->set_rules("id_curso", "Secci&oacute;n","required");
					
		
		 if ($this->form_validation->run() == FALSE)
             {
					$respuesta = array(
						"respuesta"=>0,
						"mensaje"=>validation_errors()
						);
					echo json_encode($respuesta);
             }
          else
             {
				 $TraerAlumnosDeSeccion = $this->Reportesnotasbuscar->TraerAlumnosDeSeccion($this->input->post("id_curso"));
				 //echo count($TraerAlumnosDeSeccion);
			     if(count($TraerAlumnosDeSeccion) <= 0)
				 {
					 $respuesta = array(
						"respuesta"=>2,
						"mensaje"=>"No hay resultados para generar el reporte"
						);
					echo json_encode($respuesta);
				 }
				 else
				 {
					 $this->load->library('Pdf');
					 $pdf = new PdfOficio('P', 'mm', 'Letter', true, 'UTF-8', false);

					  $pdf->SetCreator(PDF_CREATOR);
					  $pdf->SetAuthor('MaCruz-Gi');
					  $pdf->SetTitle('Reporte');
					  $pdf->SetSubject('Reporte');
					  $pdf->SetKeywords('REPORTE, Reporte');
					  // datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
					  $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING, array(0, 64, 255), array(0, 64, 128));
					  $pdf->setFooterData($tc = array(0, 64, 0), $lc = array(0, 64, 128));
					  // datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config.php de libraries/config
					  $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
					  $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
					  // se pueden modificar en el archivo tcpdf_config.php de libraries/config
					  $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
					  // se pueden modificar en el archivo tcpdf_config.php de libraries/config
					  $pdf->SetMargins(25, PDF_MARGIN_TOP, 25);
					  $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
					  $pdf->SetFooterMargin(50);//espacio del margen
					  // se pueden modificar en el archivo tcpdf_config.php de libraries/config
					  $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
					  //relación utilizada para ajustar la conversión de los píxeles
					  $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
						
					  $pdf->setFontSubsetting(true);
						
					  $pdf->SetFont('courier', '', 12, '', true);
					  $pdf->tituloReporte ="Nómina de alumnos";
					  $pdf->usuario = $this->session->userdata("usuario");
					  $pdf->AddPage();
				  
$encabezados = <<<EOD
<br><br>
<br><br>
<table border ="0">
<tr>
<td>
Secci&oacute;n: <span style="text-decoration: underline;"><b>
EOD;
$encabezados .= $TraerAlumnosDeSeccion[0]->SECCION;

$encabezados .=<<<EOD
</b></span>
</td>									   
</tr>
EOD;
$encabezados .=<<<EOD
<tr>
<td>Turno: <span style="text-decoration: underline;"><b>
EOD;
$encabezados .= $TraerAlumnosDeSeccion[0]->curso_turno;
$encabezados .=<<<EOD
</b></span>
</td>
</tr>
</table>
<br/><br/>

EOD;
$tbl =<<<EOD
<table border="1" cellpadding="0" cellspacing="0"  width="100%">
<tr>
<td width="40"><b>No.</b></td>
<td  width="85"><b>C&oacute;digo</b></td>
<td  width="80%"><b>Nombre</b></td>
</tr>
EOD;
	$correlativo = 0;
			foreach($TraerAlumnosDeSeccion as $alumnosEncontrados):
$correlativo+= 1;
$tbl .=<<<EOD
<tr>
<td>$correlativo</td>
<td>$alumnosEncontrados->alumno_codigo</td>
<td>$alumnosEncontrados->NOMBRE</td>
</tr>
EOD;
			endforeach;
$tbl .=<<<EOD
</table>
EOD;
	  
					  $pdf->writeHTML($encabezados, true, false, true, false, '');
					  $pdf->writeHTML($tbl, true, false, true, false, '');
					  //$nombre_archivo = utf8_decode("Reporte.pdf");
					  $pdf->Output(utf8_decode("Reporte.pdf"), 'F');
					  $respuesta = array(
						"respuesta"=>1,
						"mensaje"=>base_url().utf8_decode("Reporte.pdf")
						);	
					   echo json_encode($respuesta);
				 }
				 
				 
			 }
	}
	public function ReporteAlumnosEnMora()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si no da error de consultas no sincronizadas
		
		$mostrar["contenido"]	="reportes/vista_reporte_alumnos_en_mora";
		$mostrar["TraerDocentes"] = $this->Usuariosbuscar->TraerDocentesParaAsiganarMaterias();
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si no da error de consultas no sincronizadas
		$mostrar["TraerAnniosLectivos"] = $this->Generico->TraerAnniosLectivos();
		 
		$mostrar["Informacion"]	= "Este reporte mostar&aacute; el listado de alumnos en mora, dependiendo del docente y a&ntilde;o lectivo que se seleccione.";
		$this->load->view("plantilla", $mostrar);
		
	}
	public function ReporteTraerSeccionesDelDocenteCualesquiera()
	{
		//el formulario espera un json
		echo json_encode($this->Reportesnotasbuscar->ReporteTraerSeccionesDelDocenteCualesquiera($this->input->post("id_docente"), $this->input->post("id_annio_lectivo")));
	}
	public function GenerarReporteAlumnosEnMora()
	{
		$this->form_validation->set_rules("id_curso", "Secci&oacute;n","required");
		$this->form_validation->set_rules("id_annio_lectivo", "A&ntilde;o","required");		
		
		 if ($this->form_validation->run() == FALSE)
             {
					$respuesta = array(
						"respuesta"=>0,
						"mensaje"=>validation_errors()
						);
					echo json_encode($respuesta);
             }
          else
            {
				$parametros = array(
					"id_curso"=>$this->input->post("id_curso"),
					"id_annio_lectivo"=>$this->input->post("id_annio_lectivo")
					);
				$TraerAlumnosEnMoraPorSeccion = $this->Reportesnotasbuscar->TraerAlumnosEnMoraPorSeccion($parametros);
				
			
				 $this->load->library('Pdf');
				$pdf = new PdfOficio('P', 'mm', 'Letter', true, 'UTF-8', false);
				$pdf->SetCreator(PDF_CREATOR);
				$pdf->SetAuthor('MaCruz-Gi');
				$pdf->SetTitle('Reporte');
				$pdf->SetSubject('Reporte');
				$pdf->SetKeywords('REPORTE, Reporte');
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
				$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING, array(0, 64, 255), array(0, 64, 128));
				$pdf->setFooterData($tc = array(0, 64, 0), $lc = array(0, 64, 128));
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
				$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetMargins(25, PDF_MARGIN_TOP, 25);
				$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
				$pdf->SetFooterMargin(50);//espacio del margen
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
				//relación utilizada para ajustar la conversión de los píxeles
				$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
				$pdf->setFontSubsetting(true);
				$pdf->SetFont('courier', '', 12, '', true);
				$pdf->tituloReporte ="Nómina de alumnos en Mora";
				$pdf->usuario = $this->session->userdata("usuario");
				$pdf->AddPage();
				  
$encabezados = <<<EOD
<br><br>
<br><br>
<table border ="0">
<tr>
<td style="text-align:center">
Secci&oacute;n: <span style="text-decoration: underline;"><b>
EOD;
$encabezados .= @$TraerAlumnosEnMoraPorSeccion[0]->SECCION." (".@$TraerAlumnosEnMoraPorSeccion[0]->curso_turno.")";

$encabezados .=<<<EOD
</b></span>
</td>									   
</tr>
</table>
<br/><br/>

EOD;
$tbl =<<<EOD
<table border="1" cellpadding="0" cellspacing="0"  width="100%">
<tr>
<td width="85" style="text-align:center;"><b>C&oacute;digo</b></td>
<td width="50%" style="text-align:center;"><b>Alumno</b></td>
<td width="45%" style="text-align:center;"><b>Mora</b></td>
</tr>
EOD;
		$banderaAlumno ="";
		foreach($TraerAlumnosEnMoraPorSeccion as $alumnosEncontrados):
	
			if($banderaAlumno != $alumnosEncontrados->id_alumno)
			{	
				$banderaAlumno = $alumnosEncontrados->id_alumno;
				$mesesEnMora = "";
				foreach($TraerAlumnosEnMoraPorSeccion as $mesesEnMoraEncontrados):
					if($banderaAlumno == $mesesEnMoraEncontrados->id_alumno)
					{
							$mesesEnMora = $mesesEnMora."/".$mesesEnMoraEncontrados->MES."(". $mesesEnMoraEncontrados->calendario_annio.")";
					}
					
					
				endforeach;
$tbl .=<<<EOD
<tr>
<td>$alumnosEncontrados->alumno_codigo</td><td>$alumnosEncontrados->ALUMNO</td><td>$mesesEnMora</td></tr>
EOD;
			}
		endforeach;
$tbl .=<<<EOD
</table>
EOD;
			 $pdf->writeHTML($encabezados, true, false, true, false, '');
			 $pdf->writeHTML($tbl, true, false, true, false, '');
			$pdf->Output(utf8_decode("Reporte.pdf"), 'F');
			$respuesta = array(
				"respuesta"=>1,
				"mensaje"=>base_url().utf8_decode("Reporte.pdf")
				);	
			echo json_encode($respuesta);
		}
		
	}
	public function ReporteDocentes()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="reportes/vista_reporte_docentes";
		$mostrar["TraerDocentes"] = $this->Usuariosbuscar->TraerDocentesParaAsiganarMaterias();
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		$mostrar["TraerAnniosLectivos"] = $this->Generico->TraerAnniosLectivos();
		 
		$mostrar["Informacion"]	= "Este reporte mostar&aacute; el listado de los docentes inscritos en esta instituci&oacute;n, con sus repsectivas materias asigandas como orientador.";
		$this->load->view("plantilla", $mostrar);
		
	}
	public function GenerarReporteDocentes()
	{
		$this->form_validation->set_rules("id_annio_lectivo", "A&ntilde;o","required");		
		
		 if ($this->form_validation->run() == FALSE)
             {
					$respuesta = array(
						"respuesta"=>0,
						"mensaje"=>validation_errors()
						);
					echo json_encode($respuesta);
             }
          else
            {
				$id_annio_lectivo 		= $this->input->post("id_annio_lectivo");
				$GenerarReporteDocentes = $this->Reportesnotasbuscar->GenerarReporteDocentes($id_annio_lectivo);
				$annio					= $this->Generico->TaerAnnioLectivoByID($id_annio_lectivo);
			
				$this->load->library('Pdf');
				$pdf = new PdfOficio('P', 'mm', 'Letter', true, 'UTF-8', false);
				$pdf->SetCreator(PDF_CREATOR);
				$pdf->SetAuthor('MaCruz-Gi');
				$pdf->SetTitle('Reporte');
				$pdf->SetSubject('Reporte');
				$pdf->SetKeywords('REPORTE, Reporte');
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
				$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING, array(0, 64, 255), array(0, 64, 128));
				$pdf->setFooterData($tc = array(0, 64, 0), $lc = array(0, 64, 128));
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
				$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetMargins(25, PDF_MARGIN_TOP, 25);
				$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
				$pdf->SetTopMargin(50);
				$pdf->SetFooterMargin(25);//espacio del margen
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
				//relación utilizada para ajustar la conversión de los píxeles
				$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
				$pdf->setFontSubsetting(true);
				$pdf->SetFont('courier', '', 12, '', true);
				$pdf->tituloReporte ="Nómina de Docentes";
				$pdf->usuario = $this->session->userdata("usuario");
				$pdf->AddPage();
				  
$encabezados = <<<EOD

<table border ="0">
<tr>
<td style="text-align:center">
A&ntilde;o Lectivo: <span style="text-decoration: underline;"><b>
EOD;
$encabezados .= $annio;

$encabezados .=<<<EOD
</b></span>
</td>									   
</tr>
</table>
<br/><br/>

EOD;
$tbl =<<<EOD
<table border="1" cellpadding="0" cellspacing="0"  width="100%">
<tr>
<td width="40" style="text-align:center;"><b>No.</b></td>
<td width="250" style="text-align:center;"><b>Docente</b></td>
<td width="25%" style="text-align:center;"><b>Especialidad</b></td>
<td width="25%" style="text-align:center;"><b>Secci&oacute;n/es Orienta</b></td>
</tr>
EOD;
		$banderaDocente ="";
		$correlativo = 0;
		foreach($GenerarReporteDocentes as $docentesEncontrados):
	
			if($banderaDocente != $docentesEncontrados->id_docente)
			{
				$correlativo+= 1;
				$banderaDocente = $docentesEncontrados->id_docente;
				$secionesOrienta = "";
				foreach($GenerarReporteDocentes as $seccionesOrienta):
					if($banderaDocente == $seccionesOrienta->id_docente)
					{
							$secionesOrienta = $secionesOrienta."/". $seccionesOrienta->SECCION."(".$seccionesOrienta->curso_turno.")";
					}
					
					
				endforeach;
$tbl .=<<<EOD
<tr>
<td>$correlativo</td>
<td>$docentesEncontrados->DOCENTE</td><td>$docentesEncontrados->especialidad_nombre</td><td>$secionesOrienta</td></tr>
EOD;
			}
		endforeach;
$tbl .=<<<EOD
</table>
EOD;
			 $pdf->writeHTML($encabezados, true, false, true, false, '');
			 $pdf->writeHTML($tbl, true, false, true, false, '');
			$pdf->Output(utf8_decode("Reporte.pdf"), 'F');
			$respuesta = array(
				"respuesta"=>1,
				"mensaje"=>base_url().utf8_decode("Reporte.pdf")
				);	
			echo json_encode($respuesta);
		}
		
	}
	public function ReporteDocentesCumpleannieros()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		
		$mostrar["contenido"]	="reportes/vista_reporte_docentes_cumpleanieros";
		$mostrar["Informacion"]	= "Este reporte mostar&aacute; el listado de los docentes cumplea&ntilde;eros del mes seleccionado.	";
		$this->load->view("plantilla", $mostrar);
		
	}
	public function GenerarReporteDocentesCumpleannieros()
	{
		$this->form_validation->set_rules("mes", "mes","required");		
		
		 if ($this->form_validation->run() == FALSE)
             {
					$respuesta = array(
						"respuesta"=>0,
						"mensaje"=>validation_errors()
						);
					echo json_encode($respuesta);
             }
          else
            {	
				
				//concateno el mes a la fecha y el dia que simre sera 01
				$fecha 			= date("Y")."-".$this->input->post("mes")."-01";
				$GenerarReporteDocentes = $this->Reportesnotasbuscar->GenerarReporteDocentesCumpleannieros($fecha);
				
			
				$this->load->library('Pdf');
				$pdf = new PdfOficio('P', 'mm', 'Letter', true, 'UTF-8', false);
				$pdf->SetCreator(PDF_CREATOR);
				$pdf->SetAuthor('MaCruz-Gi');
				$pdf->SetTitle('Reporte');
				$pdf->SetSubject('Reporte');
				$pdf->SetKeywords('REPORTE, Reporte');
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
				$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING, array(0, 64, 255), array(0, 64, 128));
				$pdf->setFooterData($tc = array(0, 64, 0), $lc = array(0, 64, 128));
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
				$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetMargins(25, PDF_MARGIN_TOP, 25);
				$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
				$pdf->SetTopMargin(50);
				$pdf->SetFooterMargin(25);//espacio del margen
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
				//relación utilizada para ajustar la conversión de los píxeles
				$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
				$pdf->setFontSubsetting(true);
				$pdf->SetFont('courier', '', 12, '', true);
				$pdf->tituloReporte ="Docentes cumpleañeros para el mes de: ".@$GenerarReporteDocentes[0]->MES;
				$pdf->usuario = $this->session->userdata("usuario");
				$pdf->AddPage();
				  

$tbl =<<<EOD
<table border="1" cellpadding="0" cellspacing="0"  width="100%">
<tr>
<td width="40" style="text-align:center;"><b>No.</b></td>
<td width="250" style="text-align:center;"><b>Docente</b></td>
<td width="25%" style="text-align:center;"><b>Fecha Nacimiento</b></td>
<td width="25%" style="text-align:center;"><b>Cumplea&ntilde;os</b></td>
</tr>
EOD;
		
		$correlativo = 0;
		foreach($GenerarReporteDocentes as $docentesEncontrados):
			$correlativo += 1;
$tbl .=<<<EOD
<tr>
<td>$correlativo</td>
<td>$docentesEncontrados->DOCENTE</td><td>$docentesEncontrados->docente_fecha_nacimiento</td><td>$docentesEncontrados->DIA-$docentesEncontrados->MES</td></tr>
EOD;
	
		endforeach;
$tbl .=<<<EOD
</table>
EOD;
			// $pdf->writeHTML($encabezados, true, false, true, false, '');
			 $pdf->writeHTML($tbl, true, false, true, false, '');
			$pdf->Output(utf8_decode("Reporte.pdf"), 'F');
			$respuesta = array(
				"respuesta"=>1,
				"mensaje"=>base_url().utf8_decode("Reporte.pdf")
				);	
			echo json_encode($respuesta);
		}
		
	}
	public function ReporteAlumnosCumpleannieros()
	{
		if($this->session->userdata("id_rol") != 2)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["TraerSeccionesDelDocente"] = $this->Seccionesbuscar->TraerSeccionesDelDocente($this->session->userdata("id_usuario"));
		$mostrar["contenido"]	="reportes/vista_reporte_alumnos_cumpleanieros";
		$mostrar["Informacion"]	= "Este reporte mostar&aacute; el listado de los alumnos cumplea&ntilde;eros de la/s secci&oacute;n/es que usted es orientador del a&ntilde;o lectivo en curso y del mes seleccionado.";
		$this->load->view("plantilla", $mostrar);
		
	}
	public function GenerarReporteAlumnosCumpleannieros()
	{
		$this->form_validation->set_rules("id_curso", "Secci&oacute;n","required");
		$this->form_validation->set_rules("mes", "mes","required");			
		
		 if ($this->form_validation->run() == FALSE)
             {
					$respuesta = array(
						"respuesta"=>0,
						"mensaje"=>validation_errors()
						);
					echo json_encode($respuesta);
             }
          else
            {	
				
				
				$parametros = array(
						//concateno el mes a la fecha y el dia que simre sera 01
						"fecha"=> date("Y")."-".$this->input->post("mes")."-01",
						"id_curso"=>$this->input->post("id_curso")
					);
				
				$GenerarReporteAlumnosCumpleannieros = $this->Reportesnotasbuscar->GenerarReporteAlumnosCumpleannieros($parametros);
				
			
				$this->load->library('Pdf');
				$pdf = new PdfOficio('P', 'mm', 'Letter', true, 'UTF-8', false);
				$pdf->SetCreator(PDF_CREATOR);
				$pdf->SetAuthor('MaCruz-Gi');
				$pdf->SetTitle('Reporte');
				$pdf->SetSubject('Reporte');
				$pdf->SetKeywords('REPORTE, Reporte');
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
				$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING, array(0, 64, 255), array(0, 64, 128));
				$pdf->setFooterData($tc = array(0, 64, 0), $lc = array(0, 64, 128));
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
				$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetMargins(25, PDF_MARGIN_TOP, 25);
				$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
				$pdf->SetTopMargin(50);
				$pdf->SetFooterMargin(25);//espacio del margen
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
				//relación utilizada para ajustar la conversión de los píxeles
				$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
				$pdf->setFontSubsetting(true);
				$pdf->SetFont('courier', '', 12, '', true);
				$pdf->tituloReporte ="Alumnos cumpleañeros para el mes de: ".@$GenerarReporteAlumnosCumpleannieros[0]->MES;
				$pdf->usuario = $this->session->userdata("usuario");
				$pdf->AddPage();
				$la_seccion = @$GenerarReporteAlumnosCumpleannieros[0]->SECCION." (".@$GenerarReporteAlumnosCumpleannieros[0]->curso_turno.")"; 

$encabezados =<<<EOD
<table border="0" cellpadding="0" cellspacing="0"  width="100%">
<tr>
<td style="text-align:left;">SECCI&Oacute;N: <b>$la_seccion</b></td>
</tr>
</table>
EOD;
$tbl =<<<EOD
<table border="1" cellpadding="0" cellspacing="0"  width="100%">
<tr>

<td width="40" style="text-align:center;"><b>No.</b></td>
<td width="60" style="text-align:center;"><b>C&oacute;digo</b></td>
<td width="250" style="text-align:center;"><b>Alumno</b></td>
<td width="25%" style="text-align:center;"><b>Fecha Nacimiento</b></td>
<td width="25%" style="text-align:center;"><b>Cumplea&ntilde;os</b></td>
</tr>
EOD;
		
		$correlativo = 0;
		foreach($GenerarReporteAlumnosCumpleannieros as $alumnosEncontrados):
			$correlativo += 1;
$tbl .=<<<EOD
<tr>
<td>$correlativo</td>
<td>$alumnosEncontrados->alumno_codigo</td>
<td>$alumnosEncontrados->ALUMNO</td>
<td style="text-align:center;">$alumnosEncontrados->alumno_fecha_nacimiento</td>
<td style="text-align:center;">$alumnosEncontrados->DIA-$alumnosEncontrados->MES</td></tr>
EOD;
	
		endforeach;
$tbl .=<<<EOD
</table>
EOD;
			 $pdf->writeHTML($encabezados, true, false, true, false, '');
			 $pdf->writeHTML($tbl, true, false, true, false, '');
			$pdf->Output(utf8_decode("Reporte.pdf"), 'F');
			$respuesta = array(
				"respuesta"=>1,
				"mensaje"=>base_url().utf8_decode("Reporte.pdf")
				);	
			echo json_encode($respuesta);
		}
		
	}
	
	
}
