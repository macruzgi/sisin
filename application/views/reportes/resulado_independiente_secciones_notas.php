<ul>
<?php
foreach($TraerSecciones as $seccionesEncontradas):
?>
<li><a onclick="EnviarDatosAfrmParent('<?php echo $seccionesEncontradas->curso_nivel." ".$seccionesEncontradas->modalidad_nombre." ".$seccionesEncontradas->curso_identificador.", ".$seccionesEncontradas->annio;?>', '<?php echo $seccionesEncontradas->id_curso;?>', '<?php echo $seccionesEncontradas->annio;?>')" style="cursor:pointer;"><?php echo $seccionesEncontradas->curso_nivel." ".$seccionesEncontradas->modalidad_nombre." ".$seccionesEncontradas->curso_identificador." (".$seccionesEncontradas->curso_turno."), ".$seccionesEncontradas->annio;?></a></li>
<?php 
endforeach;?>
</ul>
<script>
function EnviarDatosAfrmParent(el_curso, id_curso, annio)
{
	$("#el_curso").val(el_curso);
	$("#id_curso").val(id_curso);
	$("#annio").val(annio);
	$("#buscar_curso").val(el_curso);
	$("#listadosEmergentes").html('');
}
</script>
							