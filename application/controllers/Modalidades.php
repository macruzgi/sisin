<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Modalidades extends CI_Controller {

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
		//cargo los modelos a necesitar
		$this->load->model("modalidades/Modalidadesbuscar");
		$this->load->model("modalidades/Modalidadesinsertar");
		$this->load->model("modalidades/Modalidadactualizar");
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
	public function AdministrarModalidades()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="modalidades/vista_administrar_modalidades";
		$mostrar["TraerModalidades"] = $this->Modalidadesbuscar->TraerModalidades();
		$this->load->view("plantilla", $mostrar);
		
	}
	public function NuevaModalidad()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		//si es actualizacion que traiga el dato respectivo
		$id_modalidad = $this->uri->segment(3,0);
		$mostrar["TraerModalidad"]	= $this->Modalidadesbuscar->TraerModalidad($id_modalidad);
		
		$mostrar["contenido"] = "modalidades/vista_nueva_modalidad";
		//ECHO $this->Generico->TaerSiguienteID("adm_docente", "id_docente");
		$this->load->view("plantilla", $mostrar);
		
	}
	public function AgregarModalidad()
	{
		$this->form_validation->set_rules("modalidad_nombre", "Nombre","required|is_unique[acade_modalidad.modalidad_nombre]");
		$this->form_validation->set_rules("modalidad_duracion", "Duraci&oacute;n","required|numeric");
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				
				//envio los datos en un arrar los indices tal como el nombre de los campos de la tabla
				 
				$acade_modalidad = array(
					"modalidad_nombre"=>$this->input->post("modalidad_nombre"),
					"modalidad_duracion"=>$this->input->post("modalidad_duracion"),
					"modalidad_comentario"=>$this->input->post("modalidad_comentario"),
					"id_usuario"=>$this->session->userdata("id_usuario")
					);
				 
				 //invio al modelo a insertar
				 $insertar = $this->Modalidadesinsertar->AgregarModalidad($acade_modalidad);
				 
				 if($insertar->MENSAJE == "OK")
				 {
                    echo 1;//json_encode ($this->input->post("docente_nombre"));
				 }
				 else
				 {
					 echo 0;
				 }
             }
	}
	
	public function ModificarModalidad()
	{
		$this->form_validation->set_rules("id_modalidad", "Modalidad","required");
		$this->form_validation->set_rules("modalidad_nombre", "Nombre","required");
		$this->form_validation->set_rules("modalidad_duracion", "Duraci&oacute;n","required|numeric");
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				  
				
				//envio los datos en un arrar los indices tal como el nombre de los campos de la tabla
				$acade_modalidad = array(
					"id_modalidad"=>$this->input->post("id_modalidad"),
					"modalidad_nombre"=>$this->input->post("modalidad_nombre"),
					"modalidad_duracion"=>$this->input->post("modalidad_duracion"),
					"modalidad_comentario"=>$this->input->post("modalidad_comentario")					
					);
				 
				 //invio al modelo a actualizar
				 $actualizar = $this->Modalidadactualizar->ModificarModalidad($acade_modalidad);
				 
				 if($actualizar->MENSAJE =="OK")
				 {
                    echo 1;//json_encode ($this->input->post("docente_nombre"));
				 }
				 else
				 {
					 echo 0;
				 }
             }
	}
	public function EliminarModalidad()
	{
		$this->form_validation->set_rules("id_modalidad", "Modalidad","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_modalidad		= $this->input->post("id_modalidad");
				//envio al modelo actualizar
				$eliminar	= $this->Modalidadactualizar->EliminarModalidad($id_modalidad);
				if($eliminar->MENSAJE == "OK")
				{
					echo 1;
				}
				else
				{
					echo 0;
				}
				
			 }
	}
	
}
