<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Especialidades extends CI_Controller {

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
		
		 $this->load->model("especialidades/Especialidadesactualizar");
		 $this->load->model("especialidades/Especialidadinsertar");
		 $this->load->model("especialidades/Especialidadesbuscar");
		
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
	public function AdministrarEspecialidades()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="especialidades/vista_administrar_especialidades";
		$mostrar["TraerEspecialidades"] = $this->Especialidadesbuscar->TraerEspecialidades();
		$this->load->view("plantilla", $mostrar);
		
	}
	public function NuevaEspecialidad() 
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
			
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		//si es actualizacion que traiga el dato respectivo
		$id_especialidad = $this->uri->segment(3,0);
		$mostrar["TraerEspecialidadByID"]	= $this->Especialidadesbuscar->TraerEspecialidadByID($id_especialidad);
		//mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["TraerGrados"]	= $this->Especialidadesbuscar->TraerGrados();
		
		$mostrar["contenido"] = "especialidades/vista_nueva_especialidad";
		//ECHO $this->Generico->TaerSiguienteID("adm_docente", "id_docente");
		$this->load->view("plantilla", $mostrar);
		
	}
	public function AgregarEspecialidad()
	{
		
		$this->form_validation->set_rules("especialidad_nombre", "Especialidad","required|min_length[5]");
		$this->form_validation->set_rules("id_lista", "Grado","required");
		
		 if ($this->form_validation->run() == FALSE)
             {
                       $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>"Debe completar los datos ".validation_errors()
							);
						echo json_encode($respuesta);
             }
          else
             {
				 //verifico indice
				  $indice_compuesto	= array(
						  "especialidad_nombre"=>$this->input->post("especialidad_nombre"),
						  "id_lista"=>$this->input->post("id_lista")
							);
				$verificarIndice = $this->Generico->VerificarIndice($indice_compuesto, "especialidad_nombre", "acade_especialidad");
				if($verificarIndice === true)
				{
					 $respuesta = array(
							"respuesta"=>2,
							"mensaje"=>"Los datos que intenta registrar ya existen."
							);
						echo json_encode($respuesta);
				}
				else
				{	
					 //armo los datos en array
					 $acade_especialidad = array(
							"id_especialidad"=>$this->Generico->TraerSiguienteID("acade_especialidad", "id_especialidad"),
							"especialidad_nombre"=>$this->input->post("especialidad_nombre"),
							"id_lista"=>$this->input->post("id_lista")
							);
										
					 
					 //invio al modelo a insertar
					 $insertar = $this->Especialidadinsertar->AgregarEspecialidad($acade_especialidad);
					 
					 if($insertar === true)
					 {
						$respuesta = array(
								"respuesta"=>1,
								"mensaje"=>""
								);
							echo json_encode($respuesta);
					 }
					 else
					 {
						 $respuesta = array(
								"respuesta"=>0,
								"mensaje"=>""
								);
							echo json_encode($respuesta);
					 }
				}
             }
	}
	public function ModificarEspecialidad()
	{
		$this->form_validation->set_rules("id_especialidad", "ID Especialidad","required");
		$this->form_validation->set_rules("especialidad_nombre", "Especialidad","required|min_length[5]");
		$this->form_validation->set_rules("id_lista", "Grado","required");
		
		 if ($this->form_validation->run() == FALSE)
             {
                        $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>"Debe completar los datos ".validation_errors()
							);
						echo json_encode($respuesta);
             }
          else
             {
				
				  //verifico indice
				  $indice_compuesto	= array(
						  "especialidad_nombre"=>$this->input->post("especialidad_nombre"),
						  "id_lista"=>$this->input->post("id_lista")
							);
				$verificarIndice = $this->Generico->VerificarIndice($indice_compuesto, "especialidad_nombre", "acade_especialidad");
				if($verificarIndice === true)
				{
					$respuesta = array(
							"respuesta"=>2,
							"mensaje"=>"Los datos que intenta registrar ya existen."
							);
						echo json_encode($respuesta);
				}
				else
				{
					//armo los datos en array
					$id_especialidad = $this->input->post("id_especialidad");
					 $acade_especialidad = array(
							"especialidad_nombre"=>$this->input->post("especialidad_nombre"),
							"id_lista"=>$this->input->post("id_lista")
							);
					 //invio al modelo a modificar
					 $actualizar = $this->Especialidadesactualizar->ModificarEspecialidad($acade_especialidad, $id_especialidad);
					 
					 if($actualizar === true)
					 {
						$respuesta = array(
							"respuesta"=>1,
							"mensaje"=>""
							);
						echo json_encode($respuesta);
					 }
					 else
					 {
						 $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>"Hubieron errores."
							);
						echo json_encode($respuesta);
					 }
				}
				
             }
	}
	public function EliminarEspecialidad()
	{
		$this->form_validation->set_rules("id_especialidad", "ID Especialidad","required");
		 if ($this->form_validation->run() == FALSE)
             {
                       $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>"Debe completar los datos ".validation_errors()
							);
						echo json_encode($respuesta);
             }
          else
             {
				
				//envio al modelo actualizar
				$eliminar	= $this->Especialidadesactualizar->EliminarEspecialidad($this->input->post("id_especialidad"));
				if($eliminar === true)
				{
					 $respuesta = array(
							"respuesta"=>1,
							"mensaje"=>""
							);
						echo json_encode($respuesta);
				}
				else
				{
					$respuesta = array(
							"respuesta"=>2,
							"mensaje"=>"Hubieron errores"
							);
						echo json_encode($respuesta);
				}
				
			 }
	}
}
