<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Inicio extends CI_Controller {

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
	/*
		constructor, inicializo para proteger el controller de los usuarios no logueados
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
	}
	
	public function index()
	{
		//esto para los permisos individuales por usuario, cuando en la tabla adm_usuario no existe el id_rol
		// se ha cambiado por roles
		/*
		$mostrar["contenido"]	="vista_index";
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario(1);
		$this->load->view("plantilla", $mostrar);
		*/
		
		$mostrar["contenido"]	="vista_inicio";
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		$mostrar["TraerDatosGenerales"]	= $this->Generico->TraerDatosGenerales();
		$this->load->view("plantilla", $mostrar);
		
	}
	public function MiPerfil()
	{
		$mostrar["contenido"]	="usuarios/vista_mi_perfil";
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		$this->load->view("plantilla", $mostrar);
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
	public function ConfiguracionesGenerales()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
			
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		//si es actualizacion que traiga el dato respectivo
		$mostrar["TraerDatosGenerales"]			= $this->Generico->TraerDatosGenerales();
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		$mostrar["TraerDepartamentos"]	= $this->Generico->TaerDepartamentos();
		$mostrar["contenido"] = "vista_configuraciones_generales";
		//ECHO $this->Generico->TaerSiguienteID("adm_docente", "id_docente");
		$this->load->view("plantilla", $mostrar);
	}
	public function Configurar()
	{
		$this->form_validation->set_rules("informacion_nombre_institucion", "Instituci&oacute;n","required|min_length[5]");
		$this->form_validation->set_rules("informacion_siglas", "SIGLAS","required|min_length[2]|max_length[10]");
		$this->form_validation->set_rules("informacion_codigo_infraestructura", "C&oacute;digo de Infraestructura","required");
		$this->form_validation->set_rules("informacion_distrito", "Distrituo","required");
		$this->form_validation->set_rules('informacion_direccion', 'Direcci&oacute;n', 'required|min_length[5]');
		$this->form_validation->set_rules('id_departamento', 'Departamento', 'required');
		$this->form_validation->set_rules('id_municipio', 'Municipio', 'required');
		$this->form_validation->set_rules('informacion_correo', 'Correo', 'valid_email');
		$this->form_validation->set_rules('informacion_mision', 'Correo', 'min_length[5]');
		$this->form_validation->set_rules('informacion_vision', 'Correo', 'min_length[5]');
		$this->form_validation->set_rules('informacion_valores', 'Correo', 'min_length[5]');
		$this->form_validation->set_rules('informacion_url', 'Web-URL', 'valid_url');
		
		
		 if ($this->form_validation->run() == FALSE)
             {
                        // echo validation_errors();
						$respuesta = array(
						"repuesta"=>0,
						"mensaje"=>validation_errors()
						);
						echo json_encode($respuesta);
             }
          else
			{
				$file_element_name = 'informacion_nombre_logo';
				
				//$renombar = "logoInstitucion";
				
				 /*
					configuarcion para la carga de fotogarifa
				*/
				//$config['file_name'] = $renombar;		  
				$config['upload_path'] = './fotografias/';
				$config['allowed_types'] = 'gif|jpg|png';
				$config['max_size'] = 1024 * 8;
			   // $config['encrypt_name'] = TRUE; //esto me cambia el nombre y le pone encriptacion
				//sube el archivo
				$this->load->library('upload', $config);
				//variable para que si no sube foto que no pierda la actual
				$informacion_nombre_logo_ori = "";
				if (!$this->upload->do_upload($file_element_name))
				{
					/*
					$respuesta = array(
						"repuesta"=>2,
						"mensaje"=>"NO fue posible subir la imagen."
						);
					echo json_encode($respuesta);
					*/
					//si no se subio imagien que simpre mantenga la acutal
					$informacion_nombre_logo = $this->input->post("informacion_nombre_logo_ori");
				}
				else
				{
					$data = $this->upload->data();
					//si se subio imagen, que tome la nueva
					$informacion_nombre_logo = $data['file_name'];
				}
				
				
					//echo $data['file_name'];
					//echo $this->input->post("informacion_nombre_institucion");
				   
			
				//envio a actualizar
				$acade_informacion_general = array(
					"informacion_nombre_institucion"=>$this->input->post("informacion_nombre_institucion"),
					"informacion_siglas"=>$this->input->post("informacion_siglas"),
					"informacion_codigo_infraestructura"=>$this->input->post("informacion_codigo_infraestructura"),
					"informacion_distrito"=>$this->input->post("informacion_distrito"),
					"informacion_direccion"=>$this->input->post("informacion_direccion"),
					"informacion_telefonos"=>$this->input->post("informacion_telefonos"),
					"informacion_correo"=>$this->input->post("informacion_correo"),
					"informacion_mision"=>$this->input->post("informacion_mision"),
					"informacion_vision"=>$this->input->post("informacion_vision"),
					"informacion_valores"=>$this->input->post("informacion_valores"),
					"informacion_nombre_logo"=>$informacion_nombre_logo,
					"informacion_url"=>$this->input->post("informacion_url"),
					"id_municipio"=>$this->input->post("id_municipio")
					);
				$actualizar = $this->Generico->Configurar($acade_informacion_general);
				if($actualizar->MENSAJE == "OK")
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
