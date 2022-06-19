<?php 

//print_r($TraerPermisosUsuario);
?>

<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">INSCRIPCIONES</a> <span class="divider">/</span>	
	                                    </li>
										<li>
	                                        <a href="<?php echo base_url();?>Usuarios/AdministrarAsignaciones/">Asiganciones Docentes</a> <span class="divider">/</span>	
	                                    </li>
	                                    <li class="active">Asignar Orientador</li>
	                                </ul>
                            	</div>
                        	</div>
							
 <div class="row-fluid" id="lista">
 
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Administistar Asiganciones de Orientadores a secciones
										<span class="label">DOCENTE:</span>
										<span class="label label-info"><?php echo $TraerSeccionesDelDocente[0]->NOMBRE;?></span>
									</div>
									
                                </div>
                                <div class="block-content collapse in">
										  <div class="span12">
                                   <div class="table-toolbar">
                                     <div class="alert alert-error hide">
										<button class="close" data-dismiss="alert"></button>
										Se han detectado errores, verifique por favor.
									</div>
									<div class="alert alert-success hide">
										<button class="close" data-dismiss="alert"></button>
										Datos procesados correctamente.
									</div>
                                      <div class="btn-group pull-right">
                                         <!--button data-toggle="dropdown" class="btn dropdown-toggle">Tools <span class="caret"></span></button>
                                         <ul class="dropdown-menu">
                                            <li><a href="#">Print</a></li>
                                            <li><a href="#">Save as PDF</a></li>
                                            <li><a href="#">Export to Excel</a></li>
                                         </ul-->
                                      </div>
                                   </div>
								    
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2">
                                        <thead>
                                            <tr>
                                                <th>Identificador</th>
                                                <th>Secci&oacute;n</th>
                                                <th>Acci&oacute;n</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
										<?php 
										
											foreach($TraerSeccionesDelDocente as $seccionesEncontradas):
										?>	
                                            <tr class="odd gradeX">
                                                <td><?php echo $seccionesEncontradas->id_detalle;?></td>
                                                <td><?php echo $seccionesEncontradas->SECCION." (".$seccionesEncontradas->curso_turno.")";?></td>
												<td>
												<?php 
													if($seccionesEncontradas->id_orientador == 0)
													{
												?>
                                              		<a href="#myAlert" data-toggle="modal" class="btn btn-info" OnClick="AsignarOrientador('<?php echo $seccionesEncontradas->id_docente;?>','<?php echo $seccionesEncontradas->id_curso;?>')"><i class="icon-flag icon-white"></i> </a>
												<?php 
													}
												    else
													{
												?>
													<a href="#quitarOrientador" data-toggle="modal" class="btn btn-danger" OnClick="EliminarOrientador('<?php echo $seccionesEncontradas->id_docente;?>','<?php echo $seccionesEncontradas->id_curso;?>')"><i class="icon-remove icon-white"></i> </a>
												
												<?php	
													}
												?>
												</td>
												   
                                            </tr>
                                        <?php
											endforeach;
										?>  
                                        </tbody>
                                    </table>
                                </div>
                            
                                </div>
                            </div>
                            <!-- /block -->
							

 </div>

 <div id="myAlert" class="modal hide">
											<div class="modal-header">
												<button data-dismiss="modal" class="close" type="button">&times;</button>
												<h3>Confirme la asignaci&oacute;n</h3>
											</div>
											<div class="modal-body">
												<p>Ha eligido asignar como orientador al docente pra la secci&oacute;n respectiva, ¿est&aacute; seguro/a?</p>
											</div>
											<div class="modal-footer">
												<a data-dismiss="modal" class="btn btn-danger" href="#" id="linkAsignar">S&iacute;</a>
												<a data-dismiss="modal" class="btn" href="#" id="linkDesistir">NO</a>
											</div>
										</div>
 <div id="quitarOrientador" class="modal hide">
											<div class="modal-header">
												<button data-dismiss="modal" class="close" type="button">&times;</button>
												<h3>Confirme la eliminaci&oacute;n</h3>
											</div>
											<div class="modal-body">
												<p>Ha eligido quitar al orientador de la secci&oacute;n respectiva, ¿est&aacute; seguro/a?</p>
											</div>
											<div class="modal-footer">
												<a data-dismiss="modal" class="btn btn-danger" href="#" id="linkEliminarOrientador">S&iacute;</a>
												<a data-dismiss="modal" class="btn" href="#" id="linkDesistir">NO</a>
											</div>
</div>


 <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>

 <script>
   var error1 = $('.alert-error');
   var success1 = $('.alert-success');

function AsignarOrientador(id_docente, id_curso)
{
	
   
	$("#linkAsignar").click(function(){
	$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/AsiganarDocenteOrientador/",
									data:{id_docente:id_docente, id_curso:id_curso},
									dataType: "json", // para indicarle que espero un JSON
									success:function(data)
										{
											if(data==1)
											{
												error1.hide();
												success1.show();
												setTimeout(function() {
														 location.reload();
													}, 3500);
											}
											else if(data == 2)// las seccion seleccionada ya fue asiganda a otro docente
											{
																								
												$(".alert-error").empty();
												$('.alert-error').append("La secci&oacute;n ya ha sido asiganda a otro docente.");
												error1.show();
											}
											else
											{
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos." + data);
												error1.show();
											}
											
										}
								});
							});

	}

//funcion que eliminara alguna materia seleccionada
function EliminarOrientador(id_docente, id_curso)
{
	
	//doy clic en el boton SI de de quitarOrientador
	$("#linkEliminarOrientador").click(function(){
		//proceso para eliminar la materia selectionada con la respectiva seccion
			$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/EliminarOrientador/",
									data:{id_docente:id_docente, id_curso:id_curso},
									//dataType: "json", // para indicarle que espero un JSON
									success:function(data)
										{
											if(data==1)
											{
												success1.show();
												setTimeout(function() {
														 location.reload();
													}, 3500);
											}
											else if(data == 2)// el docente ya ha asigando notas a la materia que se quiere desasiganar como orientador
											{
												$(".alert-error").empty();
												$('.alert-error').append("El docente ha asignado notas a la secci&oacute;n, no se puede desasociar.");
												error1.show();
											}
											else
											{
												$(".alert-error").empty();
												$('.alert-error').append("Debe completar todos los datos." + data);
												error1.show();
											}
										}
								});
	
	 
});

}


</script>						

							