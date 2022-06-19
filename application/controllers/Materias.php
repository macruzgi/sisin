<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Materias extends CI_Controller {

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
		 $this->load->model("materias/Materiasinsertar");
		 $this->load->model("materias/Materiasbuscar");
		 $this->load->model("materias/Materiasactualizar");
		 $this->load->model("materias/Materiaseliminar");
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
	public function AdministrarMaterias()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="materias/vista_administrar_materias";
		$mostrar["TraerMaterias"] = $this->Materiasbuscar->TraerMaterias();
		$this->load->view("plantilla", $mostrar);
		
	}
	public function NuevaMateria()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		//si es actualizacion que traiga el dato respectivo
		$id_materia = $this->uri->segment(3,0);
		$mostrar["TaerMateria"]	= $this->Materiasbuscar->TaerMateria($id_materia);
		
		$mostrar["contenido"] = "materias/vista_nueva_materia";
		//ECHO $this->Generico->TaerSiguienteID("adm_docente", "id_docente");
		$this->load->view("plantilla", $mostrar);
		
	}
	public function AgregarMateria()
	{
		$this->form_validation->set_rules("materia_nombre", "Nombre","required|is_unique[adm_materia.materia_nombre]");
				
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $materia_nombre 				= $this->input->post("materia_nombre");
				 $materia_unidades_valorativas	= $this->input->post("materia_unidades_valorativas");
				 
				
				 //envio los datos en un arrar los indices tal como el nombre de los campos de la tabla
				 
				$datos = array(
					"id_materia"=>$this->Generico->TraerSiguienteID("adm_materia", "id_materia"), //traigo el proximo id de la tabla respectiva  
					"materia_nombre"=>$materia_nombre,
					"materia_unidades_valorativas"=>$materia_unidades_valorativas,
					"id_usuario"=>1
					);
				 
				 //invio al modelo a insertar
				 $insertar = $this->Materiasinsertar->AgregarMateria($datos);
				 
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
	
	public function ModificarMateria()
	{
		$this->form_validation->set_rules("id_materia", "Materia","required");
		$this->form_validation->set_rules("materia_nombre", "Nombre","required");
		
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_materia					= $this->input->post("id_materia");
				 $materia_nombre 				= $this->input->post("materia_nombre");
				 $materia_unidades_valorativas	= $this->input->post("materia_unidades_valorativas");
				 
				 
				
				//envio los datos en un arrar los indices tal como el nombre de los campos de la tabla
				$datos = array(
					"materia_nombre"=>$materia_nombre,
					"materia_unidades_valorativas"=>$materia_unidades_valorativas
					);
				 
				 //invio al modelo a actualizar
				 $actualizar = $this->Materiasactualizar->ModificarMateria($id_materia, $datos);
				 
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
	public function EliminarMateria()
	{
		$this->form_validation->set_rules("id_materia", "Materia","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_materia		= $this->input->post("id_materia");
				//envio al modelo actualizar
				$eliminar	= $this->Materiaseliminar->EliminarMateria($id_materia);
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
	public function AdministrarNotas()
	{
		if($this->session->userdata("id_rol") != 2)
		{
		  return $this->VistaError("Acceso denegado.");
		}
		//cargar el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		$mostrar["InforamcionPeriodo"] = $this->Generico->TaerPeriodoActivo();
		$mostrar["contenido"]	="materias/administrar_notas";
		$mostrar["TraerMateriasDelDocente"] = $this->Materiasbuscar->TraerMateriasDelDocente($this->session->userdata("id_usuario"));//envio como parametro el docente logueado
		$this->load->view("plantilla", $mostrar);
		
	}
	public function TraerSeccionesPorMateriasDelDocente()
	{
		$id_materia = $this->input->post("id_materia");
		$id_docente = $this->session->userdata("id_usuario"); //docente logueado el id del docente es el mismo id del usario
		//el formulario espera un json
		echo json_encode($this->Seccionesbuscar->TraerSeccionesPorMateriasDelDocente($id_materia, $id_docente));
	
	}
	public function AgregarNotas()
	{
		$this->form_validation->set_rules("id_materia", "Materia","required");
		$this->form_validation->set_rules("id_curso", "Secci&oacute;n","required");
		$this->form_validation->set_rules("nota[]", "Debe ingresar alguna Nota","required");
		$this->form_validation->set_rules("id_alumno[]", "Alumno","required");
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_alumno				= $this->input->post("id_alumno");
				 $nota					= $this->input->post("nota");
				 $total_colecion 		= count($id_alumno);
				 $id_periodo			= $this->Generico->TaerPeriodoActivo()->id_periodo;
				 $id_annio_lectivo		= $this->Generico->TaerIdYAnnioLectivoActual()->id_annio_lectivo;
				 $insertar				= false;
				 //siguiente para recorer todas las notas, si se encuentra una fuera de rango que aborte
				 foreach($nota as $valor)
				 {
					 if($valor < 0 || $valor > 10)
					 {
						// echo "ok: ".$valor;
						 echo 3;
						 exit;
					 }
				 }
				 for($i = 0; $i < $total_colecion; $i++)
				 {
					 if($nota[$i] != "" )
					 {
						
								// echo "Alumno $id_alumno[$i]". " Nota: ".$nota[$i];
								//iserto las notas
								//siguiente para ver si es actualizacion, insert o nada lo que se hara en la db
								$filtros = array(
									"id_periodo"=>$id_periodo,	
									"id_alumno"=>$id_alumno[$i],
									"id_materia"=>$this->input->post("id_materia"), 
									"id_annio_lectivo"=>$id_annio_lectivo
									);
								//veo si la accion es insertar, update o nada
								$traer_datos_validar = $this->Materiasbuscar->ValidacionNotasAgregarEditarOnada($filtros);
								
								//si la cuenta encontrada es 0, 
								//entonces, que inserte la nota
								if($traer_datos_validar->CUENTA == 0)
								{
									$acade_periodo_nota_detalle = array(
										"N_1"=>$nota[$i],
										"id_periodo"=>$id_periodo,	
										"id_alumno"=>$id_alumno[$i],
										"id_materia"=>$this->input->post("id_materia"), 
										"id_annio_lectivo"=>$id_annio_lectivo,
										"id_usuario"=>1
										);
									
									$insertar = $this->Materiasinsertar->AgregarNotas($acade_periodo_nota_detalle);
								}
								//si la cuenta encontrada es distinta de 0
								elseif($traer_datos_validar->CUENTA != 0)
								{
									/*si la nota encontrada es distinta a la digitada en la caja de texto de la vista(siginfica que la an cambiado),
									entonces, que actualice, sino que no haga nada
									*/
									if($traer_datos_validar->N_1 != $nota[$i])
									{
										$filtros = array(
										"id_nota_detalle"=>$traer_datos_validar->id_nota_detalle
										);
										$acade_periodo_nota_detalle = array(
										"N_1"=>$nota[$i],
										"id_usuario"=>1
										);
										//actulizo la nota respectiva
										$insertar = $this->Materiasactualizar->ModificarNota($filtros, $acade_periodo_nota_detalle);
									}
								}
								
						
					 }
				 }
				
				if($insertar ===true)
				{
					echo 1;//exito
				}
				elseif($insertar == 3)//rango de notas no validos
				{
					echo 3;//rango de notas no validos
				}
				else
				{
					echo 0;//hubo errores
				}
				
				 
             }
	}
}
