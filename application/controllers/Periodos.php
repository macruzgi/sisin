<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Periodos extends CI_Controller {

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
		$this->load->model("usuarios/Usuariosbuscar");
		$this->load->model("periodos/Periodosinsertar");
		$this->load->model("periodos/Periodosbuscar");
		
		
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
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="periodos/administrar";
		$mostrar["TraerPeridos"] = $this->Periodosbuscar->TraerPeridos($this->Generico->TaerIdYAnnioLectivoActual()->id_annio_lectivo);
		$this->load->view("plantilla", $mostrar);
		
	}
	public function Nuevo()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		//trago el año lectivo
		$array1 = array($this->Generico->TaerIdYAnnioLectivoActual());
		$array2 = array($this->Generico->TaerPeriodoActivo());
		$mostrar["TaerIdYAnnioLectivoActual"]	= array_merge($array1, $array2);
		$mostrar["contenido"]	="periodos/nuevo";
		$mostrar["TraerDocentesUsuarios"] = $this->Usuariosbuscar->TraerDocentesUsuariosDeMaterias();
		$this->load->view("plantilla", $mostrar);
		
	}
	
	public function AgregarPeriodo()
	{
		$this->form_validation->set_rules("periodo_numero", "N&uacute;mero per&iacute;odo","required|numeric");
		   if ($this->form_validation->run() == FALSE)
             {
                       // echo validation_errors();
						$respuesta = array(
							"respuesta"=>2,
							"mensaje"=>validation_errors()
							);
						  echo json_encode($respuesta);
             }
          else
             {
						  //validacion del indice
						  $indice_compuesto	= array(
						  "id_annio_lectivo"=>$this->Generico->TaerIdYAnnioLectivoActual()->id_annio_lectivo,
						  "periodo_numero"=>$this->input->post("periodo_numero")
							);
						$verificarIndice = $this->Generico->VerificarIndice($indice_compuesto, "id_periodo", "acade_periodo");
						if($verificarIndice === true)
						{
						  
						  $respuesta = array(
							"respuesta"=>2,
							"mensaje"=>"El n&uacute;mero de per&iacute;odo que intenta registrar ya existen."
							);
						  echo json_encode($respuesta);
						}
						else
						{
							$periodo_recuperacion = "";
							if($this->input->post("periodo_recuperacion") == 'on')
							{ 
								$periodo_recuperacion = 1;
							}  
							else
							{ 
								$periodo_recuperacion = 0;
							}
							$acade_periodo = array(
							  "id_periodo"=>$this->Generico->TraerSiguienteID("acade_periodo", "id_periodo"),
							  "periodo_numero"=>$this->input->post("periodo_numero"),
							  "periodo_nombre"=>$this->input->post("periodo_nombre"),
							   "periodo_recuperacion"=>$periodo_recuperacion,
							  "id_annio_lectivo"=>$this->Generico->TaerIdYAnnioLectivoActual()->id_annio_lectivo,
							  "id_usuario"=>1
							  );
							  
							 
							 //envio al modelo insertar
							$insertar	= $this->Periodosinsertar->AgregarPeriodo($acade_periodo);
												
							  
						 
							if($insertar->MENSAJE == "OK")
								{
									$respuesta = array(
									"respuesta"=>1,
									"mensaje"=>""
									);
								  echo json_encode($respuesta);
								}
							elseif($insertar->MENSAJE == "YA")
								{
									//el perido que se intenta registrar es un periodo de recuperacion y ya existe uno en registrado para el año actual
									$respuesta = array(
									"respuesta"=>3,
									"mensaje"=>"No es posible registrar dos per&iacute;odos de recuperaci&oacute;n para el mismo a&ntilde;o lectivo.  Si ya ha creado un per&iacute;odo de recuperaci&oacute;n ya no podr&aacute; agregar nuevos per&iacute;odos normales ni de recuperaci&oacute;n"
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
	
}
