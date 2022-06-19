<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
Controlador estandarizado, creado por MaCruz-Gi, correo: giancarlos1029@hotmail.com
*/
class Alumnos extends CI_Controller {

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
		 $this->load->model("alumnos/Alumnosinsertar");
		 $this->load->model("alumnos/Alumnosbuscar");
		 $this->load->model("alumnos/Alumnosactualizar");
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
		$mostrar["contenido"]	="alumnos/administrar";
		$mostrar["TraerAlumnos"] = $this->Alumnosbuscar->TraerAlumnos();
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
		//si es actualizacion que traiga el dato respectivo
		$id_alumno 				= $this->uri->segment(3,0);
		$mostrar["TaerAlumno"]	= $this->Alumnosbuscar->TaerAlumno($id_alumno);
		
		//traigo el genero
		$mostrar["TraerGenero"]	= $this->Generico->TraerDatosLista(1);//id de la lista opcion para filtrar
		//traigo los departamentos
		$mostrar["TraerDepartamentos"]	= $this->Generico->TaerDepartamentos();
		
		$mostrar["contenido"] = "alumnos/nuevo";
		//ECHO $this->Generico->TaerSiguienteID("adm_docente", "id_docente");
		$this->load->view("plantilla", $mostrar);
		
	}
	public function AgregarAlumno()
	{
		$this->form_validation->set_rules("alumno_nombre", "Nombres","required|min_length[5]");
		$this->form_validation->set_rules("alumno_apellido", "Apellidos","required|min_length[4]");
		$this->form_validation->set_rules("id_lista", "G&eacute;nero","required");
		$this->form_validation->set_rules("alumno_direccion", "Residencia","required");
		$this->form_validation->set_rules("alumno_fecha_nacimiento", "Fecha Nacimiento","required");
		$this->form_validation->set_rules("id_departamento", "Departamento","required");
		$this->form_validation->set_rules("id_municipio", "Municipio","required");
		$this->form_validation->set_rules("dato_nombres_padre", "Nombres Padre","required");
		$this->form_validation->set_rules("dato_nombres_madre", "Nombres Madre","required");
		$this->form_validation->set_rules("dato_lugar_trabajo", "Residencia padres/Lugar trabajo","required");
		$this->form_validation->set_rules("dato_nombres_responsable", "Nombre encargado","required");
		$this->form_validation->set_rules("dato_lugar_trabajo_responsable", "Residencia/Lugar trabajo","required");
		
		$this->form_validation->set_rules("alumno_correo", "Correo Alumno","valid_email");
		$this->form_validation->set_rules("dato_correo", "Correo Padres","valid_email");
		$this->form_validation->set_rules("dato_correo_responsable", "Correo Responsable","valid_email");
	
				
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				$alumno_codigo = $this->Alumnosbuscar->TaerCodigoAlumno();
				// si el coadio del alumno es null, ya no hay codigos disponibles
				if($alumno_codigo != null)
				{	
					
					$alumno_nombre_foto = "alumno_nombre_foto"; //la varible de la foto
					/*
						en las configuraciones de la imagen son permitidas tres tipos, pero el final sera guardada
						como .png con el fin de poder eliminar por si ya existia
					*/
					$renombar = $alumno_codigo;
					//elimino la foto por si ya esta el @ no muestra errores si es que la imagen no esta
					//@unlink("./fotografias/".$renombar);
				
					/*
					configuarcion para la carga de fotogarifa
					*/
					$config['file_name'] = $renombar;		  
					$config['upload_path'] = './fotografias/';
					$config['allowed_types'] = 'gif|jpg|png';
					$config['max_size'] = 1024 * 8;
				   // $config['encrypt_name'] = TRUE; //esto me cambia el nombre y le pone encriptacion
					//sube el archivo
					$this->load->library('upload', $config);
					
					if (!$this->upload->do_upload($alumno_nombre_foto))
					{
						/*
						$respuesta = array(
							"repuesta"=>2,
							"mensaje"=>"NO fue posible subir la imagen."
							);
						echo json_encode($respuesta);
						*/
						//si no se subio imagien o no se selecciono ninguna, que simpre mantenga la acutal
						//$alumno_nombre_foto = $this->input->post("alumno_nombre_foto_ori");
					}
					else
					{	
						
						
						//varible para acceder a las configuraciones de la imagen subida
						$data = $this->upload->data();
						//si se subio imagen, que tome la nueva
						$alumno_nombre_foto = $data['file_name'];
					}
					
					//armo los datos en un arrary
					$adm_alumno = array(
						"alumno_codigo"=>$alumno_codigo,
						"alumno_nombre"=>$this->input->post("alumno_nombre"),
						"alumno_apellido"=>$this->input->post("alumno_apellido"),
						"alumno_direccion"=>$this->input->post("alumno_direccion"),
						"alumno_telefonos"=>$this->input->post("alumno_telefonos"),					
						"alumno_fecha_nacimiento"=>date("Ymd", strtotime(str_replace("/", "-", $this->input->post("alumno_fecha_nacimiento")))),
						"alumno_nombre_foto"=>$alumno_nombre_foto,
						"alumno_correo"=>$this->input->post("alumno_correo"),
						"id_lista"=>$this->input->post("id_lista"),
						"id_municipio"=>$this->input->post("id_municipio"),
						"id_usuario"=>$this->session->userdata("id_usuario"),
						//);
					//$acade_alumno_dato = array(
						"dato_nombres_padre"=>$this->input->post("dato_nombres_padre"),
						"dato_nombres_madre"=>$this->input->post("dato_nombres_madre"),
						"dato_telefonos_contacto"=>$this->input->post("dato_telefonos_contacto"),
						"dato_correo"=>$this->input->post("dato_correo"),
						"dato_lugar_trabajo"=>$this->input->post("dato_lugar_trabajo"),
						"dato_nombres_responsable"=>$this->input->post("dato_nombres_responsable"),
						"dato_telefono_responsable"=>$this->input->post("dato_telefono_responsable"),
						"dato_correo_responsable"=>$this->input->post("dato_correo_responsable"),
						"dato_lugar_trabajo_responsable"=>$this->input->post("dato_lugar_trabajo_responsable")
						//"id_alumno"=>$id_alumno
						//"id_usuario"=>1
						);
						
					 
					 //invio al modelo a insertar
					 $insertar = $this->Alumnosinsertar->AgregarAlumno($adm_alumno);
					 
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
					echo 2;//es null ya no hay codigos disponibles
				}
             }
	}
	public function SubirFoto()
	{
		
    $file_element_name = 'alumno_nombre_foto';
     /*
						configuarcion para la carga de fotogarifa
					*/
				  
        $config['upload_path'] = './fotografias/';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = 1024 * 8;
        $config['encrypt_name'] = TRUE;
 
        $this->load->library('upload', $config);
 
        if (!$this->upload->do_upload($file_element_name))
        {
            echo "NO LO HIZO<br>";
        }
        else
        {
            $data = $this->upload->data();
			echo $data['file_name'];
           
        }
       
    

	}
	public function ModificarAlumno()
	{
		$this->form_validation->set_rules("id_alumno", "Alumno","required");
		$this->form_validation->set_rules("alumno_codigo", "C&oacute;digo Alumno","required");
		$this->form_validation->set_rules("alumno_nombre", "Nombres","required|min_length[5]");
		$this->form_validation->set_rules("alumno_apellido", "Apellidos","required|min_length[4]");
		$this->form_validation->set_rules("id_lista", "G&eacute;nero","required");
		$this->form_validation->set_rules("alumno_direccion", "Residencia","required");
		$this->form_validation->set_rules("alumno_fecha_nacimiento", "Fecha Nacimiento","required");
		$this->form_validation->set_rules("id_departamento", "Departamento","required");
		$this->form_validation->set_rules("id_municipio", "Municipio","required");
		$this->form_validation->set_rules("dato_nombres_padre", "Nombres Padre","required");
		$this->form_validation->set_rules("dato_nombres_madre", "Nombres Madre","required");
		$this->form_validation->set_rules("dato_lugar_trabajo", "Residencia padres/Lugar trabajo","required");
		$this->form_validation->set_rules("dato_nombres_responsable", "Nombre encargado","required");
		$this->form_validation->set_rules("dato_lugar_trabajo_responsable", "Residencia/Lugar trabajo","required");
		
		$this->form_validation->set_rules("alumno_correo", "Correo Alumno","valid_email");
		$this->form_validation->set_rules("dato_correo", "Correo Padres","valid_email");
		$this->form_validation->set_rules("dato_correo_responsable", "Correo Responsable","valid_email");
		
		
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 	$alumno_nombre_foto = "alumno_nombre_foto"; //la varible de la foto
					/*
						en las configuraciones de la imagen son permitidas tres tipos, pero el final sera guardada
						como .png con el fin de poder eliminar por si ya existia
					*/
					$renombar = $this->input->post("alumno_codigo");
					//elimino la foto por si ya esta el @ no muestra errores si es que la imagen no esta
					//@unlink("./fotografias/".$renombar);
				
					/*
					configuarcion para la carga de fotogarifa
					*/
					$config['file_name'] = $renombar;		  
					$config['upload_path'] = './fotografias/';
					$config['allowed_types'] = 'gif|jpg|png';
					$config['max_size'] = 1024 * 8;
				   // $config['encrypt_name'] = TRUE; //esto me cambia el nombre y le pone encriptacion
					//sube el archivo
					$this->load->library('upload', $config);
					
					if (!$this->upload->do_upload($alumno_nombre_foto))
					{
						/*
						$respuesta = array(
							"repuesta"=>2,
							"mensaje"=>"NO fue posible subir la imagen."
							);
						echo json_encode($respuesta);
						*/
						//echo "no se puede";
						//si no se subio imagien o no se selecciono ninguna, que simpre mantenga la acutal
						$alumno_nombre_foto = $this->input->post("alumno_nombre_foto_ori");
					}
					else
					{	
						
						
						//varible para acceder a las configuraciones de la imagen subida
						$data = $this->upload->data();
						//si se subio imagen, que tome la nueva
						$alumno_nombre_foto = $data['file_name'];
					}
				 
				 $adm_alumno = array(
					"id_alumno"=> $this->input->post("id_alumno"),
					"alumno_nombre"=>$this->input->post("alumno_nombre"),
					"alumno_apellido"=>$this->input->post("alumno_apellido"),
					"alumno_direccion"=>$this->input->post("alumno_direccion"),
					"alumno_telefonos"=>$this->input->post("alumno_telefonos"),					
					"alumno_fecha_nacimiento"=>date("Y-m-d", strtotime(str_replace("/", "-", $this->input->post("alumno_fecha_nacimiento")))),
					"alumno_nombre_foto"=>$alumno_nombre_foto,
					"alumno_correo"=>$this->input->post("alumno_correo"),
					"id_lista"=>$this->input->post("id_lista"),
					"id_municipio"=>$this->input->post("id_municipio"),
					/*"id_usuario"=>1
					);
				$acade_alumno_dato = array(*/
					"dato_nombres_padre"=>$this->input->post("dato_nombres_padre"),
					"dato_nombres_madre"=>$this->input->post("dato_nombres_madre"),
					"dato_telefonos_contacto"=>$this->input->post("dato_telefonos_contacto"),
					"dato_correo"=>$this->input->post("dato_correo"),
					"dato_lugar_trabajo"=>$this->input->post("dato_lugar_trabajo"),
					"dato_nombres_responsable"=>$this->input->post("dato_nombres_responsable"),
					"dato_telefono_responsable"=>$this->input->post("dato_telefono_responsable"),
					"dato_correo_responsable"=>$this->input->post("dato_correo_responsable"),
					"dato_lugar_trabajo_responsable"=>$this->input->post("dato_lugar_trabajo_responsable")
					);
				 //invio al modelo a actualizar
				 $actualizar = $this->Alumnosactualizar->ModificarAlumno($adm_alumno);
				 
				 if($actualizar->MENSAJE == "OK")
				 {
                    echo 1;//json_encode ($this->input->post("docente_nombre"));
				 }
				 else
				 {
					 echo 0;
				 }
             }
	}
	public function EliminarAlumno()
	{
		$this->form_validation->set_rules("id_alumno", "Alumno","required");
		 if ($this->form_validation->run() == FALSE)
             {
                        echo validation_errors();
             }
          else
             {
				 $id_alumno		= $this->input->post("id_alumno");
				//envio al modelo actualizar
				$eliminar	= $this->Alumnosactualizar->EliminarAlumno($id_alumno);
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
	public function TraerMunicipios()
	{
		$id_departamento = $this->input->post("id_departamento");
		//el formulario espera un json
		echo json_encode($this->Generico->TraerMunicipios($id_departamento));
	}
	
	
}
