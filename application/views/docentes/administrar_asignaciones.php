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
	                                    <li class="active">Asiganciones Docentes</li>
	                                </ul>
                            	</div>
                        	</div>
							
 <div class="row-fluid" id="lista">
 
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Administistar Asiganciones de materias Docentes</div>
                                </div>
                                <div class="block-content collapse in">
										  <div class="span12">
                                   <div class="table-toolbar">
                                      <div class="btn-group">
                                         <a href="<?php echo base_url();?>Usuarios/Asignacion/"><button class="btn btn-success">Agregar Nuevo <i class="icon-plus icon-white"></i></button></a>
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
                                                <th>Nombre</th>
                                                <th>Apellidos</th>
                                                
												<th>Usaurio/E-mail</th>
												<th>Rol</th>
                                               
												<th>Acci&oacute;n</th>
                                            </tr>
                                        </thead>
                                        <tbody>
										<?php 
											foreach($TraerDocentesUsuarios as $docentesEncontrados):
										?>	
                                            <tr class="odd gradeX">
                                                <td><?php echo $docentesEncontrados->id_docente;?></td>
                                                <td><?php echo $docentesEncontrados->docente_nombre;?></td>
                                                <td><?php echo $docentesEncontrados->docente_apellido;?></td>
												<td class="center"><?php echo $docentesEncontrados->usuario;?></td>
												<td class="center"><?php echo $docentesEncontrados->rol_nombre;?></td>
												<td>
												
												
												<a href="#myModal" data-toggle="modal"  class="btn btn-primary" OnClick="CargarDato('<?php echo $docentesEncontrados->id_docente;?>')"><i class="icon-eye-open icon-white"></i> </a>
												<a href="<?php echo base_url();?>Usuarios/Orientador/<?php echo $docentesEncontrados->id_docente;?>" class="btn btn-info"><i class="icon-flag icon-white"></i> </a>
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
												<a data-dismiss="modal" class="btn" href="#" id="linkDesistir">NO</a>
											</div>
										</div>

<div id="myModal" class="modal hide">
											<div class="modal-header">
												<button data-dismiss="modal" class="close" type="button">&times;</button>
												<h4>Asiganci&oacute;n al docente:<span class="label label-success" id="fulanito"></span></h4>
												<span class="label label-important" id="msj_error"></span></h4>
											</div>
											<div class="modal-body">
							<div class="span12">
									<table class="table table-striped" id="tbl_datos">
						              <thead>
						                <tr>
						                  <th>Secci&oacute;n</th>
						                  <th>Materia</th>
										  <th>Acci&oacute;n</th>
						                </tr>
						              </thead>
						              <tbody>
						               
						              </tbody>
						            </table>
                            </div>
											</div>
</div>
 <script src="<?php echo base_url();?>vendors/jquery-1.9.1.min.js"></script>

 <script>
  
 function ActivarDesactiva(ValorBoleano)
 {
	  $("#usuario").prop("disabled", ValorBoleano);
	  $("#clave").prop("disabled", ValorBoleano);
	  $("#clave_re").prop("disabled", ValorBoleano);
	  $("#id_rol").prop("disabled", ValorBoleano);
 }
function CargarDato(id_docente)
{
	//quito el mensaje de error por si se habi mostrado antes
	$("#msj_error").html('');
	$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/TraerMateriasAsigandasYsecciones/",
									data:{id_docente:id_docente},
									dataType: "json", // para indicarle que espero un JSON
									success:function(data)
										{
											
											$("#tbl_datos").find('td').remove();
											$("#fulanito").html('');
											$("#fulanito").append(data[0].NOMBRE);
											
											
											  $.each(data, function (key, valor) // indice, valor
												{
													$('#tbl_datos tbody').append("<tr><td>"+ valor.SECCION + " (" + valor.curso_turno + ")</td><td>" + valor.materia_nombre + "</td><td>" + "<a href='#myAlert' data-toggle='modal'  class='btn btn-danger' OnClick=\"EliminarDato(\'" + valor.id_detalle +"\',\'" + valor.id_docente + "\',\'" + valor.id_materia + "\',\'" + valor.id_curso + "\')\"'><i class='icon-remove icon-white'></i> </a></td></tr>");
													
												});
										}
								});

	}

//funcion que eliminara alguna materia seleccionada
function EliminarDato(id_detalle, id_docente, id_materia, id_curso)
{
	//oculto la modal al levantarse la myAlert
	$("#myModal").hide();
	//quito el mensaje de error por si se habi mostrado antes
	$("#msj_error").html('');
	//doy clic en el boton SI de myAlert
	$("#linkEliminar").click(function(){
		//proceso para eliminar la materia selectionada con la respectiva seccion
			$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/EliminarMateriaSeccionAsiganda/",
									data:{id_detalle:id_detalle, id_docente:id_docente, id_materia:id_materia, id_curso:id_curso},
									//dataType: "json", // para indicarle que espero un JSON
									success:function(data)
										{
											if(data==1)
											{
											$("#msj_error").html('');
											 CargarDato(id_docente);
											 
											 $("#myModal").show();
											}
											else if(data == 2)//no se puede quitar la materia al docente ya que ya agrego notas
											{
												$("#msj_error").html('');
												$("#msj_error").append("No se puede quitar esta asiganci&oacute;n, ya hay notas ingresadas.");
												$("#myModal").show();
												
											}
											else
											{
												
											}
										}
								});
	
	 
});

}

//doy clic en no la modal myAlert
	$("#linkDesistir").click(function(){
		$("#myModal").show();	
	});

</script>						

							