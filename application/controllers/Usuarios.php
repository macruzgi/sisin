<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Usuarios extends CI_Controller {

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
		 $this->load->model("materias/Materiasbuscar");
		 $this->load->model("usuarios/Usuariosbuscar");
		 $this->load->model("usuarios/Usuarioinsertar");
		 $this->load->model("usuarios/Usuarioeliminar");
		 $this->load->model("usuarios/Usuarioactualizar");
		
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
	public function DocentesUsuarios()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
			
		}
		//esto para los permisos individuales por usuario, cuando en la tabla adm_usuario no existe el id_rol
		// se ha cambiado por roles
		/*
		$mostrar["contenido"]	="vista_index";
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario(1);
		$this->load->view("plantilla", $mostrar);
		
		*/
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="usuarios/vista_administrar_usuarios";
		$mostrar["TraerDocentesUsuarios"] = $this->Usuariosbuscar->TraerDocentesUsuarios();
		
		$this->load->view("plantilla", $mostrar);
		
	}
	public function NuevoDocenteUsuario() 
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
			
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		//traigo los departamentos
		$mostrar["TaerDepartamentos"]	= $this->Generico->TaerDepartamentos();
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		//traigo las especialidades
		$mostrar["TraerEspecialidades"]	= $this->Usuariosbuscar->TraerEspecialidades();
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		//traigo los roles de los usuarios
		$mostrar["TaerRolesUsuarios"]	= $this->Usuariosbuscar->TaerRolesUsuarios();
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		//si es actualizacion que traiga el dato respectivo
		$id_docente = $this->uri->segment(3,0);
		$mostrar["TraerDocenteUsuario"]	= $this->Usuariosbuscar->TraerDocenteUsuario($id_docente);
		
		$mostrar["contenido"] = "usuarios/vista_nuevo_docente";
		//ECHO $this->Generico->TaerSiguienteID("adm_docente", "id_docente");
		$this->load->view("plantilla", $mostrar);
		
	}
	public function AgregarDocenteUsuario()
	{
		
		$this->form_validation->set_rules("docente_nombre", "Nombre","required|min_length[5]");
		$this->form_validation->set_rules("docente_apellido", "Apellido","required|min_length[2]");
		$this->form_validation->set_rules("docente_fecha_nacimiento", "Fecha de nacimiento","required");
		$this->form_validation->set_rules("docente_direccion", "Direccion","required");
		$this->form_validation->set_rules(
        'usuario', 'Usuario/E-mail',
        'required|valid_email|is_unique[adm_usuario.usuario]',
				array(
						'required'      => 'Debe completar el %s.',
						'is_unique'     => 'El %s ya existe.',
						'valid_email'	=> 'El %s no es correcto.'
				)
			);
		$this->form_validation->set_rules('clave', 'Clave', 'required|min_length[5]');
		$this->form_validation->set_rules('clave_re', 'Confirmacion de la clave', 'required|matches[clave]');
		$this->form_validation->set_rules('id_rol', 'Rol', 'required');
		$this->form_validation->set_rules('id_departamento', 'Depto.', 'required');
		$this->form_validation->set_rules('id_municipio', 'Municipio', 'required');
		$this->form_validation->set_rules('id_especialidad', 'Especialidad', 'required');
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				
				 //armo los datos en array
				
				 $adm_docente = array(
						"usuario"=>$this->input->post("usuario"),
						"clave"=>md5($this->input->post("clave")),
						"id_rol"=>$this->input->post("id_rol"),
						"docente_nombre"=>$this->input->post("docente_nombre"),
						"docente_apellido"=>$this->input->post("docente_apellido"),
						"docente_direccion"=>$this->input->post("docente_direccion"),
						"docente_fecha_nacimiento"=>date("Ymd", strtotime(str_replace("/", "-", $this->input->post("docente_fecha_nacimiento")))),
						"id_municipio"=>$this->input->post("id_municipio"),
						"id_especialidad"=>$this->input->post("id_especialidad")
						);
									
				 
				 //invio al modelo a insertar
				 $insertar = $this->Usuarioinsertar->AgregarDocenteUsuario($adm_docente);
				 
				 if($insertar->MENSAJE == 'OK')
				 {
                    echo 1;//json_encode ($this->input->post("docente_nombre"));
				 }
				 else
				 {
					 echo 0;
				 }
             }
	}
	public function TraerDocenteUsuario()
	{
		$id_docente = $this->input->post("id_docente");
		echo json_encode($this->Usuariosbuscar->TraerDocenteUsuario($id_docente));
	}
	public function ModificarDocenteUsuario()
	{
		$this->form_validation->set_rules("docente_nombre", "Nombre","required");
		$this->form_validation->set_rules("docente_apellido", "Apellido","required");
		$this->form_validation->set_rules("docente_fecha_nacimiento", "Fecha de nacimiento","required");
		$this->form_validation->set_rules("docente_direccion", "Direccion","required");
		$this->form_validation->set_rules("id_docente", "ID Docente","required");
		$this->form_validation->set_rules('id_departamento', 'Depto.', 'required');
		$this->form_validation->set_rules('id_municipio', 'Municipio', 'required');
		$this->form_validation->set_rules('id_especialidad', 'Especialidad', 'required');
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				
				 
				// $id_rol			= $this->input->post("id_rol");
				$adm_docente = array(
					"id_docente"=>$this->input->post("id_docente"),
					"docente_nombre"=>$this->input->post("docente_nombre"),
					"docente_apellido"=>$this->input->post("docente_apellido"),
					"docente_direccion"=>$this->input->post("docente_direccion"),
					"docente_fecha_nacimiento"=>date("Ymd", strtotime(str_replace("/", "-", $this->input->post("docente_fecha_nacimiento")))),
					"id_municipio"=>$this->input->post("id_municipio"),
					"id_especialidad"=>$this->input->post("id_especialidad")
					);
				 
				 //invio al modelo a insertar
				 $insertar = $this->Usuarioactualizar->ModificarDocenteUsuario($adm_docente);
				 
				 if($insertar->MENSAJE == 'OK')
				 {
                    echo 1;//json_encode ($this->input->post("docente_nombre"));
				 }
				 else
				 {
					 echo 0;
				 }
             }
	}
	public function EliminarDocenteUsuario()
	{
		$this->form_validation->set_rules("id_docente", "ID Docente","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_docente = array(
						"id_usuario"=>$this->input->post("id_docente")
						);
				//envio al modelo actualizar
				$eliminar	= $this->Usuarioactualizar->EliminarDocenteUsuario($id_docente);
				if($eliminar->MENSAJE == 'OK')
				{
					echo 1;
				}
				else
				{
					echo 0;
				}
				
			 }
	}
	public function ResetearClave()
	{
		$this->form_validation->set_rules("id_docente", "ID Docente","required");
		$this->form_validation->set_rules("clave", "Clave","required|min_length[5]");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_docente	= $this->input->post("id_docente");
				 $clave			= md5($this->input->post("clave"));
				//envio al modelo actualizar
				$resetear	= $this->Usuarioactualizar->ResetearClave($id_docente, $clave);
				if($resetear ===true)
				{
					echo 1;
				}
				else
				{
					echo 0;
				}
				
			 }
	}
	public function TraerMunicipios()
	{
		$id_departamento = $this->input->post("id_departamento");
		//el formulario espera un json
		echo json_encode($this->Generico->TraerMunicipios($id_departamento));
	}
	public function AdministrarAsignaciones()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
			
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="docentes/administrar_asignaciones";
		$mostrar["TraerDocentesUsuarios"] = $this->Usuariosbuscar->TraerDocentesUsuariosDeMaterias();
		$this->load->view("plantilla", $mostrar);
		
	}
	public function TraerMateriasAsigandasYsecciones()
	{
		$id_docente = $this->input->post("id_docente");
		//el formulario espera un json
		echo json_encode($this->Usuariosbuscar->TraerMateriasAsigandasYsecciones($id_docente));
	}
	public function Asignacion()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
			
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$mostrar["contenido"]	="docentes/asignar_docentes";
		$mostrar["TraerSecciones"] = $this->Seccionesbuscar->TraerSecciones();
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		$mostrar["TraerDocentes"] = $this->Usuariosbuscar->TraerDocentesParaAsiganarMaterias();
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		$mostrar["TraerMaterias"] = $this->Materiasbuscar->TraerMaterias();
		$mostrar["Informacion"]	= "Desde este formulario asiganar&aacute; la materia que el docente impartir&aacute; a cualesquiera de las secciones seleccionadas.";
		$this->load->view("plantilla", $mostrar);
		
	}
	public function AsignarDocente()
	{
		$this->form_validation->set_rules("id_docente", "Docente","required");
		$this->form_validation->set_rules("id_materia", "Materia","required");
		$this->form_validation->set_rules("id_curso[]", "Secci&oacute;n/es","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 
				 $id_curso			= $this->input->post("id_curso");
				 $verificarIndice	= false;
				foreach($id_curso as $valor)
					 {
						  //validacion del indice
						  $indice_compuesto	= array(
						  "id_annio_lectivo"=>$this->Generico->TaerAnnioLectivo(),
						  "id_curso"=>$valor,
						  "id_docente"=>$this->input->post("id_docente"),
						  "id_materia"=>$this->input->post("id_materia")
							);
							$verificarIndice = $this->Generico->VerificarIndice($indice_compuesto, "id_detalle", "adm_curso_detalle");
						if($verificarIndice === true)
						{
						  echo 2; //hay error de duplicidad de indice imprimira un 2 y el 0 del error de la variable $insertar generando un 20
						  EXIT;
						}
						
						
						  
					 }
									 
				 
					 $resetear		= false;
					 foreach($id_curso as $valor)
					 {
						  $adm_curso_detalle = array(
						  "id_annio_lectivo"=>$this->Generico->TaerAnnioLectivo(),
						  "id_curso"=>$valor,
						  "id_docente"=>$this->input->post("id_docente"),
						  "id_materia"=>$this->input->post("id_materia"),
						  "id_usuario"=>1
						  );
						  
						  //validacion del indice
						  $indice_compuesto	= array(
						  "id_annio_lectivo"=>$this->Generico->TaerAnnioLectivo(),
						  "id_curso"=>$valor,
						  "id_docente"=>$this->input->post("id_docente"),
						  "id_materia"=>$this->input->post("id_materia")
							);
						
						 //envio al modelo insertar
						$resetear	= $this->Usuarioinsertar->AsignarDocente($adm_curso_detalle);
											
						  
					 }
					if($resetear ===true)
						{
							echo 1;
						}
						else
						{
							echo 0;
						}
				
				
			 }
	}
	public function EliminarMateriaSeccionAsiganda()
	{
		$this->form_validation->set_rules("id_detalle", "Detalle","required");
		$this->form_validation->set_rules("id_docente", "Docente","required");
		$this->form_validation->set_rules("id_materia", "Materia","required");
		$this->form_validation->set_rules("id_curso", "Secci&oacute;n","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_detalle		= $this->input->post("id_detalle");
				 /*
					antes de eliminar la materia asiganda al docente se verifica si no ha ingresado notas
					ya que si tiene notas no se puece eliminar la materia asiganda al docente 
				*/
				$acade_periodo_nota_detalle = array(
					"id_docente"=>$this->input->post("id_docente"),
					"id_materia"=>$this->input->post("id_materia"),
					"id_curso"=>$this->input->post("id_curso") 
					);
				$VerSiDocenteIngresoNotasAmateria = $this->Materiasbuscar->VerSiDocenteIngresoNotasAmateria($acade_periodo_nota_detalle);
				if($VerSiDocenteIngresoNotasAmateria == 0) //significa que el docente no ha ingresado notas aun
				{
					//envio al modelo actualizar
					$eliminar	= $this->Usuarioeliminar->EliminarMateriaSeccionAsiganda($id_detalle);
					if($eliminar ===true)
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
					echo 2; //no puede quitarse  la materia al docente
				}
				
			 }
	}
	public function Orientador()
	{
		if($this->session->userdata("id_rol") != 1)
		{
		  return $this->VistaError("Acceso denegado.");	
			
		}
		//carga el menu siempre
		$mostrar["TraerPermisosUsuario"] = $this->Validarpermisos->TraerPermisosUsuario($this->session->userdata("id_usuario")); //id usurio logueado
		mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
		
		$id_docente = $this->uri->segment(3,0);
		 
		$mostrar["contenido"]	="docentes/asignar_orientador";
		$mostrar["TraerSeccionesDelDocente"] = $this->Usuariosbuscar->TraerSeccionesDelDocente($id_docente);
		$this->load->view("plantilla", $mostrar);
		
	}  
	public function AsiganarDocenteOrientador()
	{
		
		$this->form_validation->set_rules("id_docente", "Docente","required");
		$this->form_validation->set_rules("id_curso", "Secci&oacute;n","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				
				$acade_detalle_orientador = array(
					"id_docente"=>$this->input->post("id_docente"),
					"id_curso"=>$this->input->post("id_curso"),
					"id_usuario"=>$this->session->userdata("id_usuario")
					);
				
					//envio al modelo actualizar
					$asignar	= $this->Usuarioinsertar->AsiganarDocenteOrientador($acade_detalle_orientador);
					if($asignar->MENSAJE == "OK")
					{
						echo 1;
					}
					elseif($asignar->MENSAJE == "NO")
					{
						echo 2;//el curso ya fue asigando a otro profesor
					}
					else
					{
						echo 0;
					}
				
				
			 }
	}
	public function EliminarOrientador()
	{
		$this->form_validation->set_rules("id_docente", "Docente","required");
		$this->form_validation->set_rules("id_curso", "Secci&oacute;n","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				
				$acade_detalle_orientador = array(
					"id_docente"=>$this->input->post("id_docente"),
					"id_curso"=>$this->input->post("id_curso")
					);
				
					//envio al modelo actualizar
					$asignar	= $this->Usuarioeliminar->EliminarOrientador($acade_detalle_orientador);
					if($asignar->MENSAJE == "OK")
					{
						echo 1;
					}
					elseif($asignar->MENSAJE == "NO")
					{
						echo 2;//el curso ya fue asigando a otro profesor
					}
					else
					{
						echo 0;
					}
				
				
			 }
	}
	public function CambiarClave()
	{
		$this->form_validation->set_rules("clave_anterior", "Calve anterior","required|min_length[5]");
		$this->form_validation->set_rules("clave", "Clave","required|min_length[5]");
		$this->form_validation->set_rules("clave_re", "Confirmaci&oacute;n Clave","required|min_length[5]|matches[clave]");
		 if ($this->form_validation->run() == FALSE)
             {
                       
						$respuesta = array(
							"respuesta"=>2,
							"mensaje"=>validation_errors()
						);
					echo json_encode($respuesta);
             }
          else
             {
				// verifico si el usaurio ha digitado las credenciales anteriores correctas
				$adm_usuario = array(
				"usuario"=>$this->session->userdata("usuario"),
				"clave"=>md5($this->input->post('clave_anterior'))
				);
				$verificarCredeciales	  = $this->Usuariosbuscar->IniciarSesion($adm_usuario);
				mysqli_next_result($this->db->conn_id);//para poder ejecutar el siguiente PA o sql si na error de consultas no sincronizadas
				if($verificarCredeciales->usuario == 'NO')//hubieron errores
				{
					$respuesta = array(
							"respuesta"=>0,
							"mensaje"=>"La Clave actual no cohinciden."
						);
					echo json_encode($respuesta);
				}
				else
				{
					
					//envio al modelo actualizar
					$adm_usuario_calve = array(
					"id_usuario"=>$this->session->userdata("id_usuario"),
					"clave"=>md5($this->input->post('clave'))
					);
					$asignar	= $this->Usuarioactualizar->ResetearClave($adm_usuario_calve);
					if($asignar->MENSAJE == "OK")
					{
						
						$respuesta = array(
							"respuesta"=>1,
							"mensaje"=>"La Clave has sido cambiada satisfactoriamente."
						);
						echo json_encode($respuesta);
					}
					else
					{
						$respuesta = array(
							"respuesta"=>2,
							"mensaje"=>"Hubieron errores, comunique a un administrador."
						);
						echo json_encode($respuesta);
						
					}
				}
				
				
				
			 }
	}
	
}
