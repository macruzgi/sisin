<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Inscripciones extends CI_Controller {

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
		 $this->load->model("secciones/Seccionesbuscar");
		 $this->load->model("alumnos/Alumnosbuscar");
		 $this->load->model("alumnos/Alumnosinsertar");
		 $this->load->model("inscripciones/Inscripcioneseliminar");
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
	public function Administrar()
	{
		if($this->session->userdata("id_rol") != 2)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//cargar el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		$mostrar["Informacion"]	= "Desde este formulario matricular&aacute; a los alumnos a las secciones respectivas, las secciones mostradas ser&aacute;n aquellas que se le han asignado como orientador/a del a&ntilde;o lectivo en curso.";
		$mostrar["contenido"]	="inscripciones/inscripciones";
		$mostrar["TraerSeccionesDelDocente"] = $this->Seccionesbuscar->TraerSeccionesDelDocente($this->session->userdata("id_usuario"));//envio como parametro el docente logueado
		$this->load->view("plantilla", $mostrar);
		
	}
	public function InscribirAlumno()
	{
		
		$this->form_validation->set_rules("id_curso", "Docente","required");
		$this->form_validation->set_rules("id_alumno", "Secci&oacute;n","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				
						  $id_annio_lectivo = $this->Generico->TaerAnnioLectivo();
						  $indice_compuesto	= array(
						  "id_annio_lectivo"=>$id_annio_lectivo,
						  "id_alumno"=>$this->input->post("id_alumno")
							);
							$verificarIndice = $this->Generico->VerificarIndice($indice_compuesto, "id_detalle_alumno", "adm_alumno_detalle");
							
						if($verificarIndice === true)
						{
						  echo 2; //hay error de duplicidad de indice
						 
						}
						else
						{
							/*
								siguiente es para ver si al alumno ya pago la inscripcion
							*/
							$acade_calendario_pago = array(
								"id_alumno"=>$this->input->post("id_alumno"),
								"calendario_mes"=>30 //30 es el mes de inscripcion
								);
							$VerSiAlumnoYaPagoCuota = $this->Generico->VerSiAlumnoYaPagoCuota($acade_calendario_pago);
							if($VerSiAlumnoYaPagoCuota == 1)
							{
								//arrego los datos en un array
								$adm_alumno_detalle = array(
									"id_alumno"=>$this->input->post("id_alumno"),
									"id_curso"=>$this->input->post("id_curso"),
									"id_annio_lectivo"=>$id_annio_lectivo,
									"id_usuario"=>1
									);
								//matricular alumno
								$matricular = $this->Alumnosinsertar->InscribirAlumno($adm_alumno_detalle);
								if($matricular === true)
								{
									echo 1;
								}
								else
								{
									echo 0;
								}
							}
							else
							{
								echo 3;//no a pagado inscripcion
							}
						}
						
					
			 }
		
	}
	public function BuscarInteractivaAlumnos()
	{
		$this->form_validation->set_rules("buscar_alumno", "Dato","required");
		
		
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 
					$buscar_alumno						= $this->input->post("buscar_alumno");
					$mostrar["TraerAlumnosFiltrados"]	= $this->Alumnosbuscar->BuscarInteractivaAlumnos($buscar_alumno);
					$this->load->view("inscripciones/resulado_independiente", $mostrar);
					
		
				 
             }
	}
	public function TraerAlumnosInscritosEnSeccion() 
	{
		$id_curso = $this->input->post("id_curso");
		//el formulario espera un json
		echo json_encode($this->Alumnosbuscar->TraerAlumnosInscritosEnSeccion($id_curso));
	}
	public function DesinscribirAlumno()
	{
		$this->form_validation->set_rules("id_detalle_alumno", "Detalle Alumno","required");
		$this->form_validation->set_rules("id_alumno", "Alumno","required");
		
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
					$id_detalle_alumno		= $this->input->post("id_detalle_alumno");
					$id_alumno				= $this->input->post("id_alumno");
					//validando para ver si el alumno a desinscribir de la seccion no tiene notas, si tiene notas no puede desinscribirse
					$tiene_notas_del_anio_curso = $this->Alumnosbuscar->VerSiTieneNotasEnAnnioLectivo($id_alumno);
					
					if($tiene_notas_del_anio_curso == 1)//1 equivale a true
					{
						
						$desinscribir	= $this->Inscripcioneseliminar->DesinscribirAlumno($id_detalle_alumno);
						if($desinscribir === true)
						{
							echo 1;
						}
						else
						{
							echo 0;
						}
					}
					else
					{
						echo 3; //no puede desmatricular este alumno ya tiene notas de cualesquiera de las materias.
					}
             }
	}
	
	public function TraerAlumnosInscritosEnSeccionConNotaYsinNota() 
	{
		$id_curso 	= $this->input->post("id_curso");
		$id_materia = $this->input->post("id_materia");
		$periodo_recuperacion = $this->input->post("periodo_recuperacion");
		//el formulario espera un json
		echo json_encode($this->Alumnosbuscar->TraerAlumnosInscritosEnSeccionConNotaYsinNota($id_curso, $id_materia, $periodo_recuperacion));
	}
}
