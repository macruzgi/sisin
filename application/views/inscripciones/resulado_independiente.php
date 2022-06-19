<ul>
<?php
foreach($TraerAlumnosFiltrados as $alumnosEncontrados):
?>
<li><a onclick="EnviarDatosAfrmParent('<?php echo $alumnosEncontrados->alumno_codigo."-".$alumnosEncontrados->alumno_apellido.", ".$alumnosEncontrados->alumno_nombre;?>', '<?php echo $alumnosEncontrados->id_alumno;?>')" style="cursor:pointer;"><?php echo $alumnosEncontrados->alumno_codigo."-".$alumnosEncontrados->alumno_apellido.", ".$alumnosEncontrados->alumno_nombre;?></a></li>
<?php 
endforeach;?>
</ul>
<script>
function EnviarDatosAfrmParent(alumno, id_alumno)
{
	$("#alumno").val(alumno);
	$("#id_alumno").val(id_alumno);
	$("#buscar_alumno").val(alumno);
	$("#listadosEmergentes").html('');
}
</script>
							