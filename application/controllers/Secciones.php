<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Secciones extends CI_Controller {

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
		 $this->load->model("secciones/Seccionesinsertar");
		 $this->load->model("secciones/Seccionesbuscar");
		 $this->load->model("secciones/Seccionesactualizar");
		 $this->load->model("modalidades/Modalidadesbuscar");
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
	public function AdministrarSecciones()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
		}	
		//cargar el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="secciones/vista_administrar_secciones";
		$mostrar["TraerSecciones"] = $this->Seccionesbuscar->TraerSecciones();
		$this->load->view("plantilla", $mostrar);
		
	}
	public function NuevaSeccion()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
		}
		//cargar el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		//si es actualizacion que traiga el dato respectivo
		$id_curso 					= $this->uri->segment(3,0);
		$mostrar["TraerSeccion"]	= $this->Seccionesbuscar->TraerSeccion($id_curso);
		//traigo datos del año lectivo
		$mostrar["TraerAnnioLectivo"] 	= $this->Generico->TaerIdYAnnioLectivoActual();
		//traigo las modalidades
		$mostrar["TraerModalidades"]	= $this->Modalidadesbuscar->TraerModalidades();
		$mostrar["contenido"] 			= "secciones/vista_nueva_seccion";
		//ECHO $this->Generico->TaerSiguienteID("adm_docente", "id_docente");
		$this->load->view("plantilla", $mostrar);
		
	}
	public function AgregarSeccion()
	{
		$this->form_validation->set_rules("id_modalidad", "Modalidad","required");
		$this->form_validation->set_rules("curso_nivel", "Grado/Nivel","required|numeric");
		$this->form_validation->set_rules("curso_identificador", "Secci&oacute;n/Aula","required");
		$this->form_validation->set_rules("curso_turno", "Turno","required");
		
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_modalidad 			= $this->input->post("id_modalidad");
				 $curso_nivel			= $this->input->post("curso_nivel");
				 $curso_identificador	= $this->input->post("curso_identificador");
				 $verificarIndice		= $this->Seccionesbuscar->VerificarIndice($id_modalidad, $curso_nivel, $curso_identificador);
				 
				 if($verificarIndice === false)//no existe el indice unico formado por los cuatro campos el campo id_anio_lectivo se busca en el modelo
				 {
					
					 //armo la data en un array 
					 $adm_curso = array(
						"id_modalidad"=>$id_modalidad,
						"curso_nivel"=>$curso_nivel,
						"curso_identificador"=>$curso_identificador,
						"curso_turno"=> $this->input->post("curso_turno"),
						"id_annio_lectivo"=>$this->Generico->TaerAnnioLectivo(), //me trae el id_anio_lectivo activo
						"id_usuario"=>$this->session->userdata("id_usuario")
						);
					  //invio al modelo a insertar
					 $insertar = $this->Seccionesinsertar->AgregarSeccion($adm_curso);
					 
					 if($insertar->MENSAJE == "OK")
					 {
						echo 1;//json_encode ($this->input->post("docente_nombre"));
					 }
					 else
					 {
						 echo 0;
					 }
				 } 
				else
				{
					echo 2;//duplicidad de inice, el registro ya existe
				}
				 
				
				 
             }
	}
	
	public function ModificarSeccion()
	{
		$this->form_validation->set_rules("id_curso", "Curso","required");
		$this->form_validation->set_rules("id_modalidad", "Modalidad","required");
		$this->form_validation->set_rules("curso_nivel", "Grado/Nivel","required");
		$this->form_validation->set_rules("curso_identificador", "Secci&oacute;n/Aula","required");
		$this->form_validation->set_rules("curso_turno", "Turno","required");
		
		if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_curso				= $this->input->post("id_curso");
				 $id_modalidad 			= $this->input->post("id_modalidad");
				 $curso_nivel			= $this->input->post("curso_nivel");
				 $curso_identificador	= $this->input->post("curso_identificador");
				 
				 $verificarIndice		= $this->Seccionesbuscar->VerificarIndice($id_modalidad, $curso_nivel, $curso_identificador);
				 
				 if($verificarIndice === false)//no existe el indice unico formado por los cuatro campos el campo id_anio_lectivo se busca en el modelo
				 {
					 
					 
					 //armo la data en un array
					 $adm_curso = array(
						"id_curso"=>$id_curso,
						"id_modalidad"=>$id_modalidad,
						"curso_nivel"=>$curso_nivel,
						"curso_identificador"=>$curso_identificador,
						"curso_turno"=> $this->input->post("curso_turno"),
						);
						 //invio al modelo actualizar
						 $insertar = $this->Seccionesactualizar->ModificarSeccion($adm_curso);
						 
						 if($insertar->MENSAJE ="OK")
						 {
							echo 1;//json_encode ($this->input->post("docente_nombre"));
						 }
						 else
						 {
							 echo 0;
						 }
				 }
				 else
				 {
					 echo 2;//hay duplicidad
				 }
             }
	}
	public function EliminarSeccion()
	{
		$this->form_validation->set_rules("id_curso", "Curso","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_curso		= $this->input->post("id_curso");
				//envio al modelo actualizar
				$eliminar	= $this->Seccionesactualizar->EliminarSeccion($id_curso);
				if($eliminar ===true)
				{
					echo 1;
				}
				else
				{
					echo 0;
				}
				
			 }
	}
	public function SeccionesDocente()
	{
		if($this->session->userdata("id_rol") != 2)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="secciones/secciones_docentes";
		/*
			comentare eso porque aqui solo me muestra las secciones a las que doy clases y no las materias
		$mostrar["TraerSeccionesDelDocente"] = $this->Seccionesbuscar->TraerMateriasDelDocente($this->session->userdata("id_usuario"));//que es el docente que se ha logueado
		*/
		// esta me trae las secciones con las materias que imparto
		$mostrar["TraerSeccionesDelDocentePorMateria"] = $this->Seccionesbuscar->TraerSeccionesDelDocentePorMateria($this->session->userdata("id_usuario"));//que es el docente que se ha logueado
		$this->load->view("plantilla", $mostrar);
		
	}
	
}
