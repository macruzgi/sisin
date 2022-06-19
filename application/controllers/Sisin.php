<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Sisin extends CI_Controller {

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
	
		 //cargo los modelos necesarios en este controlador
		 $this->load->model("usuarios/Usuariosbuscar");
		
	 }
	public function index()
	{
		//siguiente es para la captcha
		$this->load->helper('captcha');
		$valores_captcha = array(
        'word'          => '',
        'img_path'      => './captcha/',//carpeta donde se generan las imagenes de las captchas
        'img_url'       => base_url() .'captcha/',//ruta para cargar y mostrar la captcha
        'font_path'     => base_url() . 'system/fonts/gomarice_simple_slum.ttf',
        'img_width'     => '150',
        'img_height'    => 30,
        'expiration'    => 7200,
        'word_length'   => 8,
        'font_size'     => 16,
        'img_id'        => 'Imageid',
        'pool'          => '123456789abcdefghijkmnpqrstuvwxyz',//caracteres aleatorios que mostrara la captcha

        // White background and border, black text and red grid
        'colors'        => array(
                'background' => array(255, 125, 168	),
                'border' => array(255, 255, 255),
                'text' => array(0, 0, 0),
                'grid' => array(233, 60, 60)
				)
		);
		
		$captcha = create_captcha($valores_captcha);
		$mostrar["Captcha"]=$captcha['image'];
		//elimino la captcha vieja y asigno la nueva
		$this->session->unset_userdata('CodigoCaptcha');
		$this->session->set_userdata('CodigoCaptcha',$captcha['word']);
		//echo $this->session->userdata("CodigoCaptcha");
		//echo $this->input->ip_address();
		$this->load->view("vista_index", $mostrar);
		
	}
	public function IniciarSesion()
	{
		
		$this->form_validation->set_rules('usuario', 'Usuario', 'required');
		$this->form_validation->set_rules('clave', 'Clave', 'required');
		$this->form_validation->set_rules('captcha', 'Captcha', 'required');
		
		if ($this->form_validation->run() == FALSE)
		{
			//$this->load->view('vista_index');
			echo validation_errors();
		}
		else
		{
			//siguiente para verificar la captcha
			if($this->input->post('captcha') === $this->session->userdata("CodigoCaptcha"))
			{
						$adm_usuario = array(
						"usuario"=>$this->input->post('usuario'),
						"clave"=>md5($this->input->post('clave'))
						);
					///valido el usuario
					$usuarioEncontrado  = $this->Usuariosbuscar->IniciarSesion($adm_usuario);
					if($usuarioEncontrado->usuario == 'NO')//hubieron errores
					{
						echo $usuarioEncontrado->id_usuario;//el id_usuario me trae el mensaje de error desde el PA
					}
					else
					{
					
						$datosEnSesion = array(
						'id_usuario'=>$usuarioEncontrado->id_usuario,
						'usuario'=>$usuarioEncontrado->usuario,
						'id_rol'=>$usuarioEncontrado->id_rol,
						'docente_nombre'=>$usuarioEncontrado->docente_nombre,
						'docente_apellido'=>$usuarioEncontrado->docente_apellido,
						"SIGLAS"=>$usuarioEncontrado->SIGLAS,
						"url"=>$usuarioEncontrado->url,
						'chequear'=>true
						);
						//agrego los datos a una sesion
						$this->session->set_userdata($datosEnSesion); 
						echo 1;
				
					}	
			}
			else 
			{
				//la captcha digitada por el usuario no concuerda con la almacenada en sesion y lanza error
				echo 2;
			}
			
			
		}
	}
	public function CerrarSesion()
	{
		$datosEnSesion = array(
		'chequear'=>false     
		);
		$this->session->sess_destroy();
		redirect(base_url());
		exit;
	}
	
}
