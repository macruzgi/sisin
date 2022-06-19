<?php
public function EliminarDocenteUsuario($id_docente)
	{
		
		//actualizo la tabla adm_docente
		$resultado = $this->db->query("update adm_usuario u 
				inner join adm_docente d on(u.id_usuario = d.id_usuario)
				set u.usuario_estado = false 
				where d.id_docente = $id_docente");
		if($resultado === true)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}


	//NOTA: esta funcion se usa tambien en la funcion Usuarios/AdministrarAsignaciones, Usuarios/Asignacion
	public function TraerDocentesUsuarios()
	{
			/*
		$resultado = $this->db->query("select u.id_usuario, u.nombres, u.apellidos,
			m.id_modulo, m.nombre_modulo, mo.id_modulo_opcion, mo.nombre_opcion
			from adm_usuario u
			inner join adm_modulo_opcion_usuario mou on(u.id_usuario = mou.id_usuario)
			inner join adm_modulo_opcion mo on(mo.id_modulo_opcion = mou.id_modulo_opcion)
			inner join adm_modulo m on(m.id_modulo = mo.id_modulo)
			where u.id_usuario = $id_usuario");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
		*/
		
		$resultado = $this->db->query("SELECT d.id_docente, d.docente_nombre, d.docente_apellido, d.docente_direccion, d.fecha_creacion,
						u.usuario, r.rol_nombre
						from adm_docente d 
						inner join adm_usuario u
						on(d.id_usuario = u.id_usuario)
						inner join adm_rol r
						on(r.id_rol = u.id_rol)
						where u.usuario_estado = true order by d.docente_apellido, d.docente_nombre");

			$datosEnArray = array();
			if($resultado->num_rows() > 0)
			{
				foreach($resultado->result() as $filasEncontradas)
				{
					$datosEnArray[] = $filasEncontradas;
				}
			}
		return $datosEnArray;
	}
	
	public function TaerRolesUsuarios()
	{
		$resultado = $this->db->query("select id_rol, rol_nombre from adm_rol");
		$datosEnArray = array();
		if($resultado->num_rows() > 0)
		{
			foreach($resultado->result() as $filasEncontradas)
			{
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
	}