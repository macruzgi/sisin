<?php 

//print_r($TraerPermisosUsuario);
?>
<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">CAT&Aacute;LOGOS</a> <span class="divider">/</span>	
	                                    </li>
	                                    <li class="active">Alumnos</li>
	                                </ul>
                            	</div>
                        	</div>
							
 <div class="row-fluid" id="lista">
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Administistar Alumnos</div>
                                </div>
                                <div class="block-content collapse in">
										  <div class="span12">
                                   <div class="table-toolbar">
                                      <div class="btn-group">
                                         <a href="<?php echo base_url();?>Alumnos/Nuevo/"><button class="btn btn-success">Agregar Nuevo <i class="icon-plus icon-white"></i></button></a>
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
											    <th>C&oacute;d.</th>
                                                <th>Apellidos</th>
                                                <th>Nombres</th>
                                                <th>Fecha de alta</th>
												<th>Acci&oacute;n</th>
                                            </tr>
                                        </thead>
                                        <tbody>
										<?php 
											foreach($TraerAlumnos as $alumnosEncontrados):
										?>	
                                            <tr class="odd gradeX">
											    <td><?php echo $alumnosEncontrados->alumno_codigo;?></td>
                                                <td><?php echo $alumnosEncontrados->alumno_apellido;?></td>
                                                <td><?php echo $alumnosEncontrados->alumno_nombre;?></td>
                                                <td class="center"><?php echo date("d-m-Y", strtotime($alumnosEncontrados->fecha_creacion));?></td>
												<td>
																						
												<a href="<?php echo base_url();?>Alumnos/Nuevo/<?php echo $alumnosEncontrados->id_alumno;?>" class="btn btn-primary"><i class="icon-pencil icon-white"></i> </a>
												<a href="#myAlert" data-toggle="modal"  class="btn btn-danger" OnClick="EliminarDato('<?php echo $alumnosEncontrados->id_alumno;?>')"><i class="icon-remove icon-white"></i> </a>
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
												<h3>Confirme la eliminaci&oacute;n</h3>
											</div>
											<div class="modal-body">
												<p>Ha eligido elminar el registro, ¿est&aacute; seguro/a?</p>
											</div>
											<div class="modal-footer">
												<a data-dismiss="modal" class="btn btn-danger" href="#" id="linkEliminar">S&iacute;</a>
												<a data-dismiss="modal" class="btn" href="#">NO</a>
											</div>
										</div>
 <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>
 <script>

function EliminarDato(id_alumno)
{
	
$("#linkEliminar").click(function(){
	$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Alumnos/EliminarAlumno/",
									data:{id_alumno:id_alumno},
									//dataType: "json", // para indicarle que espero un JSON
									success:function(data)
										{
											if(data==1)
											{
											 location.reload();
											}
											else
											{
												
											}
										}
								});
});
	}



</script>						

							