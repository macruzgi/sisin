<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Aranceles extends CI_Controller {

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
		 $this->load->model("aranceles/Arancelesinsertar");
		 $this->load->model("aranceles/Arancelesbuscar");
		 $this->load->model("aranceles/Arancelesactualizar");
		 $this->load->model("alumnos/Alumnosbuscar");
		 
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
	public function AdministrarAranceles()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="aranceles/vista_administrar";
		$mostrar["TraerAranceles"] = $this->Arancelesbuscar->TraerAranceles();
		$this->load->view("plantilla", $mostrar);
		
	}
	public function NuevoArancel()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		
		//si es actualizacion que traiga el dato respectivo
		$id_arancel = $this->uri->segment(3,0);
		$mostrar["TraerArancel"]	= $this->Arancelesbuscar->TraerArancel($id_arancel);
		
		$mostrar["contenido"] = "aranceles/nuevo";
		$this->load->view("plantilla", $mostrar);
		
	}
	public function AgregarArancel()
	{
		$this->form_validation->set_rules("arancel_nombre", "Nombre","required|is_unique[acade_arancel.arancel_nombre]");
				
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				
				 //envio los datos en un arrar los indices tal como el nombre de los campos de la tabla
				 
				$acade_arancel = array(
					"id_arancel"=>$this->Generico->TraerSiguienteID("acade_arancel", "id_arancel"), //traigo el proximo id de la tabla respectiva  
					"arancel_nombre"=>$this->input->post("arancel_nombre"),
					"id_usuario"=>1
					);
				 
				 //invio al modelo a insertar
				 $insertar = $this->Arancelesinsertar->AgregarArancel($acade_arancel);
				 
				 if($insertar === true)
				 {
                    echo 1;//json_encode ($this->input->post("docente_nombre"));
				 }
				 else
				 {
					 echo 0;
				 }
             }
	}
	
	public function ModificarArancel()
	{
		$this->form_validation->set_rules("id_arancel", "Arancel","required");
		$this->form_validation->set_rules("arancel_nombre", "Nombre","required");
		
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_arancel					= $this->input->post("id_arancel");
				
				 
				
				//envio los datos en un arrar los indices tal como el nombre de los campos de la tabla
				$acade_arancel = array(
					"arancel_nombre"=>$this->input->post("arancel_nombre"),
					"id_usuario"=>1
					);
				 
				 //invio al modelo a actualizar
				 $actualizar = $this->Arancelesactualizar->ModificarArancel($id_arancel, $acade_arancel);
				 
				 if($actualizar == true)
				 {
                    echo 1;//json_encode ($this->input->post("docente_nombre"));
				 }
				 else
				 {
					 echo 0;
				 }
             }
	}
	public function EliminarArancel()
	{
		$this->form_validation->set_rules("id_arancel", "Arancel","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_arancel		= $this->input->post("id_arancel");
				 //envio los datos en un arrar los indices tal como el nombre de los campos de la tabla
				
				//envio al modelo actualizar
				$eliminar	= $this->Arancelesactualizar->EliminarArancel($id_arancel);
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
	public function Cuotas()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//cargar el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		
		$mostrar["contenido"]	="aranceles/cuotas";
		
		$this->load->view("plantilla", $mostrar);
		
	}
	public function BusquedaInteractivaAlumnos()
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
					$this->load->view("aranceles/resulado_independiente_alumnos", $mostrar);
					
		
				 
             }
	}
	public function TraerCuotasAlumno()
	{
		$id_alumno = $this->input->post("id_alumno");
		//el formulario espera un json
		echo json_encode($this->Arancelesbuscar->TraerCuotasAlumno($id_alumno));
	}
	public function ActualizarCuotasAlumno()
	{
		$this->form_validation->set_rules("id_alumno", "Alumno","required");
				
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				
				 //envio los datos en un arrar los indices tal como el nombre de los campos de la tabla
				 
				$acade_calendario_pago = array(
					"id_alumno"=>$this->input->post("id_alumno"),
					"id_calendario_pago"=>$this->input->post("id_calendario_pago")
					);
				 
				 //invio al modelo a insertar
				 $insertar = $this->Arancelesactualizar->ActualizarCuotasAlumno($acade_calendario_pago);
				 
				 if($insertar === true)
				 {
                    echo 1;//json_encode ($this->input->post("docente_nombre"));
				 }
				 else
				 {
					 echo 0;
				 }
             }
	}
	
}
