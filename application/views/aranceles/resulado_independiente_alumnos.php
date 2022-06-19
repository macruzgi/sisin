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
		/////*******PROCESO PARA traer el plan de pagos para el alumno seleccionado
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Aranceles/TraerCuotasAlumno/",
									data:{id_alumno:id_alumno},
									dataType: 'json',//espero un json
									success:function(data)
										{
											$("#tbl_alumnos").find('td').remove();
											
											  $.each(data, function (key, valor) // indice, valor
												{
													$('#tbl_alumnos tbody').append("<tr><td>"+ valor.id_calendario_pago + "</td><td>" + valor.MES + "</td><td>" + valor.calendario_annio + "</td><td>" + valor.ESTADO_CUOTA +"</td><td>" + "<input type='radio' name='id_calendario_pago' value="+ valor.id_calendario_pago +"></td></tr>");
													
												});
										}
								});
								
							/////*******FIN DEL PROCESO 
}
</script>
							